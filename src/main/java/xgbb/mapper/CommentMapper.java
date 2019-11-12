package xgbb.mapper;

import org.apache.ibatis.annotations.*;
import org.springframework.web.bind.annotation.RequestMapping;
import xgbb.entity.Comment;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import xgbb.entity.DataAnalysis;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author nb
 * @since 2019-06-10
 */
@RequestMapping("commentMapper")
public interface CommentMapper extends BaseMapper<Comment> {
    @Select("select * from comment where comment_commodity_id=${commodityId} order by comment_time desc")
    @Results({
            @Result(property = "commentUserId",column = "comment_user_id"),
            @Result(property = "user",column = "comment_user_id",
                    one = @One(select = "xgbb.mapper.UserMapper.getUserById"))
    }
    )
    public List<Comment> getComment(@Param("commodityId") Integer commodityId);



}
