package xgbb.mapper;

import org.apache.ibatis.annotations.*;
import org.springframework.web.bind.annotation.RequestMapping;
import xgbb.entity.Commodity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import xgbb.entity.DataAnalysis;
import xgbb.entity.OrderDetails;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author nb
 * @since 2019-05-09
 */
@RequestMapping("commodityMapper")
public interface CommodityMapper extends BaseMapper<Commodity> {
    @Select("select * from commodity where commodity_name like '%${commodityName}%' and shelf=1 limit ${q} , ${h}")
    @Results(id = "commodityMap",value = {
            @Result(property = "store", column = "owner_store_id",
                    one = @One(select = "xgbb.mapper.StoreMapper.getStoreById"))
    }
    )
    public List<Commodity> myGetCommodityList(@Param("commodityName") String commodityName,
                                              @Param("q") int q,
                                              @Param("h") int h);

    @Select("select * from commodity where shelf=1")
    @Results(
            @Result(property = "store", column = "owner_store_id",
                    one = @One(select = "xgbb.mapper.StoreMapper.getStoreById"))

    )
    public List<Commodity> mySelectCommodityList();

    @Select("select * from commodity where commodity_name like '%${commodityName}%' and shelf=1")
    @Results(
            @Result(property = "store", column = "owner_store_id",
                    one = @One(select = "xgbb.mapper.StoreMapper.getStoreById"))

    )
    public List<Commodity> mySelectCommodityListByName(@Param("commodityName") String commodityName);

    @Select("select * from commodity where commodity_name like '%${commodityName}%' limit ${q} , ${h}")
    @Results({
            @Result(property = "store", column = "owner_store_id",
                    one = @One(select = "xgbb.mapper.StoreMapper.getStoreById"))
    }
    )
    public List<Commodity> myGetCommodityListForAdmin(@Param("commodityName") String commodityName,
                                              @Param("q") int q,
                                              @Param("h") int h);
    @Select("select * from commodity where commodity_category_id=#{categoryId}  and shelf=1 ")
    @Results({
            @Result(property = "store",column = "owner_store_id",
                    one = @One(select = "xgbb.mapper.StoreMapper.getStoreById")
            )
    }
    )
    public List<Commodity> getCommodityListByCategoryId(Integer categoryId);


    @Update("update commodity set commodity_hot='${commodityHot}',shelf='${shelf}',commodity_category_id='${categoryId}' where commodity_id='${commodityId}'")
    public  void adminModifyCommodity2(@Param("commodityId") Integer commodityId,
                                      @Param("shelf") Integer shelf,
                                      @Param("commodityHot") Integer commodityHot,
                                      @Param("categoryId")Integer categoryId);

    @Update("update commodity set commodity_hot='${commodityHot}',shelf='${shelf}' where commodity_id='${commodityId}'")
    public  void adminModifyCommodity(@Param("commodityId") Integer commodityId,
                                      @Param("shelf") Integer shelf,
                                      @Param("commodityHot") Integer commodityHot);


    @Select("select count(*) from commodity where commodity_name like '%${commodityName}%'  and shelf=1 ")
    public int getCommodityCount(@Param("commodityName")String commodityName);

    @Select("select count(*) from commodity where commodity_name like '%${commodityName}%' ")
    public int getCommodityCountForAdmin(@Param("commodityName")String commodityName);

    @Select("select count(*) from commodity where owner_store_id=${ownerStoreId}")
    public int getCommodityCountByOwnerStoreId(@Param("ownerStoreId") Integer ownerStoreId);

    @Select("select * from commodity where owner_store_id=${ownerStoreId} limit ${q} , ${h}")
    public List<Commodity> getCommodityListByOwnerStoreIdForSeller(@Param("ownerStoreId") Integer ownerStoreId,
                                                          @Param("q")int q,
                                                          @Param("h")int h);

    @Select("select * from commodity where owner_store_id=#{ownerStoreId}  and shelf=1 ")
    public List<Commodity> getCommodityListByOwnerStoreId(Integer ownerStoreId);

