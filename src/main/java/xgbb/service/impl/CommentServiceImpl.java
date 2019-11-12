package xgbb.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import xgbb.entity.Comment;
import xgbb.mapper.CommentMapper;
import xgbb.service.CommentService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author nb
 * @since 2019-06-10
 */
@Service("commentService")
public class CommentServiceImpl extends ServiceImpl<CommentMapper, Comment> implements CommentService {
    @Autowired
    CommentMapper commentMapper;
    public List<Comment> getComment(Integer commodityId){
        return commentMapper.getComment(commodityId);
    }

}
