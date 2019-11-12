package xgbb.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import xgbb.entity.FavoritesStorelist;
import xgbb.mapper.FavoritesStorelistMapper;
import xgbb.service.FavoritesStorelistService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author nb
 * @since 2019-05-06
 */
@Service("favoriteStoreService")
public class FavoritesStorelistServiceImpl extends ServiceImpl<FavoritesStorelistMapper, FavoritesStorelist> implements FavoritesStorelistService {

    @Autowired
    FavoritesStorelistMapper favoritesStorelistMapper;

    public void add(Integer userId,Integer storeId){
        FavoritesStorelist one = favoritesStorelistMapper.selectOne(new QueryWrapper<FavoritesStorelist>().
                eq("user_id", userId).eq("favorites_store_id", storeId));
        if(one==null){
            one=new FavoritesStorelist();
            one.setUserId(userId);
            one.setFavoritesStoreId(storeId);
            favoritesStorelistMapper.insert(one);
        }
    }

    public void remove(Integer userId,Integer storeId){
        favoritesStorelistMapper.delete(new QueryWrapper<FavoritesStorelist>().eq("user_id",userId).
                eq("favorites_store_id",storeId));
    }

    public List<FavoritesStorelist> myGetList(Integer userId){
        return favoritesStorelistMapper.getStoreList(userId);
    }
}
