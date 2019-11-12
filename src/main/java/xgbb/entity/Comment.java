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
 * @since 2019-06-10
 */
@TableName("comment")
public class Comment extends Model<Comment> {

    private static final long serialVersionUID = 1L;

    private Integer commentId;

    private Double commentScore;

    private String commentTime;

    private Integer commentUserId;

    private Integer commentCommodityId;

    private Integer commentOrderId;

    private String commentContent;

    @TableField(exist = false)
    private User user;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Integer getCommentId() {
        return commentId;
    }

    public void setCommentId(Integer commentId) {
        this.commentId = commentId;
    }

    public Double getCommentScore() {
        return commentScore;
    }

    public void setCommentScore(Double commentScore) {
        this.commentScore = commentScore;
    }

    public String getCommentTime() {
        return commentTime;
    }

    public void setCommentTime(String commentTime) {
        this.commentTime = commentTime;
    }

    public Integer getCommentUserId() {
        return commentUserId;
    }

    public void setCommentUserId(Integer commentUserId) {
        this.commentUserId = commentUserId;
    }

    public Integer getCommentCommodityId() {
        return commentCommodityId;
    }

    public void setCommentCommodityId(Integer commentCommodityId) {
        this.commentCommodityId = commentCommodityId;
    }

    public Integer getCommentOrderId() {
        return commentOrderId;
    }

    public void setCommentOrderId(Integer commentOrderId) {
        this.commentOrderId = commentOrderId;
    }

    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent;
    }

    @Override
    protected Serializable pkVal() {
        return this.commentId;
    }

    @Override
    public String toString() {
        return "Comment{" +
        "commentId=" + commentId +
        ", commentScore=" + commentScore +
        ", commentTime=" + commentTime +
        ", commentUserId=" + commentUserId +
        ", commentCommodityId=" + commentCommodityId +
        ", commentOrderId=" + commentOrderId +
        ", commentContent=" + commentContent +
        "}";
    }
}
