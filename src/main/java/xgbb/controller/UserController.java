package xgbb.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import xgbb.entity.*;
import xgbb.service.UserService;
import xgbb.service.impl.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author nb
 * @since 2019-04-21
 */
@Controller
@RequestMapping("user")
public class UserController {
    @Autowired
    UserServiceImpl userService;
    @Autowired
    CommodityServiceImpl commodityService;
    @Autowired
    StoreServiceImpl storeService;
    @Autowired
    CategoryServiceImpl categoryService;
    @Autowired
    OrderServiceImpl orderService;
    @Autowired
    ModifyPasswordServiceImpl modifyPasswordService;
    @Autowired
    RegisterCodeServiceImpl registerCodeService;
    @Autowired
    AdServiceImpl adService;

    @RequestMapping("loginUI")
    public String loginUI(){
        return "login";
    }

    @RequestMapping("login.do")
    public String login(Model model, String name, String password, HttpSession session){
        User one = userService.getOne(new QueryWrapper<User>().eq("name", name).eq("password", password));
        if (one==null){
            model.addAttribute("message","用户名或密码错误，请重新登录！");
            return "login";
        }
        session.setAttribute("user",one);
        List<Commodity> hotCommodityList = commodityService.getHotCommodityList();
        List<Category> category = categoryService.getAllCategory();
        List<Commodity> guessCommodityList = commodityService.guessYouLike(one.getId());
        List<Store> hotStoreList = storeService.getHotStoreList();
        int orderCountByUserId_0 = orderService.getOrderCountByUserId_0(one.getId());
        int orderCountByUserId_1 = orderService.getOrderCountByUserId_1(one.getId());
        int orderCountByUserId_2 = orderService.getOrderCountByUserId_2(one.getId());
        int orderCountByUserId_3 = orderService.getOrderCountByUserId_3(one.getId());
        model.addAttribute("orderNum0",orderCountByUserId_0);
        model.addAttribute("orderNum1",orderCountByUserId_1);
        model.addAttribute("orderNum2",orderCountByUserId_2);
        model.addAttribute("orderNum3",orderCountByUserId_3);
        model.addAttribute("hotStoreList",hotStoreList);
        model.addAttribute("guessCommodityList",guessCommodityList);
        model.addAttribute("categoryList",category);
        model.addAttribute("hotCommodityList",hotCommodityList);
        List<Ad> adList = adService.list();
        model.addAttribute("adList",adList);
        return "homePage";
    }
    @RequestMapping("logout.do")
    public String logout(HttpSession session,Model model){
        session.removeAttribute("user");
        List<Commodity> hotCommodityList = commodityService.getHotCommodityList();
        List<Category> category = categoryService.getAllCategory();
        List<Commodity> guessCommodityList = commodityService.guessYouLike(null);
        List<Store> hotStoreList = storeService.getHotStoreList();
        model.addAttribute("hotStoreList",hotStoreList);
        model.addAttribute("guessCommodityList",guessCommodityList);
        model.addAttribute("categoryList",category);
        model.addAttribute("hotCommodityList",hotCommodityList);
        List<Ad> adList = adService.list();
        model.addAttribute("adList",adList);
        return "homePage";
    }
    @RequestMapping("index.do")
    public String index(Model model,HttpSession session){
        session.removeAttribute("registerMessage");
        List<Commodity> hotCommodityList = commodityService.getHotCommodityList();
        User user = (User) session.getAttribute("user");
        List<Commodity> guessCommodityList = commodityService.guessYouLike(null);
        if (user==null){
            guessCommodityList = commodityService.guessYouLike(null);
        }else {
            guessCommodityList = commodityService.guessYouLike(user.getId());
        }
        if (user!=null){
            int orderCountByUserId_0 = orderService.getOrderCountByUserId_0(user.getId());
            int orderCountByUserId_1 = orderService.getOrderCountByUserId_1(user.getId());
            int orderCountByUserId_2 = orderService.getOrderCountByUserId_2(user.getId());
            int orderCountByUserId_3 = orderService.getOrderCountByUserId_3(user.getId());
            model.addAttribute("orderNum0",orderCountByUserId_0);
            model.addAttribute("orderNum1",orderCountByUserId_1);
            model.addAttribute("orderNum2",orderCountByUserId_2);
            model.addAttribute("orderNum3",orderCountByUserId_3);
        }
        List<Category> category = categoryService.getAllCategory();
        List<Store> hotStoreList = storeService.getHotStoreList();
        model.addAttribute("hotStoreList",hotStoreList);
        model.addAttribute("categoryList",category);
        model.addAttribute("hotCommodityList",hotCommodityList);
        model.addAttribute("guessCommodityList",guessCommodityList);
        List<Ad> adList = adService.list();
        model.addAttribute("adList",adList);
        return "homePage";
    }
    @RequestMapping("/registerUI.do")
    public String registerUI(HttpSession session){
//        session.removeAttribute("registerMessage");
        return "register";
    }
    @RequestMapping("/getRegisterCode.do")
    public void getRegisterCode(HttpServletResponse response,String email) throws EmailException, IOException {
        registerSendMail(email);
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("邮件已经发送！");
    }

