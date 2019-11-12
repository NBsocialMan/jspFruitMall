package xgbb.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import xgbb.entity.Category;
import xgbb.entity.Commodity;
import xgbb.entity.MyPage;
import xgbb.service.impl.CategoryServiceImpl;

import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author nb
 * @since 2019-05-13
 */
@Controller
@RequestMapping("category")
public class CategoryController {

    @Autowired
    CategoryServiceImpl categoryService;

    @RequestMapping("getCommodityListByCategoryId")
    public  String getCommodityListByCategoryId(Model model,Integer currentPage,Integer categoryId){
        Category category = categoryService.getCategory(categoryId);
        List<Category> allCategory = categoryService.getAllCategory();
        MyPage<Commodity> commodityMyPage = categoryService.myGetCommodityListByCategoryId(categoryId, (currentPage == null ? 1 : currentPage));
        model.addAttribute("category",category);
        model.addAttribute("allCategory",allCategory);
        model.addAttribute("commodityList",commodityMyPage);
        return "categoryCommodityList";
    }

}

