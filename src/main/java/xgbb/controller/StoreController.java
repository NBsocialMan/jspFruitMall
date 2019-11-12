package xgbb.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.multipart.MultipartFile;
import xgbb.entity.*;
import xgbb.service.impl.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author nb
 * @since 2019-04-28
 */
@Controller
@RequestMapping("store")
public class StoreController {
    @Resource(name = "storeService")
    StoreServiceImpl storeService;
    @Autowired
    UserServiceImpl userService;
    @Autowired
    OrderServiceImpl orderService;
    @Autowired
    OrderDetailsServiceImpl orderDetailsService;
    @Autowired
    CommodityServiceImpl commodityService;
    @Autowired
    CategoryServiceImpl categoryService;
    @RequestMapping("myGetStoreList.do")
    public String myGetStoreList(Model model, Integer currentPage, String searchName){
        MyPage<Store> storeMyPage = storeService.myGetStoreList(searchName == null ? "%" : searchName,
                currentPage == null ? 1 : currentPage);
        List<Store> hotStoreList = storeService.getHotStoreList();
        model.addAttribute("hotStoreList",hotStoreList);
        model.addAttribute("storeList",storeMyPage);
        model.addAttribute("searchName",searchName);
        return "storeList";
    }

    @RequestMapping("storeDetails.do")
    public String storeDetails(Model model,Integer storeId){
        Store store = storeService.myGetStore(storeId);
        model.addAttribute("store",store);
        return "storeDetails";
    }


    @RequestMapping("storeRegisterUI")
    public String storeRegisterUI(){
        return "storeRegister";
    }

    @RequestMapping("storeRegister")
    public String storeRegister(HttpServletRequest request,
                                MultipartFile storePicture,
                                Model model,
                                Integer userId,
                                String storeName,
                                String storeAddress,
                                String storeIntroduction,
                                HttpSession session) throws IOException {
        User user = userService.getOne(new QueryWrapper<User>().eq("id", userId));
        user.setRole(1);
        userService.updateById(user);
        Store store = new Store();
        store.setStoreName(storeName);
        store.setStoreAddress(storeAddress);
        store.setStoreIntroduction(storeIntroduction);
        store.setStoreOwnerId(userId);
        storeService.save(store);
        Store store1 = storeService.myGetStoreOne(userId);
        String path = request.getSession().getServletContext().getRealPath("/static/store/storePictures/");
        File file = new File(path);
        if (!file.exists()){
            file.mkdirs();
        }
        String fileName="storePicture"+store1.getStoreId()+".jpg";

        storePicture.transferTo(new File(path,fileName));
        store.setStoreId(store1.getStoreId());
        store.setStorePicture("storePicture"+store1.getStoreId());
        storeService.updateById(store);
        model.addAttribute("message","店铺注册成功,请重新进入卖家中心！");
        user=userService.getOne(new QueryWrapper<User>().eq("id", userId));
        session.setAttribute("user",user);
        return "sellerCenter";
    }

    @RequestMapping("storeInformationUI")
    public String storeInformationUI(Model model, HttpSession session){
        User user = (User) session.getAttribute("user");
        if(user==null){
            model.addAttribute("message","请先登录");
            return "login";
        }
        Store store = storeService.myGetStoreOne(user.getId());
        session.setAttribute("store",store);
        model.addAttribute("sellerCenterState",1);
        return "sellerCenter";
    }

    @RequestMapping("modifyStoreInformation")
    public String modifyStoreInformation(Model model,
                                         HttpSession session,
                                         HttpServletRequest request,
                                         MultipartFile storePicture,
                                         String storeName,
                                         Integer storeState,
                                         String storeAddress,
                                         String storeIntroduction) throws IOException {
        User user = (User) session.getAttribute("user");
         Store store = storeService.myGetStoreOne(user.getId());
        Store store1 = new Store();
        store1.setStoreName(storeName);
        store1.setStoreAddress(storeAddress);
        store1.setStoreIntroduction(storeIntroduction);
        store1.setStoreId(store.getStoreId());
        if(storeState!=null){
            store1.setStoreState(storeState);
            if(storeState==0){
                commodityService.lowerShelf(store.getStoreId());
            }else if(storeState==1){
                commodityService.upperShelf(store.getStoreId());
            }
        }
        if(storePicture!=null&&storePicture.getSize()!=0){
            String path = request.getSession().getServletContext().getRealPath("/static/store/storePictures/");
            File file = new File(path);
            if (!file.exists()){
                file.mkdirs();
            }
            String fileName="storePicture"+store.getStoreId()+".jpg";
            storePicture.transferTo(new File(path,fileName));
            store1.setStorePicture("storePicture"+store.getStoreId());
        }else {
            store1.setStorePicture(store.getStorePicture());
        }
        storeService.updateById(store1);
        store = storeService.myGetStoreOne(user.getId());
        model.addAttribute("store",store);
        model.addAttribute("sellerCenterState",1);
        return "sellerCenter";
    }

