package com.gxuwz.KeepHealth.business.action.web;

import com.gxuwz.KeepHealth.SystemContext;
import com.gxuwz.KeepHealth.business.entity.TbConsumer;
import com.gxuwz.KeepHealth.business.entity.TbTeacher;
import com.gxuwz.KeepHealth.business.service.TbConsultationRecordService;
import com.gxuwz.KeepHealth.business.service.TbTeacherService;
import com.gxuwz.core.pagination.Result;
import com.gxuwz.core.web.action.BaseAction;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.util.List;

/**
 * 与咨询老师相关的控制器
 * 
 * @author 叶城廷
 * @version 2019.03.01
 */
public class TbTeacherAction extends BaseAction implements Preparable, ModelDriven {
	protected static final String LOGIN_JSP = "/weixin/TeacherLogin.jsp";

	 protected static final String HOME_JSP = "/weixin/Teacher_home.jsp";
	 

	private static final long serialVersionUID = 1L;
	protected static final String LIST_JSP = "/WEB-INF/page/web/health_consult_teacher/Teacher_list.jsp";
	protected static final String ADD_JSP = "/WEB-INF/page/web/health_consult_teacher/Teacher_add.jsp";
	protected static final String EDIT_JSP = "/WEB-INF/page/web/health_consult_teacher/Teacher_edit.jsp";

	protected static final String CHANGEPASSW_JSP = "/weixin/Change_teacherPwd.jsp";
	protected static final String SAVEOK_JSP = "/weixin/SaveOK.jsp";
	
	protected static final String WXTEACHERLIST_JSP = "/weixin/ConsultingTeacherList.jsp";
	protected static final String WXTEACHER_JSP = "/weixin/ConsultationRecord_add.jsp";
	protected static final String smym_JSP = "/weixin/smym.jsp";

	private File[] upload;
	private String[] uploadFileName;
	private String[] uploadContentType;
	private int teacherId;

	public int getTeacherId() {
		return teacherId;
	}

	public void setTeacherId(int teacherId) {
		this.teacherId = teacherId;
	}

	@Autowired
	private TbTeacherService tbTeacherService;
	private TbConsultationRecordService tbConsultationRecordService;
	private TbTeacher tbTeacher;
	private TbConsumer tbConsumer;
	// 微信唯一码
	private String openId;
	// 反馈信息字符串
	private String result;
	private List<TbTeacher> teacherList;
	// private TbConsultationRecord tbConsultationRecord;
	private String teacherPasswork;

	private Result<TbTeacher> pageResult;// 分页
	private String oldPassword;
	private String tbTeacherList;
	private String teacherPhone;
	int yhf_number = 0;// 已回复记录条数
	int whf_number = 0;// 未回复记录条数
	int yds_number = 0;// 已打赏记录条数
	int wds_number = 0;// 未打赏记录条数
	private String resetTeacher;
	

	// 综合查询内容
	private String queryText;

	@Override
	public Object getModel() {

		return null;
	}

	@Override
	public void prepare() throws Exception {

		if (null == tbTeacher) {

			tbTeacher = new TbTeacher();
		}

	}

	/**
	 * 由助念机调至打赏求方
	 * @author 叶城廷
	 * @version 2019.04.05
	 */
	public  String forwardRewardFormula(){
		teacherList = tbTeacherService.queryTeacher();
		//System.out.println("查询完毕："+list);
		setForwardView(WXTEACHERLIST_JSP);
		return  SUCCESS;
	}

	/**
	 * 列表查看
	 * 
	 * @author 陈紫丽
	 * @data 2019.03.04
	 * @return
	 * @throws Exception
	 */
	public String openList() throws Exception {
		// System.out.println("11111111111");
		pageResult = tbTeacherService.find("", getPage(), getRow());
		setForwardView(LIST_JSP);
		return SUCCESS;
	}

	public String queryList() throws Exception {
		// System.out.println("11112");
		pageResult = tbTeacherService.queryTeacherList(queryText, getPage(), getRow());
		setForwardView(LIST_JSP);
		return SUCCESS;
	}

