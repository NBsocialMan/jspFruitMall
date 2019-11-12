package xgbb.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import java.util.List;

/**
 * <p>
 * 
 * </p>
 *
 * @author nb
 * @since 2019-04-28
 */
@TableName("store")
public class Store extends Model<Store> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "store_id", type = IdType.AUTO)
    private Integer storeId;

    private String storeName;

    private String storeAddress;

    private String storeIntroduction;

    private String storePicture;

    private Integer storeOwnerId;

    private String storePosterPicture1;

    private String storePosterPicture2;

    private String storePosterPicture3;

    private Integer storeState;

    private Integer storeHot;

    @TableField(exist = false)
    private List<Commodity> commodityList;

    public List<Commodity> getCommodityList() {
        return commodityList;
    }

    public void setCommodityList(List<Commodity> commodityList) {
        this.commodityList = commodityList;
    }

    public Integer getStoreId() {
        return storeId;
    }

    public void setStoreId(Integer storeId) {
        this.storeId = storeId;
    }

    public String getStoreName() {
        return storeName;
    }

    public void setStoreName(String storeName) {
        this.storeName = storeName;
    }

    public String getStoreAddress() {
        return storeAddress;
    }

    public void setStoreAddress(String storeAddress) {
        this.storeAddress = storeAddress;
    }

    public String getStoreIntroduction() {
        return storeIntroduction;
    }

    public void setStoreIntroduction(String storeIntroduction) {
        this.storeIntroduction = storeIntroduction;
    }

    public String getStorePicture() {
        return storePicture;
    }

    public void setStorePicture(String storePicture) {
        this.storePicture = storePicture;
    }

    public Integer getStoreOwnerId() {
        return storeOwnerId;
    }

    public void setStoreOwnerId(Integer storeOwnerId) {
        this.storeOwnerId = storeOwnerId;
    }

    public String getStorePosterPicture1() {
        return storePosterPicture1;
    }

    public void setStorePosterPicture1(String storePosterPicture1) {
        this.storePosterPicture1 = storePosterPicture1;
    }

    public String getStorePosterPicture2() {
        return storePosterPicture2;
    }

    public void setStorePosterPicture2(String storePosterPicture2) {
        this.storePosterPicture2 = storePosterPicture2;
    }

    public String getStorePosterPicture3() {
        return storePosterPicture3;
    }

    public void setStorePosterPicture3(String storePosterPicture3) {
        this.storePosterPicture3 = storePosterPicture3;
    }

    public Integer getStoreState() {
        return storeState;
    }

    public void setStoreState(Integer storeState) {
        this.storeState = storeState;
    }

    public Integer getStoreHot() {
        return storeHot;
    }

    public void setStoreHot(Integer storeHot) {
        this.storeHot = storeHot;
    }


    @Override
    protected Serializable pkVal() {
        return this.storeId;
    }

    @Override
    public String toString() {
        return "Store{" +
        "storeId=" + storeId +
        ", storeName=" + storeName +
        ", storeAddress=" + storeAddress +
        ", storeIntroduction=" + storeIntroduction +
        ", storePicture=" + storePicture +
        ", storeOwnerId=" + storeOwnerId +
        ", storePosterPicture1=" + storePosterPicture1 +
        ", storePosterPicture2=" + storePosterPicture2 +
        ", storePosterPicture3=" + storePosterPicture3 +
        ", storeState=" + storeState +
        ", storeHot=" + storeHot +
        "}";
    }
}
