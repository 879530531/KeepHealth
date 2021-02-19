package com.gxuwz.KeepHealth.business.action.web;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.gxuwz.KeepHealth.SystemContext;
import com.gxuwz.KeepHealth.business.dao.TbPersonalDataDAO;
import com.gxuwz.KeepHealth.business.entity.SysRole;
import com.gxuwz.KeepHealth.business.entity.SysUnit;
import com.gxuwz.KeepHealth.business.entity.SysUser;
import com.gxuwz.KeepHealth.business.entity.SysUserRole;
import com.gxuwz.KeepHealth.business.entity.TbPersonalData;
import com.gxuwz.KeepHealth.business.service.SysRoleService;
import com.gxuwz.KeepHealth.business.service.SysUserRoleService;
import com.gxuwz.KeepHealth.business.service.SysUserService;
import com.gxuwz.KeepHealth.business.service.TbPersonalDataService;
import com.gxuwz.KeepHealth.business.service.SysUnitService;
import com.gxuwz.core.pagination.Result;
import com.gxuwz.core.web.action.BaseAction;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
/**
 * 
 * @author <a href=mailto:amu_1115@126.com> amu </a>
 * @version $ DepartmentAction.java 2015-7-27 下午05:11:18
 */
public class SysUserAction extends BaseAction implements Preparable, ModelDriven{

	private static final long serialVersionUID = -4104125263890869018L;
	protected static final String LIST_JSP = "/WEB-INF/page/web/SysUser_list.jsp";
	protected static final String ADD_JSP = "/WEB-INF/page/web/SysUser_add.jsp";
	protected static final String EDIT_JSP = "/WEB-INF/page/web/SysUser_edit.jsp";
	protected static final String MESSAGE_JSP = "/WEB-INF/page/web/userMessage.jsp";
	
	@Autowired
	private SysUserService sysUserService;
	@Autowired
	private SysRoleService sysRoleService;
	@Autowired
	private SysUserRoleService sysUserRoleService;
	@Autowired
	private SysUnitService sysUnitService;
	@Autowired
	private TbPersonalDataDAO tbPersonalDataDAO;
	@Autowired
	private TbPersonalDataService tbPersonalDataService;
	
