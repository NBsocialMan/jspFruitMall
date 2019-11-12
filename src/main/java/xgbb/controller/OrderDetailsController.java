package xgbb.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import xgbb.entity.Comment;
import xgbb.entity.Commodity;
import xgbb.service.impl.CommentServiceImpl;
import xgbb.service.impl.CommodityServiceImpl;

import javax.annotation.Resource;
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
@RequestMapping("/orderDetails")
public class OrderDetailsController {

    @Resource(name = "commodityService")
    CommodityServiceImpl commodityService;
    @Autowired
    CommentServiceImpl commentService;
    @RequestMapping("commentUI")
    public String commentUI(Model model, Integer userId,Integer orderId,Integer commodityId){
        if(userId==null){
            model.addAttribute("message","请先登录");
            return "login";
        }
        Commodity commodity = commodityService.getCommodityById(commodityId);
        List<Comment> commentList = commentService.getComment(commodityId);
        model.addAttribute("commentList",commentList);
        model.addAttribute("orderId",orderId);
        model.addAttribute("commodity",commodity);
        model.addAttribute("commentState",1);
        return "commodityDetails";
    }

}

