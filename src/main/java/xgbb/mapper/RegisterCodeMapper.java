package xgbb.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import xgbb.entity.RegisterCode;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author nb
 * @since 2019-07-04
 */
public interface RegisterCodeMapper extends BaseMapper<RegisterCode> {

    @Insert("INSERT INTO register_code  ( email,test_code )  VALUES  ( '${email}','${testCode}' )")
    public void insertOneCode(@Param("email") String email, @Param("testCode") String testCode);

}
