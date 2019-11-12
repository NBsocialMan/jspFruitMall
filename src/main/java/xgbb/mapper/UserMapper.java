package xgbb.mapper;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.web.bind.annotation.RequestMapping;
import xgbb.entity.User;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author nb
 * @since 2019-05-20
 */
@RequestMapping("userMapper")
public interface UserMapper extends BaseMapper<User> {

    @Update("update user set receive_address='${receiveAddress}', post_code='${postCode}',receiver='${receiver}',telephone='${telephone}' where id=${id}")
    public void modifyReceiveAddress(@Param("id") Integer id,
                                     @Param("receiveAddress") String receiveAddress,
                                     @Param("postCode")String postCode,
                                     @Param("receiver")String receiver,
                                     @Param("telephone")String telephone);

    @Select("select * from user where name='${name}' and password='${password}' and role=6")
    public User adminLogin(@Param("name") String name,@Param("password") String password);

    @Select("select * from user where id=#{id}")
    public User getUserById(Integer id);

    @Update("update user set password='${password}' where id=${id}")
    public void modifyPassword(@Param("id") Integer id,@Param("password") String password);



}