	public String openAdd() {
		forwardView = ADD_JSP;
		return SUCCESS;
	}

	/**
	 * 打开咨询老师修改信息页面
	 * 
	 * @return
	 * @author 陈紫丽
	 * @Date 2019.03.04
	 */
	public String openEditWeb() {
		// 根据个人teacherId查询用户信息
		// System.out.println("t");
		tbTeacher = tbTeacherService.findByTeacherIdWeb(tbTeacher.getTeacherId());
		// System.out.println("22222");
		setForwardView(EDIT_JSP);

		return SUCCESS;
	}
	/**
	 * 打开未开发页面
	 * 
	 * @return
	 * @author 陈紫丽
	 * @Date 2019.04.27
	 */
	public String openwkf() {
		// 根据个人teacherId查询用户信息
		// System.out.println("t");
		//tbTeacher = tbTeacherService.findByTeacherIdWeb(tbTeacher.getTeacherId());
		// System.out.println("22222");
		setForwardView(smym_JSP);

		return SUCCESS;
	}

	/**
	 * 添加老师
	 * 
	 * @return
	 * @throws Exception
	 * @author 陈紫丽
	 * @date 2019.03.04
	 */
	public String addWeb() throws Exception {
		//
		boolean result = tbTeacherService.checkTeacherPhone(tbTeacher.getTeacherPhone());
		// System.out.println(result+tbPersonalData.getMobilePhone());
		if (!result) {
			// 设置默认密码
			tbTeacher.setTeacherPasswork("0774123");
			int minTopId = tbTeacherService.getMinNumber() - 1;
			tbTeacher.setTopId(minTopId);
			tbTeacher.setIsDelete(0);

			// 添加导师 导师简介暂定80字
			tbTeacherService.addWeb(tbTeacher, upload, uploadFileName, uploadContentType);

			tbTeacher.setTeacherSex(null);
			tbTeacher.setTeacherPhone(null);

			return openList();
		} else {
			return openAdd();
		}

	}

	/**
	 * 保存修改的用户信息
	 * 
	 * @retur7
	 * @throws Exception
	 * @author 陈紫丽->左丰维
	 * @Date 2019.03.10 ->5.9
	 */
	public String updateWeb() throws Exception {

		//相同的电话号码
		TbTeacher tb = tbTeacherService.queryTeacher(tbTeacher);
		//同一个对象或者不存在相同电话号码
		if((tb != null && tb.getTeacherId().equals(tbTeacher.getTeacherId())) || tb == null) {
			tbTeacher.setIsDelete(0);
			tbTeacher.setTopId(tbTeacherService.getTopId(tbTeacher.getTeacherId()));
			tbTeacherService.updateWeb(tbTeacher, upload, uploadFileName, uploadContentType);
			return openList();
		}
		else {
			return openEditWeb();
		}
	}

	/**
	 * 重置老师密码
	 * 
	 * @author 陈紫丽
	 * @throws Exception
	 * @Date 2019.03.10
	 */
	public String changePwd() throws Exception {
		// System.out.println(tbTeacher.getTeacherId());
		tbTeacherService.changePwd(teacherId);

		tbTeacher = tbTeacherService.findByTeacherIdWeb(teacherId);

		tbTeacher.setTeacherId(null);
		tbTeacher.setTeacherName(null);
		tbTeacher.setTeacherPhone(null);
		getRequest().setAttribute("tip", "fail");
		return openList();

	}
	
