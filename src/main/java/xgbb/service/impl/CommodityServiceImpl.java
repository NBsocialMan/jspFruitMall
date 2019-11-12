package xgbb.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import xgbb.entity.*;
import xgbb.mapper.CommodityMapper;
import xgbb.mapper.OrderDetailsMapper;
import xgbb.mapper.OrderMapper;
import xgbb.service.CommodityService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.*;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author nb
 * @since 2019-05-09
 */
@Service("commodityService")
public class CommodityServiceImpl extends ServiceImpl<CommodityMapper, Commodity> implements CommodityService {
    @Resource(name = "commodityMapper")
    CommodityMapper commodityMapper;
    @Autowired
    OrderMapper orderMapper;
    @Autowired
    OrderDetailsMapper orderDetailsMapper;

    public MyPage<Commodity> myGetCommodityList(String searchName, int currentPage){
        MyPage myPage = new MyPage();
        myPage.setCurrentPage(currentPage);
        myPage.setPageNotesCount(20);
        int count = commodityMapper.getCommodityCount(searchName);
        int ceil = (int)Math.ceil(1.0 * count / 20);
        myPage.setPageTotal(ceil);
        List<Commodity> commodities = commodityMapper.myGetCommodityList(searchName, (myPage.getCurrentPage() - 1) * 20, myPage.getPageNotesCount());
        myPage.setList(commodities);
        return myPage;
    }

    public MyPage<Commodity> myGetCommodityListForAdmin(String searchName, int currentPage){
        MyPage myPage = new MyPage();
        myPage.setCurrentPage(currentPage);
        myPage.setPageNotesCount(20);
        int count = commodityMapper.getCommodityCountForAdmin(searchName);
        int ceil = (int)Math.ceil(1.0 * count / 20);
        myPage.setPageTotal(ceil);
        List<Commodity> commodities = commodityMapper.myGetCommodityListForAdmin(searchName, (myPage.getCurrentPage() - 1) * 20, myPage.getPageNotesCount());
        myPage.setList(commodities);
        return myPage;
    }

    public MyPage<Commodity> getCommodityListByOwnerStoreIdForSeller(Integer ownerStoreId,int currentPage){
        MyPage myPage = new MyPage();
        myPage.setCurrentPage(currentPage);
        myPage.setPageNotesCount(10);
        int count = commodityMapper.getCommodityCountByOwnerStoreId(ownerStoreId);
        int ceil = (int)Math.ceil(1.0 * count / 10);
        myPage.setPageTotal(ceil);
        List<Commodity> commodityList = commodityMapper.getCommodityListByOwnerStoreIdForSeller(ownerStoreId, (myPage.getCurrentPage() - 1) * 10, myPage.getPageNotesCount());
        myPage.setList(commodityList);
        return myPage;
    }

    public void handSalesvolume(Integer commodityId,Integer salesvolume){commodityMapper.handSalesvolume(commodityId,salesvolume);}

    public void handStock(Integer commodityId,Integer stock){commodityMapper.handStock(commodityId,stock);}

    public MyPage<Commodity> getCommodityListASC(String searchName, int currentPage){
        MyPage myPage = new MyPage();
        myPage.setCurrentPage(currentPage);
        myPage.setPageNotesCount(20);
        int count = commodityMapper.getCommodityCount(searchName);
        int ceil = (int)Math.ceil(1.0 * count / 20);
        myPage.setPageTotal(ceil);
        List<Commodity> commodities = commodityMapper.getCommodityListASC(searchName, (myPage.getCurrentPage() - 1) * 20, myPage.getPageNotesCount());
        myPage.setList(commodities);
        return myPage;
    }

    public MyPage<Commodity> getCommodityListDESC(String searchName, int currentPage){
        MyPage myPage = new MyPage();
        myPage.setCurrentPage(currentPage);
        myPage.setPageNotesCount(20);
        int count = commodityMapper.getCommodityCount(searchName);
        int ceil = (int)Math.ceil(1.0 * count / 20);
        myPage.setPageTotal(ceil);
        List<Commodity> commodities = commodityMapper.getCommodityListDESC(searchName, (myPage.getCurrentPage() - 1) * 20, myPage.getPageNotesCount());
        myPage.setList(commodities);
        return myPage;
    }

