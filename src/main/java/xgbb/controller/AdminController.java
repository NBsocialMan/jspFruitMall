package xgbb.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import xgbb.entity.*;
import xgbb.service.impl.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedHashMap;
import java.util.List;

@Controller
@RequestMapping("admin")
public class AdminController {
    @Autowired
    UserServiceImpl userService;
    @Autowired
    CategoryServiceImpl categoryService;
    @Autowired
    CommodityServiceImpl commodityService;
    @Autowired
    StoreServiceImpl storeService;
    @Autowired
    OrderServiceImpl orderService;
    @Autowired
    OrderDetailsServiceImpl orderDetailsService;
    @Autowired
    AdServiceImpl adService;

    @RequestMapping("loginUI")
    public String loginUI(){
        return "../../admin/login";
    }
    @RequestMapping("login")
    public String login(String name, String password, Model model, HttpSession session){
        User user = userService.adminLogin(name, password);
        if(user==null){
            model.addAttribute("message","无权访问");
            return "../../admin/login";
        }else{
            session.setAttribute("admin",user);
            return "../../admin/homePage";
        }
    }

    @RequestMapping("getCategoryList")
    public String getCategoryList(Model model){
        List<Category> categoryList = categoryService.getAllCategory();
        model.addAttribute("categoryList",categoryList);
        return "../../admin/category/categoryList";
    }

    @RequestMapping("getCommodityList")
    public String getCommodityList(Model model,
                                   Integer currentPage,
                                   String searchName){
        MyPage<Commodity> commodityMyPage = commodityService.myGetCommodityListForAdmin(searchName == null ? "%" : searchName,
                currentPage==null?1:currentPage);
        model.addAttribute("commodityList",commodityMyPage);
        model.addAttribute("searchName",searchName);
        return "../../admin/commodity/commodityList";
    }

    @RequestMapping("getStoreList")
    public String getStoreList(Model model,String searchName,Integer currentPage){
        MyPage<Store> storeList = storeService.myGetStoreList(searchName == null ? "%" : searchName,
                currentPage==null?1:currentPage);
        model.addAttribute("storeList",storeList);
        return "../../admin/store/storeList";
    }

    @RequestMapping("getOrderList")
    public String getOrderList(Model model,String searchName,Integer currentPage){
        MyPage<Order> orderList = orderService.myGetOrderListForAdmin(
                currentPage==null?1:currentPage);
        model.addAttribute("orderList",orderList);
        return "../../admin/order/orderList";
    }

    @RequestMapping("orderDetails")
    public String orderDetails(Model model,Integer orderId){
        List<OrderDetails> orderDetailsList = orderDetailsService.getOrderDetailsByOrderId(orderId);
        model.addAttribute("orderDetailsList",orderDetailsList);
        return "../../admin/order/orderDetails";
    }

    @RequestMapping("modifyCategoryUI")
    public String modifyCategoryUI(Integer categoryId,Model model){
        Category category = categoryService.getCategory(categoryId);
        model.addAttribute("category",category);
        return "../../admin/category/modifyCategory";
    }

    @RequestMapping("modifyCategory")
    public String modifyCategory(Integer categoryId,String categoryName,Model model){
        categoryService.modifyCategory(categoryName,categoryId);
        List<Category> categoryList = categoryService.getAllCategory();
        model.addAttribute("categoryList",categoryList);
        return "../../admin/category/categoryList";
    }

    @RequestMapping("deleteCategory")
    public String deleteCategory(Integer categoryId,Model model){
        categoryService.remove(new QueryWrapper<Category>().eq("category_id",categoryId));
        List<Category> categoryList = categoryService.getAllCategory();
        model.addAttribute("categoryList",categoryList);
        return "../../admin/category/categoryList";
    }

    @RequestMapping("insertCategoryUI")
    public String insertCategoryUI(){
        return "../../admin/category/insertCategory";
    }

    @RequestMapping("dataAnalysisUI")
    public String dataAnalysisUI(){
        return "../../admin/dataAnalysis";
    }

    @RequestMapping("insertCategory")
    public String insertCategory(Model model,String categoryName){
        Category category = new Category();
        category.setCategoryName(categoryName);
        categoryService.save(category);
        List<Category> categoryList = categoryService.getAllCategory();
        model.addAttribute("categoryList",categoryList);
        return "../../admin/category/categoryList";
        }

        @RequestMapping("modifyCommodityUI")
        public String modifyCommodityUI(Model model,Integer commodityId){
            Commodity commodity = commodityService.getCommodityById(commodityId);
            model.addAttribute("commodity",commodity);
            List<Category> allCategory = categoryService.getAllCategory();
            model.addAttribute("allCategory",allCategory);
            return "../../admin/commodity/modifyCommodity";
        }

    @RequestMapping("modifyStoreUI")
    public String modifyStoreUI(Model model,Integer storeId){
        Store one = storeService.getOne(new QueryWrapper<Store>().eq("store_id", storeId));
        model.addAttribute("store",one);
        return "../../admin/store/modifyStore";
    }

