package xgbb.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import xgbb.entity.ModifyPassword;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author nb
 * @since 2019-07-03
 */
public interface ModifyPasswordMapper extends BaseMapper<ModifyPassword> {

    @Insert("INSERT INTO modify_password  ( user_id,test_code )  VALUES  ( ${userId},${testCode} )")
    public void cao(@Param("userId") Integer userId,@Param("testCode") String testCode);

}
