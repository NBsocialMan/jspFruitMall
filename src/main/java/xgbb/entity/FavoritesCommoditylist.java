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
 * @since 2019-05-05
 */
@TableName("favorites_commoditylist")
public class FavoritesCommoditylist extends Model<FavoritesCommoditylist> {

    private static final long serialVersionUID = 1L;


    private Integer userId;

    private Integer favoritesCommodityId;
    @TableField(exist = false)
    private Commodity commodity;

    public Commodity getCommodity() {
        return commodity;
    }

    public void setCommodity(Commodity commodity) {
        this.commodity = commodity;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getFavoritesCommodityId() {
        return favoritesCommodityId;
    }

    public void setFavoritesCommodityId(Integer favoritesCommodityId) {
        this.favoritesCommodityId = favoritesCommodityId;
    }

    @Override
    protected Serializable pkVal() {
        return this.userId;
    }

    @Override
    public String toString() {
        return "FavoritesCommoditylist{" +
                "userId=" + userId +
                ", favoritesCommodityId=" + favoritesCommodityId +
                ", commodity=" + commodity +
                '}';
    }
}
