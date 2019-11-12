package xgbb.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import xgbb.entity.FavoritesCommoditylist;
import xgbb.service.impl.FavoritesCommoditylistServiceImpl;

import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author nb
 * @since 2019-05-05
 */
@Controller
@RequestMapping("favoritesCommoditylist")
public class FavoritesCommoditylistController {
    @Autowired
    FavoritesCommoditylistServiceImpl favoritesCommoditylistService;

    @RequestMapping("getList")
    public String getList(Model model,Integer userId){
        if (userId==null){
            model.addAttribute("message","请先登录");
            return "login";
        }
        List<FavoritesCommoditylist> list = favoritesCommoditylistService.myGetList(userId);
        model.addAttribute("commodityList",list);
        return "favoritesCommodityList";
    }

    @RequestMapping("add")
    public String add(Model model,Integer userId,Integer commodityId){
        if (userId==null){
            model.addAttribute("message","请先登录");
            return "login";
        }
        favoritesCommoditylistService.add(userId,commodityId);
        List<FavoritesCommoditylist> list = favoritesCommoditylistService.myGetList(userId);
        model.addAttribute("commodityList",list);
        return "favoritesCommodityList";
    }

    @RequestMapping("remove")
    public String remove(Model model,Integer userId,Integer commodityId){
        if (userId==null){
            model.addAttribute("message","请先登录");
            return "login";
        }
        favoritesCommoditylistService.remove(userId,commodityId);
        List<FavoritesCommoditylist> list = favoritesCommoditylistService.myGetList(userId);
        model.addAttribute("commodityList",list);
        return "favoritesCommodityList";
    }
}

