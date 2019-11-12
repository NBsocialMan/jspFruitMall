package xgbb.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import xgbb.entity.ModifyPassword;
import xgbb.mapper.ModifyPasswordMapper;
import xgbb.service.ModifyPasswordService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author nb
 * @since 2019-07-03
 */
@Service
public class ModifyPasswordServiceImpl extends ServiceImpl<ModifyPasswordMapper, ModifyPassword> implements ModifyPasswordService {
@Autowired
    ModifyPasswordMapper modifyPasswordMapper;
    public void cao(Integer userId,String testCode){
        modifyPasswordMapper.cao(userId,testCode);
    }
}