    @RequestMapping("commodityManagementUI.do")
    public String commodityManagementUI(Model model,HttpSession session, Integer currentPage){
        User user = (User) session.getAttribute("user");
        Store store = storeService.myGetStoreOne(user.getId());
        MyPage<Commodity> commodityListByOwnerStoreId = commodityService.getCommodityListByOwnerStoreIdForSeller(store.getStoreId(), currentPage == null ? 1 : currentPage);
        model.addAttribute("commodityList",commodityListByOwnerStoreId);
        model.addAttribute("sellerCenterState",0);
        return "sellerCenter";
    }

    @RequestMapping("deleteCommodity")
    public String deleteCommodity(Model model,Integer commodityId,HttpSession session){
        commodityService.remove(new QueryWrapper<Commodity>().eq("commodity_id",commodityId));
        User user = (User) session.getAttribute("user");
        Store store = storeService.myGetStoreOne(user.getId());
        MyPage<Commodity> commodityListByOwnerStoreId = commodityService.getCommodityListByOwnerStoreIdForSeller(store.getStoreId(), 1);
        model.addAttribute("commodityList",commodityListByOwnerStoreId);
        model.addAttribute("sellerCenterState",0);
        return "sellerCenter";
    }

    @RequestMapping("dataAnalysisUI")
    public String dataAnalysisUI(Model model,Integer storeId,HttpSession session,Integer sellerCenterState){
        if (sellerCenterState!=null){
            model.addAttribute("sellerCenterState",sellerCenterState);
        }else {
            model.addAttribute("sellerCenterState",3);
        }
        return "sellerCenter";
    }

    @RequestMapping("modifyCommodityUI")
    public String modifyCommodityUI(Model model,Integer commodityId){
        Commodity commodity = commodityService.getCommodityById(commodityId);
        List<Category> allCategory = categoryService.getAllCategory();
        model.addAttribute("allCategory",allCategory);
        model.addAttribute("commodity",commodity);
        model.addAttribute("sellerCenterState",10);
        return "sellerCenter";
    }