    @RequestMapping("/forgetUI.do")
    public String forgetUI(Model model){
        model.addAttribute("ms",0);
        return "resetPassword";
    }

    @RequestMapping("/getForgetCode.do")
    public void getForgetCode(HttpServletResponse response,String email) throws EmailException, IOException {
        User one = userService.getOne(new QueryWrapper<User>().eq("email", email));
        response.setCharacterEncoding("UTF-8");
        if (one==null){
            response.getWriter().write("此邮箱未注册！");
        }else {
            forgetPasswordSendMail(email);
            response.getWriter().write("邮件已经发送！");
        }
    }

    @RequestMapping("/register.do")
    public String register(String name,String password,String email,String testCode,Model model){
        RegisterCode one = registerCodeService.getOne(new QueryWrapper<RegisterCode>().eq("email", email).eq("test_code", testCode));
        if (one==null){
            model.addAttribute("registerMessage","验证码错误");
            model.addAttribute("name",name);
            return "register";
        }
        User user = userService.getOne(new QueryWrapper<User>().eq("email", email).or().eq("name",name));
        if(user==null){
            User newUser = new User();
            newUser.setName(name);
            newUser.setPassword(password);
            newUser.setEmail(email);
            userService.save(newUser);
            model.addAttribute("message","注册成功！");
            return "login";
        }
        model.addAttribute("registerMessage","用户名已经存在或者邮箱已经注册过账号");
        return "register";
    }
    @RequestMapping("individualInformationUI.do")
    public String individualInformationUI(Model model){
        //默认进入个人资料页面显示个人资料
        model.addAttribute("individualState",1);
        return "individualInformation";
    }

    @RequestMapping("securitySettingUI.do")
    public String securitySettingUI(Model model,HttpSession session){
        //安全设置
        model.addAttribute("individualState",0);
        User user = (User) session.getAttribute("user");
        String email = user.getEmail();
        if(email!=null&&email!=""){
            int i = email.lastIndexOf("@");
            if (i!=-1){
                String substring2 = email.substring(i, email.length());
                String handleEmail="*********"+substring2;
                model.addAttribute("handleEmail",handleEmail);
            }else {
                model.addAttribute("handleEmail","邮箱获取异常");
            }
        }
        return "individualInformation";
    }

    @RequestMapping("receiveAddressSettingUI.do")
    public String receiveAddressSetting(Model model){
        //收货地址
        model.addAttribute("individualState",2);
        return "individualInformation";
    }

    @RequestMapping("modifyReceiveAddress.do")
    public String modifyReceiveAddress(Integer id,
                                       String receiveAddress,
                                       String postCode,
                                       String receiver,
                                       String telephone,
                                       HttpSession session,
                                       Model model){
        userService.modifyReceiveAddress(id,receiveAddress,postCode,receiver,telephone);
        User one = userService.getOne(new QueryWrapper<User>().eq("id", id));
        session.setAttribute("user",one);
        model.addAttribute("message","success_2");
        model.addAttribute("individualState",2);
        return "individualInformation";
    }

    @RequestMapping("modifyIndividualInformation.do")
    public String modifyIndividualInformation(Integer id,
                                              String name,
                                              String birthday,
                                              String realname,
                                              String gender,
                                              String placeOfResidence,
                                              HttpSession session,
                                              Model model){
        User name1 = userService.getOne(new QueryWrapper<User>().eq("name", name));
        if(name1.getId()==id){
            model.addAttribute("message","success_1");
            userService.modifyIndividualInformation(id,name, birthday,realname,gender,placeOfResidence);
        }else {
            model.addAttribute("message","fail_1");
        }
        User one = userService.getOne(new QueryWrapper<User>().eq("id", id));
        session.setAttribute("user",one);
        model.addAttribute("individualState",1);
        return "individualInformation";
    }
    @RequestMapping("findPW")
    public String findPW(HttpSession session,Model model) throws EmailException {
        model.addAttribute("individualState",3);
        return "individualInformation";
    }
    @RequestMapping("findPassword")
    public String findPassword(HttpSession session,Model model) throws EmailException {
        User user = (User) session.getAttribute("user");
        sendMail(user.getId(),user.getEmail());
        model.addAttribute("individualState",4);
        return "individualInformation";
    }

    @RequestMapping("test")
    public String test(HttpSession session,Model model,String code){
        User user = (User) session.getAttribute("user");
        ModifyPassword one = modifyPasswordService.getOne(new QueryWrapper<ModifyPassword>().eq("user_id", user.getId()).eq("test_code", code));

        if (one==null){
            model.addAttribute("individualState",4);
            model.addAttribute("modifyMS","验证码错误");
        }else {
            model.addAttribute("individualState",5);
        }
        return "individualInformation";
    }

