package xgbb.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author nb
 * @since 2019-05-09
 */
@TableName("commodity")
public class Commodity extends Model<Commodity> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "commodity_id", type = IdType.AUTO)
    private Integer commodityId;

    private String commodityName;

    private Double commodityPrice;

    private String commodityPicture;

    private Integer shelf;

    private Integer commodityHot;

    private Integer commodityStock;

    private Double commodityWeight;

    private Double commodityFloat;

    private String commodityLevel;

    private Integer ownerStoreId;

    private Integer commodityCategoryId;

    private String commodityIntroduce;

    private Integer commoditySalesvolume;

    private String commodityPosterPicture1;

    private String commodityPosterPicture2;

    private String commodityPosterPicture3;

    private Double commodityCurrentprice;

    @TableField(exist = false)
    private Store store;
    @TableField(exist = false)
    private Category category;

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public Store getStore() {
        return store;
    }

    public void setStore(Store store) {
        this.store = store;
    }

    public Integer getCommodityId() {
        return commodityId;
    }

    public void setCommodityId(Integer commodityId) {
        this.commodityId = commodityId;
    }

    public String getCommodityName() {
        return commodityName;
    }

    public void setCommodityName(String commodityName) {
        this.commodityName = commodityName;
    }

    public Double getCommodityPrice() {
        return commodityPrice;
    }

    public void setCommodityPrice(Double commodityPrice) {
        this.commodityPrice = commodityPrice;
    }

    public String getCommodityPicture() {
        return commodityPicture;
    }

    public void setCommodityPicture(String commodityPicture) {
        this.commodityPicture = commodityPicture;
    }

    public Integer getShelf() {
        return shelf;
    }

    public void setShelf(Integer shelf) {
        this.shelf = shelf;
    }

    public Integer getCommodityHot() {
        return commodityHot;
    }

    public void setCommodityHot(Integer commodityHot) {
        this.commodityHot = commodityHot;
    }

    public Integer getCommodityStock() {
        return commodityStock;
    }

    public void setCommodityStock(Integer commodityStock) {
        this.commodityStock = commodityStock;
    }

    public Double getCommodityWeight() {
        return commodityWeight;
    }

    public void setCommodityWeight(Double commodityWeight) {
        this.commodityWeight = commodityWeight;
    }

    public Double getCommodityFloat() {
        return commodityFloat;
    }

    public void setCommodityFloat(Double commodityFloat) {
        this.commodityFloat = commodityFloat;
    }

    public String getCommodityLevel() {
        return commodityLevel;
    }

    public void setCommodityLevel(String commodityLevel) {
        this.commodityLevel = commodityLevel;
    }

    public Integer getOwnerStoreId() {
        return ownerStoreId;
    }

    public void setOwnerStoreId(Integer ownerStoreId) {
        this.ownerStoreId = ownerStoreId;
    }

    public Integer getCommodityCategoryId() {
        return commodityCategoryId;
    }

    public void setCommodityCategoryId(Integer commodityCategoryId) {
        this.commodityCategoryId = commodityCategoryId;
    }

    public String getCommodityIntroduce() {
        return commodityIntroduce;
    }

    public void setCommodityIntroduce(String commodityIntroduce) {
        this.commodityIntroduce = commodityIntroduce;
    }

    public Integer getCommoditySalesvolume() {
        return commoditySalesvolume;
    }

    public void setCommoditySalesvolume(Integer commoditySalesvolume) {
        this.commoditySalesvolume = commoditySalesvolume;
    }

    public String getCommodityPosterPicture1() {
        return commodityPosterPicture1;
    }

    public void setCommodityPosterPicture1(String commodityPosterPicture1) {
        this.commodityPosterPicture1 = commodityPosterPicture1;
    }

    public String getCommodityPosterPicture2() {
        return commodityPosterPicture2;
    }

    public void setCommodityPosterPicture2(String commodityPosterPicture2) {
        this.commodityPosterPicture2 = commodityPosterPicture2;
    }

    public String getCommodityPosterPicture3() {
        return commodityPosterPicture3;
    }

    public void setCommodityPosterPicture3(String commodityPosterPicture3) {
        this.commodityPosterPicture3 = commodityPosterPicture3;
    }

    public Double getCommodityCurrentprice() {
        return commodityCurrentprice;
    }

    public void setCommodityCurrentprice(Double commodityCurrentprice) {
        this.commodityCurrentprice = commodityCurrentprice;
    }

    @Override
    protected Serializable pkVal() {
        return this.commodityId;
    }

    @Override
    public String toString() {
        return "Commodity{" +
                "commodityId=" + commodityId +
                ", commodityName='" + commodityName + '\'' +
                ", commodityPrice=" + commodityPrice +
                ", commodityPicture='" + commodityPicture + '\'' +
                ", shelf=" + shelf +
                ", commodityHot=" + commodityHot +
                ", commodityStock=" + commodityStock +
                ", commodityWeight=" + commodityWeight +
                ", commodityFloat=" + commodityFloat +
                ", commodityLevel='" + commodityLevel + '\'' +
                ", ownerStoreId=" + ownerStoreId +
                ", commodityCategoryId=" + commodityCategoryId +
                ", commodityIntroduce='" + commodityIntroduce + '\'' +
                ", commoditySalesvolume=" + commoditySalesvolume +
                ", commodityPosterPicture1='" + commodityPosterPicture1 + '\'' +
                ", commodityPosterPicture2='" + commodityPosterPicture2 + '\'' +
                ", commodityPosterPicture3='" + commodityPosterPicture3 + '\'' +
                ", commodityCurrentprice=" + commodityCurrentprice +
                ", store=" + store +
                '}';
    }
}
