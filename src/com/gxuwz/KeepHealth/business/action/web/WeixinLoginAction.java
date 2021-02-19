package com.gxuwz.KeepHealth.business.action.web;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import util.MyTime;

import com.gxuwz.KeepHealth.business.entity.Content;
import com.gxuwz.KeepHealth.business.entity.FatherHealth;
import com.gxuwz.KeepHealth.business.entity.MyAppointment;
import com.gxuwz.KeepHealth.business.entity.ReferData;
import com.gxuwz.KeepHealth.business.entity.SysLoginRecord;
import com.gxuwz.KeepHealth.business.entity.TbAdvice;
import com.gxuwz.KeepHealth.business.entity.TbFeedback;
import com.gxuwz.KeepHealth.business.entity.TbPersonalData;
import com.gxuwz.KeepHealth.business.entity.TbReadme;
import com.gxuwz.KeepHealth.business.entity.ThroughFeedback;
import com.gxuwz.KeepHealth.business.service.ContentService;
import com.gxuwz.KeepHealth.business.service.PersonalDataDetailService;
import com.gxuwz.KeepHealth.business.service.SysLoginRecordService;
import com.gxuwz.KeepHealth.business.service.SysUserService;
import com.gxuwz.KeepHealth.business.service.TbAdviceService;
import com.gxuwz.KeepHealth.business.service.TbFeedbackService;
import com.gxuwz.KeepHealth.business.service.TbPersonalDataService;
import com.gxuwz.KeepHealth.business.service.TbReadmeService;
import com.gxuwz.KeepHealth.business.service.WxLoginService;
import com.gxuwz.core.pagination.Result;
import com.gxuwz.core.web.action.BaseAction;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

/**
 * 微信登录控制器
 * @author  梧州学院 软件研发中心 莫然源
 * <br>Copyright (C), 2017, 梧州学院 软件研发中心
 * <br>This program is protected by copyright laws.
 * <br>Program Name: TbReadmeAction
 * <br>Date: 2017-03-01
 */

public class WeixinLoginAction extends BaseAction implements Preparable, ModelDriven {

	private static final long serialVersionUID = -4104125263890869018L;
	protected static final String LOGIN_JSP = "/weixin/MemberLogin.jsp";
	protected static final String MAIN_JSP = "/weixin/Member_home.jsp";
    protected static final String REG_JSP = "/weixin/Register.jsp";
	protected static final String MC_JSP = "/weixin/Mentor_center.jsp";
	protected static final String MCHome_JSP = "/weixin/Mentor_home.jsp";
	protected static final String EXIT_JSP = "/weixin/Login_out.jsp";
	protected static final String TEST_JSP = "/weixin/test.jsp";
	protected static final String MENTORDATA_JSP = "/weixin/Mentor_data.jsp";
	protected static final String NEWS_JSP = "/weixin/news.jsp";

	private Content con;//新闻信息模型
	private String content;  //新闻编辑内容
	private Result<Content> contentList;//新闻信息集合
	@Autowired
	private SysUserService userService;//Web端用户信息处理接口
	
	@Autowired
	private ContentService contentService;//新闻信息处理接口
	@Autowired
	private ContentService orService;	//用户信息处理接口
	@Autowired
	private WxLoginService wxLoginService;//微信登录接口
	@Autowired
	private TbAdviceService tbAdviceService;//调理建议接口
	private TbPersonalData tbPersonalData;//用户信息模型
	private List<TbPersonalData> tbPersonalData1;//用户信息集合
	private List<TbPersonalData> tbPersonalDataa;//用户信息集合
    private TbReadmeService tbReadmeService;//健康自述接口
    private TbReadme tbReadme; //健康自述模型
    private TbAdvice tbAdvice;//调理建议模型
    private List<TbReadme> tbReadmeList;//健康自述列表
    private List<MyAppointment> tbReadmeList1;//调理建议列表
    private List<MyAppointment> myAppointment;//健康自述列表
    private List<TbPersonalData> tbPersonalDataList;//用户信息列表
	@Autowired
	private TbPersonalDataService tbPersonalDataService;//微信端用户信息处理接口
	