	/**
	 * 删除老师
     * @author 陈紫丽
	 * @Date 2019.05.6
	 */
	public String delete() throws Exception{
		tbTeacherService.delete(teacherId);
//		System.out.println(222);

//		
		return openList();
	}
	/**
	 * 跳转至微信老师登录页面
	 * 
	 * @author 叶城廷
	 * @version 2019.03.09
	 * @return
	 */
	public String teacherLogin() {
		setForwardView(LOGIN_JSP);
		return SUCCESS;
	}
	/**
	 * 跳转至微信老师首页页面
	 * 
	 * @author 陈紫丽
	 * @version 2019.04.15
	 * @return
	 */
	public String openhome() {
		TbTeacher teacher = (TbTeacher) getSession().getAttribute("teacher");//从session中查出老师信息
		yhf_number = tbConsultationRecordService.findYhf(teacher.getTeacherId()).size();// 统计已回复记录条数
		
		whf_number = tbConsultationRecordService.findWhf(teacher.getTeacherId()).size();// 统计未回复回复记录条数
		yds_number = tbConsultationRecordService.findYds(teacher.getTeacherId()).size();// 统计已打赏记录条数
		wds_number = tbConsultationRecordService.findWds(teacher.getTeacherId()).size();// 统计未打赏记录条数

		getRequest().setAttribute("yhf_number", yhf_number);// 将数据通过request传到前台
		getRequest().setAttribute("whf_number", whf_number);
		getRequest().setAttribute("yds_number", yds_number);
		getRequest().setAttribute("wds_number", wds_number);
		setForwardView(HOME_JSP);
		
		return SUCCESS;
	}
	
	/**
	 * 老师登录检查(及已回复、未回复、已打赏、未打赏记录条数)
	 * 
	 * @author 陈紫丽
	 * @version 2019.3.20
	 * @return
	 */
	public String login() throws ParseException,
	UnsupportedEncodingException {
		HttpServletRequest request = ServletActionContext.getRequest();
		// 检查用户名teacherPhone
		// System.out.println(tbTeacher.getTeacherPhone()+"sss");
		TbTeacher teacher = tbTeacherService.queryTeacher(tbTeacher);

		// teacher.getTeacherName();
		boolean flag = false;
		// 验证成功(校验加密密码）
		// System.out.println(tbTeacher.getTeacherPhone());
		if (teacher != null
				&& SystemContext.passwdDecryption(tbTeacher.getTeacherPasswork(), teacher.getTeacherPasswork())) {
			// System.out.println(12);
			// 判断是否首次登录,如首次登录执行微信唯一码补全 openId为空
			tbConsumer = (TbConsumer) getSession().getAttribute("currentConsumer");
			// System.out.println("tbConsumer:----"+tbConsumer);
			flag = tbTeacherService.queryFirstLogin(teacher, tbConsumer);
			if (flag) {
				// System.out.println("ddd"+teacher.getTeacherName());
				yhf_number = tbConsultationRecordService.findYhf(teacher.getTeacherId()).size();// 统计已回复记录条数
				// System.out.println(yhf_number);
				whf_number = tbConsultationRecordService.findWhf(teacher.getTeacherId()).size();// 统计未回复回复记录条数
				yds_number = tbConsultationRecordService.findYds(teacher.getTeacherId()).size();// 统计已打赏记录条数
				wds_number = tbConsultationRecordService.findWds(teacher.getTeacherId()).size();// 统计未打赏记录条数

				getRequest().setAttribute("yhf_number", yhf_number);// 将数据通过request传到前台

				getRequest().setAttribute("whf_number", whf_number);
				getRequest().setAttribute("yds_number", yds_number);
				getRequest().setAttribute("wds_number", wds_number);
				// 登录后将teacher信息放置于session会话
				getSession().setAttribute("teacher", teacher);
				System.out.println(getTeacherId());
				// 从浏览器渠道登录
				setForwardView(HOME_JSP);
			} else {
				
			//	request.setAttribute("fail", "fail1");
				resetTeacher = tbTeacher.getTeacherPhone();
				setForwardView(LOGIN_JSP);
				getRequest().setAttribute("f","t");
				//result = "fail-error";
			}
		} else {
			//getRequest().setAttribute("fail", "fail1");
			//request.setAttribute("fail", "fail1");
			resetTeacher = tbTeacher.getTeacherPhone();
			setForwardView(LOGIN_JSP);
			getRequest().setAttribute("f","t");
			//result = "fail";

		}
		// HttpServletRequest object =
		// ServletActionContext.getRequest();//.getContext().get("request");
		// object.setAttribute("flag", flag);
		return SUCCESS;
	}
public String jumpHome(){
	TbTeacher attribute = (TbTeacher) getSession().getAttribute("teacher");
	TbTeacher teacher = tbTeacherService.queryTeacher(attribute);
	// System.out.println("ddd"+teacher.getTeacherName());
	yhf_number = tbConsultationRecordService.findYhf(teacher.getTeacherId()).size();// 统计已回复记录条数
	// System.out.println(yhf_number);
	whf_number = tbConsultationRecordService.findWhf(teacher.getTeacherId()).size();// 统计未回复回复记录条数
	yds_number = tbConsultationRecordService.findYds(teacher.getTeacherId()).size();// 统计已打赏记录条数
	wds_number = tbConsultationRecordService.findWds(teacher.getTeacherId()).size();// 统计未打赏记录条数

	getRequest().setAttribute("yhf_number", yhf_number);// 将数据通过request传到前台

	getRequest().setAttribute("whf_number", whf_number);
	getRequest().setAttribute("yds_number", yds_number);
	getRequest().setAttribute("wds_number", wds_number);
	// 登录后将teacher信息放置于session会话

	System.out.println(getTeacherId());
	// 从浏览器渠道登录
	setForwardView(HOME_JSP);
	return SUCCESS;
}
	/**
	 * 打开老师修改密码页面
	 * 
	 * @return
	 * @throws Exception
	 * @author 陈紫丽
	 * @throws ParseException
	 * @throws UnsupportedEncodingException
	 * @Date 2019.03.30
	 */
	public String OpenTeacherData() throws ParseException, UnsupportedEncodingException {
		setForwardView(CHANGEPASSW_JSP);
		return SUCCESS;
	}