    @RequestMapping("modifyCommodity")
    public String modifyCommodity(HttpServletRequest request,
                                  Model model,
                                  Integer commodityId,
                                  MultipartFile commodityPicture,
                                  MultipartFile commodityPosterPicture1,
                                  MultipartFile commodityPosterPicture2,
                                  MultipartFile commodityPosterPicture3,
                                  String commodityName,
                                  Integer commodityCategoryId,
                                  String commodityIntroduce,
                                  Integer shelf,
                                  Integer commodityStock,
                                  Double commodityPrice,
                                  Double commodityCurrentprice,
                                  Double commodityWeight,
                                  Double commodityFloat,
                                  String  commodityLevel,
                                  HttpSession session) throws IOException {
        Commodity commodity = new Commodity();
        commodity.setCommodityId(commodityId);
        commodity.setCommodityName(commodityName);
        commodity.setCommodityCategoryId(commodityCategoryId);
        commodity.setCommodityIntroduce(commodityIntroduce);
        commodity.setShelf(shelf);
        commodity.setCommodityStock(commodityStock);
        commodity.setCommodityPrice(commodityPrice);
        commodity.setCommodityCurrentprice(commodityCurrentprice);
        commodity.setCommodityWeight(commodityWeight);
        commodity.setCommodityFloat(commodityFloat);
        commodity.setCommodityLevel(commodityLevel);
        if(commodityPicture!=null&&commodityPicture.getSize()!=0){
            String path = request.getSession().getServletContext().getRealPath("/static/commodity/commodityPictures/");
            File file = new File(path);
            if (!file.exists()){
                file.mkdirs();
            }
            String fileName="commodityPicture"+commodityId+".jpg";
            commodityPicture.transferTo(new File(path,fileName));
            commodity.setCommodityPicture("commodityPicture"+commodityId);
        }else {
            Commodity commodityById = commodityService.getCommodityById(commodityId);
            commodity.setCommodityPicture(commodityById.getCommodityPicture());
        }
        if(commodityPosterPicture1!=null&&commodityPosterPicture1.getSize()!=0){
            String path = request.getSession().getServletContext().getRealPath("/static/commodity/commodityPosterPictures/");
            File file = new File(path);
            if (!file.exists()){
                file.mkdirs();
            }
            String fileName="commodity"+commodityId+"PosterPicture1.jpg";
            commodityPosterPicture1.transferTo(new File(path,fileName));
            commodity.setCommodityPosterPicture1("commodity"+commodityId+"PosterPicture1");
        }else {
            Commodity commodityById = commodityService.getCommodityById(commodityId);
            commodity.setCommodityPosterPicture1(commodityById.getCommodityPosterPicture1());
        }
        if(commodityPosterPicture2!=null&&commodityPosterPicture2.getSize()!=0){
            String path = request.getSession().getServletContext().getRealPath("/static/commodity/commodityPosterPictures/");
            File file = new File(path);
            if (!file.exists()){
                file.mkdirs();
            }
            String fileName="commodity"+commodityId+"PosterPicture2.jpg";
            commodityPosterPicture2.transferTo(new File(path,fileName));
            commodity.setCommodityPosterPicture2("commodity"+commodityId+"PosterPicture2");
        }else {
            Commodity commodityById = commodityService.getCommodityById(commodityId);
            commodity.setCommodityPosterPicture2(commodityById.getCommodityPosterPicture2());
        }
        if(commodityPosterPicture3!=null&&commodityPosterPicture3.getSize()!=0){
            String path = request.getSession().getServletContext().getRealPath("/static/commodity/commodityPosterPictures/");
            File file = new File(path);
            if (!file.exists()){
                file.mkdirs();
            }
            String fileName="commodity"+commodityId+"PosterPicture3.jpg";
            commodityPosterPicture3.transferTo(new File(path,fileName));
            commodity.setCommodityPosterPicture3("commodity"+commodityId+"PosterPicture3");
        }else {
            Commodity commodityById = commodityService.getCommodityById(commodityId);
            commodity.setCommodityPosterPicture3(commodityById.getCommodityPosterPicture3());
        }
        commodityService.updateById(commodity);
        User user = (User) session.getAttribute("user");
        Store store = storeService.myGetStoreOne(user.getId());
        MyPage<Commodity> commodityListByOwnerStoreId = commodityService.getCommodityListByOwnerStoreIdForSeller(store.getStoreId(), 1);
        model.addAttribute("commodityList",commodityListByOwnerStoreId);
        model.addAttribute("sellerCenterState",0);
        return  "sellerCenter";
    }

    @RequestMapping("orderProcessingUI")
    public String orderProcessingUI(Model model,HttpSession session,Integer currentPage){
        Store store = (Store) session.getAttribute("store");
        MyPage<Order> orderList = orderService.getOrderListByStoreIdFY(store.getStoreId(), currentPage == null ? 1 : currentPage);
        model.addAttribute("orderListPage",orderList);
        model.addAttribute("sellerCenterState",2);
        return "sellerCenter";
    }

    @RequestMapping("getOrderWhereState_1")
    public String getOrderWhereState_1(Model model,HttpSession session,Integer currentPage){
        Store store = (Store) session.getAttribute("store");
        MyPage<Order> orderList = orderService.getOrderListByStoreIdWhereState_1_FY(store.getStoreId(), currentPage == null ? 1 : currentPage);
        model.addAttribute("orderListPage",orderList);
        model.addAttribute("sellerCenterState",21);
        return "sellerCenter";
    }

    @RequestMapping("orderDetails.do")
    public String orderDetails(Model model,HttpSession session,Integer orderId){
        List<OrderDetails> orderDetailsList = orderDetailsService.getOrderDetailsByOrderId(orderId);
        model.addAttribute("orderDetailsList",orderDetailsList);
        model.addAttribute("sellerCenterState",20);
        return "sellerCenter";
    }