	private SysLoginRecord sysLoginRecord;//登陆日志
	@Autowired
	private SysLoginRecordService sysLoginRecordService;
	
	@Autowired
	private TbFeedbackService tbFeedbackService;//效果反馈接口
	@Autowired
	private PersonalDataDetailService personalDataDetailService;
	private TbFeedback tbfeedback;//效果反馈模型
	private ReferData referData;
	private FatherHealth fatherHealth;//父级健康自述模型
	private ThroughFeedback throughFeedback;
	private List<ReferData> referDataList;
	private List<TbReadme> fatherHealthList;//父级健康自述列表，即fatherID=0的记录
	private List<TbAdvice> fatherAdviceList;//调理建议列表，即fatherID=0的记录
	private List<TbAdvice> fatherAdviceList1;//子级调理建议列表，即fatherID!=0的记录 
	private List<TbReadme> childHealthList;//子级健康自述列表，即fatherID!=0的记录  
	private List<ThroughFeedback> throughFeedbackList;//效果反馈列表
	int consult_number = 0;//用户已咨询的咨询数量
	int answer_number = 0;//用户已答复的咨询数量
	int advice_nember = 0;//导师已回复的咨询数量
	int feedback_nember = 0;//用户未反馈的咨询数量
	private int myAppointment_number=0; //我的预约数量
	private int otherAppointment_number=0; //其他预约数量
	private int idd = 0;
	private int readmeId = 0;//健康咨询表主键
	private int mentorId = 0;//个人信息表主键
	private int personalid = 0;//个人信息表主键
	private String phone;//手机号
	private String password1;//密码
	public void prepare() throws Exception{
		if (null == tbPersonalData) {
			tbPersonalData = new TbPersonalData();
		}
		if (con == null) {
			con = new Content();
		}
		if (null == tbAdvice) {
			tbAdvice = new TbAdvice();
		}
		if (null == referData) {
			referData = new ReferData();
		}
		if (null == fatherHealth) {
			fatherHealth = new FatherHealth();
		}
		if (null == throughFeedback) {
			throughFeedback = new ThroughFeedback();
		}

		if(null == sysLoginRecord){
			sysLoginRecord = new SysLoginRecord();
		}

	}
	