	/**
	 * 修改老师个人密码
	 * 
	 * @return
	 * @throws Exception
	 * @author 陈紫丽
	 * @Date 2019.03.30
	 */
	public String changePassword() throws Exception {
		// TbTeacher Teacher1=(TbTeacher)
		// ServletActionContext.getRequest().getSession().getAttribute("teacher");
		// teacherId = Teacher1.getTeacherId();
		tbTeacher = (TbTeacher) getSession().getAttribute("teacher");

		// System.out.println(getTeacherId());
		// 获取保存在session里的用户id。
		int passwordtype;// 修改状态。若等于1，则修改失败，等于其他则修改成功
		passwordtype = tbTeacherService.updatePassword(tbTeacher, oldPassword, teacherPasswork);
		System.out.println("-----" + oldPassword);
		if (passwordtype == 1) {
			setForwardView(CHANGEPASSW_JSP);
			 getRequest().setAttribute("ti","no");
		} else {
			// //修改成功后清除cookie和session并退出到登录界面。
			// HttpServletRequest request =ServletActionContext.getRequest();
			// HttpServletResponse response1=ServletActionContext.getResponse();
			// //清除所有session
			// HttpSession session = request.getSession();
			// Enumeration ee=session.getAttributeNames();
			// while(ee.hasMoreElements()){ String
			// sessionName=(String)ee.nextElement();
			// //System.out.println("存在的session有："+sessionName);
			getSession().removeAttribute("teacher"); // }
			// 删除cookie里的数据
			//
			// Cookie deleteCookie = new Cookie("username",null);
			// deleteCookie.setMaxAge(0);
			// deleteCookie.setPath("/");
			// response1.addCookie(deleteCookie);
			//
			// Cookie deleteCookie1 = new Cookie("password",null);
			// deleteCookie1.setMaxAge(0);
			// deleteCookie1.setPath("/");
			// response1.addCookie(deleteCookie1);
			//
			setForwardView(SAVEOK_JSP);
		}

		return SUCCESS;
	}

	// 获得咨询老师列表

	/**
	 * 获得咨询老师列表(微信页面)
	 * 
	 * @author 左丰维
	 * @version 2019.3.20
	 * @return
	 */

