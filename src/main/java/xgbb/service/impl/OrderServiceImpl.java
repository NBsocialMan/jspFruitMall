package xgbb.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import xgbb.entity.*;
import xgbb.mapper.OrderDetailsMapper;
import xgbb.mapper.OrderMapper;
import xgbb.service.OrderService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author nb
 * @since 2019-05-16
 */
@Service("orderService")
public class OrderServiceImpl extends ServiceImpl<OrderMapper, Order> implements OrderService {
    @Autowired
    OrderMapper orderMapper;

    @Autowired
    OrderDetailsMapper orderDetailsMapper;

    public Order myGetOrderOne(Integer userId){
        return orderMapper.myGetOrderOne(userId);
    }
    public Order getOrderByOrderId(Integer orderId){
        return orderMapper.getOrderByOrderId(orderId);
    }
    public void cancelOrder(Integer orderId){
        orderMapper.cancelOrder(orderId);
        orderDetailsMapper.delete(new QueryWrapper<OrderDetails>().eq("order_id",orderId));
    }

    public void delOrder(Integer orderId){
        orderMapper.delOrder(orderId);
        orderDetailsMapper.delOrderDetails(orderId);
    }

    public MyPage<Order> myGetOrderList(Integer userId,Integer currentPage){
        MyPage myPage = new MyPage();
        myPage.setCurrentPage(currentPage);
        myPage.setPageNotesCount(10);
        int count = orderMapper.getOrderCountByUserId(userId);
        int ceil = (int)Math.ceil(1.0 * count / 10);
        myPage.setPageTotal(ceil);
        List<Order> orders = orderMapper.myGetOrderList(userId, (currentPage - 1) * 10, 10);
        myPage.setList(orders);
        return myPage;
    }

    public void payment(String address,String liaison,String telephone,Integer orderId){
        orderMapper.payment(address,liaison,telephone,orderId);
    }

    public void addOrder(Order order, List<OrderDetails> orderDetailsList){
        orderMapper.myInsert(order.getOrderUserId(),order.getOrderTime(),order.getOrderPrice(),order.getOrderStoreId());
        Integer orderId=order.getOrderUserId();
        Order order1 = orderMapper.myGetOrderOne(orderId);
        for (OrderDetails orderDetails:
                orderDetailsList) {
            orderDetails.setOrderId(order1.getOrderId());
            orderDetailsMapper.myInsert(orderDetails.getCommodityId(),
                    orderDetails.getCommodityNumber(),
                    orderDetails.getOrderId());
        }

    }
    public List<Order> getOrderListByStoreId(Integer storeId){
        return orderMapper.getOrderListByStoreId(storeId);
    }

    public MyPage<Order> getOrderListByStoreIdFY(Integer storeId,int currentPage){
        MyPage myPage = new MyPage();
        myPage.setCurrentPage(currentPage);
        myPage.setPageNotesCount(6);
        int count = orderMapper.getOrderCountByStoreId(storeId);
        int ceil = (int)Math.ceil(1.0 * count / 6);
        myPage.setPageTotal(ceil);
        List<Order> orders = orderMapper.getOrderListByStoreIdFY(storeId, (myPage.getCurrentPage() - 1) * 6, myPage.getPageNotesCount());
        myPage.setList(orders);
        return myPage;
    }

    public MyPage<Order> getOrderListByStoreIdWhereState_1_FY(Integer storeId,int currentPage){
        MyPage myPage = new MyPage();
        myPage.setCurrentPage(currentPage);
        myPage.setPageNotesCount(6);
        int count = orderMapper.getOrderCountByStoreIdWhereState_1(storeId);
        int ceil = (int)Math.ceil(1.0 * count / 6);
        myPage.setPageTotal(ceil);
        List<Order> orders = orderMapper.getOrderListByStoreIdWhereState_1_FY(storeId, (myPage.getCurrentPage() - 1) * 6, myPage.getPageNotesCount());
        myPage.setList(orders);
        return myPage;
    }

    public void deliverCommodity(Integer orderId){
        orderMapper.deliverCommodity(orderId);

    }

    public void receivingGoods(Integer orderId){
        orderMapper.receivingGoods(orderId);
    }

    public void comment(Integer orderId){ orderMapper.comment(orderId);}

    public List<Order> getOrderWhere0(Integer userId){
        return orderMapper.getOrderWhere0(userId);
    }

    public List<Order> getOrderWhere1(Integer userId){
        return orderMapper.getOrderWhere1(userId);
    }

    public int getOrderCount(){
        return orderMapper.getOrderCount();
    }

    public List<Order> getOrderWhere2(Integer userId){
        return orderMapper.getOrderWhere2(userId);
    }

    public List<Order> getOrderWhere3(Integer userId){
        return orderMapper.getOrderWhere3(userId);
    }

    public MyPage<Order> myGetOrderListForAdmin(int currentPage){
        MyPage myPage = new MyPage();
        myPage.setCurrentPage(currentPage);
        myPage.setPageNotesCount(10);
        int count = orderMapper.getOrderCount();
        int ceil = (int)Math.ceil(1.0 * count / 10);
        myPage.setPageTotal(ceil);
        List<Order> orders = orderMapper.myGetOrderListForAdmin( (myPage.getCurrentPage() - 1) * 10, myPage.getPageNotesCount());
        myPage.setList(orders);
        return myPage;
    }
    public int getOrderCountByUserId_0(Integer userId){
        return orderMapper.getOrderCountByUserId_0(userId);
    }
    public int getOrderCountByUserId_1(Integer userId){
        return orderMapper.getOrderCountByUserId_1(userId);
    }
    public int getOrderCountByUserId_2(Integer userId){
        return orderMapper.getOrderCountByUserId_2(userId);
    }
    public int getOrderCountByUserId_3(Integer userId){
        return orderMapper.getOrderCountByUserId_3(userId);
    }

}