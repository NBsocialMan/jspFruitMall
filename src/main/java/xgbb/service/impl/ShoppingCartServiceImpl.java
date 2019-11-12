package xgbb.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import xgbb.entity.HandleOrder;
import xgbb.entity.ShoppingCart;
import xgbb.mapper.ShoppingCartMapper;
import xgbb.service.ShoppingCartService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author nb
 * @since 2019-04-30
 */
@Service("shoppingCartService")
public class ShoppingCartServiceImpl extends ServiceImpl<ShoppingCartMapper, ShoppingCart> implements ShoppingCartService {

    @Resource(name = "shoppingCartMapper")
    ShoppingCartMapper shoppingCartMapper;

    public List<ShoppingCart> getShoppingCartById(Integer userId){
        return shoppingCartMapper.getShoppingCartById(userId);
    }

    public void cleanupCart(Integer userId){
        shoppingCartMapper.delete(new QueryWrapper<ShoppingCart>().eq("user_id",userId));
    }

    public void removeCart(Integer userId,Integer commodityId){
        shoppingCartMapper.delete(new QueryWrapper<ShoppingCart>().eq("user_id",userId).
                eq("commodity_id",commodityId));
    }

    public void addCart(Integer userId,Integer commodityId,Integer commodityNumber){
        ShoppingCart one = shoppingCartMapper.selectOne(new QueryWrapper<ShoppingCart>().eq("user_id", userId).
                eq("commodity_id", commodityId));
        if (one==null){
            ShoppingCart cart = new ShoppingCart();
            cart.setUserId(userId);
            cart.setCommodityId(commodityId);
            cart.setCommodityNumber(commodityNumber);
            shoppingCartMapper.insert(cart);
        }else {
            Integer number = one.getCommodityNumber();
            Integer newNumber=number+commodityNumber;
            one.setCommodityNumber(newNumber);
            shoppingCartMapper.updateById(one);
        }

    }

    public List<HandleOrder> howManyOrder(Integer userId){
        return shoppingCartMapper.howManyOrder(userId);
    }

    public List<HandleOrder> handleOrder(Integer userId,Integer storeId){
        return shoppingCartMapper.handleOrder(userId,storeId);
    }

    public void discardSPC(Integer userId){
        shoppingCartMapper.discardSPC(userId);
    }

    public void check(Integer spId){
        shoppingCartMapper.check(spId);
    }

    public void uncheck(Integer spId){
        shoppingCartMapper.uncheck(spId);
    }

    public void allcheck(Integer userId){
        shoppingCartMapper.allcheck(userId);
    }

    public void reallcheck(Integer userId){
        shoppingCartMapper.reallcheck(userId);
    }

    public List<ShoppingCart> getShoppingCartByIdAndChecked(Integer userId){
        return shoppingCartMapper.getShoppingCartByIdAndChecked(userId);
    }

}