    @RequestMapping("deliverCommodity")
    public String deliverCommodity(Model model,HttpSession session,Integer orderId,Integer currentPage){
        Store store = (Store) session.getAttribute("store");
        List<OrderDetails> orderDetailsByOrderId = orderDetailsService.getOrderDetailsByOrderId(orderId);
        List judge=new ArrayList();
         Boolean flag=false;
        for (OrderDetails o:orderDetailsByOrderId) {
            Integer commodityId = o.getCommodityId();
            Integer commodityNumber = o.getCommodityNumber();
            Commodity commodity = commodityService.getCommodityById(commodityId);
            if(commodity.getCommodityStock()-commodityNumber<0){
                judge.add(flag);
            }
        }
        if (judge.size()==0){
            orderService.deliverCommodity(orderId);//处理订单
            for (OrderDetails o:orderDetailsByOrderId) {
                Commodity commodity = commodityService.getCommodityById(o.getCommodityId());
                commodityService.handStock(commodity.getCommodityId(),commodity.getCommodityStock()-o.getCommodityNumber());
                commodityService.handSalesvolume(commodity.getCommodityId(),commodity.getCommoditySalesvolume()+o.getCommodityNumber());
            }
        }else{
            MyPage<Order> orderMyPage = orderService.getOrderListByStoreIdFY(store.getStoreId(), currentPage==null?1:currentPage);
            model.addAttribute("orderListPage",orderMyPage);
            model.addAttribute("fail","1");
            model.addAttribute("sellerCenterState",2);
            return "sellerCenter";
        }
        MyPage<Order> orderMyPage = orderService.getOrderListByStoreIdFY(store.getStoreId(), currentPage==null?1:currentPage);
        model.addAttribute("orderListPage",orderMyPage);
        model.addAttribute("success","1");
        model.addAttribute("sellerCenterState",2);
        return "sellerCenter";
    }

    @RequestMapping("addCommodityUI")
    public  String addCommodityUI(Model model){
        List<Category> categoryList = categoryService.list();
        model.addAttribute("allCategory",categoryList);
        model.addAttribute("sellerCenterState",100);
        return "sellerCenter";
    }

    @RequestMapping("upperShelf")
    public String upperShelf(Model model,HttpSession session){
        User user = (User) session.getAttribute("user");
        if (user==null){
            model.addAttribute("message","先等登录");
            return "login";
        }
        Store store = storeService.myGetStoreOne(user.getId());
        commodityService.upperShelf(store.getStoreId());
        MyPage<Commodity> commodityListByOwnerStoreId = commodityService.getCommodityListByOwnerStoreIdForSeller(store.getStoreId(), 1);
        model.addAttribute("commodityList",commodityListByOwnerStoreId);
        model.addAttribute("sellerCenterState",0);
        return "sellerCenter";
    }

    @RequestMapping("lowerShelf")
    public String lowerShelf(Model model,HttpSession session){
        User user = (User) session.getAttribute("user");
        if (user==null){
            model.addAttribute("message","先等登录");
            return "login";
        }
        Store store = storeService.myGetStoreOne(user.getId());
        commodityService.lowerShelf(store.getStoreId());
        MyPage<Commodity> commodityListByOwnerStoreId = commodityService.getCommodityListByOwnerStoreIdForSeller(store.getStoreId(), 1);
        model.addAttribute("commodityList",commodityListByOwnerStoreId);
        model.addAttribute("sellerCenterState",0);
        return "sellerCenter";
    }

    @RequestMapping("addCommodity")
    public String addCommodity(HttpServletRequest request,
                               Model model,
//                               Integer commodityId,
                               MultipartFile commodityPicture,
                               String commodityName,
                               Integer commodityCategoryId,
                               String commodityIntroduce,
                               Integer shelf,
                               Integer commodityStock,
                               Double commodityPrice,
                               Double commodityCurrentprice,
                               Double commodityWeight,
                               Double commodityFloat,
                               String  commodityLevel,
                               HttpSession session) throws IOException {
        Store store = (Store) session.getAttribute("store");
        Commodity commodity = new Commodity();
        commodity.setCommodityName(commodityName);
        commodity.setCommodityCategoryId(commodityCategoryId);
        commodity.setCommodityIntroduce(commodityIntroduce);
        commodity.setShelf(shelf);
        commodity.setOwnerStoreId(store.getStoreId());
        commodity.setCommodityStock(commodityStock);
        commodity.setCommodityPrice(commodityPrice);
        commodity.setCommodityCurrentprice(commodityCurrentprice);
        commodity.setCommodityWeight(commodityWeight);
        commodity.setCommodityFloat(commodityFloat);
        commodity.setCommodityLevel(commodityLevel);
        commodityService.save(commodity);
        Commodity theLatestCommodity = commodityService.getTheLatestCommodityByOwnerStore(store.getStoreId());
        int commodityId=theLatestCommodity.getCommodityId();
        if(commodityPicture!=null&&commodityPicture.getSize()!=0){
            String path = request.getSession().getServletContext().getRealPath("/static/commodity/commodityPictures/");
            File file = new File(path);
            if (!file.exists()){
                file.mkdirs();
            }
            String fileName="commodityPicture"+commodityId+".jpg";
            commodityPicture.transferTo(new File(path,fileName));
            theLatestCommodity.setCommodityPicture("commodityPicture"+commodityId);
        }
        commodityService.updateById(theLatestCommodity);
        User user = (User) session.getAttribute("user");
        MyPage<Commodity> commodityListByOwnerStoreId = commodityService.getCommodityListByOwnerStoreIdForSeller(store.getStoreId(), 1);
        model.addAttribute("commodityList",commodityListByOwnerStoreId);
        model.addAttribute("sellerCenterState",0);
        return  "sellerCenter";
    }


