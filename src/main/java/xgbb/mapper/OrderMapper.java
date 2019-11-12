package xgbb.mapper;

import org.apache.ibatis.annotations.*;
import org.springframework.web.bind.annotation.RequestMapping;
import xgbb.entity.Order;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author nb
 * @since 2019-05-16
 */
@RequestMapping("orderMapper")
public interface OrderMapper extends BaseMapper<Order> {
    @Delete("delete from `order` where order_ID=${orderId}")
    public void cancelOrder(@Param("orderId") Integer orderId);

    @Delete("delete from `order` where order_ID=${orderId}")
    public void delOrder(@Param("orderId") Integer orderId);

    @Select("SELECT * FROM `order` WHERE order_USER_ID=${userId} order by order_id desc limit 1")
    public Order myGetOrderOne(@Param("userId") Integer userId);

    @Select("SELECT * FROM `order` WHERE order_ID=${orderId}")
    public Order getOrderByOrderId(@Param("orderId") Integer orderId);

    @Select("SELECT * FROM `order` WHERE order_USER_ID=${userId} order by order_time desc limit ${q},${h}")
    @Results({
            @Result(property = "store", column = "order_store_id",
                    one = @One(select = "xgbb.mapper.StoreMapper.getStoreById"))
    })
    public List<Order> myGetOrderList(@Param("userId") Integer userId,
                                      @Param("q")int q,
                                      @Param("h")int h);

    @Select("SELECT * FROM `order` WHERE order_store_id=${storeId} order by order_time desc limit ${q},${h}")
    public List<Order> getOrderListByStoreIdFY(@Param("storeId") Integer storeId,
                                             @Param("q")int q,
                                             @Param("h")int h);

    @Select("SELECT * FROM `order` WHERE order_store_id=${storeId} and order_state=1 order by order_time desc limit ${q},${h}")
    public List<Order> getOrderListByStoreIdWhereState_1_FY(@Param("storeId") Integer storeId,
                                               @Param("q")int q,
                                               @Param("h")int h);


    @Select("SELECT * FROM `order` WHERE order_store_id=${storeId} order by order_time desc")
    public List<Order> getOrderListByStoreId(@Param("storeId") Integer storeId);


    @Insert("INSERT INTO `order` (`order_user_id`, `order_time`, `order_price`, `order_store_id`) VALUES ('${userId}',  '${orderTime}', '${orderPrice}', '${orderStoreId}')")
    public void myInsert(@Param("userId") Integer userId,
                         @Param("orderTime") String orderTime,
                         @Param("orderPrice") Double orderPrice,
                         @Param("orderStoreId") Integer orderStoreId);

    @Update("UPDATE `order` SET  `order_state`='1', `address`='${address}', `liaison`='${liaison}', `telephone`='${telephone}' WHERE (`order_id`='${orderId}')")
    public void payment(@Param("address") String address,
                        @Param("liaison") String liaison,
                        @Param("telephone") String telephone,
                        @Param("orderId") Integer orderId);

    @Update("UPDATE `order` SET  `order_state`='2' WHERE `order_id`=${orderId}")
    public void deliverCommodity(@Param("orderId") Integer orderId);

    @Update("UPDATE `order` SET  `order_state`='3' WHERE `order_id`=#{orderId}")
    public void receivingGoods(Integer orderId);

    @Update("UPDATE `order` SET  `order_state`='4' WHERE `order_id`=#{orderId}")
    public void comment(Integer orderId);

    @Select("SELECT * FROM `order` WHERE order_USER_ID=${userId} and order_state='0'order by order_time desc ")
    @Results({
            @Result(property = "store", column = "order_store_id",
                    one = @One(select = "xgbb.mapper.StoreMapper.getStoreById"))
    })
    public List<Order> getOrderWhere0(@Param("userId") Integer userId);

    @Select("SELECT * FROM `order` WHERE order_USER_ID=${userId} and order_state='1'order by order_time desc ")
    @Results({
            @Result(property = "store", column = "order_store_id",
                    one = @One(select = "xgbb.mapper.StoreMapper.getStoreById"))
    })
    public List<Order> getOrderWhere1(@Param("userId") Integer userId);

    @Select("SELECT * FROM `order` WHERE order_USER_ID=${userId} and order_state='2'order by order_time desc ")
    @Results({
            @Result(property = "store", column = "order_store_id",
                    one = @One(select = "xgbb.mapper.StoreMapper.getStoreById"))
    })
    public List<Order> getOrderWhere2(@Param("userId") Integer userId);

    @Select("SELECT * FROM `order` WHERE order_USER_ID=${userId} and order_state='3'order by order_time desc ")
    @Results({
            @Result(property = "store", column = "order_store_id",
                    one = @One(select = "xgbb.mapper.StoreMapper.getStoreById"))
    })
    public List<Order> getOrderWhere3(@Param("userId") Integer userId);

    @Select("SELECT count(*) from `order` WHERE order_store_id=#{storeId}")
    public int getOrderCountByStoreId(Integer storeId);


    @Select("SELECT count(*) from `order` WHERE order_store_id=#{storeId} and order_state=1")
    public int getOrderCountByStoreIdWhereState_1(Integer storeId);


    @Select("SELECT count(*) from `order`")
    public int getOrderCount();

    @Select("SELECT count(*) FROM `order` where order_user_id=#{userId} and order_state=0")
    public int getOrderCountByUserId_0(Integer userId);

    @Select("SELECT count(*) FROM `order` where order_user_id=#{userId} and order_state=1")
    public int getOrderCountByUserId_1(Integer userId);

    @Select("SELECT count(*) FROM `order` where order_user_id=#{userId} and order_state=2")
    public int getOrderCountByUserId_2(Integer userId);

    @Select("SELECT count(*) FROM `order` where order_user_id=#{userId} and order_state=3")
    public int getOrderCountByUserId_3(Integer userId);

    @Select("SELECT count(*) from `order` where order_user_id=#{userId}")
    public int getOrderCountByUserId(Integer userId);

    @Select("select * from `order` order by order_time desc limit ${q} , ${h}")
    @Results({
            @Result(property = "store", column = "order_store_id",
                    one = @One(select = "xgbb.mapper.StoreMapper.getStoreById"))
    })
    public List<Order> myGetOrderListForAdmin(@Param("q") int q,@Param("h") int h);

    @Select("select * from `order` where order_user_id=#{userId} and order_state>0 order by order_time desc limit 0 , 1")
    public Order getGuess(Integer userId);
}