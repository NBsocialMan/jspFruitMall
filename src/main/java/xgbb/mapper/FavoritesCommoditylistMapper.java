package xgbb.mapper;

import org.apache.ibatis.annotations.*;
import org.springframework.web.bind.annotation.RequestMapping;
import xgbb.entity.FavoritesCommoditylist;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author nb
 * @since 2019-05-05
 */
@RequestMapping("favoritesCommodityMapper")
public interface FavoritesCommoditylistMapper extends BaseMapper<FavoritesCommoditylist> {
    @Select("select * from favorites_commoditylist where user_id=${id}")
    @Results({
            @Result(property = "userId", column ="user_id" ),
            @Result(property = "favoritesCommodityId", column ="favorites_commodity_id" ),
            @Result(property = "commodity",column = "favorites_commodity_id",
                    one = @One(select = "xgbb.mapper.CommodityMapper.getCommodityById"))
    })
    public List<FavoritesCommoditylist> getCommodityList(@Param("id") Integer id);

}
