package xgbb.service.impl;

import xgbb.entity.Ad;
import xgbb.mapper.AdMapper;
import xgbb.service.AdService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author nb
 * @since 2019-07-15
 */
@Service
public class AdServiceImpl extends ServiceImpl<AdMapper, Ad> implements AdService {

}
