package xgbb.entity;

public class HandleOrder {
    private Integer storeId;

    private Integer commodityId;

    private Integer commodityNumber;

    private String commodityName;

    private String commodityPicture;

    private Double commodityCurrentprice;

    public Integer getCommodityId() {
        return commodityId;
    }

    public void setCommodityId(Integer commodityId) {
        this.commodityId = commodityId;
    }

    public Integer getCommodityNumber() {
        return commodityNumber;
    }

    public void setCommodityNumber(Integer commodityNumber) {
        this.commodityNumber = commodityNumber;
    }

    public String getCommodityName() {
        return commodityName;
    }

    public void setCommodityName(String commodityName) {
        this.commodityName = commodityName;
    }

    public String getCommodityPicture() {
        return commodityPicture;
    }

    public void setCommodityPicture(String commodityPicture) {
        this.commodityPicture = commodityPicture;
    }

    public Double getCommodityCurrentprice() {
        return commodityCurrentprice;
    }

    public void setCommodityCurrentprice(Double commodityCurrentprice) {
        this.commodityCurrentprice = commodityCurrentprice;
    }

    public Integer getStoreId() {
        return storeId;
    }

    public void setStoreId(Integer storeId) {
        this.storeId = storeId;
    }

    @Override
    public String toString() {
        return "HandleOrder{" +
                "storeId=" + storeId +
                ", commodityId=" + commodityId +
                ", commodityNumber=" + commodityNumber +
                ", commodityName='" + commodityName + '\'' +
                ", commodityPicture='" + commodityPicture + '\'' +
                ", commodityCurrentprice=" + commodityCurrentprice +
                '}';
    }
}
