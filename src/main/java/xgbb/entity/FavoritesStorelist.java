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
 * @since 2019-05-06
 */
@TableName("favorites_storelist")
public class FavoritesStorelist extends Model<FavoritesStorelist> {

    private static final long serialVersionUID = 1L;

    private Integer userId;

    private Integer favoritesStoreId;

    @TableField(exist = false)
    private Store store;

    public Store getStore() {
        return store;
    }

    public void setStore(Store store) {
        this.store = store;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getFavoritesStoreId() {
        return favoritesStoreId;
    }

    public void setFavoritesStoreId(Integer favoritesStoreId) {
        this.favoritesStoreId = favoritesStoreId;
    }

    @Override
    protected Serializable pkVal() {
        return this.userId;
    }

    @Override
    public String toString() {
        return "FavoritesStorelist{" +
                "userId=" + userId +
                ", favoritesStoreId=" + favoritesStoreId +
                ", store=" + store +
                '}';
    }
}
