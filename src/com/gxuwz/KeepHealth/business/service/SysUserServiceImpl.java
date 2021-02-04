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
import com.gxuwz.KeepHealth.business.dao.TbPersonalDataDAO;
import com.gxuwz.KeepHealth.business.entity.SysRoleRight;
import com.gxuwz.KeepHealth.business.entity.SysUser;
import com.gxuwz.KeepHealth.business.entity.SysUserRole;
import com.gxuwz.KeepHealth.business.entity.TbPersonalData;
import com.gxuwz.core.pagination.Result;
import com.gxuwz.core.util.UidUtils;

/**
 * <p>Title: 类名：用户-业务逻辑--实现</p>
 * <p>Description:mailsender-业务逻辑/n</p>
 * @author:	梧州学院 软件开发中心 庞光垚
 * @date:2015.07.31
 */

@Service("sysUserService")
public class SysUserServiceImpl implements SysUserService {

	@Autowired
	private SysUserRoleService sysUserRoleService;
	@Autowired
	private SysUserDAO sysUserDAO;
	@Autowired
	private TbPersonalDataDAO tbPersonalDataDAO;
	@Autowired
	private TbPersonalDataService tbPersonalDataService;
	
	/**
	 * 根据用户编号查询用户对象
	 * @param userid 用户编号
	 * @return 用户对象
	 */
	public SysUser findByUserId(String userid){
		return sysUserDAO.findSysUserByProperty("userId", userid);
	}
	
	/**
	 * 获取令牌
	 * @param userId 用户编号
	 * @param sign 令牌
	 * @return true 令牌符合,false 令牌错误
	 */
	/*public boolean checkSign(String userId,String sign){
		boolean isS = false;
		SysUser sysUser = null;
		sysUser = sysUserDAO.fingByUserid(userId);//手机
		//校验令牌
		if(SystemContext.passwdDecryption(sign,sysUser.getSign())){
			isS = true;
		}
		return isS;
	}*/
	
	/**
	 * 修改用户昵称
	 * @param userId 用户编号
	 * @param userName 用户昵称
	 * @return 1-成功；0-出错
	 */
	public int updateUserName(String userId,String userName){
		int numT = 0;
		SysUser sysUser = sysUserDAO.findSysUserByProperty("userId", userId);//
		if(null != sysUser){
			sysUser.setUserName(userName);
			sysUserDAO.update(sysUser);
			numT = 1;
		}
		return numT;
	}
	
	/**
	 * 修改导师手机号码
	 * @param userId 用户编号
	 * @param userPassword  用户密码
	 * @return void
	 */
	public void updateMobilePhone(String TPhone,String MPhone){
		SysUser sysUser = sysUserDAO.findSysUserByProperty("userTelephone", TPhone);
		if(null != sysUser){
			sysUser.setUserTelephone(MPhone);
			sysUserDAO.update(sysUser);
		}
	}
	
	/**
	 * 修改用户密码
	 * @param userId 用户编号
	 * @param userPassword  用户密码
	 * @return 1-成功；0-出错
	 */
	public int updateUserPassWd(String userId,String userPassword){
		int numT = 0;
		SysUser sysUser = sysUserDAO.findSysUserByProperty("userId", userId);//
		if(null != sysUser){
			sysUser.setUserPassword(SystemContext.passwdEncryption(userPassword));
			sysUserDAO.update(sysUser);
			numT = 1;
		}
		return numT;
	}
	
	/**
	 * 用户登录
	 * @param sysUser 用户对象
	 * @return true -允许登录；false -不允许登录
	 */
	public boolean isLogin(SysUser sysUser){
		//System.out.println("sysUser.getUserPassword()="+sysUser.getUserPassword());
		//System.out.println("sysUser.getUserName()="+sysUser.getUserName());
		boolean isL = false;//初始化临时变量
		SysUser sysUserTem = null;
		try {
			sysUserTem = sysUserDAO.findSysUserByProperty("userName", sysUser.getUserName());
			//System.out.println("login"+sysUser.getUserName());
			if(null == sysUserTem){//用户名为空，再读用户编号
				sysUserTem = sysUserDAO.findSysUserByProperty("userId", sysUser.getUserName());
			}
			if(null != sysUserTem){
				//System.out.println("sysUserTem.getUserPassword="+sysUserTem.getUserPassword());
				if(SystemContext.passwdDecryption(sysUser.getUserPassword(),sysUserTem.getUserPassword())){
					isL =true;
				}
			}
		} catch (Exception e) {
			
		}
		//isL = true;//测试
		
		return isL;
	}
	/**
	 * 根据条件查找分页
	 * @param sysUser 模型
	 * @param page 第几页
	 * @param row 长度
	 * @return
	 * @author 卢善坚，潘恒飞
	 * @date 2015.8.8
	 */
	public Result<SysUser> find(SysUser sysUser, int page, int row) {
		return sysUserDAO.find(sysUser, page, row);
	}
	
	/**
	 * 添加用户--所有的保存都要调用该方法，因为有加密
	 * @param sysUser
	 * @author 庞光垚
	 * @date 2015.8.8
	 */
	public void add(SysUser sysUser){
		//密码需要加密
		//System.out.println("sys"+sysUser.getUserPassword());
		sysUser.setUserPassword(SystemContext.passwdEncryption(sysUser.getUserPassword()));
		sysUserDAO.save(sysUser);
	}
	
