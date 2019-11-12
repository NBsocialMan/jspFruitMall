package xgbb.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import xgbb.entity.Category;
import xgbb.entity.Commodity;
import xgbb.entity.MyPage;
import xgbb.mapper.CategoryMapper;
import xgbb.service.CategoryService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author nb
 * @since 2019-05-13
 */
@Service("categoryService")
public class CategoryServiceImpl extends ServiceImpl<CategoryMapper, Category> implements CategoryService {

    @Autowired
    CategoryMapper categoryMapper;


    public MyPage<Commodity> myGetCommodityListByCategoryId(Integer categoryId,int currentPage){
        MyPage myPage = new MyPage();
        myPage.setCurrentPage(currentPage);
        myPage.setPageNotesCount(20);
        int count = categoryMapper.getCommodityCount(categoryId);
        int ceil = (int)Math.ceil(1.0 * count / 20);
        myPage.setPageTotal(ceil);
        List<Commodity> commodityList = categoryMapper.myGetCommodityListByCategoryId(categoryId, (myPage.getCurrentPage() - 1) * 20, myPage.getPageNotesCount());
        myPage.setList(commodityList);
        return myPage;
    }
    public Category getCategory(Integer categoryId){
        return categoryMapper.getCategory(categoryId);
    }

    public List<Category> getAllCategory(){return  categoryMapper.getAllCategory();}

//    public void deleteCategory(Integer categoryId){ categoryMapper.delete(categoryId);}

    public void modifyCategory(String categoryName,Integer categoryId){ categoryMapper.modifyCategory(categoryName,categoryId);}
}