	/**
	 * 登录校验+登录判断跳转+界面显示数据（微信端）
	 * @return
	 * @throws Exception
	 * @author 莫然源、陈洁
	 * @throws ParseException 
	 * @throws UnsupportedEncodingException 
	 * @Date 2017.03.19
	 */
	public String weixinLogin() throws ParseException,
			UnsupportedEncodingException {

		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response1 = ServletActionContext.getResponse();
		HttpServletResponse response2 = ServletActionContext.getResponse();

		// 保存账号信息到cookie
		int i = 0, j = 0;// i为cookie中名字不为username的数量，j为cookie中名字不为password的数量。
		Cookie myCookie[] = request.getCookies();
		if (myCookie.length > 0) {
			for (int n = 0; n < myCookie.length; n++) {
				Cookie newCookie = myCookie[n];

				if (!"username".equals(newCookie.getName())) {
					i++;
				}
				if ("username".equals(newCookie.getName())) {
					String UserName=URLDecoder.decode(newCookie.getValue(),"utf-8");
					tbPersonalData.setMobilePhone(UserName);
				}
				if (!"password".equals(newCookie.getName())) {
					j++;
				}
				if ("password".equals(newCookie.getName())) {
					String PassWord=URLDecoder.decode(newCookie.getValue(),"utf-8");
					tbPersonalData.setPassword(PassWord);
				}
			}
		}


		boolean state = false;

		state = wxLoginService.isLogin1(tbPersonalData);// 判断用户名和密码是否正确

		String ip = ServletActionContext.getRequest().getRemoteAddr(); // 获取用户登录IP
		// 获取当前系统时间
		String time = MyTime.getStringDate();
		/*
		 * Date date=new Date(); DateFormat format=new
		 * SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); String time =
		 * format.format(date);
		 */
		Timestamp loginTime = Timestamp.valueOf(time);// 把String 类型转换成 Timestamp类型
		
		// 根据个人mobilePhone查询用户信息
		TbPersonalData tbPersonalData1 = new TbPersonalData();
		tbPersonalData1 = tbPersonalDataService.fingByMobilePhone(tbPersonalData.getMobilePhone());


		// System.out.println(state);
		if (state) {
			// System.out.println("i为："+i+"j为："+j+"长度为"+myCookie.length);
			if (i == myCookie.length) {// 保存登录名到cookie
				String userName1 = URLEncoder.encode(tbPersonalData.getMobilePhone(),"UTF-8");
				// System.out.println("保存的账号是"+userName1);
				Cookie cookie = new Cookie("username", userName1);
				cookie.setMaxAge(365 * 24 * 60 * 60);// 存活期一年
				cookie.setPath("/");
				response1.addCookie(cookie);
			}

			if (j == myCookie.length) {// 保存密码到cookie
				String userName2 = URLEncoder.encode(tbPersonalData.getPassword(),"UTF-8");
				// System.out.println("保存的密码是"+userName2);
				Cookie cookie1 = new Cookie("password", userName2);
				cookie1.setMaxAge(365 * 24 * 60 * 60);// 存活期一年
				cookie1.setPath("/");
				response2.addCookie(cookie1);
			}
			
			// 将用户登录信息放到用户登录记录对象中
			sysLoginRecord.setOperateContent("登录成功");
			// operateType表示日志类型：1表示登录，2表示导出二维码/微信端登陆日志
			sysLoginRecord.setOperateType(2);
			sysLoginRecord.setLoginIp(ip);
			sysLoginRecord.setUserId(tbPersonalData1.getPersonalNumber());
			sysLoginRecord.setUserName(tbPersonalData1.getMobilePhone());
			sysLoginRecord.setLoginTime(loginTime);
			// 将用户登录记录存放到用户登录记录表中
			sysLoginRecordService.add(sysLoginRecord);

			// 清除所有session
			HttpSession session = request.getSession();
			Enumeration ee = session.getAttributeNames();
			while (ee.hasMoreElements()) {
				String sessionName = (String) ee.nextElement();
				// System.out.println("存在的session有："+sessionName);
				session.removeAttribute(sessionName);
			}

			tbPersonalData = tbPersonalDataService.find(tbPersonalData);
			getRequest().getSession().setAttribute("password",
					tbPersonalData.getPassword());// 将密码存进session
			getRequest().getSession().setAttribute("personaldata",
					tbPersonalData);// 将个人数据存进session
			getRequest().getSession().setAttribute("personalId",
					tbPersonalData.getPersonalId());// 将个Id存进session
			getRequest().getSession().setAttribute("Name",
					tbPersonalData.getName());// 将用户昵称存进session
			getRequest().getSession().setAttribute("realName",
					tbPersonalData.getRealName());// 将用户姓名存进session
			getRequest().getSession().setAttribute("Level",
					tbPersonalData.getLevel());// 用户等级存进session
			getRequest().getSession().setAttribute("flagtype",
					tbPersonalData.getFlagType());// 将用户类型存进session
			getRequest().getSession().setAttribute("mobilePhone",tbPersonalData.getMobilePhone());// 将用户类型存进session

			if (tbPersonalData.getFlagType() == 0
					|| tbPersonalData.getFlagType() == 3)// 如果登录类型为0即为会员，进入会员中心界面
			{
				WeixinMemberLogin(tbPersonalData.getPersonalId());
				setForwardView(MAIN_JSP);
				return SUCCESS;
			} else// 登录类型不为0进入导师中心界面
			{
				contentList = orService.coverNewsList(con, getPage(), getRow());// 学习园地
				WeixinMentorLogin(tbPersonalData.getPersonalId());
				setForwardView(MCHome_JSP);
				return SUCCESS;
			}
		} else {// 清除cookie
			ClearCookie();
	if(null != tbPersonalData1){ 
            // 将用户登录信息放到用户登录记录对象中
			sysLoginRecord.setOperateContent("密码错误，登陆失败");
			// operateType表示日志类型：1表示登录，2表示导出二维码/微信端登陆日志
			sysLoginRecord.setOperateType(2);
			sysLoginRecord.setLoginIp(ip);
			sysLoginRecord.setUserId(tbPersonalData1.getPersonalNumber());
			sysLoginRecord.setUserName(tbPersonalData1.getMobilePhone());
			sysLoginRecord.setLoginTime(loginTime);
			// 将用户登录记录存放到用户登录记录表中
			sysLoginRecordService.add(sysLoginRecord);
	}

			request.setAttribute("fail", "fail1");
			setForwardView(LOGIN_JSP);
		}
		return SUCCESS;
	}
	
	
	/**
	 * 清除cook保存的账号密码
	 * @return
	 * @throws Exception
	 * @author 莫然源
	 * @throws ParseException 
	 * @throws UnsupportedEncodingException 
	 * @Date 2017.03.19
	 */
	public void ClearCookie() throws ParseException, UnsupportedEncodingException{
		HttpServletRequest request =ServletActionContext.getRequest();
		HttpServletResponse response1=ServletActionContext.getResponse();
		//删除cookie里username和password的数据
		Cookie deleteCookie = new Cookie("username",null); 
		deleteCookie.setMaxAge(0); 
		deleteCookie.setPath("/");
		response1.addCookie(deleteCookie);
		
		Cookie deleteCookie1 = new Cookie("password",null); 
		deleteCookie1.setMaxAge(0); 
		deleteCookie1.setPath("/");
		response1.addCookie(deleteCookie1);
		
		//清除所有session
		HttpSession session = request.getSession();
		Enumeration ee=session.getAttributeNames();
		while(ee.hasMoreElements()){ String sessionName=(String)ee.nextElement();
		//System.out.println("存在的session有："+sessionName);
		session.removeAttribute(sessionName); 
	
	     }
	}
	
