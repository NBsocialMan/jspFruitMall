package xgbb.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import xgbb.entity.OrderDetails;
import xgbb.mapper.OrderDetailsMapper;
import xgbb.mapper.OrderMapper;
import xgbb.service.OrderDetailsService;
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
@Service("orderDetailsService")
public class OrderDetailsServiceImpl extends ServiceImpl<OrderDetailsMapper, OrderDetails> implements OrderDetailsService {

    @Autowired
    OrderDetailsMapper orderDetailsMapper;

    @Autowired
    OrderMapper orderMapper;
    public List<OrderDetails> getOrderDetailsByOrderId(Integer orderId){
        return orderDetailsMapper.getOrderDetailsByOrderId(orderId);
    }

    public void changeCommentState(Integer commodityId, Integer orderId){
        orderDetailsMapper.changeCommentState(commodityId, orderId);
    };

}