        @RequestMapping("modifyCommodity")
        public String modifyCommodity(Integer currentPage,
                                  String searchName,Model model,Integer commodityId,Integer categoryId,Integer shelf,Integer commodityHot){
        if (categoryId==null){
            commodityService.adminModifyCommodity( commodityId, shelf, commodityHot);
        }else {
            commodityService.adminModifyCommodity2( commodityId, shelf, commodityHot,categoryId);
        }

            MyPage<Commodity> commodityMyPage = commodityService.myGetCommodityListForAdmin(searchName == null ? "%" : searchName,
                    currentPage==null?1:currentPage);

            model.addAttribute("commodityList",commodityMyPage);
            model.addAttribute("searchName",searchName);
            return "../../admin/commodity/commodityList";
        }

    @RequestMapping("modifyStore")
    public String modifyStore(Integer currentPage,
                                  String searchName,Model model,Integer storeId,Integer state,Integer storeHot){
        if (state==2){
            commodityService.sanction(storeId);
        }else{
            commodityService.unSanction(storeId);
        }
        storeService.adminModifyStore(storeId, state, storeHot);
        MyPage<Store> storeMyPage = storeService.myGetStoreList(searchName == null ? "%" : searchName,
                currentPage == null ? 1 : currentPage);
        model.addAttribute("storeList",storeMyPage);
        model.addAttribute("searchName",searchName);
        return "../../admin/store/storeList";
    }

        @RequestMapping("getAd")
        public String getAd(Model model){
            List<Ad> adList = adService.list();
            model.addAttribute("adList",adList);
            return "../../admin/ad/adList";
        }

        @RequestMapping("delOrder")
        public String delOrder(Model model,Integer orderId){
        orderService.delOrder(orderId);
            MyPage<Order> orderList = orderService.myGetOrderListForAdmin(1);
            model.addAttribute("orderList",orderList);
            return "../../admin/order/orderList";
        }

    @RequestMapping("storeBT")
    public String storeBT(Model model,Integer storeId){
        model.addAttribute("storeId",storeId);
        return "../../admin/store/storeBT";
    }

    @RequestMapping("storeZT")
    public String storeZT(Model model,Integer storeId){
        model.addAttribute("storeId",storeId);
        return "../../admin/store/storeZT";
    }

        @RequestMapping("modifyAdUI")
    public String modifyAdUI(Integer adId,Model model){
            Ad ad = adService.getOne(new QueryWrapper<Ad>().eq("ad_id", adId));
            model.addAttribute("ad",ad);
            return "../../admin/ad/modifyAd";
        }
        @RequestMapping("modifyAd")
    public String modifyAd(Integer adId,
                           MultipartFile adImg,
                           String adUrl,
                           HttpServletRequest request,
                           Model model) throws IOException {
            Ad ad = adService.getOne(new QueryWrapper<Ad>().eq("ad_id", adId));
            if(adImg!=null&&adImg.getSize()>0){
                String path = request.getSession().getServletContext().getRealPath("/static/ad/");
                File file = new File(path);
                if (!file.exists()){
                    file.mkdirs();
                }
                String fileName="ad"+adId+".jpg";
                adImg.transferTo(new File(path,fileName));
                ad.setAdImg("ad"+adId);
            }else {
                ad.setAdImg(ad.getAdImg());
            }
            ad.setAdId(adId);
            ad.setAdUrl(adUrl==null?ad.getAdUrl():adUrl);
            adService.updateById(ad);
            List<Ad> adList = adService.list();
            model.addAttribute("adList",adList);
            return "../../admin/ad/adList";
        }

    @RequestMapping("/getChart.do")
    public void getChart(HttpServletRequest req, HttpServletResponse resp, Integer storeId) throws IOException {
        req.setCharacterEncoding("utf-8");
        //解决传到前端的数据乱码问题
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("text/html");
        LinkedHashMap<String, Object> map = new LinkedHashMap<>();
        for (int i=1;i<13;i++){
            DataAnalysis data;
            if (i<10){
                data = commodityService.monthAnalysisForAdmin("2019", "0"+i);
                if (data==null){
                    map.put(""+i+"月",0);
                }else
                    map.put(""+i+"月",data.getSalesAmount());
            }else{
                data = commodityService.monthAnalysisForAdmin("2019", ""+i);
                if (data==null){
                    map.put(""+i+"月",0);
                }else
                    map.put(""+i+"月",data.getSalesAmount());
            }
            System.out.println(data);

        }



        System.out.println("-------------------------");
        System.out.println(map);
        //构建返回的数据项，

        JSONObject jsonObject = JSONObject.fromObject(map);
        PrintWriter writer = resp.getWriter();
        writer.print(jsonObject.toString());
        writer.flush();
        writer.close();
    }

        }