    public MyPage<Commodity> getCommodityListSalesvolume(String searchName, int currentPage){
        MyPage myPage = new MyPage();
        myPage.setCurrentPage(currentPage);
        myPage.setPageNotesCount(20);
        int count = commodityMapper.getCommodityCount(searchName);
        int ceil = (int)Math.ceil(1.0 * count / 20);
        myPage.setPageTotal(ceil);
        List<Commodity> commodities = commodityMapper.getCommodityListSalesvolume(searchName, (myPage.getCurrentPage() - 1) * 20, myPage.getPageNotesCount());
        myPage.setList(commodities);
        return myPage;
    }

    public MyPage<Commodity> getCommodityListBigger(String searchName,Double commodityPrice1, int currentPage){
        MyPage myPage = new MyPage();
        myPage.setCurrentPage(currentPage);
        myPage.setPageNotesCount(20);
        int count = commodityMapper.getCommodityCountBigger(searchName,commodityPrice1);
        int ceil = (int)Math.ceil(1.0 * count / 20);
        myPage.setPageTotal(ceil);
        List<Commodity> commodities = commodityMapper.getCommodityListBigger(searchName, commodityPrice1,(myPage.getCurrentPage() - 1) * 20, myPage.getPageNotesCount());
        myPage.setList(commodities);
        return myPage;
    }

    public MyPage<Commodity> getCommodityListSmaller(String searchName,Double commodityPrice2, int currentPage){
        MyPage myPage = new MyPage();
        myPage.setCurrentPage(currentPage);
        myPage.setPageNotesCount(20);
        int count = commodityMapper.getCommodityCountSmaller(searchName,commodityPrice2);
        int ceil = (int)Math.ceil(1.0 * count / 20);
        myPage.setPageTotal(ceil);
        List<Commodity> commodities = commodityMapper.getCommodityListSmaller(searchName, commodityPrice2,(myPage.getCurrentPage() - 1) * 20, myPage.getPageNotesCount());
        myPage.setList(commodities);
        return myPage;
    }

    public MyPage<Commodity> getCommodityListBetween(String searchName,Double commodityPrice1,Double commodityPrice2, int currentPage){
        MyPage myPage = new MyPage();
        myPage.setCurrentPage(currentPage);
        myPage.setPageNotesCount(20);
        int count = commodityMapper.getCommodityCountBetween(searchName,commodityPrice1,commodityPrice2);
        int ceil = (int)Math.ceil(1.0 * count / 20);
        myPage.setPageTotal(ceil);
        List<Commodity> commodities = commodityMapper.getCommodityListBetween(searchName, commodityPrice1,commodityPrice2,(myPage.getCurrentPage() - 1) * 20, myPage.getPageNotesCount());
        myPage.setList(commodities);
        return myPage;
    }

    public int getCommodityCount(String commodityName){
        return commodityMapper.getCommodityCount(commodityName);
    }

    public List<Commodity> getHotCommodityList(){return commodityMapper.getHotCommodityList();};