	private SysUserRole sysUserRole; //用户角色模型
	private String[] roleId;
	private SysUser sysUser;//用户模型
	private Result<SysUser> pageResult;//分页
	private List<SysRole> roles; //角色
	private List<SysUserRole> userRoles;//接收用户角色列表
	private String oldPassword;
	private int userTypee;//用户原来的密码
	private int actionState;//操作状态。1-操作成功（保存成功）
	private String city;
	private String province;
	private String county;
	private String area=null;
	private List<SysUnit> sysUnitList;
	private String tib;
	private String telephone;
	private String userN;
	
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
			pageResult = sysUserService.find(sysUser, getPage(), getRow());
			setForwardView(LIST_JSP);
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
		boolean result1 = sysUserService.checkUserName(sysUser.getUserName());
		if(!result1){
		//System.out.println("roleId1===="+roleId);
		if(!"省份".equals(province)&&!"地级市".equals(city)&&!"市，县级市".equals(county)){
		 area=province+city+county;
		}
		
		Date date1 = new Date(System.currentTimeMillis());
		//设置日期格式
	SimpleDateFormat format1 =  new SimpleDateFormat("yyyyMMddHHmmss");  
	String time1 = format1.format(date1); 
	sysUser.setUserId(time1);
	//System.out.println("userID"+sysUser.getUserId());
		
		if(sysUser.getUserType() == 2){
			boolean result = tbPersonalDataService.checkMobilePhone(sysUser.getUserTelephone());
			if(!result){
			TbPersonalData tbPersonalData = new TbPersonalData();
			tbPersonalData.setFlagType(1);
			
			Date date = new Date(System.currentTimeMillis());
			//设置日期格式
		    SimpleDateFormat format =  new SimpleDateFormat("yyyyMMddHHmmss");  
		    String time = format.format(date);     
		    
			//查询数据库中最大个人编号，并转换为字符串
			String maxNumber = String.valueOf(tbPersonalDataDAO.findMaxPersonalNumber());
			//System.out.println("maxNumber"+maxNumber);
			
			
			if("[null]".equals(maxNumber)){
				maxNumber = null;
				int a = 10001;
				String number = String.valueOf(a);
				String newName = time+tbPersonalData.getFlagType()+number;
				//System.out.println("newName"+newName);
				tbPersonalData.setPersonalNumber(newName);
			}
			
			else{
				//截取序号，并将其转换成int类型
				String numberString = maxNumber.substring(16, maxNumber.length()-1);
				//System.out.println("numberString"+numberString);
				int a = Integer.valueOf(numberString)+1;
				//System.out.println("a"+a);
				String number = String.valueOf(a);
				String newName = time+tbPersonalData.getFlagType()+number;
				//System.out.println("newName"+newName);
				
				if(20 == newName.length()){
					tbPersonalData.setPersonalNumber(newName);
					sysUser.setUserId(newName);
				}
			}
			tbPersonalData.setImage("default_img.png");
			tbPersonalData.setName(sysUser.getUserRealName());
			tbPersonalData.setSex(sysUser.getUserSex());
			tbPersonalData.setMobilePhone(sysUser.getUserTelephone());
			tbPersonalData.setPassword(sysUser.getUserPassword());
			tbPersonalData.setRealName(sysUser.getUserRealName());
			tbPersonalData.setLevel(0);
			tbPersonalData.setQq(sysUser.getUserQq());
			tbPersonalData.setEmail(sysUser.getUserEmail());
			tbPersonalData.setAddress(sysUser.getUserAddress());
			tbPersonalDataService.add(tbPersonalData);
			sysUser.setUserName(sysUser.getUserTelephone());
			}else{
				tib="have";
				setForwardView(ADD_JSP);
				return SUCCESS;
			}
		}
	    sysUser.setUserAddress(area);
		sysUserService.add(sysUser,roleId);
		sysUser.setUserName(null);
		return list();
		}else{
			tib="have1";
			setForwardView(ADD_JSP);
			return SUCCESS;
		}
 }
	/**
	 * 保存修改的用户信息
	 * @return
	 * @throws Exception
	 * @author 潘恒飞，卢善坚
	 * @Date 2015.08.09
	 */
	public String update() throws Exception{
		boolean result1;
		if(userN.equals(sysUser.getUserName())){
			result1=false;
		}else{
	     result1 = sysUserService.checkUserName(sysUser.getUserName());
		}
		if(!result1){
		//System.out.println("roleId===="+roleId);
		if(!"省份".equals(province)&&!"地级市".equals(city)&&!"市，县级市".equals(county)){
			 area=province+city+county;
			}
		sysUser.setUserAddress(area);
		
		if(sysUser.getUserType() == 2){
			boolean result;
			if(telephone.equals(sysUser.getUserTelephone())){
				result=false;
			}else{
		     result = tbPersonalDataService.checkMobilePhone(sysUser.getUserTelephone());
			}
			if(!result){
			//System.out.println(sysUser.getUserId());
			TbPersonalData tbPersonalData = tbPersonalDataService.findByPersonalNameWeb(sysUser.getUserId());
			
			tbPersonalData.setMobilePhone(sysUser.getUserTelephone());
			tbPersonalData.setPassword(SystemContext.passwdEncryption(sysUser.getUserPassword()));
			tbPersonalData.setRealName(sysUser.getUserRealName());
			tbPersonalData.setSex(sysUser.getUserSex());
			tbPersonalData.setQq(sysUser.getUserQq());
			tbPersonalData.setEmail(sysUser.getUserEmail());
			tbPersonalData.setAddress(sysUser.getUserAddress());
			
			tbPersonalDataDAO.update(tbPersonalData);
			sysUser.setUserName(sysUser.getUserTelephone());
			}else{
				tib="have";
				return openEdit();
			}
		}
		
		sysUserService.update(sysUser,roleId, getOldPassword());
		sysUser.setUserName(null);
		return list();
		}else{
			tib="have1";
			return openEdit();
		}
	}
	
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
		roles = sysRoleService.getRoleAll();
		//获取所有省（直辖市）
		//comDistricts = comDistrictService.findComDistrictByUpid(0);
		sysUnitList=sysUnitService.getUnitAll();
		forwardView = ADD_JSP;
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
		sysUnitList=sysUnitService.getUnitAll();
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

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public List<SysUnit> getSysUnitList() {
		return sysUnitList;
	}

	public void setSysUnitList(List<SysUnit> sysUnitList) {
		this.sysUnitList = sysUnitList;
	}

	public String getCounty() {
		return county;
	}

	public void setCounty(String county) {
		this.county = county;
	}

	public int getUserTypee() {
		return userTypee;
	}

	public void setUserTypee(int userTypee) {
		this.userTypee = userTypee;
	}

	public String getTib() {
		return tib;
	}

	public void setTib(String tib) {
		this.tib = tib;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getUserN() {
		return userN;
	}

	public void setUserN(String userN) {
		this.userN = userN;
	}






	
}