	public String queryTeacherList() {
		teacherList = tbTeacherService.queryTeacher();
		// System.out.println("查询完毕："+teacherList);
		setForwardView(WXTEACHERLIST_JSP);
		return SUCCESS;
	}

	/**
	 * 通过老师id获得咨询老师(微信页面)
	 * 
	 * @author 左丰维
	 * @version 2019.3.20
	 * @return
	 */
	public String queryTeacher() {

		tbTeacher = tbTeacherService.findByTeacherIdWeb(teacherId);

		setForwardView(WXTEACHER_JSP);
		return SUCCESS;

	}


	/**
	 * @Author zuofengwei
	 * @Description 后台操作-置顶老师
	 * @Date 2019/5/9 15:24
	 * @param
	 * @return java.lang.String
	 **/
	public String isTop() throws Exception {

		tbTeacher = tbTeacherService.findByTeacherIdWeb(tbTeacher.getTeacherId());
		int currMaxNum = tbTeacherService.getMaxNumber()+1;

		tbTeacherService.updateTopId(tbTeacher,currMaxNum);
		return openList();
	}

	public String clearOpenId() throws Exception {

		System.out.println(tbTeacher.getTeacherId());
		tbTeacher = tbTeacherService.findByTeacherIdWeb(tbTeacher.getTeacherId());
		tbTeacher.setOpenId(null);
		tbTeacherService.updateTeacher(tbTeacher);
		return openList();
	}

	public String getResetTeacher() {
		return resetTeacher;
	}

	public void setResetTeacher(String resetTeacher) {
		this.resetTeacher = resetTeacher;
	}

	public String getTeacherPhone() {
		return teacherPhone;
	}

	public void setTeacherPhone(String teacherPhone) {
		this.teacherPhone = teacherPhone;
	}

	public TbTeacherService getTbTeacherService() {
		return tbTeacherService;
	}

	public void setTbTeacherService(TbTeacherService tbTeacherService) {
		this.tbTeacherService = tbTeacherService;
	}

	public TbTeacher getTbTeacher() {
		return tbTeacher;
	}

	public void setTbTeacher(TbTeacher tbTeacher) {
		this.tbTeacher = tbTeacher;
	}

	public Result<TbTeacher> getPageResult() {
		return pageResult;
	}

	public void setPageResult(Result<TbTeacher> pageResult) {
		this.pageResult = pageResult;
	}

	public File[] getUpload() {
		return upload;
	}

	public void setUpload(File[] upload) {
		this.upload = upload;
	}

	public String[] getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String[] uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public String[] getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(String[] uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public String getOldPassword() {
		return oldPassword;
	}

	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}

	public String getQueryText() {
		return queryText;
	}

	public void setQueryText(String queryText) {
		this.queryText = queryText;
	}

	public String getTbTeacherList() {
		return tbTeacherList;
	}

	public void setTbTeacherList(String tbTeacherList) {
		this.tbTeacherList = tbTeacherList;
	}

	public String getOpenId() {
		return openId;
	}

	public void setOpenId(String openId) {
		this.openId = openId;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public List<TbTeacher> getTeacherList() {
		return teacherList;
	}

	public void setTeacherList(List<TbTeacher> teacherList) {
		this.teacherList = teacherList;
	}

	public TbConsultationRecordService getTbConsultationRecordService() {
		return tbConsultationRecordService;
	}

	public void setTbConsultationRecordService(TbConsultationRecordService tbConsultationRecordService) {
		this.tbConsultationRecordService = tbConsultationRecordService;
	}

	public TbConsumer getTbConsumer() {
		return tbConsumer;
	}

	public void setTbConsumer(TbConsumer tbConsumer) {
		this.tbConsumer = tbConsumer;
	}

	public String getTeacherPasswork() {
		return teacherPasswork;
	}

	public void setTeacherPasswork(String teacherPasswork) {
		this.teacherPasswork = teacherPasswork;
	}

	

}