	/**
	 * 根据登录信息进入微信端用户首页
	 * @return
	 * @throws Exception
	 * @author 莫然源
	 * @throws ParseException 
	 * @throws UnsupportedEncodingException 
	 * @Date 2017.03.19
	 */
	public void WeixinMemberLogin(int a) throws ParseException,
			UnsupportedEncodingException {

		tbPersonalDataa = tbPersonalDataService.findTh();// 查询所有导师数据
		consult_number = tbReadmeService.findCS(a);// 统计已咨询记录条数
		answer_number = tbReadmeService.findFahterReplyPQ(a).size();// 统计已回复记录条数
		feedback_nember = tbReadmeService.findFatherNoFeedbackPQ(a).size();// 统计未反馈记录条数
		getRequest().setAttribute("consult_number", consult_number);// 将数据通过request传到前台
		getRequest().setAttribute("answer_number", answer_number);
		getRequest().setAttribute("feedback_nember", feedback_nember);
		getRequest().getSession()
				.setAttribute("personalDataa", tbPersonalDataa);// 将个人数据存进session

		tbPersonalData = tbPersonalDataService.findById(a);// 根据id查询个人数据
		if (tbPersonalData.getLevel() == 0 || tbPersonalData.getLevel() == 1) {// 如果该会员为正式会员（即已缴费）
			SimpleDateFormat sdf3 = new SimpleDateFormat("yyyy-MM-dd");// 获取会员结束时间，并将其转成string类型
			String time2 = sdf3.format(tbPersonalData.getEndTime());
			getRequest().getSession().setAttribute("EndTime", time2);
			/*
			 * Date date=new Date(); DateFormat format=new
			 * SimpleDateFormat("yyyy-MM-dd"); String time =
			 * format.format(date);
			 */
			String time = MyTime.getStringDateShort();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");// 类型转换
			long m = 0;
			m = sdf.parse(time2).getTime() - sdf.parse(time).getTime();// 计算会员剩余天数
			m = m / (1000 * 60 * 60 * 24);
			// System.out.println("M:"+m);
			getRequest().getSession().setAttribute("overdue", m);
			if (m < 0) {// 如果会员已过期
				getRequest().getSession().setAttribute("tip", "会员身份已过期，请续费");
				getRequest().setAttribute("aler1", "error");
			} else {
				contentList = orService.coverNewsList(con, getPage(), getRow());// 学习园地
				tbPersonalData1 = tbPersonalDataService.findTh();// 查询所有导师

				if (tbPersonalData.getLevel() == 0) {// 如果该会员为普通会员

					for (int j1 = 0; j1 < tbPersonalData1.size(); j1++) {
						if (tbPersonalData1.get(j1).getLevel() == 2) {
							tbPersonalData1.get(j1).setPersonalId(1);
							// System.out.println(tbPersonalData1.get(j1).getRealName());
						}

					}
					getRequest().getSession().setAttribute("personalData1",
							tbPersonalData1);// 将个人数据存进session
					getRequest().getSession().setAttribute("tip", "选择导师");

				} else if (tbPersonalData.getLevel() == 1) {// 如果该会员为高级会员

					getRequest().getSession().setAttribute("personalData1",
							tbPersonalData1);// 将个人数据存进session
					getRequest().getSession().setAttribute("tip", "选择导师");

				}
			}
		} else {// 如果该会员为非正式会员（即未缴费）

			getRequest().getSession().setAttribute("tip", "缴费后成为VIP会员即可咨询");
			getRequest().setAttribute("aler1", "error");

		}

		fatherHealthList = personalDataDetailService
				.findByFatherPersonalId(tbPersonalData.getPersonalId());// 根据会员id查询会员的非子级健康自述记录
		fatherAdviceList = personalDataDetailService
				.findByFatherAdvicePersonalId(tbPersonalData.getPersonalId());// 根据会员id查询会员的所有调理建议记录
		childHealthList = personalDataDetailService
				.findByChildMemberId(tbPersonalData.getPersonalId());// 根据会员id查询该会员的子级所有健康记录
		throughFeedbackList = personalDataDetailService
				.findByFeedbackMemberId(tbPersonalData.getPersonalId());// 根据会员id查询该会员的所有效果反馈记录

	}
	
