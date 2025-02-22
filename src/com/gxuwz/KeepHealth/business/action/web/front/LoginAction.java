package com.gxuwz.KeepHealth.business.action.web.front;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.gxuwz.KeepHealth.business.entity.SysLoginRecord;
import com.gxuwz.KeepHealth.business.entity.SysUser;
import com.gxuwz.KeepHealth.business.service.SysLoginRecordService;
import com.gxuwz.KeepHealth.business.service.SysUserService;
import com.gxuwz.core.web.action.BaseAction;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

/**
 * <p>Title: 类名：用户-业务逻辑--实现</p>
 * <p>Description:mailsender-业务逻辑/n</p>
 * @author:	梧州学院 软件开发中心  庞光垚  <a href=mailto:116861519@qq.com>庞光垚 </a>
 * @date:2015.07.31
 */
@SuppressWarnings({ "serial", "unchecked", "rawtypes" })
public class LoginAction extends BaseAction implements Preparable, ModelDriven {

	private static final long serialVersionUID = -4104125263890869018L;
	protected static final String LOGIN_JSP = "/login.jsp";
	protected static final String MAIN_JSP = "/WEB-INF/page/main.jsp";
	protected static final String TOP_JSP = "/WEB-INF/page/top.jsp";
	protected static final String LEFT_JSP = "/WEB-INF/page/left.jsp";
	protected static final String INDEX_JSP = "/WEB-INF/page/index.jsp";
	
	@Autowired
	private SysUserService sysUserService;
	@Autowired
	private SysLoginRecordService sysLoginRecordService;
	
	private SysUser sysUser;
	private SysLoginRecord sysLoginRecord;
	private List<String> listRight;
	
	public void prepare() throws Exception {
		if(null == sysUser){
			sysUser = new SysUser();
		}
		if(null == sysLoginRecord){
			sysLoginRecord = new SysLoginRecord();
		}
	}
	
	/**
	 * PC系统管理=登录验证
	 * @return
	 */
	public String webLogin(){
		HttpServletRequest request =ServletActionContext.getRequest();
		//isLogin初始为false,还有打开isLogin方法
		boolean isLogin = false;
		int isUserType = 0;
		isLogin = sysUserService.isLogin(sysUser);
		String ip = ServletActionContext.getRequest().getRemoteAddr(); //获取用户登录IP
		//获取当前系统时间
		Date date=new Date();
		DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = format.format(date); 
		Timestamp loginTime = Timestamp.valueOf(time);//把String 类型转换成 Timestamp 类型
		
		//根据用户编号或者用户名，读取用户对象
		sysUser = sysUserService.findByName(sysUser.getUserName());
		//System.out.println(sysUser.getUserType());
		//判断用户类型
		if(null != sysUser){
		if(2 == sysUser.getUserType() || sysUser.getUserType() == 3){
			isUserType = 1;
		}}
		if(1 == isUserType && isLogin){//登录成功
			
			//获取用户名，并把用户名存入session
			String userName = sysUser.getUserName();
			getRequest().getSession().setAttribute("userName",userName );
			getRequest().getSession().setAttribute("user",sysUser );
			//将用户登录信息放到用户登录记录对象中
			sysLoginRecord.setOperateContent("登录成功");
			//operateType表示日志类型：1表示登录，2表示导出二维码
			sysLoginRecord.setOperateType(1);
			sysLoginRecord.setLoginIp(ip);
			sysLoginRecord.setUserId(sysUser.getUserId());
			sysLoginRecord.setUserName(sysUser.getUserName());
			sysLoginRecord.setLoginTime(loginTime);
			//将用户登录记录存放到用户登录记录表中
			sysLoginRecordService.add(sysLoginRecord);

			
			//查询用户对应的权限（用户->角色->权限）
			listRight=sysUserService.findUserPermissions(sysUser.getUserId());
			//把用户权限放到session当中
			ActionContext.getContext().getSession().put("listRight", listRight);
		    
			/**
			//这个看起来很多余：主要是因为jsp界面没有判断null，为了省事，直接在这里判断。2015-11-30，庞光垚
			if(null == sysUser.getTourProductProvince()){
				sysUser.setTourProductProvince("");
			}
			if(null == sysUser.getTourProductCity()){
				sysUser.setTourProductCity("");
			}
			*/
			
			//把用户对象放到session当中
			ActionContext.getContext().getSession().put("sysUser", sysUser);
			forwardView = MAIN_JSP;
		}else {
			if(null != sysUser){   //如果用户对象不为空，为密码错误，否则用户名称不存在
				//将用户登录信息放到用户登录记录对象中
				sysLoginRecord.setOperateContent("密码错误，登录失败");
				request.setAttribute("fail","fail1");
				//operateType表示日志类型：1表示登录，2表示导出二维码
				sysLoginRecord.setOperateType(1);
				sysLoginRecord.setLoginIp(ip);
				sysLoginRecord.setUserId(sysUser.getUserId());
				sysLoginRecord.setUserName(sysUser.getUserName());
				sysLoginRecord.setLoginTime(loginTime);
				//将用户登录记录存放到用户登录记录表中
				sysLoginRecordService.add(sysLoginRecord);
				setForwardView (LOGIN_JSP);
				return SUCCESS;
			}else{
				request.setAttribute("fail","fail1");
				System.out.println("用户不存在，登录失败");
				setForwardView (LOGIN_JSP);
				return SUCCESS;
			}
		}
		return SUCCESS;
	}
	
	/**
	 * 登录-顶部跳转
	 * @return
	 */
	public String openTop(){
		forwardView = TOP_JSP;
		return SUCCESS;
	}
	
	/**
	 * 登录-顶部跳转
	 * @return
	 */
	public String openLeft(){
		forwardView = LEFT_JSP;
		return SUCCESS;
	}
	
	/**
	 * 登录-顶部跳转
	 * @return
	 */
	public String openIndex(){
		forwardView = INDEX_JSP;
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
	
}
