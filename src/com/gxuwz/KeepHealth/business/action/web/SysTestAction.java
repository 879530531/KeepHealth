package com.gxuwz.KeepHealth.business.action.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.gxuwz.KeepHealth.business.entity.SysRole;
import com.gxuwz.KeepHealth.business.entity.SysUser;
import com.gxuwz.KeepHealth.business.entity.SysUserRole;
import com.gxuwz.KeepHealth.business.service.SysRoleService;
import com.gxuwz.KeepHealth.business.service.SysUserRoleService;
import com.gxuwz.KeepHealth.business.service.SysUserService;
import com.gxuwz.core.pagination.Result;
import com.gxuwz.core.web.action.BaseAction;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
/**
 * 
 * @author <a href=mailto:amu_1115@126.com> amu </a>
 * @version $ DepartmentAction.java 2015-7-27 下午05:11:18
 */
public class SysTestAction extends BaseAction implements Preparable, ModelDriven{

	private static final long serialVersionUID = -4104125263890869018L;
	protected static final String LIST_JSP = "/WEB-INF/page/web/health_manage/SysMember_list.jsp";
	protected static final String SET_JSP = "/WEB-INF/page/web/health_manage/SysMember_set.jsp";
	protected static final String SET1_JSP = "/WEB-INF/page/web/health_manage/Health_record.jsp";
	protected static final String LIST1_JSP = "/WEB-INF/page/web/health_manage/SysTeacher_list.jsp";
	protected static final String LIST2_JSP = "/WEB-INF/page/web/health_manage/Untreated_consulting.jsp";
	protected static final String LIST3_JSP = "/WEB-INF/page/web/health_manage/Vip_manage.jsp";
	protected static final String LIST4_JSP = "/WEB-INF/page/web/health_manage/Health_data.jsp";
	protected static final String LIST5_JSP = "/WEB-INF/page/web/health_manage/Teacher_count.jsp";
	protected static final String LIST6_JSP = "/WEB-INF/page/web/health_manage/Personal_data.jsp";
	protected static final String ADD_JSP = "/WEB-INF/page/web/health_manage/SysMember_add.jsp";
	protected static final String ADD1_JSP = "/WEB-INF/page/web/health_manage/SysTeacher_add.jsp";
	protected static final String EDIT_JSP = "/WEB-INF/page/web/SysUser_edit.jsp";
	protected static final String MESSAGE_JSP = "/WEB-INF/page/web/userMessage.jsp";
	
	@Autowired
	private SysUserService sysUserService;
	@Autowired
	private SysRoleService sysRoleService;
	@Autowired
	private SysUserRoleService sysUserRoleService;
	
	private SysUserRole sysUserRole; //用户角色模型
	private String[] roleId;
	private SysUser sysUser;//用户模型
	private Result<SysUser> pageResult;//分页
	private List<SysRole> roles; //角色
	private List<SysUserRole> userRoles;//接收用户角色列表
	private String oldPassword;           //用户原来的密码
	private int actionState;//操作状态。1-操作成功（保存成功）
	
	public void prepare() throws Exception{
		if(null == sysUser){
			sysUser = new SysUser();
		}
		if(null == sysUserRole){
			sysUserRole = new SysUserRole();
		}
	}
	
	@Override
	public String execute() throws Exception {
		
		return SUCCESS;
	}
	/**
	 * 列表
	 * @return
	 * @throws Exception
	 */
	public String list()throws Exception{
//			pageResult = sysUserService.find(sysUser, getPage(), getRow());
			setForwardView(LIST_JSP);
		return SUCCESS;
	}
	
	public String list1()throws Exception{
//		pageResult = sysUserService.find(sysUser, getPage(), getRow());
		setForwardView(LIST1_JSP);
	return SUCCESS;
}
	
	public String list2()throws Exception{
//		pageResult = sysUserService.find(sysUser, getPage(), getRow());
		setForwardView(LIST2_JSP);
	return SUCCESS;
}
	
	public String list3()throws Exception{
//		pageResult = sysUserService.find(sysUser, getPage(), getRow());
		setForwardView(LIST3_JSP);
	return SUCCESS;
}
	
	public String list4()throws Exception{
//		pageResult = sysUserService.find(sysUser, getPage(), getRow());
		setForwardView(LIST4_JSP);
	return SUCCESS;
}
	
	public String list5()throws Exception{
//		pageResult = sysUserService.find(sysUser, getPage(), getRow());
		setForwardView(LIST5_JSP);
	return SUCCESS;
}
	