	/**
	 * 查询登录导师的信息并打开导师首页
	 * @return
	 * @throws Exception
	 * @author 莫然源
	 * @throws ParseException 
	 * @throws UnsupportedEncodingException 
	 * @Date 2017.03.19
	 */
	public void WeixinMentorLogin(int personalId) throws ParseException, UnsupportedEncodingException{
		int a= (Integer) getRequest().getSession().getAttribute("personalId");
		advice_nember=tbReadmeService.findFatherPQ(a).size();//统计导师服务记录条数
		getRequest().setAttribute("advice_nember",advice_nember);//将统计到的数量放进request传到前台
		/*tbReadme.setMentorId(tbPersonalData.getPersonalId());*/
	//	System.out.println("导师id为："+personalId);
		myAppointment = tbReadmeService.findByMentorId(a);//根据导师id查询所有健康自述记录
		tbReadmeList1 = tbReadmeService.findBypersonalid();//查询所有没有指定导师的健康咨询记录
		myAppointment_number = tbReadmeService.findByMentorId(personalId).size();//查询所有选择该导师的咨询记录
		otherAppointment_number=tbReadmeService.findBypersonalid().size();//查询所有没有指定导师的健康咨询记录
		getRequest().getSession().setAttribute("myAppointment_number1",myAppointment_number);// 将我的预约条数存进session
		getRequest().getSession().setAttribute("otherAppointment_number1",otherAppointment_number);// 将其他预约条数存进session
		/*tbPersonalDataList = tbPersonalDataService.findByMentorId(tbReadmeList);*/
		
	}
	
	
	/**
	 * 打开导师菜单
	 * @return
	 * @throws Exception
	 * @author 莫然源
	 * @throws ParseException 
	 * @throws UnsupportedEncodingException 
	 * @Date 2017.03.19
	 */
	public String OpenMentorData() throws ParseException, UnsupportedEncodingException{
		int personalId=(Integer) getRequest().getSession().getAttribute("personalId");
		advice_nember=tbReadmeService.findFatherPQ(personalId).size();//统计导师服务记录条数
		getRequest().setAttribute("advice_nember",advice_nember);//将统计到的数量放进request传到前台
		setForwardView(MENTORDATA_JSP);
		return SUCCESS;
	}
	
	
	/**
	 * 退出登录
	 * @return
	 * @throws Exception
	 * @author 莫然源
	 * @throws ParseException 
	 * @throws UnsupportedEncodingException 
	 * @Date 2017.03.19
	 */
	public String LoginOut() throws UnsupportedEncodingException, ParseException{
		ClearCookie();
		setForwardView(EXIT_JSP);
		return SUCCESS;
	}
	
