package xgbb.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import xgbb.entity.RegisterCode;
import xgbb.mapper.RegisterCodeMapper;
import xgbb.service.RegisterCodeService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author nb
 * @since 2019-07-04
 */
@Service
public class RegisterCodeServiceImpl extends ServiceImpl<RegisterCodeMapper, RegisterCode> implements RegisterCodeService {
@Autowired
    RegisterCodeMapper registerCodeMapper;
    public void insertOneCode(String email,String testCode){
        registerCodeMapper.insertOneCode(email, testCode);
    }
}
