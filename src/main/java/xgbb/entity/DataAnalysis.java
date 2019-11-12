package xgbb.entity;

public class DataAnalysis {
    String name;
    Integer salesVolume;
    Double salesAmount;
    String month;
    Double [] a;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getSalesVolume() {
        return salesVolume;
    }

    public void setSalesVolume(Integer salesVolume) {
        this.salesVolume = salesVolume;
    }

    public Double getSalesAmount() {
        return salesAmount;
    }

    public void setSalesAmount(Double salesAmount) {
        this.salesAmount = salesAmount;
    }

    public String getMonth() {
        return month;
    }

    public void setMonth(String month) {
        this.month = month;
    }

    @Override
    public String toString() {
        return "DataAnalysis{" +
                "name='" + name + '\'' +
                ", salesVolume=" + salesVolume +
                ", salesAmount=" + salesAmount +
                ", month='" + month + '\'' +
                '}';
    }
}
