package xgbb.mapper;

import org.apache.ibatis.annotations.*;
import org.springframework.web.bind.annotation.RequestMapping;
import xgbb.entity.OrderDetails;
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
@RequestMapping("orderDetailsMapper")
public interface OrderDetailsMapper extends BaseMapper<OrderDetails> {
    @Select("select * from order_details where order_id=${orderId}")
    @Results({
            @Result(property = "commodityId",column = "commodity_id"),
            @Result(property = "orderId",column = "order_id"),
            @Result(property = "state",column = "state"),
            @Result(property = "commodity",column = "commodity_id",
                    one = @One(select = "xgbb.mapper.CommodityMapper.getCommodityById"))
    })
    public List<OrderDetails> getOrderDetailsByOrderId(@Param("orderId") Integer orderId);

    @Insert("INSERT INTO `order_details` (`commodity_id`, `commodity_number`, `order_id`) VALUES ('${commodityId}',  '${commodityNumber}', '${orderId}')")
    public void myInsert(@Param("commodityId")Integer commodityId,
                         @Param("commodityNumber") Integer commodityNumber,
                         @Param("orderId")Integer orderId);

    @Update("UPDATE order_details  SET state=1  WHERE commodity_id=${commodityId} and order_id=${orderId}")
    public void changeCommentState(@Param("commodityId") Integer commodityId,@Param("orderId") Integer orderId);

    @Delete("delete from `order_details` where order_id=${orderId}")
    public void delOrderDetails(@Param("orderId") Integer orderId);
}
