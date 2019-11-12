package xgbb.mapper;

import org.apache.ibatis.annotations.*;
import org.springframework.web.bind.annotation.RequestMapping;
import xgbb.entity.HandleOrder;
import xgbb.entity.ShoppingCart;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author nb
 * @since 2019-04-30
 */
@RequestMapping("shoppingCartMapper")
public interface ShoppingCartMapper extends BaseMapper<ShoppingCart> {
    @Select("select * from shopping_cart where user_id=${userId}")
    @Results({
            @Result(property = "spId", column ="sp_id" ),
            @Result(property = "userId", column ="user_id" ),
            @Result(property = "checked",column = "checked"),
            @Result(property = "commodityId", column ="commodity_id" ),
            @Result(property = "commodityNumber", column ="commodity_number" ),
            @Result(property = "commodity",column = "commodity_id",
                    one = @One(select = "xgbb.mapper.CommodityMapper.getCommodityById"))
    })
    public List<ShoppingCart> getShoppingCartById(@Param("userId") Integer userId);

    @Select("select * from shopping_cart where user_id=${userId} and checked=1")
    @Results({
            @Result(property = "spId", column ="sp_id" ),
            @Result(property = "userId", column ="user_id" ),
            @Result(property = "checked",column = "checked"),
            @Result(property = "commodityId", column ="commodity_id" ),
            @Result(property = "commodityNumber", column ="commodity_number" ),
            @Result(property = "commodity",column = "commodity_id",
                    one = @One(select = "xgbb.mapper.CommodityMapper.getCommodityById"))
    })
    public List<ShoppingCart> getShoppingCartByIdAndChecked(@Param("userId") Integer userId);


    @Select("SELECT\n" +
            "\tc.owner_store_id as storeId\n" +
            "FROM\n" +
            "\tshopping_cart AS spc\n" +
            "LEFT JOIN commodity AS c ON spc.commodity_id = c.commodity_id\n" +
            "WHERE\n" +
            "\tspc.user_id = ${userId} and checked=1 \n" +
            "GROUP BY\n" +
            "\towner_store_id")
    public List<HandleOrder> howManyOrder(@Param("userId") Integer userId);


    @Select("SELECT\n" +
            "\tspc.commodity_id as commodityId,\n" +
            "  spc.commodity_number as commodityNumber,\n" +
            "  c.commodity_currentprice as commodityCurrentprice,\n" +
            "\tc.commodity_picture AS commodityPicture,\n" +
            "\tc.commodity_name as commodityName,\n" +
            "\tc.owner_store_id as storeId\n" +
            "FROM\n" +
            "\tshopping_cart AS spc\n" +
            "LEFT JOIN commodity AS c ON spc.commodity_id = c.commodity_id\n" +
            "WHERE\n" +
            "\tspc.user_id = ${userId} and spc.checked=1 \n" +
            "AND c.owner_store_id = ${storeId}")
    public List<HandleOrder> handleOrder(@Param("userId") Integer userId,
                                         @Param("storeId")Integer storeId);


    @Delete("delete from shopping_cart where user_id=#{userId} and checked=1")
    public void discardSPC(Integer userId);

    @Update("update shopping_cart set checked=1 where sp_id=#{spId}")
    public void check(Integer spId);

    @Update("update shopping_cart set checked=0 where sp_id=#{spId}")
    public void uncheck(Integer spId);

    @Update("update shopping_cart set checked=1 where user_id=#{userId}")
    public void allcheck(Integer userId);

    @Update("update shopping_cart set checked=0 where user_id=#{userId}")
    public void reallcheck(Integer userId);
}