package xgbb.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import xgbb.entity.*;
import xgbb.service.impl.OrderDetailsServiceImpl;
import xgbb.service.impl.OrderServiceImpl;
import xgbb.service.impl.ShoppingCartServiceImpl;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author nb
 * @since 2019-05-16
 */
@Controller
@RequestMapping("order")
public class OrderController {
    @Autowired
    OrderServiceImpl orderService;
    @Autowired
    OrderDetailsServiceImpl orderDetailsService;
    @Autowired
    ShoppingCartServiceImpl shoppingCartService;
    //已弃用的方法

    @RequestMapping("paymentUI")
    public String paymentUI(Model model,Integer orderId){
        Order order = orderService.getOrderByOrderId(orderId);
        List<OrderDetails> orderDetailsList = orderDetailsService.getOrderDetailsByOrderId(orderId);
        order.setOrderDetailsList(orderDetailsList);
        model.addAttribute("order",order);
        return "paymentUI";
    }
    @RequestMapping("myOrder")
    public String myOrder(Model model, HttpSession session,Integer currentPage){
        User user = (User)session.getAttribute("user");
        Integer userId = user.getId();
        MyPage<Order> orderMyPage = orderService.myGetOrderList(userId, currentPage == null ? 1 : currentPage);
        model.addAttribute("orderMyPage",orderMyPage);
        return "myOrder";
    }

    @RequestMapping("myOrderPlus")
    public String myOrderPlus(Model model,HttpSession session,Integer state){
        User user = (User)session.getAttribute("user");
        Integer userId = user.getId();
        if (state==0){
            List<Order> orderList = orderService.getOrderWhere0(userId);
            model.addAttribute("orderList",orderList);
        }else if(state==1){
            List<Order> orderList = orderService.getOrderWhere1(userId);
            model.addAttribute("orderList",orderList);
        }else if(state==2){
            List<Order> orderList = orderService.getOrderWhere2(userId);
            model.addAttribute("orderList",orderList);
        }else if(state==3){
            List<Order> orderList = orderService.getOrderWhere3(userId);
            model.addAttribute("orderList",orderList);
        }
        model.addAttribute("state",state);
        return "myOrder";
    }

    @RequestMapping("cancelOrder")
    public String cancelOrder(Integer orderId,Integer userId,Model model){
        Order order = orderService.getOrderByOrderId(orderId);
        if(order.getOrderState()==2){
            MyPage<Order> orderList = orderService.myGetOrderList(userId, 1);
            model.addAttribute("orderMyPage",orderList);
            model.addAttribute("message",2);
            return "myOrder";
        }
        orderService.cancelOrder(orderId);
        MyPage<Order> orderList = orderService.myGetOrderList(userId,1);
        model.addAttribute("orderMyPage",orderList);
        model.addAttribute("message",0);
        return "myOrder";

    }

    //commentUI评论入口
    @RequestMapping("orderDetails")
    public String orderDetails(Model model,Integer orderId){
        List<OrderDetails> orderDetailsList = orderDetailsService.getOrderDetailsByOrderId(orderId);
        Order order = orderService.getOrderByOrderId(orderId);
        model.addAttribute("order",order);
        model.addAttribute("orderDetailsList",orderDetailsList);
        return "orderDetails";
    }

    @RequestMapping("payment")
    public String payment(Integer orderId,
                          String address,
                          String liaison,
                          String telephone,
                          Model model,
                          Integer userId){
        orderService.payment(address,liaison,telephone,orderId);
        MyPage<Order> orderList = orderService.myGetOrderList(userId,1);
        model.addAttribute("orderMyPage",orderList);
        model.addAttribute("message",1);
        return "myOrder";
    }
    @RequestMapping("newAddOrder")
    public String newAddOrder(Model model,Integer userId,HttpSession session){
        List<HandleOrder> handleOrderList = shoppingCartService.howManyOrder(userId);
        for (HandleOrder handleOrder:handleOrderList) {
            //一个订单有一个总价
            Double totalPrice=0.0;
            //一个订单有一个订单详情List
            List<OrderDetails> orderDetailsList=new ArrayList<OrderDetails>();
            Order order = new Order();
            Date date = new Date();
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy年MM月dd日HH时mm分ss秒SSS毫秒");
            String date1 = simpleDateFormat.format(date);
            order.setOrderStoreId(handleOrder.getStoreId());
            order.setOrderTime(date1);
            order.setOrderUserId(userId);
            List<HandleOrder> handleOrders = shoppingCartService.handleOrder(userId, handleOrder.getStoreId());
            int i=0;
            for (HandleOrder realHandle:handleOrders) {
                OrderDetails orderDetails = new OrderDetails();
                orderDetails.setCommodityId(realHandle.getCommodityId());
                orderDetails.setCommodityNumber(realHandle.getCommodityNumber());
                orderDetailsList.add(i,orderDetails);
                totalPrice+=realHandle.getCommodityNumber()*realHandle.getCommodityCurrentprice();
                i++;
            }
            order.setOrderPrice(totalPrice);
            order.setOrderDetailsList(orderDetailsList);
            orderService.addOrder(order,orderDetailsList);
        }
//        shoppingCartService.cleanupCart(userId);
        shoppingCartService.discardSPC(userId);
        MyPage<Order> orderList= orderService.myGetOrderList(userId,1);
        model.addAttribute("orderMyPage",orderList);
        return "myOrder";
    }

    @RequestMapping("receivingGoods")
    public  String receivingGoods(Model model,
                                  Integer orderId,
                                  Integer userId){
        orderService.receivingGoods(orderId);
        MyPage<Order> orderList = orderService.myGetOrderList(userId,1);
        model.addAttribute("orderMyPage",orderList);
        model.addAttribute("message",3);
        return "myOrder";
    }



}