	public String list6()throws Exception{
//		pageResult = sysUserService.find(sysUser, getPage(), getRow());
		setForwardView(LIST6_JSP);
	return SUCCESS;
}
	/**
	 * 添加用户
	 * @return
	 * @throws Exception
	 * @author 卢善坚，潘恒飞
	 * @date 2015.8.8
	 */
	public String add() throws Exception{
		System.out.println("roleId===="+roleId);
		sysUserService.add(sysUser,roleId);
		sysUser.setUserName(null);
		return list();
	}
	/**
	 * 保存修改的用户信息
	 * @return
	 * @throws Exception
	 * @author 潘恒飞，卢善坚
	 * @Date 2015.08.09
	 */
	/*public String update() throws Exception{
		System.out.println("roleId===="+roleId);
		sysUserService.update(sysUser,roleId, oldPassword);
		sysUser.setUserName(null);
		return list();
	}*/
	
	/**
	 * 保存用户个人修改的信息
	 * @param sysUser
	 * @param oldPassword
	 * @author 卢善坚
	 * @date 2015.09.25
	 */
	public String updateUserMessage(){
		sysUserService.updateUserMessage(sysUser, oldPassword);
		actionState = 1;
		return openMessage();
	}
	
	/**
	 * 删除用户
	 * @param sysUser 模型
 * @author 潘恒飞，卢善坚
	 * @Date 2015.08.09
	 */
	public String delete() throws Exception{
		sysUserService.delete(sysUser.getId(),sysUser.getUserId());
		return list();
	}
	
	/**
	 * 页面跳转
	 * @return
	 */
	public String openList(){
		
		return SUCCESS;
	}
	/**
	 * 打开添加用户页面
	 * @return
	 * @author 潘恒飞，卢善坚
	 * @Date 2015.08.09
	 */
	public String openAdd(){
		//查询出所有角色信息
//		roles = sysRoleService.getRoleAll();
		//获取所有省（直辖市）
		//comDistricts = comDistrictService.findComDistrictByUpid(0);
		forwardView = ADD_JSP;
		return SUCCESS;
	}
	public String openAdd1(){
		//查询出所有角色信息
//		roles = sysRoleService.getRoleAll();
		//获取所有省（直辖市）
		//comDistricts = comDistrictService.findComDistrictByUpid(0);
		forwardView = ADD1_JSP;
		return SUCCESS;
	}
	
	public String openSet(){
		//查询出所有角色信息
//		roles = sysRoleService.getRoleAll();
		//获取所有省（直辖市）
		//comDistricts = comDistrictService.findComDistrictByUpid(0);
		forwardView = SET_JSP;
		return SUCCESS;
	}
	
	public String openSet1(){
		//查询出所有角色信息
//		roles = sysRoleService.getRoleAll();
		//获取所有省（直辖市）
		//comDistricts = comDistrictService.findComDistrictByUpid(0);
		forwardView = SET1_JSP;
		return SUCCESS;
	}
	/**
	 * 打开修改信息页面
	 * @return
	 * @author 潘恒飞，卢善坚
	 * @Date 2015.08.09
	 */
	public String openEdit(){
		//查询角色的所有信息
		roles = sysRoleService.getRoleAll();
		//comDistricts = comDistrictService.findComDistrictByUpid(0);
		//根据用户编号查询用户角色
		userRoles = sysUserRoleService.findByUserId(sysUser.getUserId());
		
		
		//根据用户id查询用户信息
		sysUser = sysUserService.findById(sysUser.getId());
		/**
		if(null!=sysUser.getMerchantId()){
			//根据商家（单位）编号查询商家信息
			//sysMerchantUnit = sysMerchantUnitService.findById(sysUser.getMerchantId());
		}
		*/
		
		forwardView = EDIT_JSP;
		return SUCCESS;
	}
	/**
	 * 打开个人修改信息页面
	 * @return
	 */
	public String openMessage(){
		//根据用户id查询用户信息
		sysUser = sysUserService.findById(sysUser.getId());
		//根据用户编号查询用户角色
		userRoles = sysUserRoleService.findByUserId(sysUser.getUserId());
		forwardView = MESSAGE_JSP;
		return SUCCESS;
		
	}

	@Override
	public Object getModel() {
		
		return sysUser;
	}
	
	public SysUser getSysUser() {
		return sysUser;
	}

	public void setSysUser(SysUser sysUser) {
		this.sysUser = sysUser;
	}

	public Result<SysUser> getPageResult() {
		return pageResult;
	}

	public void setPageResult(Result<SysUser> pageResult) {
		this.pageResult = pageResult;
	}

	public List<SysRole> getRoles() {
		return roles;
	}

	public void setRoles(List<SysRole> roles) {
		this.roles = roles;
	}

	public String[] getRoleId() {
		return roleId;
	}

	public void setRoleId(String[] roleId) {
		this.roleId = roleId;
	}

	public List<SysUserRole> getUserRoles() {
		return userRoles;
	}

	public void setUserRoles(List<SysUserRole> userRoles) {
		this.userRoles = userRoles;
	}

	public String getOldPassword() {
		return oldPassword;
	}

	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}

	public int getActionState() {
		return actionState;
	}

	public void setActionState(int actionState) {
		this.actionState = actionState;
	}
	
}