    @Select("select * from commodity where commodity_id=#{commodityId} ")
    @Results({
            @Result(property = "store",column = "owner_store_id",
                    one = @One(select = "xgbb.mapper.StoreMapper.getStoreById")
            ),
            @Result(property = "category",column = "commodity_category_id",
            one = @One(select = "xgbb.mapper.CategoryMapper.getCategoryById"))
    }
    )
    public Commodity getCommodityById(Integer commodityId);

    @Select("select * from commodity where owner_store_id=#{storeId} order by commodity_id desc limit 0,1")
    public Commodity getTheLatestCommodityByOwnerStore(Integer storeId);

    @Update("update commodity set commodity_stock='${stock}' where commodity_id='${commodityId}'")
    public void handStock(@Param("commodityId") Integer commodityId,@Param("stock") Integer stock);

    @Update("update commodity set commodity_salesvolume=${salesvolume} where commodity_id=${commodityId}")
    public void handSalesvolume(@Param("commodityId") Integer commodityId,@Param("salesvolume") Integer salesvolume);

    @Select("select * from commodity where commodity_hot=1   and shelf=1 limit 0,8 ")
    @Results(id = "commodityMap1",value = {
            @Result(property = "store", column = "owner_store_id",
                    one = @One(select = "xgbb.mapper.StoreMapper.getStoreById"))
    }
    )
    public List<Commodity> getHotCommodityList();

    @Select("select * from commodity where commodity_name like '%${commodityName}%' and shelf=1  ORDER BY commodity_currentprice asc limit ${q} , ${h}")
    @Results( @Result(property = "store", column = "owner_store_id",
            one = @One(select = "xgbb.mapper.StoreMapper.getStoreById")))
    public List<Commodity> getCommodityListASC(@Param("commodityName") String commodityName,
                                               @Param("q") int q,
                                               @Param("h") int h);

    @Select("select * from commodity where commodity_name like '%${commodityName}%' and shelf=1  ORDER BY commodity_currentprice DESC limit ${q} , ${h}")
    @Results( @Result(property = "store", column = "owner_store_id",
            one = @One(select = "xgbb.mapper.StoreMapper.getStoreById")))
    public List<Commodity> getCommodityListDESC(@Param("commodityName") String commodityName,
                                               @Param("q") int q,
                                               @Param("h") int h);

    @Select("select * from commodity where commodity_name like '%${commodityName}%' and shelf=1  ORDER BY commodity_salesvolume DESC limit ${q} , ${h}")
    @Results( @Result(property = "store", column = "owner_store_id",
            one = @One(select = "xgbb.mapper.StoreMapper.getStoreById")))
    public List<Commodity> getCommodityListSalesvolume(@Param("commodityName") String commodityName,
                                                @Param("q") int q,
                                                @Param("h") int h);

    @Select("select * from commodity where commodity_name like '%${commodityName}%' and shelf=1  and commodity_currentprice >= ${commodityPrice1} ORDER BY commodity_currentprice asc limit ${q} , ${h} ")
    @Results( @Result(property = "store", column = "owner_store_id",
            one = @One(select = "xgbb.mapper.StoreMapper.getStoreById")))
    public List<Commodity> getCommodityListBigger(@Param("commodityName") String commodityName,@Param("commodityPrice1")Double commodityPrice1,
                                                       @Param("q") int q,
                                                       @Param("h") int h);

    @Select("select * from commodity where commodity_name like '%${commodityName}%' and shelf=1  and commodity_currentprice <= ${commodityPrice2} ORDER BY commodity_currentprice desc limit ${q} , ${h} ")
    @Results( @Result(property = "store", column = "owner_store_id",
            one = @One(select = "xgbb.mapper.StoreMapper.getStoreById")))
    public List<Commodity> getCommodityListSmaller(@Param("commodityName") String commodityName,@Param("commodityPrice2")Double commodityPrice2,
                                                       @Param("q") int q,
                                                       @Param("h") int h);

