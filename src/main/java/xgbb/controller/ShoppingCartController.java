package xgbb.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.sun.deploy.net.HttpResponse;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;
import xgbb.entity.Comment;
import xgbb.entity.Commodity;
import xgbb.entity.ShoppingCart;
import xgbb.entity.User;
import xgbb.service.impl.CommentServiceImpl;
import xgbb.service.impl.CommodityServiceImpl;
import xgbb.service.impl.ShoppingCartServiceImpl;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author nb
 * @since 2019-04-30
 */
@Controller
@RequestMapping("shoppingCart")
public class ShoppingCartController {
    @Resource(name = "shoppingCartService")
    ShoppingCartServiceImpl shoppingCartService;
    @Autowired
    CommodityServiceImpl commodityService;
    @Autowired
    CommentServiceImpl commentService;
    @RequestMapping("getCommodityListByUserIdInshoppingCart")
    public String getCommodityListByUserIdInshoppingCart(Model model, Integer userId){
        if(userId==null){
            model.addAttribute("message","请先登录");
            return "login";
        }
        List<ShoppingCart> shoppingCartList = shoppingCartService.getShoppingCartById(userId);
        model.addAttribute("shoppingCartList",shoppingCartList);
        return "shoppingCart";
    }

    @RequestMapping("removeCart")
    public String removeCart(Model model,Integer userId,Integer commodityId){
        if(userId==null){
            model.addAttribute("message","请先登录");
            return "login";
        }
        shoppingCartService.removeCart(userId,commodityId);
        List<ShoppingCart> shoppingCartList = shoppingCartService.getShoppingCartById(userId);
        model.addAttribute("shoppingCartList",shoppingCartList);
        return "shoppingCart";
    }

    @RequestMapping("cleanupCart")
    public String cleanupCart(Model model,Integer userId){
        if(userId==null){
            model.addAttribute("message","请先登录");
            return "login";
        }
        shoppingCartService.cleanupCart(userId);
        List<ShoppingCart> shoppingCartList = shoppingCartService.getShoppingCartById(userId);
        model.addAttribute("shoppingCartList",shoppingCartList);
        return "shoppingCart";
    }

    @RequestMapping("addCart")
    public String addCart(Model model,Integer userId,Integer commodityId,Integer commodityNumber){
        Integer stock = commodityService.getCommodityById(commodityId).getCommodityStock();
        if(userId==null){
            model.addAttribute("message","请先登录");
            return "login";
        }
        Commodity commodityById = commodityService.getCommodityById(commodityId);
        Integer storeOwnerId = commodityById.getStore().getStoreOwnerId();
        if (storeOwnerId==userId){
            model.addAttribute("commodity",commodityById);
            model.addAttribute("ms",1);
            return "commodityDetails";
        }
        shoppingCartService.addCart(userId,commodityId,commodityNumber);
        List<ShoppingCart> shoppingCartList = shoppingCartService.getShoppingCartById(userId);
        model.addAttribute("shoppingCartList",shoppingCartList);
        return "shoppingCart";
    }
    @RequestMapping("commodityJia")
    public String commodityJia(Model model,Integer userId,Integer commodityId,Integer commodityNumber){
        if(userId==null){
            model.addAttribute("message","请先登录");
            return "login";
        }
        ShoppingCart one = shoppingCartService.getOne(new QueryWrapper<ShoppingCart>().eq("commodity_id", commodityId).eq("user_id", userId));
        Integer spId = one.getSpId();
        ShoppingCart shoppingCart = new ShoppingCart();
        shoppingCart.setSpId(spId);
        shoppingCart.setCommodityNumber(one.getCommodityNumber()+1);
        shoppingCart.setCommodityId(one.getCommodityId());
        shoppingCart.setUserId(userId);
        shoppingCartService.updateById(shoppingCart);
        List<ShoppingCart> shoppingCartList = shoppingCartService.getShoppingCartById(userId);
        model.addAttribute("shoppingCartList",shoppingCartList);
        return "shoppingCart";
    }

    @RequestMapping("commodityJian")
    public String commodityJian(Model model,Integer userId,Integer commodityId,Integer commodityNumber){
        if(userId==null){
            model.addAttribute("message","请先登录");
            return "login";
        }
        ShoppingCart one = shoppingCartService.getOne(new QueryWrapper<ShoppingCart>().eq("commodity_id", commodityId).eq("user_id", userId));
        Integer spId = one.getSpId();
        ShoppingCart shoppingCart = new ShoppingCart();
        shoppingCart.setSpId(spId);
        shoppingCart.setCommodityNumber(one.getCommodityNumber()-1);
        shoppingCart.setCommodityId(one.getCommodityId());
        shoppingCart.setUserId(userId);
        shoppingCartService.updateById(shoppingCart);
        List<ShoppingCart> shoppingCartList = shoppingCartService.getShoppingCartById(userId);
        model.addAttribute("shoppingCartList",shoppingCartList);
        return "shoppingCart";
    }
    @RequestMapping("analysisCheck")
    public void analysisCheck(Integer spId, HttpServletResponse response, HttpSession session) throws IOException {
        ShoppingCart one = shoppingCartService.getOne(new QueryWrapper<ShoppingCart>().eq("sp_id", spId));
        if (one.getChecked()==0){
            shoppingCartService.check(spId);
            response.getWriter().write("yes");
        }else if (one.getChecked()==1){
            shoppingCartService.uncheck(spId);
            response.getWriter().write("no");
        }
    }

    @RequestMapping("allCheck")
    public void allCheck(Integer userId, HttpServletResponse response) throws IOException {
        shoppingCartService.allcheck(userId);
        List<ShoppingCart> shoppingCartList = shoppingCartService.getShoppingCartByIdAndChecked(userId);
        Double price = new Double(0.0);
        for (ShoppingCart shoppingCart : shoppingCartList) {
            Double i = shoppingCart.getCommodity().getCommodityCurrentprice() * shoppingCart.getCommodityNumber();
            if (i==null)
                i=0.0;
            price+=i;
        }
        if (price==null)
            price=0.0;
        response.getWriter().write(String.valueOf(price));
    }

    @RequestMapping("reallCheck")
    public void reallCheck(Integer userId, HttpServletResponse response) throws IOException {
        shoppingCartService.reallcheck(userId);
        List<ShoppingCart> shoppingCartList = shoppingCartService.getShoppingCartByIdAndChecked(userId);
        Double price = null;
        for (ShoppingCart shoppingCart : shoppingCartList) {
            Double i = shoppingCart.getCommodity().getCommodityCurrentprice() * shoppingCart.getCommodityNumber();
            price+=i;
        }
        if (price==null)
            price=0.0;
        response.getWriter().write(String.valueOf(price));
    }
    @RequestMapping("getPrice")
    @ResponseBody
    public void getPrice(HttpSession session, HttpServletResponse response) throws IOException {
        User user = (User) session.getAttribute("user");
        List<ShoppingCart> shoppingCartList = shoppingCartService.getShoppingCartByIdAndChecked(user.getId());
        Double price = new Double(0.0);
        for (ShoppingCart shoppingCart : shoppingCartList) {
            Double i = shoppingCart.getCommodity().getCommodityCurrentprice() * shoppingCart.getCommodityNumber();
            price+=i;
        }
        if (price==null)
            price=0.0;
        response.getWriter().write(String.valueOf(price));
    }
}

