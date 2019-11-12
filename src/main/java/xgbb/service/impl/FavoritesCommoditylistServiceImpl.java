package xgbb.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import xgbb.entity.FavoritesCommoditylist;
import xgbb.mapper.FavoritesCommoditylistMapper;
import xgbb.service.FavoritesCommoditylistService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author nb
 * @since 2019-05-05
 */
@Service("favaritesCommodityService")
public class FavoritesCommoditylistServiceImpl extends ServiceImpl<FavoritesCommoditylistMapper, FavoritesCommoditylist> implements FavoritesCommoditylistService {

    @Autowired
    FavoritesCommoditylistMapper favoritesCommoditylistMapper;


    public List<FavoritesCommoditylist> myGetList(Integer userId) {
        return favoritesCommoditylistMapper.getCommodityList(userId);
    }
    public void add(Integer userId,Integer commodityId){
        FavoritesCommoditylist one = favoritesCommoditylistMapper.selectOne(new QueryWrapper<FavoritesCommoditylist>().eq("user_id", userId).
                eq("favorites_commodity_id", commodityId));
        if(one==null){
            one = new FavoritesCommoditylist();
            one.setUserId(userId);
            one.setFavoritesCommodityId(commodityId);
            favoritesCommoditylistMapper.insert(one);
        }

    }

    public void remove(Integer userId,Integer commodityId){
        favoritesCommoditylistMapper.delete(new QueryWrapper<FavoritesCommoditylist>().eq("user_id", userId).
                eq("favorites_commodity_id", commodityId));
    }
}
