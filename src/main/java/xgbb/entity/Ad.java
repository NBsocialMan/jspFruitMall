package xgbb.entity;

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
 * @since 2019-07-15
 */
@TableName("ad")
public class Ad extends Model<Ad> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "ad_id", type = IdType.AUTO)
    private Integer adId;

    private String adImg;

    private String adUrl;


    public Integer getAdId() {
        return adId;
    }

    public void setAdId(Integer adId) {
        this.adId = adId;
    }

    public String getAdImg() {
        return adImg;
    }

    public void setAdImg(String adImg) {
        this.adImg = adImg;
    }

    public String getAdUrl() {
        return adUrl;
    }

    public void setAdUrl(String adUrl) {
        this.adUrl = adUrl;
    }

    @Override
    protected Serializable pkVal() {
        return this.adId;
    }

    @Override
    public String toString() {
        return "Ad{" +
        "adId=" + adId +
        ", adImg=" + adImg +
        ", adUrl=" + adUrl +
        "}";
    }
}