    @RequestMapping("forgetTest")
    public String forgetTest(String email,Model model,String code){
        User user = userService.getOne(new QueryWrapper<User>().eq("email", email));
        ModifyPassword one = modifyPasswordService.getOne(new QueryWrapper<ModifyPassword>().eq("user_id", user.getId()).eq("test_code", code));
        if (one==null){
            model.addAttribute("ms",0);
            model.addAttribute("message","验证码错误");
        }else {
            model.addAttribute("ms",1);
        }
        model.addAttribute("email",email);
        return "resetPassword";
    }

    @RequestMapping("modifyPassword")
    public String modifyPassword(HttpSession session,String password,Model model){
        User user = (User) session.getAttribute("user");
        userService.modifyPassword(user.getId(),password);
        session.removeAttribute("user");
        model.addAttribute("message","你已更改密码，请重新登录");
        return "login";
    }
    @RequestMapping("modifyPasswordWhenForget")
    public String modifyPasswordWhenForget(String email,String password,Model model,HttpSession session){
        User one = userService.getOne(new QueryWrapper<User>().eq("email", email));
        userService.modifyPassword(one.getId(),password);
        session.removeAttribute("user");
        model.addAttribute("message","你已更改密码，请重新登录");
        return "login";
    }



    public void sendMail(Integer id,String email) throws EmailException {

        Random random = new Random();
        String code="";
        for (int i=0;i<6;i++) {
            code += random.nextInt(10);
        }
        SimpleEmail mail = new SimpleEmail();
        // 设置邮箱服务器信息
        mail.setSslSmtpPort("25");
        mail.setHostName("smtp.qq.com");
        // 设置密码验证器
        mail.setAuthentication("1601073303@qq.com", "pxcvlmokezdfgaed");
        // 设置邮件发送者
        mail.setFrom("1601073303@qq.com");
        // 设置邮件接收者
        mail.addTo(email);
        // 设置邮件编码
        mail.setCharset("UTF-8");
        // 设置邮件主题
        mail.setSubject("属实奥利给！水果蔬菜商城密码找回邮件（请勿回复此封邮件）");
        // 设置邮件内容
        mail.setMsg(code);
        // 设置邮件发送时间
        mail.setSentDate(new Date());
        ModifyPassword one = modifyPasswordService.getOne(new QueryWrapper<ModifyPassword>().eq("user_id", id));
        if (one==null){
            modifyPasswordService.cao(id,code);
        }else {
            one.setTestCode(code);
            modifyPasswordService.updateById(one);
        }

        // 发送邮件
        mail.send();
    }

    public void registerSendMail(String email) throws EmailException {

        Random random = new Random();
        String code="";
        for (int i=0;i<6;i++) {
            code += random.nextInt(10);
        }
        SimpleEmail mail = new SimpleEmail();
        // 设置邮箱服务器信息
        mail.setSslSmtpPort("465");
        mail.setHostName("smtp.qq.com");
        // 设置密码验证器
        mail.setAuthentication("1601073303@qq.com", "pxcvlmokezdfgaed");
        // 设置邮件发送者
        mail.setFrom("1601073303@qq.com");
        // 设置邮件接收者
        mail.addTo(email);
        // 设置邮件编码
        mail.setCharset("UTF-8");
        // 设置邮件主题
        mail.setSubject("注册邮件（请勿将验证码告知他人）");
        // 设置邮件内容
        mail.setMsg(code);
        // 设置邮件发送时间
        mail.setSentDate(new Date());
        RegisterCode registerCode = registerCodeService.getOne(new QueryWrapper<RegisterCode>().eq("email", email));
        if (registerCode==null){
            registerCodeService.insertOneCode(email,code);
        }else {
            registerCode.setTestCode(code);
           registerCodeService.updateById(registerCode);
        }

        // 发送邮件
        mail.send();
    }

    public void forgetPasswordSendMail(String email) throws EmailException {
        User user = userService.getOne(new QueryWrapper<User>().eq("email", email));

        Random random = new Random();
        String code="";
        for (int i=0;i<6;i++) {
            code += random.nextInt(10);
        }
        SimpleEmail mail = new SimpleEmail();
        // 设置邮箱服务器信息
        mail.setSslSmtpPort("465");
        mail.setHostName("smtp.qq.com");
        // 设置密码验证器
        mail.setAuthentication("1601073303@qq.com", "pxcvlmokezdfgaed");
        // 设置邮件发送者
        mail.setFrom("1601073303@qq.com");
        // 设置邮件接收者
        mail.addTo(email);
        // 设置邮件编码
        mail.setCharset("UTF-8");
        // 设置邮件主题
        mail.setSubject("找回密码邮件（请勿将验证码告知他人）");
        // 设置邮件内容
        mail.setMsg(code);
        // 设置邮件发送时间
        mail.setSentDate(new Date());
        ModifyPassword one = modifyPasswordService.getOne(new QueryWrapper<ModifyPassword>().eq("user_id", user.getId()));
        if (one==null){
            modifyPasswordService.cao(user.getId(),code);
        }else {
            one.setTestCode(code);
            modifyPasswordService.updateById(one);
        }

        // 发送邮件
        mail.send();
    }
}

