package xgbb.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import xgbb.entity.MyPage;
import xgbb.entity.Order;
import xgbb.entity.Store;
import xgbb.mapper.OrderMapper;
import xgbb.mapper.StoreMapper;
import xgbb.service.StoreService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author nb
 * @since 2019-04-28
 */
@Service("storeService")
public class StoreServiceImpl extends ServiceImpl<StoreMapper, Store> implements StoreService {
    @Resource(name = "storeMapper")
    StoreMapper storeMapper;
//    @Autowired
//    OrderMapper orderMapper;


    public int getStoreCount(String storeName){return storeMapper.getStoreCount(storeName);}


    public MyPage<Store> myGetStoreList(String searchName, int currentPage){
        MyPage myPage = new MyPage();
        myPage.setCurrentPage(currentPage);
        myPage.setPageNotesCount(9);
        int count = storeMapper.getStoreCount(searchName);
        int ceil = (int)Math.ceil(1.0 * count / 9);
        myPage.setPageTotal(ceil);
        List<Store> stores = storeMapper.myGetStoreList(searchName, (myPage.getCurrentPage() - 1) * 9, myPage.getPageNotesCount());
        myPage.setList(stores);
        return myPage;
    }




    public List<Store> getHotStoreList(){return storeMapper.getHotStoreList();}

    public Store myGetStore(Integer storeId){return storeMapper.myGetStore(storeId);}

    public Store myGetStoreOne(Integer ownerStoreId){return storeMapper.myGetStoreOne(ownerStoreId);}

    public void adminModifyStore(Integer storeId,Integer state,Integer storeHot){storeMapper.adminModifyStore(storeId, state, storeHot);}


    public void setPoster1(String picture,Integer storeId){
        storeMapper.setPoster1(picture, storeId);
    }
    public void setPoster2(String picture,Integer storeId){
        storeMapper.setPoster2(picture, storeId);
    }
    public void setPoster3(String picture,Integer storeId){
        storeMapper.setPoster3(picture, storeId);
    }
}
