package xgbb.mapper;

import org.apache.ibatis.annotations.*;
import org.springframework.web.bind.annotation.RequestMapping;
import xgbb.entity.Store;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author nb
 * @since 2019-04-28
 */
@RequestMapping("storeMapper")
public interface StoreMapper extends BaseMapper<Store> {

    @Select("select * from store where store_name like '%${sName}%' limit ${q} , ${h}")
    @Results({
            @Result(property = "storeId", column = "store_id"),
            @Result(property = "storeAddress", column = "store_address"),
            @Result(property = "storeIntroduction", column = "store_introduction"),
            @Result(property = "storeOwnerId", column = "store_owner_id"),
            @Result(property = "storeName", column = "store_name"),
            @Result(property = "storeState", column = "store_state"),
            @Result(property = "storePicture", column = "store_picture"),
            @Result(property = "storePosterPicture1", column = "store_poster_picture1"),
            @Result(property = "storePosterPicture2", column = "store_poster_picture2"),
            @Result(property = "storePosterPicture3", column = "store_poster_picture3"),
            @Result(property = "commodityList" ,column = "store_id",
                    many = @Many(select = "xgbb.mapper.CommodityMapper.getCommodityListByOwnerStoreId"))

    })
    public List<Store> myGetStoreList(@Param("sName") String sName,
                                      @Param("q") int q,
                                      @Param("h") int h);

    @Select("select count(*) from store where store_name like '%${storeName}%'")
    public int getStoreCount(@Param("storeName") String storeName);

    @Select("select * from store where store_id=#{storeId}")
    public Store getStoreById(Integer storeId);

    @Select("select * from store where store_hot=1 limit 0,10")
    public List<Store> getHotStoreList();

    @Select("select * from store where store_id=#{storeId}")
    @Results({@Result(property = "storeId", column = "store_id"),
            @Result(property = "commodityList",column = "store_id",
                    many = @Many(select = "xgbb.mapper.CommodityMapper.getCommodityListByOwnerStoreId"))
    })
    public Store myGetStore(Integer storeId);
    @Select("SELECT * FROM store WHERE store_owner_id=#{storeOwnerId} order by store_id desc limit 1")
    public Store myGetStoreOne(Integer storeOwnerId);

    @Update("update store set store_hot='${storeHot}',store_state='${state}' where store_id='${storeId}'")
    public  void adminModifyStore(@Param("storeId") Integer storeyId,
                                      @Param("state") Integer state,
                                      @Param("storeHot") Integer storeHot);

    @Update("update store set store_poster_picture1='${picture}' where store_id='${storeId}'")
    public void setPoster1(@Param("picture") String picture,@Param("storeId") Integer storeId);
    @Update("update store set store_poster_picture2='${picture}' where store_id='${storeId}'")
    public void setPoster2(@Param("picture") String picture,@Param("storeId") Integer storeId);
    @Update("update store set store_poster_picture3='${picture}' where store_id='${storeId}'")
    public void setPoster3(@Param("picture") String picture,@Param("storeId") Integer storeId);

}
