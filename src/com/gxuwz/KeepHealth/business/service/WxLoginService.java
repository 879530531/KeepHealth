package com.gxuwz.KeepHealth.business.service;


import java.util.List;

import com.gxuwz.KeepHealth.business.entity.SysUser;
import com.gxuwz.KeepHealth.business.entity.TbPersonalData;
import com.gxuwz.core.pagination.Result;

/**
 * 
* @ClassName: WxLoginService 
* @Description:  微信登录Service接口
* @author 软件开发中心  莫然源
* @date 2017年7月7日 下午9:41:45
 */
public interface WxLoginService {
	
	/**
	 * 检查用户名和密码是否存在于数据库
	 * @return boolean
	 * @throws 
	 * @author 莫然源
	 * @Date 2017.03.24
	 */
	public boolean isLogin1(TbPersonalData tbPersonalData);
	
}
