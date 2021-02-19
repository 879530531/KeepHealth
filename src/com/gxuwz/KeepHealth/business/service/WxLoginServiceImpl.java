package com.gxuwz.KeepHealth.business.service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import util.MyTime;

import com.gxuwz.KeepHealth.SystemContext;
import com.gxuwz.KeepHealth.business.dao.SysUserDAO;
import com.gxuwz.KeepHealth.business.dao.WxLoginDAO;
import com.gxuwz.KeepHealth.business.entity.SysRoleRight;
import com.gxuwz.KeepHealth.business.entity.SysUser;
import com.gxuwz.KeepHealth.business.entity.SysUserRole;
import com.gxuwz.KeepHealth.business.entity.TbPersonalData;

import com.gxuwz.core.pagination.Result;
import com.gxuwz.core.util.UidUtils;

/**
 * 
* @ClassName: WxLoginServiceImpl 
* @Description:  微信登录Service实现类 
* @author 软件开发中心  莫然源
* @date 2017年7月7日 下午9:43:33
 */
@Service("WxLoginService")
public class WxLoginServiceImpl implements WxLoginService {


	@Autowired
	private WxLoginDAO wxLoginDAO;
	
	
	/**
	 * 用户登录
	 * @param sysUser 用户对象
	 * @return true -允许登录；false -不允许登录
	 */
	public boolean isLogin1(TbPersonalData tbPersonalData){
		
		boolean isL = false;//初始化临时变量
		TbPersonalData TbPerson = null;
		try {
			//System.out.println("123"+tbPersonalData.getPassword());
			//System.out.println("123"+tbPersonalData.getMobilePhone());
			TbPerson = wxLoginDAO.findWxLoginByProperty("mobilePhone",tbPersonalData.getMobilePhone());//根据id查找用户名
			
			if(null != TbPerson){
				//System.out.println("sysUserTem.getUserPassword="+TbPerson.getPassword());
				if(SystemContext.passwdDecryption(tbPersonalData.getPassword(),TbPerson.getPassword())){
					isL =true;
				}
			}
		} catch (Exception e) {
			
		}
		//isL = true;//测试
		//System.out.println(isL);
		return isL;
	}


}