    /*
     * 饼状图，模拟数据返回json
     */
    @RequestMapping("/getChart.do")
    public void getChart(HttpServletRequest req, HttpServletResponse resp,Integer storeId) throws IOException {
        req.setCharacterEncoding("utf-8");
        //解决传到前端的数据乱码问题
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("text/html");
        List<DataAnalysis> dataAnalyses = commodityService.dataAnalysis(storeId);
        //构建返回的数据项，实际开发中应该从数据库中读出
        Map<String, Object> map = new HashMap<>();
        for (DataAnalysis data: dataAnalyses) {
            map.put(data.getName(), data.getSalesVolume());
        }
        JSONObject jsonObject = JSONObject.fromObject(map);
        PrintWriter writer = resp.getWriter();
        writer.print(jsonObject.toString());
        writer.flush();
        writer.close();
    }
    @RequestMapping("/getChart2.do")
    public void getChart2(HttpServletRequest req, HttpServletResponse resp,Integer storeId) throws IOException {
        req.setCharacterEncoding("utf-8");
        //解决传到前端的数据乱码问题
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("text/html");
        LinkedHashMap<String, Object> map = new LinkedHashMap<>();
        for (int i=1;i<13;i++){
            DataAnalysis data;
            if (i<10){
                data = commodityService.monthAnalysis(storeId, "2019", "0"+i);
                if (data==null){
                    map.put(""+i+"月",0);
                }else
                    map.put(""+i+"月",data.getSalesAmount());
            }else{
                data = commodityService.monthAnalysis(storeId, "2019", ""+i);
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

    @RequestMapping("ADManageUI")
    public String ADManageUI(HttpSession session,Model model){
        model.addAttribute("sellerCenterState",6);
        User user = (User) session.getAttribute("user");
        Store store = storeService.myGetStoreOne(user.getId());
        session.setAttribute("store",store);
        return "sellerCenter";
    }
    @RequestMapping("ADManage")
    public String ADManage(HttpSession session,
                           Model model,
                           HttpServletRequest request,
                           MultipartFile storePosterPicture1,
                           MultipartFile storePosterPicture2,
                           MultipartFile storePosterPicture3) throws IOException {
        model.addAttribute("sellerCenterState",6);
        User user = (User) session.getAttribute("user");
        Store store = storeService.myGetStoreOne(user.getId());
        session.setAttribute("store",store);
        if(storePosterPicture1!=null&&storePosterPicture1.getSize()!=0){
            String path = request.getSession().getServletContext().getRealPath("/static/store/storePosterPictures/");
            File file = new File(path);
            if (!file.exists()){
                file.mkdirs();
            }
            String fileName="store"+store.getStoreId()+"PosterPicture1.jpg";
            storePosterPicture1.transferTo(new File(path,fileName));
            storeService.setPoster1("store"+store.getStoreId()+"PosterPicture1",store.getStoreId());
        }
        if(storePosterPicture2!=null&&storePosterPicture2.getSize()!=0){
            String path = request.getSession().getServletContext().getRealPath("/static/store/storePosterPictures/");
            File file = new File(path);
            if (!file.exists()){
                file.mkdirs();
            }
            String fileName="store"+store.getStoreId()+"PosterPicture2.jpg";
            storePosterPicture2.transferTo(new File(path,fileName));
            storeService.setPoster2("store"+store.getStoreId()+"PosterPicture2",store.getStoreId());
        }
        if(storePosterPicture3!=null&&storePosterPicture3.getSize()!=0){
            String path = request.getSession().getServletContext().getRealPath("/static/store/storePosterPictures/");
            File file = new File(path);
            if (!file.exists()){
                file.mkdirs();
            }
            String fileName="store"+store.getStoreId()+"PosterPicture3.jpg";
            storePosterPicture3.transferTo(new File(path,fileName));
            storeService.setPoster3("store"+store.getStoreId()+"PosterPicture3",store.getStoreId());
        }
        model.addAttribute("sellerCenterState",6);
        return "sellerCenter";
    }



}