	/**
	 * 返回用户首页
	 * @return
	 * @throws Exception
	 * @author 莫然源
	 * @throws ParseException 
	 * @throws UnsupportedEncodingException 
	 * @Date 2017.03.19
	 */
	public String ReturnMemberHome() throws UnsupportedEncodingException, ParseException{
		int a= (Integer) getRequest().getSession().getAttribute("personalId");//获取session里personalId的值
		WeixinMemberLogin(a);
		setForwardView(MAIN_JSP);
		return SUCCESS;
	}
	
	
	/**
	 * 打开导师首页
	 * @return
	 * @throws Exception
	 * @author 莫然源
	 * @throws ParseException 
	 * @throws UnsupportedEncodingException 
	 * @Date 2017.03.19
	 */
	public String OpenMentorHome() throws UnsupportedEncodingException, ParseException{
		int personalId=(Integer) getRequest().getSession().getAttribute("personalId");//获取session里personalId的值
		WeixinMentorLogin(personalId);
		setForwardView(MCHome_JSP);
		return SUCCESS;
	}

	/**
	 * 
	 * @Title: timer4 
	 * @Description: 设置定时器参数
	 * @return void    返回类型 
	 * @author: 莫然源
	 * @Date 2017年7月8日
	 * @throws
	 */
/*	public void timer4() {
		Calendar calendar = Calendar.getInstance();
	    calendar.set(Calendar.HOUR_OF_DAY, 0); // 控制时
	    calendar.set(Calendar.MINUTE, 0);    // 控制分
	    calendar.set(Calendar.SECOND, 0);    // 控制秒
	 
	    Date time = calendar.getTime();     // 得出执行任务的时间,此处为今天的12：00：00
	    
	    Timer timer = new Timer();
	    timer.scheduleAtFixedRate(new TimerTask() {
		public void run() {
			changeType();
	    	  System.out.println("123147852");
	      }
	    }, time, 1000 * 60 * 60 * 24);// 这里设定将延时每天固定执行
	  }*/
	/**
	 * 
	 * @Title: changeType 
	 * @Description: 更新所有的健康咨询。
	 * @return void    返回类型 
	 * @author: 莫然源
	 * @Date 2017年7月8日
	 * @throws
	 */
/*	public void changeType(){
		tbReadmeList=tbReadmeService.findReadmeByMentorId();
		//查询所有未答复的指定导师的健康咨询
   	     for(TbReadme tbReadme:tbReadmeList){//更新所有的健康咨询
   		  tbReadme.setMentorId(0);
   		  //设置不指定导师
   		  tbReadmeService.update(tbReadme);
   		  
   	     }
	}
	*/

	@Override
	public Object getModel() {
		
		return tbPersonalData;
	}

	public Object getModel1() {
		return con;
	}
	
	public void setTbPersonalData(TbPersonalData tbPersonalData) {
		this.tbPersonalData = tbPersonalData;
	}
	public TbPersonalData getTbPersonalData() {
		return tbPersonalData;
	}
	
	public List<TbPersonalData> getTbPersonalData1() {
		return tbPersonalData1;
	}

	public void setTbPersonalData(List<TbPersonalData> tbPersonalData1) {
		this.tbPersonalData1 = tbPersonalData1;
	}

	public TbReadmeService getTbReadmeService() {
		return tbReadmeService;
	}

	public void setTbReadmeService(TbReadmeService tbReadmeService) {
		this.tbReadmeService = tbReadmeService;
	}

	public TbReadme getTbReadme() {
		return tbReadme;
	}

	public void setTbReadme(TbReadme tbReadme) {
		this.tbReadme = tbReadme;
	}

	public List<TbReadme> getTbReadmeList() {
		return tbReadmeList;
	}