	/**
	 * 添加用户
	 * @param sysUser
	 * @author 卢善坚
	 * @date 2015.8.8
	 */
	@Override
	public void add(SysUser sysUser, String[] roleIds) {
		if(null != roleIds){
			for(int i = 0; i < roleIds.length; i++){
				SysUserRole sysUserRole = new SysUserRole();
				sysUserRole.setUserId(sysUser.getUserId());
				sysUserRole.setRoleId(roleIds[i]);
				sysUserRoleService.addUserRole(sysUserRole);
			}
		}
		
		add(sysUser);
		
	}
	/**
	 * 根据Id查询单条记录
	 * @param id
	 * @return
	 * @author 潘恒飞，卢善坚
	 * @Date 2015.08.09ss
	 */
	@Override
	public SysUser findById(int id) {
		return sysUserDAO.get(SysUser.class,id);
	}
	/**
	 * 保存修改用户信息
	 * @param sysUser
	 * @author 潘恒飞，卢善坚
	 * @Date 2015.08.09
	 */
	@Override
	public void update(SysUser sysUser, String[] roleIds, String oldPassword) {
		//先根据用户编号删除用户角色
		sysUserRoleService.deleteUserRole(sysUser.getUserId());
		//System.out.println("roleIds2===="+roleIds);
		if(null != roleIds){
			//再循环添加用户角色
			for(int i = 0; i < roleIds.length; i++){
				SysUserRole sysUserRole = new SysUserRole();
				sysUserRole.setUserId(sysUser.getUserId());
				sysUserRole.setRoleId(roleIds[i]);
				sysUserRoleService.addUserRole(sysUserRole);
			}
		}
		
		if(sysUser.getUserPassword().equals("")){     //如果用户修改的密码为空，则是用户不修改密码，不用加密直接保存到数据库
			sysUser.setUserPassword(oldPassword);
		}else{
			//否则为已经修改了密码需要加密
			sysUser.setUserPassword(SystemContext.passwdEncryption(sysUser.getUserPassword()));
		}
		//更新用户信息
		
		sysUserDAO.update(sysUser);
	}
	
	/**
	 * 删除用户
	 * @param sysUser 模型
 * @author 潘恒飞，卢善坚
	 * @Date 2015.08.09
	 */
	@Override
	public void delete(int id,String userId) {
		sysUserRoleService.deleteUserRole(userId);
		SysUser sysUser = findById(id);
		//System.out.println("用户管理 删除"+sysUser.getUserType());
		if(sysUser.getUserType() == 2){
			TbPersonalData tbPersonalData = tbPersonalDataService.findByPersonalNameWeb(sysUser.getUserId());
			tbPersonalDataDAO.remove(tbPersonalData);
		}
		sysUserDAO.remove(sysUser);
	}
	/**
	 * 检验用户编号是否存在
	 * @param userId
	 * @return
	 * @author 卢善坚，汪嘉惠
	 * @date 2015.08.14
	 */
	@Override
	public boolean checkUserId(String userId){
		boolean result = false;
		List<SysUser> sysUser = sysUserDAO.checkUserId(userId);
		if(null != sysUser && sysUser.size()>0){
			result = true;
		}
		return result;
	}
	/**
	 * 检验用户名是否存在
	 * @param userId
	 * @return
	 * @author 卢善坚，汪嘉惠
	 * @date 2015.08.14
	 */
	@Override
	public boolean checkUserName(String userId){
		boolean result = false;
		List<SysUser> sysUser = sysUserDAO.checkUserName(userId);
		if(null != sysUser && sysUser.size()>0){
			result = true;
		}
		return result;
	}
	/**
	 * 校验用户密码
	 * @param rawPassword 数据库保存的加密的密码
	 * @param password 明文密码（需要匹配的用户输入的那份）
	 * @return
	 * @author 卢善坚，汪嘉惠
	 * @date 2015.08.14
	 */
	@Override
	public boolean checkPasswd(String rawPassword, String password) {
		return SystemContext.passwdDecryption(rawPassword, password);
	}
	/**
	 * 根据用户名称查询用户信息
	 * @param userName 用户名称
	 * @return
	 */
	@Override
	public SysUser findByName(String userName) {
		return sysUserDAO.findSysUserByUserNameOrUserId(userName);
	}
	
	/**
	 * 根据用户id查找用户权限id
	 * @param userId
	 * @return
	 * @author 蒙译文
	 * @date 2015.09.15
	 */
	@Override
	public List<String> findUserPermissions(String userId) {
		List<String> strList=new ArrayList<String>();
		List<SysRoleRight> list=sysUserDAO.findUserPermissions(userId);
		for(int i=0;i<list.size();i++){
			strList.add(list.get(i).getRightId());
		}
		return strList;
	}
	
	/**
	 * 保存用户个人修改的信息
	 * @param sysUser
	 * @param oldPassword
	 * @author 卢善坚
	 * @date 2015.09.25
	 */
	@Override
	public void updateUserMessage(SysUser sysUser, String oldPassword) {
		
		if(sysUser.getUserPassword().equals("")){     //如果用户修改的密码为空，则是用户不修改密码，不用加密直接保存到数据库
			sysUser.setUserPassword(oldPassword);
		}else{
			//否则为已经修改了密码需要加密
			sysUser.setUserPassword(SystemContext.passwdEncryption(sysUser.getUserPassword()));
		}
		//更新用户信息
		sysUserDAO.update(sysUser);
	}
	/**
	 * 根据userName查询对象
	 */
	public SysUser findByUserName(String userName){
		//System.out.println("根据userName查询对象");
		return sysUserDAO.findSysUserByUserNameOrUserId(userName);
	}
	
}
