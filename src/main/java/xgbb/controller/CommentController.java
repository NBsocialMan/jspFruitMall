package xgbb.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import xgbb.entity.Comment;
import xgbb.entity.Commodity;
import xgbb.entity.Order;
import xgbb.entity.OrderDetails;
import xgbb.service.impl.CommentServiceImpl;
import xgbb.service.impl.CommodityServiceImpl;
import xgbb.service.impl.OrderDetailsServiceImpl;
import xgbb.service.impl.OrderServiceImpl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author nb
 * @since 2019-06-10
 */
@Controller
@RequestMapping("/comment")
public class CommentController {
    @Autowired
    CommentServiceImpl commentService;
    @Autowired
    CommodityServiceImpl commodityService;
    @Autowired
    OrderServiceImpl orderService;
    @Autowired
    OrderDetailsServiceImpl orderDetailsService;
    @RequestMapping("addComment")
    public String addComment(Model model,
                             Double score,
                             Integer userId,
                             Integer commodityId,
                             Integer orderId,
                             String content
                             ){
        if(userId==null){
            model.addAttribute("message","请先登录");
            return "login";
        }
        Comment comment = new Comment();
        comment.setCommentOrderId(orderId);
        comment.setCommentUserId(userId);
        comment.setCommentCommodityId(commodityId);
        comment.setCommentContent(content);
        comment.setCommentScore(score==null?6:score);
        Date date = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy年MM月dd日HH时mm分ss秒SSS毫秒");
        String date1 = simpleDateFormat.format(date);
        comment.setCommentTime(date1);
        commentService.save(comment);
        orderDetailsService.changeCommentState(commodityId, orderId);
        List<OrderDetails> list = orderDetailsService.list(new QueryWrapper<OrderDetails>().eq("order_id", orderId));
        boolean flag=true;
        for (OrderDetails orderDetails: list) {
            if(orderDetails.getState()==0){
                flag=false;
            }
        }
        if(flag){
            orderService.comment(orderId);
        }
        Commodity commodity = commodityService.getCommodityById(commodityId);
        model.addAttribute("commodity",commodity);
        List<Comment> commentList = commentService.getComment(commodityId);
        model.addAttribute("commentList",commentList);
        return "commodityDetails";
    }

}