    @Select("select * from commodity where commodity_name like '%${commodityName}%' and shelf=1  and commodity_currentprice between ${commodityPrice1}  and ${commodityPrice2} ORDER BY commodity_currentprice asc limit ${q} , ${h} ")
    @Results( @Result(property = "store", column = "owner_store_id",
            one = @One(select = "xgbb.mapper.StoreMapper.getStoreById")))
    public List<Commodity> getCommodityListBetween(@Param("commodityName") String commodityName,
                                                   @Param("commodityPrice1")Double commodityPrice1,
                                                   @Param("commodityPrice2")Double commodityPrice2,
                                                       @Param("q") int q,
                                                       @Param("h") int h);


    @Select("select count(*) from commodity where commodity_name like '%${commodityName}%' and shelf=1  and commodity_currentprice >=${commodityPrice1}")
    public int getCommodityCountBigger(@Param("commodityName")String commodityName,@Param("commodityPrice1") Double commodityPrice1);

    @Select("select count(*) from commodity where commodity_name like '%${commodityName}%' and shelf=1  and commodity_currentprice <=${commodityPrice2}")
    public int getCommodityCountSmaller(@Param("commodityName")String commodityName,@Param("commodityPrice2") Double commodityPrice2);

    @Select("select count(*) from commodity where commodity_name like '%${commodityName}%' and shelf=1   and commodity_currentprice between ${commodityPrice1}  and ${commodityPrice2}")
    public int getCommodityCountBetween(@Param("commodityName")String commodityName,@Param("commodityPrice1") Double commodityPrice1,@Param("commodityPrice2") Double commodityPrice2);

    @Update("update commodity set shelf=2 where owner_store_id=#{storeId}")
    public void sanction(Integer storeId);

    @Update("update commodity set shelf=0 where owner_store_id=#{storeId}")
    public void unSanction(Integer storeId);

    @Update("update commodity set shelf=1 where owner_store_id=#{storeId}")
    public void upperShelf(Integer storeId);

    @Update("update commodity set shelf=0 where owner_store_id=#{storeId}")
    public void lowerShelf(Integer storeId);

    @Select("SELECT commodity_name name,commodity_salesvolume salesvolume " +
            "FROM commodity " +
            "WHERE commodity_salesvolume>0 and owner_store_id=#{storeId}")
    public List<DataAnalysis> dataAnalysis(Integer storeId);

    @Select(" SELECT SUM(od.commodity_number) salesVolume,SUM(o.order_price) salesAmount\n" +
            " FROM `order` o LEFT JOIN `order_details` od \n" +
            " ON o.order_id=od.order_id \n" +
            " WHERE o.order_store_id=${storeId} AND o.order_state>=2 and o.order_time LIKE '${year}_${month}%'")
    public DataAnalysis monthAnalysis(@Param("storeId") Integer storeId,
                                      @Param("year") String year,
                                      @Param("month") String month);

    @Select(" SELECT SUM(od.commodity_number) salesVolume,SUM(o.order_price) salesAmount\n" +
            " FROM `order` o LEFT JOIN `order_details` od \n" +
            " ON o.order_id=od.order_id \n" +
            " WHERE o.order_state>=2 and o.order_time LIKE '${year}_${month}%'")
    public DataAnalysis monthAnalysisForAdmin(@Param("year") String year,
                                      @Param("month") String month);


    @Select("SELECT od.* FROM `order` o LEFT JOIN `order_details` od \n" +
            "ON o.order_id=od.order_id  \n" +
            "WHERE order_user_id=#{userId} and o.order_state>0 \n" +
            "GROUP BY od.commodity_id\n" +
            "ORDER BY o.order_time desc ")
    @Results({
            @Result(property = "commodityId",column = "commodity_id"),
            @Result(property = "orderId",column = "order_id"),
            @Result(property = "state",column = "state"),
            @Result(property = "commodity",column = "commodity_id",
                    one = @One(select = "xgbb.mapper.CommodityMapper.getCommodityById"))
    })
    public List<OrderDetails> getPurchaseHistory(Integer userId);

}
