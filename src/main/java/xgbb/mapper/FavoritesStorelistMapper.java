package xgbb.mapper;

import org.apache.ibatis.annotations.*;
import org.springframework.web.bind.annotation.RequestMapping;
import xgbb.entity.FavoritesStorelist;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author nb
 * @since 2019-05-06
 */
@RequestMapping("favoritesStoreMapper")
public interface FavoritesStorelistMapper extends BaseMapper<FavoritesStorelist> {

    @Select("select * from favorites_storelist where user_id=${id}")
    @Results({
            @Result(property = "userId", column ="user_id" ),
            @Result(property = "favoritesStoreId",column = "favorites_store_id"),
            @Result(property = "store",column = "favorites_store_id",
            one = @One(select = "xgbb.mapper.StoreMapper.getStoreById"))
    })
    public List<FavoritesStorelist> getStoreList(@Param("id") Integer id);

}
