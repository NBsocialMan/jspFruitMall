package xgbb.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import xgbb.entity.User;
import xgbb.mapper.UserMapper;
import xgbb.service.UserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author nb
 * @since 2019-05-15
 */
@Service("userService")
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {
    @Autowired
    UserMapper userMapper;
    public void modifyIndividualInformation(Integer id,
                                            String name,
                                            String birthday,
                                            String realname,
                                            String gender,
                                            String placeOfResidence){
        User user = userMapper.selectOne(new QueryWrapper<User>().eq("id", id));
        user.setName(name);
        user.setBirthday(birthday);
        user.setRealname(realname);
        user.setGender(gender);
        user.setPlaceOfResidence(placeOfResidence);
        userMapper.updateById(user);
    }

    public void modifyReceiveAddress(Integer id,String receiveAddress,String postCode,String receiver,String telephone){
        userMapper.modifyReceiveAddress(id,receiveAddress,postCode,receiver,telephone);

    }

    public User adminLogin(String name,String password){
        return  userMapper.adminLogin(name, password);
    }

    public  void modifyPassword(Integer id,String password){
        userMapper.modifyPassword(id, password);
    }
}

