package xgbb.controller;


import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import xgbb.entity.FavoritesStorelist;
import xgbb.service.impl.FavoritesStorelistServiceImpl;

import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author nb
 * @since 2019-05-06
 */
@Controller
@RequestMapping("favoritesStorelist")
public class FavoritesStorelistController {

    @Autowired
    FavoritesStorelistServiceImpl favoritesStorelistService;
    @RequestMapping("getList")
    public String getList(Model model,Integer userId){

        if (userId==null){
            model.addAttribute("message","请先登录");
            return "login";
        }
        List<FavoritesStorelist> list = favoritesStorelistService.myGetList(userId);
        model.addAttribute("storeList",list);
        return "favoritesStoreList";
    }
    @RequestMapping("add")
    public String add(Model model,Integer userId,Integer storeId){
        if (userId==null){
            model.addAttribute("message","请先登录");
            return "login";
        }
        favoritesStorelistService.add(userId,storeId);
        List<FavoritesStorelist> list = favoritesStorelistService.myGetList(userId);
        model.addAttribute("storeList",list);
        return "favoritesStoreList";
    }

    @RequestMapping("remove")
    public String remove(Model model,Integer userId,Integer storeId){
        if (userId==null){
            model.addAttribute("message","请先登录");
            return "login";
        }
        favoritesStorelistService.remove(userId,storeId);
        List<FavoritesStorelist> list = favoritesStorelistService.myGetList(userId);
        model.addAttribute("storeList",list);
        return "favoritesStoreList";
    }

}

