package xgbb.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import xgbb.entity.*;
import xgbb.service.impl.CommentServiceImpl;
import xgbb.service.impl.CommodityServiceImpl;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author nb
 * @since 2019-05-09
 */
@Controller
@RequestMapping("commodity")
public class CommodityController {
    @Resource(name = "commodityService")
    CommodityServiceImpl commodityService;
    @Autowired
    CommentServiceImpl  commentService;
    @RequestMapping("myGetCommodityList.do")
    public String myGetCommodityList(Model model,
                                     Integer currentPage,
                                     String searchName){


        MyPage<Commodity> commodityMyPage = commodityService.myGetCommodityList(searchName == null ? "%" : searchName,
                currentPage==null?1:currentPage);
        model.addAttribute("commodityList",commodityMyPage);
        model.addAttribute("searchName",searchName);
            List<Commodity> guessCommodityList = commodityService.guessYouLike(null);
            model.addAttribute("guessCommodityList",guessCommodityList);
        return "commodityList";
    }
    @RequestMapping("myGetCommodityListDefault.do")
    public String myGetCommodityListDefault(Model model,
                                     Integer currentPage,
                                     String searchName){
        return myGetCommodityList(model, currentPage, searchName);
    }
    @RequestMapping("getCommodityListDESC.do")
    public String getCommodityListDESC(Model model,
                                     Integer currentPage,
                                     String searchName){

        MyPage<Commodity> commodityMyPage = commodityService.getCommodityListDESC(searchName == null ? "%" : searchName,
                currentPage==null?1:currentPage);
        model.addAttribute("searchState","DESC");
        model.addAttribute("commodityList",commodityMyPage);
        model.addAttribute("searchName",searchName);
        return "commodityList";
    }
    @RequestMapping("getCommodityListASC.do")
    public String getCommodityListASC(Model model,
                                      Integer currentPage,
                                      String searchName){

        MyPage<Commodity> commodityMyPage = commodityService.getCommodityListASC(searchName == null ? "%" : searchName,
                currentPage==null?1:currentPage);
        model.addAttribute("searchState","ASC");
        model.addAttribute("commodityList",commodityMyPage);
        model.addAttribute("searchName",searchName);
        return "commodityList";
    }
    @RequestMapping("getCommodityListSalesvolume.do")
    public String getCommodityListSalesvolume(Model model,
                                       Integer currentPage,
                                       String searchName){

        MyPage<Commodity> commodityMyPage = commodityService.getCommodityListSalesvolume(searchName == null ? "%" : searchName,
                currentPage==null?1:currentPage);
        model.addAttribute("searchState","SALESVOLUME");
        model.addAttribute("commodityList",commodityMyPage);
        model.addAttribute("searchName",searchName);
        return "commodityList";
    }

    @RequestMapping("getCommodityListPlus.do")
    public String getCommodityListPlus(Model model,
                                              Integer currentPage,
                                              String searchName,Double commodityPrice1,Double commodityPrice2){
        MyPage<Commodity> commodityMyPage = commodityService.myGetCommodityList(searchName == null ? "%" : searchName,
                currentPage==null?1:currentPage);
        if(commodityPrice1!=null&&commodityPrice2==null){
            commodityMyPage = commodityService.getCommodityListBigger(searchName == null ? "%" : searchName, commodityPrice1,
                    currentPage == null ? 1 : currentPage);
        }
        else if (commodityPrice1==null&&commodityPrice2!=null){
            commodityMyPage = commodityService.getCommodityListSmaller(searchName == null ? "%" : searchName, commodityPrice2,
                    currentPage == null ? 1 : currentPage);
        }else if(commodityPrice1!=null&&commodityPrice2!=null){
            commodityMyPage = commodityService.getCommodityListBetween(searchName == null ? "%" : searchName,commodityPrice1, commodityPrice2,
                    currentPage == null ? 1 : currentPage);
        }
        List<Commodity> guessYouLike = commodityService.guessYouLike(null);
        model.addAttribute("guessCommodityList",guessYouLike);
        model.addAttribute("searchState","BETWEEN");
        model.addAttribute("commodityPrice1",commodityPrice1);
        model.addAttribute("commodityPrice2",commodityPrice2);
        model.addAttribute("commodityList",commodityMyPage);
        model.addAttribute("searchName",searchName);
        return "commodityList";
    }
    @RequestMapping("commodityDetail.do")
    public String commodityDetail(Model model,Integer commodityId){
        Commodity commodity = commodityService.getCommodityById(commodityId);
        model.addAttribute("commodity",commodity);
        List<Comment> commentList = commentService.getComment(commodityId);
        model.addAttribute("commentList",commentList);
        return "commodityDetails";
    }

    @RequestMapping("getPurchaseHistory")
    public String getPurchaseHistory(Model model, HttpSession session){
        User user = (User) session.getAttribute("user");
        if(user==null){
                model.addAttribute("message","请先登录");
                return "login";
        }else {
            List<OrderDetails> purchaseHistory = commodityService.getPurchaseHistory(user.getId());
            model.addAttribute("purchaseHistory",purchaseHistory);
            return "purchaseHistory";
        }

    }

}

