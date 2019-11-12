package xgbb.mapper;

import org.apache.ibatis.annotations.*;
import org.springframework.web.bind.annotation.RequestMapping;
import xgbb.entity.Category;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import xgbb.entity.Commodity;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author nb
 * @since 2019-05-13
 */
@RequestMapping("categoryMapper")
public interface CategoryMapper extends BaseMapper<Category> {

    @Select("select * from category where category_id=${categoryId} ")
    @Results({
            @Result(property = "categoryName",column = "category_name"),
            @Result(property = "categoryId",column = "category_id"),
            @Result(property = "commodityList",column = "category_id",
                    many = @Many(select = "xgbb.mapper.CommodityMapper.getCommodityListByCategoryId")
            )
    }
    )
    public Category getCategory(@Param("categoryId") Integer categoryId);

    @Select("select * from commodity where commodity_category_id=${categoryId} limit ${q} , ${h}")
    @Results(@Result(property = "store",column = "owner_store_id",
    one = @One(select = "xgbb.mapper.StoreMapper.getStoreById")))
    public List<Commodity> myGetCommodityListByCategoryId(@Param("categoryId") Integer categoryId,
                                                        @Param("q") int q,
                                                        @Param("h") int h);


    @Select("select count(*) from commodity where commodity_category_id=${categoryId}")
    public int getCommodityCount(@Param("categoryId") Integer categoryId);

    @Select("select * from category")
    public List<Category> getAllCategory();

    @Select("select * from category where category_id=#{categoryId}")
    public Category getCategoryById(Integer categoryId);

//    @RequestMapping("delete from category where category_id=#{categoryId}")
//    public void delete(Integer categoryId);

    @Update("update category set category_name='${categoryName}' where category_id=${categoryId}")
    public void modifyCategory(@Param("categoryName") String categoryName,@Param("categoryId") Integer categoryId);
}