    public List<Commodity> guessYouLike(Integer userId){
        List<Commodity> guessCommodityList=new ArrayList<>();
        List<Commodity> commodities = commodityMapper.mySelectCommodityList();
        if (userId==null){
            Map map=new HashMap();
            if (commodities.size()!=0){
                while(map.size()<8){
                    int random= (int) (Math.random()*commodities.size());
                    if (!map.containsKey(random)){
                        map.put(random,"");
                        guessCommodityList.add(commodities.get(random));
                    }
                }
            }
            return  guessCommodityList;
        }else {
            Order order = orderMapper.getGuess(userId);
            if (order==null){
                Map map=new HashMap();
                if (commodities.size()!=0){
                    while(map.size()<8){
                        int random= (int) (Math.random()*commodities.size());
                        if (!map.containsKey(random)){
                            map.put(random,"");
                            guessCommodityList.add(commodities.get(random));
                        }
                    }
                }
                return guessCommodityList;
            }else {
                Map map=new HashMap();
                List<OrderDetails> orderDetails = orderDetailsMapper.getOrderDetailsByOrderId(order.getOrderId());
                for (OrderDetails orderDetail : orderDetails) {
                    String commodityName = orderDetail.getCommodity().getCommodityName();
                    if (commodityName.contains("哈密瓜")){
                        List<Commodity> commodityList = commodityMapper.mySelectCommodityListByName("哈密瓜");
                        if (commodityList.size()!=0){
                            for (Commodity commodity : commodityList) {
                                if (guessCommodityList.size()<8&&!map.containsKey(commodity.getCommodityId())){
                                    guessCommodityList.add(commodity);
                                    map.put(commodity.getCommodityId(),"");
                                }
                            }
                        }
                    }
                    if (commodityName.contains("菠萝")){
                        List<Commodity> commodityList = commodityMapper.mySelectCommodityListByName("菠萝");
                        if (commodityList.size()!=0){
                            for (Commodity commodity : commodityList) {
                                if (guessCommodityList.size()<8&&!map.containsKey(commodity.getCommodityId())){
                                    guessCommodityList.add(commodity);
                                    map.put(commodity.getCommodityId(),"");
                                }
                            }
                        }
                    }
                    if (commodityName.contains("荔枝")){
                        List<Commodity> commodityList = commodityMapper.mySelectCommodityListByName("荔枝");
                        if (commodityList.size()!=0){
                            for (Commodity commodity : commodityList) {
                                if (guessCommodityList.size()<8&&!map.containsKey(commodity.getCommodityId())){
                                    guessCommodityList.add(commodity);
                                    map.put(commodity.getCommodityId(),"");
                                }
                            }
                        }
                    }
                    if (commodityName.contains("火龙果")){
                        List<Commodity> commodityList = commodityMapper.mySelectCommodityListByName("火龙果");
                        if (commodityList.size()!=0){
                            for (Commodity commodity : commodityList) {
                                if (guessCommodityList.size()<8&&!map.containsKey(commodity.getCommodityId())){
                                    guessCommodityList.add(commodity);
                                    map.put(commodity.getCommodityId(),"");
                                }
                            }
                        }
                    }
                    if (commodityName.contains("橘子")){
                        List<Commodity> commodityList = commodityMapper.mySelectCommodityListByName("橘子");
                        if (commodityList.size()!=0){
                            for (Commodity commodity : commodityList) {
                                if (guessCommodityList.size()<8&&!map.containsKey(commodity.getCommodityId())){
                                    guessCommodityList.add(commodity);
                                    map.put(commodity.getCommodityId(),"");
                                }
                            }
                        }
                    }
                    if (commodityName.contains("葡萄")){
                        List<Commodity> commodityList = commodityMapper.mySelectCommodityListByName("葡萄");
                        if (commodityList.size()!=0){
                            for (Commodity commodity : commodityList) {
                                if (guessCommodityList.size()<8&&!map.containsKey(commodity.getCommodityId())){
                                    guessCommodityList.add(commodity);
                                    map.put(commodity.getCommodityId(),"");
                                }
                            }
                        }
                    }
                    if (commodityName.contains("柠檬")){
                        List<Commodity> commodityList = commodityMapper.mySelectCommodityListByName("柠檬");
                        if (commodityList.size()!=0){
                            for (Commodity commodity : commodityList) {
                                if (guessCommodityList.size()<8&&!map.containsKey(commodity.getCommodityId())){
                                    guessCommodityList.add(commodity);
                                    map.put(commodity.getCommodityId(),"");
                                }
                            }
                        }
                    }
                    if (commodityName.contains("苹果")){
                        List<Commodity> commodityList = commodityMapper.mySelectCommodityListByName("苹果");
                        if (commodityList.size()!=0){
                            for (Commodity commodity : commodityList) {
                                if (guessCommodityList.size()<8&&!map.containsKey(commodity.getCommodityId())){
                                    guessCommodityList.add(commodity);
                                    map.put(commodity.getCommodityId(),"");
                                }
                            }
                        }
                    }
                    if (commodityName.contains("草莓")){
                                List<Commodity> commodityList = commodityMapper.mySelectCommodityListByName("草莓");
                                if (commodityList.size()!=0){
                                    for (Commodity commodity : commodityList) {
                                        if (guessCommodityList.size()<8&&!map.containsKey(commodity.getCommodityId())){
                                            guessCommodityList.add(commodity);
                                            map.put(commodity.getCommodityId(),"");
                                        }
                                    }
                        }
                    }
                    if (commodityName.contains("香蕉")){
                        List<Commodity> commodityList = commodityMapper.mySelectCommodityListByName("香蕉");
                        if (commodityList.size()!=0){
                            for (Commodity commodity : commodityList) {
                                if (guessCommodityList.size()<8&&!map.containsKey(commodity.getCommodityId())){
                                    guessCommodityList.add(commodity);
                                    map.put(commodity.getCommodityId(),"");
                                }
                            }
                        }
                    }
                    if (commodityName.contains("西瓜")){
                        List<Commodity> commodityList = commodityMapper.mySelectCommodityListByName("西瓜");
                        if (commodityList.size()!=0){
                            for (Commodity commodity : commodityList) {
                                if (guessCommodityList.size()<8&&!map.containsKey(commodity.getCommodityId())){
                                    guessCommodityList.add(commodity);
                                    map.put(commodity.getCommodityId(),"");
                                }
                            }
                        }
                    }
                    if (commodityName.contains("黑布林")){
                        List<Commodity> commodityList = commodityMapper.mySelectCommodityListByName("黑布林");
                        if (commodityList.size()!=0){
                            for (Commodity commodity : commodityList) {
                                if (guessCommodityList.size()<8&&!map.containsKey(commodity.getCommodityId())){
                                    guessCommodityList.add(commodity);
                                    map.put(commodity.getCommodityId(),"");
                                }
                            }
                        }
                    }
                    if (commodityName.contains("梨")){
                        List<Commodity> commodityList = commodityMapper.mySelectCommodityListByName("梨");
                        if (commodityList.size()!=0){
                            for (Commodity commodity : commodityList) {
                                if (guessCommodityList.size()<8&&!map.containsKey(commodity.getCommodityId())){
                                    guessCommodityList.add(commodity);
                                    map.put(commodity.getCommodityId(),"");
                                }
                            }
                        }
                    }
                    if (commodityName.contains("蛋糕")){
                        List<Commodity> commodityList = commodityMapper.mySelectCommodityListByName("蛋糕");
                        if (commodityList.size()!=0){
                            for (Commodity commodity : commodityList) {
                                if (guessCommodityList.size()<8&&!map.containsKey(commodity.getCommodityId())){
                                    guessCommodityList.add(commodity);
                                    map.put(commodity.getCommodityId(),"");
                                }
                            }
                        }
                    }
                    if (commodityName.contains("水果")){
                        List<Commodity> commodityList = commodityMapper.mySelectCommodityListByName("水果");
                        if (commodityList.size()!=0){
                            for (Commodity commodity : commodityList) {
                                if (guessCommodityList.size()<8&&!map.containsKey(commodity.getCommodityId())){
                                    guessCommodityList.add(commodity);
                                    map.put(commodity.getCommodityId(),"");
                                }
                            }
                        }
                    }
                }
            }


        }
        System.out.println("------------------------");
        for (Commodity commodity : guessCommodityList) {
            System.out.println(commodity.getCommodityId()+"---"+commodity.getCommodityName());
        }
        System.out.println("------------------------");
        Collections.shuffle(guessCommodityList);
        return guessCommodityList;
    }