	public void setTbReadmeList(List<TbReadme> tbReadmeList) {
		this.tbReadmeList = tbReadmeList;
	}

	public List<TbPersonalData> getTbPersonalDataList() {
		return tbPersonalDataList;
	}

	public void setTbPersonalDataList(List<TbPersonalData> tbPersonalDataList) {
		this.tbPersonalDataList = tbPersonalDataList;
	}

	public void setTbAdvice(TbAdvice tbAdvice) {
		this.tbAdvice = tbAdvice;
	}
	
	public TbAdvice getTbAdvice() {
		return tbAdvice;
	}

	public TbFeedback getTbfeedback() {
		return tbfeedback;
	}

	public void setTbfeedback(TbFeedback tbfeedback) {
		this.tbfeedback = tbfeedback;
	}

	public List<ReferData> getReferDataList() {
		return referDataList;
	}

	public void setReferDataList(List<ReferData> referDataList) {
		this.referDataList = referDataList;
	}









	public List<TbReadme> getFatherHealthList() {
		return fatherHealthList;
	}

	public void setFatherHealthList(List<TbReadme> fatherHealthList) {
		this.fatherHealthList = fatherHealthList;
	}

	public List<TbAdvice> getFatherAdviceList() {
		return fatherAdviceList;
	}

	public void setFatherAdviceList(List<TbAdvice> fatherAdviceList) {
		this.fatherAdviceList = fatherAdviceList;
	}

	public List<TbAdvice> getFatherAdviceList1() {
		return fatherAdviceList1;
	}

	public void setFatherAdviceList1(List<TbAdvice> fatherAdviceList1) {
		this.fatherAdviceList1 = fatherAdviceList1;
	}

	public List<TbReadme> getChildHealthList() {
		return childHealthList;
	}

	public void setChildHealthList(List<TbReadme> childHealthList) {
		this.childHealthList = childHealthList;
	}

	public List<ThroughFeedback> getThroughFeedbackList() {
		return throughFeedbackList;
	}

	public void setThroughFeedbackList(List<ThroughFeedback> throughFeedbackList) {
		this.throughFeedbackList = throughFeedbackList;
	}

	public int getReadmeId() {
		return readmeId;
	}

	public void setReadmeId(int readmeId) {
		this.readmeId = readmeId;
	}

	public int getMentorId() {
		return mentorId;
	}

	public void setMentorId(int mentorId) {
		this.mentorId = mentorId;
	}

	public int getPersonalid() {
		return personalid;
	}

	public void setPersonalid(int personalid) {
		this.personalid = personalid;
	}

	public int getIdd() {
		return idd;
	}

	public void setIdd(int idd) {
		this.idd = idd;
	}

	public List<TbPersonalData> getTbPersonalDataa() {
		return tbPersonalDataa;
	}

	public void setTbPersonalDataa(List<TbPersonalData> tbPersonalDataa) {
		this.tbPersonalDataa = tbPersonalDataa;
	}

	public List<MyAppointment> getTbReadmeList1() {
		return tbReadmeList1;
	}

	public void setTbReadmeList1(List<MyAppointment> tbReadmeList1) {
		this.tbReadmeList1 = tbReadmeList1;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPassword1() {
		return password1;
	}

	public void setPassword1(String password1) {
		this.password1 = password1;
	}

	public int getMyAppointment_number() {
		return myAppointment_number;
	}

	public void setMyAppointment_number(int myAppointment_number) {
		this.myAppointment_number = myAppointment_number;
	}

	public int getOtherAppointment_number() {
		return otherAppointment_number;
	}

	public void setOtherAppointment_number(int otherAppointment_number) {
		this.otherAppointment_number = otherAppointment_number;
	}

	public Content getCon() {
		return con;
	}

	public void setCon(Content con) {
		this.con = con;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Result<Content> getContentList() {
		return contentList;
	}

	public void setContentList(Result<Content> contentList) {
		this.contentList = contentList;
	}

	public List<MyAppointment> getMyAppointment() {
		return myAppointment;
	}

	public void setMyAppointment(List<MyAppointment> myAppointment) {
		this.myAppointment = myAppointment;
	}





	
}
