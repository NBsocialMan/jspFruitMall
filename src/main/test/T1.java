
import com.baomidou.mybatisplus.annotation.DbType;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.generator.config.*;
import com.baomidou.mybatisplus.generator.AutoGenerator;
import com.baomidou.mybatisplus.generator.config.rules.NamingStrategy;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import xgbb.entity.*;
import xgbb.service.CommodityService;
import xgbb.service.impl.*;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.function.Consumer;


public class T1 {
    @Test
    public void a(){
//        ApplicationContext context = new ClassPathXmlApplicationContext("classpath:applicationcontext.xml");
//        CommodityServiceImpl bean = context.getBean(CommodityServiceImpl.class);
//        for (int i=17;i<=200;i++){
//            Commodity commodity = new Commodity();
//            commodity.setCommodityName("番茄"+i+"号");
//            bean.save(commodity);
//        }
//        String a="0123456";
//        String substring = a.substring(0, 3);
//        System.out.println(substring);
        Comparator<Integer> cc=(x, y)->Integer.compare(3,5);
        System.out.println(cc.compare(3,3));
        Comparator<Integer> c=(x,y)->{
            System.out.println("比较");
            return Integer.compare(x,y);
        };
        System.out.println(c.compare(9,9));
//        System.out.println("----------");
//        c.compare(7,9);
//        Runnable r=()-> System.out.println("启动");
//        r.run();
//        Consumer<String> cs=(e)-> System.out.println("奥利给"+e);
//        cs.accept("阿");

    }
//    @Test
//    public void b(){
//        ApplicationContext context = new ClassPathXmlApplicationContext("classpath:applicationcontext.xml");
////        CategoryServiceImpl bean = context.getBean(CategoryServiceImpl.class);
////        List<Category> hotCommodityList = bean.getCategory();
////        System.out.println(hotCommodityList);
//        CommodityServiceImpl bean = context.getBean(CommodityServiceImpl.class);
//        List<Commodity> hotCommodityList = bean.guessYouLike();
//        System.out.println(hotCommodityList);
//    }

//    public static void main(String[] args) {
//        // 代码生成器
//        //1. 全局配置
//        String projectPath = System.getProperty("user.dir");
//        GlobalConfig config = new GlobalConfig();
//        config.setActiveRecord(true) // 是否支持AR模式
//                .setAuthor("nb") // 作者
//                .setOutputDir(projectPath + "/src/main/java") // 生成路径
//                .setFileOverride(true)  // 文件覆盖
//                .setIdType(IdType.AUTO) // 主键策略
//                .setServiceName("%sService")  // 设置生成的service接口的名字的首字母是否为I
//                .setBaseResultMap(true)
//                .setBaseColumnList(true);
//
//        //2. 数据源配置
//        DataSourceConfig dsConfig  = new DataSourceConfig();
//        dsConfig.setDbType(DbType.MYSQL)  // 设置数据库类型
//                .setDriverName("com.mysql.jdbc.Driver")
//                .setUrl("jdbc:mysql:///ssm416?serverTimezone=GMT")
//                .setUsername("root")
//                .setPassword("123456");
//
//        //3. 策略配置
//        StrategyConfig stConfig = new StrategyConfig();
//        stConfig.setCapitalMode(true) //全局大写命名
////                .setDbColumnUnderline(true)  // 指定表名 字段名是否使用下划线
//                .setNaming(NamingStrategy.underline_to_camel) // 数据库表映射到实体的命名策略
//                .setTablePrefix("")
//                .setInclude("shopping_cart");  // 生成的表
//
//        //4. 包名策略配置
//        PackageConfig pkConfig = new PackageConfig();
//        pkConfig.setParent("xgbb")
//                .setMapper("mapper")
//                .setService("service")
//                .setController("controller")
//                .setEntity("entity")
//                .setXml("mapper");
//
//        //5. 整合配置
//        AutoGenerator ag = new AutoGenerator();
//
//        ag.setGlobalConfig(config)
//                .setDataSource(dsConfig)
//                .setStrategy(stConfig)
//                .setPackageInfo(pkConfig);
//
//        //6. 执行
//        ag.execute();
//    }
}