    public Commodity getCommodityById(Integer commodityId){
        return commodityMapper.getCommodityById(commodityId);
    }

    public List<Commodity> getCommodityListByOwnerStoreIdForSeller(Integer ownerStoreId,int q,int h)
    {return commodityMapper.getCommodityListByOwnerStoreIdForSeller(ownerStoreId,q,h);}

    public Commodity getTheLatestCommodityByOwnerStore(Integer storeId){
        return commodityMapper.getTheLatestCommodityByOwnerStore(storeId);
    }
    public  void adminModifyCommodity2(Integer commodityId,Integer shelf,Integer commodityHot,Integer categoryId){
        commodityMapper.adminModifyCommodity2(commodityId, shelf, commodityHot,categoryId);
    }

    public  void adminModifyCommodity(Integer commodityId,Integer shelf,Integer commodityHot){
        commodityMapper.adminModifyCommodity(commodityId, shelf, commodityHot);
    }

    public void sanction(Integer storeId){
        commodityMapper.sanction(storeId);
    }

    public void unSanction(Integer storeId){
        commodityMapper.unSanction(storeId);
    }

    public void upperShelf(Integer storeId){
        commodityMapper.upperShelf(storeId);
    }

    public void lowerShelf(Integer storeId){
        commodityMapper.lowerShelf(storeId);
    }

    public List<Commodity> mySelectCommodityList(){return commodityMapper.mySelectCommodityList();}

    public List<DataAnalysis> dataAnalysis(Integer storeId){
        return commodityMapper.dataAnalysis(storeId);
    }

    public DataAnalysis monthAnalysis(Integer storeId,String year,String month){
        return commodityMapper.monthAnalysis(storeId, year, month);
    }

    public DataAnalysis monthAnalysisForAdmin(String year,String month){
        return commodityMapper.monthAnalysisForAdmin( year, month);

    }

    public List<OrderDetails> getPurchaseHistory(Integer userId){
        return commodityMapper.getPurchaseHistory(userId);
    }
}

