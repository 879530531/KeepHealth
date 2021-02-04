package com.gxuwz.KeepHealth.business.action.web.front;

import com.google.gson.Gson;
import com.gxuwz.KeepHealth.business.entity.TbPersonalData;
import com.gxuwz.KeepHealth.business.service.*;
import com.gxuwz.core.web.action.BaseAction;
import com.opensymphony.xwork2.Preparable;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.IOException;
import java.io.PrintWriter;

/**
 * <p>Title: 类名：（系统设置相关）使用Json数据表的形式，返回数据</p>
 * <p>Description:控制器/n</p>
 * @author:	梧州学院 软件开发中心  卢善坚，汪嘉惠  <a href=mailto:116861519@qq.com>庞光垚 </a>
 * @date:2015.07.31
 */
@SuppressWarnings({ "serial", "unchecked", "rawtypes" })
public class SysJsonAction extends BaseAction implements Preparable{

	private static final long serialVersionUID = -4104125263890869018L;
	
	@Autowired
	private SysRoleService sysRoleService;
	@Autowired
	private SysRightService sysRightService;
	@Autowired
	private SysUserService sysUserService;
	@Autowired
	private TbPersonalDataService tbPersonalDataService;
	@Autowired
	private TbTeacherService tbTeacherService;

	private SysUnitService sysUnitService;
	private String mobilePhone;//用户输入的要校验名字

	private String teacherPhone;
	
	private String checkName;//用户输入的要校验名字
	private TbPersonalData tbPersonalData1;
	private String unitCod;//用户输入的要校验公司编码
	private String rawPassword;
	public void prepare() throws Exception {
		if(null == tbPersonalData1){
			tbPersonalData1 = new TbPersonalData();
		}
		
	}
	/**
	 * 验证角色编号是否有重复
	 * @return
	 * @throws IOException
	 */
	public String checkRoleName() throws IOException{
		String check = sysRoleService.checkRoleName(checkName);
		Gson gson = new Gson();
		String json = gson.toJson(check);
		PrintWriter writer = getPrintWriter();
		writer.write(json);
		writer.flush();
		writer.close();
		return null;
	}

	/**
	 * 验证权限编号是否有重复
	 * @return
	 * @throws IOException
	 */
	public String checkRightName() throws IOException{
		String check = sysRightService.checkRightId(checkName);
		Gson gson = new Gson();
		String json = gson.toJson(check);
		PrintWriter writer = getPrintWriter();
		writer.write(json);
		writer.flush();
		writer.close();
		return null;
	}
	/**
	 * 检验用户编号是否存在
	 * @return
	 */
	public String checkUserName()throws IOException{
		System.out.println("====验证"+checkName);
		boolean result = sysUserService.checkUserId(checkName);
		Gson gson = new Gson();
		String json = gson.toJson(""+result);
		PrintWriter writer = getPrintWriter();
		writer.write(json);
		writer.flush();
		writer.close();
		return null;
	}
	
	/**
	 * 检验用户名是否存在
	 * @return
	 */
	public String checkUser()throws IOException{
		System.out.println("====验证"+checkName);
		boolean result = sysUserService.checkUserName(checkName);
		Gson gson = new Gson();
		String json = gson.toJson(""+result);
		PrintWriter writer = getPrintWriter();
		writer.write(json);
		writer.flush();
		writer.close();
		return null;
	}

	/**
	 * 检验用户输入密码是否正确
	 * @return
	 * @throws IOException
	 */
	public String checkUserPasswd()throws IOException{
		boolean result = sysUserService.checkPasswd(checkName, rawPassword);
		Gson gson = new Gson();
		String json = gson.toJson(""+result);
		PrintWriter writer = getPrintWriter();
		writer.write(json);
		writer.flush();
		writer.close();
		return null;
	}
	
	/**
	 * 检验用户手机是否存在
	 * @return
	 */
	public String checkMobilePhone()throws IOException{
		boolean result;
		tbPersonalData1 = (TbPersonalData) getRequest().getSession()
				.getAttribute("personaldata");
		if (tbPersonalData1 != null) {
			if (tbPersonalData1.getMobilePhone().equals(mobilePhone)) {
				result = false;
			} else {
				result = tbPersonalDataService.checkMobilePhone(mobilePhone);
			}
		} else {
			result = tbPersonalDataService.checkMobilePhone(mobilePhone);
		}
		Gson gson = new Gson();
		String json = gson.toJson("" + result);
		PrintWriter writer = getPrintWriter();
		writer.write(json);
		writer.flush();
		writer.close();
		return null;
	}
	
	/**
	 * 检验公司编码是否存在
	 * @return
	 */
	public String checkunitCod()throws IOException{
		System.out.println("====验证"+unitCod+checkName);
		boolean result = sysUnitService.checkunitCod(unitCod);
		Gson gson = new Gson();
		String json = gson.toJson(""+result);
		PrintWriter writer = getPrintWriter();
		writer.write(json);
		writer.flush();
		writer.close();
		return null;
	}

	/**
	 * @Author zuofengwei
	 * @Description 检查手机号码是否重复
	 * @Date 2019/5/9 17:02
	 * @param
	 * @return java.lang.String
	 **/
	public String checkTeacherPhone(){
		boolean result = false;
		result = tbTeacherService.checkTeacherPhone(teacherPhone);
		Gson gson = new Gson();
		String json = gson.toJson(""+result);
		PrintWriter writer = getPrintWriter();
		writer.write(json);
		writer.flush();
		writer.close();
		return null;
	}
	
	public String getCheckName() {
		return checkName;
	}
	public void setCheckName(String checkName) {
		this.checkName = checkName;
	}
	public String getRawPassword() {
		return rawPassword;
	}
	public void setRawPassword(String rawPassword) {
		this.rawPassword = rawPassword;
	}
	public String getMobilePhone() {
		return mobilePhone;
	}
	public void setMobilePhone(String mobilePhone) {
		this.mobilePhone = mobilePhone;
	}
	public String getUnitCod() {
		return unitCod;
	}
	public void setUnitCod(String unitCod) {
		this.unitCod = unitCod;
	}
	public TbPersonalData getTbPersonalData1() {
		return tbPersonalData1;
	}
	public void setTbPersonalData1(TbPersonalData tbPersonalData1) {
		this.tbPersonalData1 = tbPersonalData1;
	}

	public String getTeacherPhone() {
		return teacherPhone;
	}

	public void setTeacherPhone(String teacherPhone) {
		this.teacherPhone = teacherPhone;
	}
}
