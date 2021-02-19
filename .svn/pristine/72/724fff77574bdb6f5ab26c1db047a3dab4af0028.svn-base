package com.gxuwz.KeepHealth.business.action.web;

import java.util.List;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import util.MyTime;

import com.gxuwz.KeepHealth.business.entity.Content;
import com.gxuwz.KeepHealth.business.entity.FatherHealth;
import com.gxuwz.KeepHealth.business.entity.MyAppointment;
import com.gxuwz.KeepHealth.business.entity.ReferData;
import com.gxuwz.KeepHealth.business.entity.TbAdvice;
import com.gxuwz.KeepHealth.business.entity.TbFeedback;
import com.gxuwz.KeepHealth.business.entity.TbPersonalData;
import com.gxuwz.KeepHealth.business.entity.TbReadme;
import com.gxuwz.KeepHealth.business.entity.ThroughFeedback;
import com.gxuwz.KeepHealth.business.service.ContentService;
import com.gxuwz.KeepHealth.business.service.PersonalDataDetailService;
import com.gxuwz.KeepHealth.business.service.TbAdviceService;
import com.gxuwz.KeepHealth.business.service.TbFeedbackService;
import com.gxuwz.KeepHealth.business.service.TbPersonalDataService;
import com.gxuwz.KeepHealth.business.service.TbReadmeService;
import com.gxuwz.core.pagination.Result;
import com.gxuwz.core.web.action.BaseAction;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
/**
 * 
* @ClassName: TbAdviceAction 
* @Description: 调理建议表控制器   增刪查改
* @author 软件开发中心  陈洁 
* @date 2017年7月7日 上午8:55:31
 */
public class TbAdviceAction extends BaseAction implements Preparable, ModelDriven{

	private static final long serialVersionUID = -4104125263890869018L;
	protected static final String ReferData_JSP = "/WEB-INF/page/web/health_manage/Refer_data.jsp";
	protected static final String RECORDS_JSP = "/weixin/Consulting_records.jsp";
	protected static final String MEMBER_JSP = "/weixin/Mentor_home.jsp";
	protected static final String FeedBack_JSP = "/weixin/FeedBack.jsp";
	protected static final String MemberDetails_JSP = "/weixin/Member_details.jsp";
	protected static final String Refered_JSP = "/weixin/Refered_record.jsp";
	protected static final String RECORDS1_JSP = "/weixin/Consulting_records1.jsp";
	protected static final String Homelink_JSP = "/weixin/Member_homelink.jsp";
	protected static final String Home_JSP = "/weixin/Member_home.jsp";
	protected static final String SERVICERE_JSP = "/weixin/Service_record.jsp";
	protected static final String ADDIADVICE_JSP = "/weixin/Additional_Advice.jsp";
	protected static final String REGULATE_JSP = "/weixin/Regulate_advice.jsp";
	
	@Autowired
	private TbAdviceService tbAdviceService;//调理建议接口
	@Autowired
	private TbReadmeService tbReadmeService;//健康自述接口
	@Autowired
	private ContentService orService;	//用户信息处理接口
	
	private Result<Content> contentList;//新闻信息集合
	private Content con;//新闻信息模型
	private TbReadme tbReadme; //健康自述模型
	private TbAdvice tbAdvice; //调理建议模型
	private List<MyAppointment> tbReadmeList1;//调理建议列表
    private List<MyAppointment> myAppointment;//健康自述列表
	private List<TbReadme> tbReadmeList;
    private List<TbAdvice> tbAdviceList;//调理建议列表
    private TbPersonalData tbPersonalData;//個人數據模型
    private TbPersonalData tbPersonalData2;
	private List<TbPersonalData> tbPersonalData1;
	private List<TbPersonalData> tbPersonalDataList;//個人數據列表
	private List<TbReadme> childPreviousquestions=null;
	private List<TbReadme> fatherPreviousquestions;
	private List<TbAdvice> adviceList;//調理建議模型（針對對查詢結果的封裝）
	private List<TbFeedback> tbFeedback;//效果反饋模型
	private List<TbFeedback> tbFeedbackList;//效果反饋列表
	@Autowired
	private TbPersonalDataService tbPersonalDataService;//個人數據接口
	@Autowired
	private TbFeedbackService tbFeedbackService;//效果反饋接口
	@Autowired
	private PersonalDataDetailService personalDataDetailService;//個人數據詳情接口(封裝多表查詢得到的結果)
	private TbFeedback tbfeedback;
	private ReferData referData;//已咨詢模型（封裝多表查詢得到的結果）
	private FatherHealth fatherHealth;//父級健康自述模型
	private ThroughFeedback throughFeedback;//
	private List<ReferData> referDataList;//已咨詢列表
	private List<TbReadme> fatherHealthList;//父級健康自述列表
	private List<TbAdvice> fatherAdviceList;//子級調理建議列表
	private List<TbReadme> childHealthList;//子級健康自述列表
	private List<ThroughFeedback> throughFeedbackList;
	int consult_number = 0;//已咨询记录条数
	int answer_number = 0;//已回复记录条数
	
	int feedback_nember = 0;//已反馈记录条数
	int advice_nember = 0;//导师服务记录条数
	private int myAppointment_number=0; //我的預約未答復條數
	private int otherAppointment_number=0; //其他預約未答復條數
	private int idd = 0;//健康自述id
	private int idd1 = 0;
	private int idd2 = 0;
	private int idd3 = 0;
	private int readmeId = 0;//健康自述編號
	private int mentorId = 0;//導師編號
	private int personalid = 0;//個人數據編號
	public void prepare() throws Exception{
		if(null == tbAdvice){
			tbAdvice = new TbAdvice();
		}
		if(null == referData){
			referData = new ReferData();
		}
		if(null == fatherHealth){
			fatherHealth =  new FatherHealth();
		}
		if(null == throughFeedback){
			throughFeedback = new ThroughFeedback();
		}
	}
	
	@Override
	public String execute() throws Exception {
		
		return SUCCESS;
	}
	
	/**
	 * 
	* @Title: add 
	* @author 软件开发中心   陈洁
	* @Description: 添加调理建议，并修改健康自述的回复状态字段
	* @return String 
	* @throws
	 */
	public String add() throws Exception{
		HttpServletRequest request =ServletActionContext.getRequest();
 		//获取当前系统时间
		String time = MyTime.getStringDate();
		/*Date date=new Date();
		DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = format.format(date); */
		Timestamp adviceTime = Timestamp.valueOf(time);//把String 类型转换成 Timestamp 类型
		tbAdvice.setAdviceTime(adviceTime);
		int a= (Integer) getRequest().getSession().getAttribute("personalId");
   	    String name=(String)getRequest().getSession().getAttribute("realName");
   	    tbAdvice.setMentorName(name);
   	    tbAdvice.setPersonalId(a);
   	    tbAdvice.setFatherId(0);
		tbAdviceService.addAdvice(tbAdvice);//增加一条调理建议记录
		tbReadmeService.updatementorId(a,tbAdvice.getReadmeId(),name);//更新健康自述记录对应的导师id导师名称
		tbReadmeService.updateReadme(tbAdvice.getReadmeId());//根据id值更新个人数据表的回复状态字段
		advice_nember=tbReadmeService.findFatherPQ(a).size();//统计导师服务记录条数
		getRequest().setAttribute("advice_nember",advice_nember);//将统计到的数量放进request传到前台
		myAppointment = tbReadmeService.findByMentorId(a);//根据导师id查询所有预约了该导师的健康自述记录
		tbReadmeList1 = tbReadmeService.findBypersonalid();//查询所有没有指定导师的健康咨询记录
		myAppointment_number = tbReadmeService.findByMentorId(a).size();//查询我的预约的数量
		otherAppointment_number=tbReadmeService.findBypersonalid().size();//查询其他预约的数量
		contentList = orService.coverNewsList(con, getPage(), getRow());//学习园地
		//清除session   每次回复都清除原session存有的数据   并将新查询得到的数据存进session
		HttpSession session = getRequest().getSession();
		session.removeAttribute("myAppointment_number1"); 
		session.removeAttribute("otherAppointment_number1"); 
		getRequest().getSession().setAttribute("myAppointment_number1",myAppointment_number);// 将我的预约条数存进session
		getRequest().getSession().setAttribute("otherAppointment_number1",otherAppointment_number);// 将其他预约条数存进session
		request.setAttribute("tbReadmeList",tbReadmeList);
		request.setAttribute("alert","success");
		setForwardView(MEMBER_JSP);
		return SUCCESS;
	}
	/**
	 * 添加追加建议
	 * @return
	 * @throws Exception
	 * @author 莫然源
	 * @date 2017.04.30
	 */
	public String Additional() throws Exception{
		HttpServletRequest request =ServletActionContext.getRequest();
		//获取当前系统时间 
		String time = MyTime.getStringDate();
		/*Date date=new Date();
		DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = format.format(date); */
		Timestamp adviceTime = Timestamp.valueOf(time);//把String 类型转换成 Timestamp 类型
		tbAdvice.setAdviceTime(adviceTime);
		int a= (Integer) getRequest().getSession().getAttribute("personalId");
		//获取保存在session里的导师id。
  	    String name=(String)getRequest().getSession().getAttribute("realName");
  	    //获取保存在session里的导师的真实姓名。
  	    tbAdvice.setMentorName(name);//将导师id和真实姓名存放到实体类
  	    tbAdvice.setPersonalId(a);
		if (tbAdviceService.findByReadmeId(tbAdvice.getReadmeId()).size() != 0) {
			if (tbAdvice.getFatherId() == 0) {// 根据fatherId来判断追加的建议是咨询还是追加咨询。
				childPreviousquestions = tbReadmeService
						.findChildPQByReadmeId(tbAdvice.getReadmeId());
				// 根据readmeId查找所有fatherId!=0的咨询记录
				tbAdvice.setReadmeId(childPreviousquestions.get(0)
						.getReadmeId());
				tbAdvice.setFatherId(tbAdviceService
						.findByReadmeId(tbAdvice.getReadmeId()).get(0)
						.getAdviceId());
			} else {
				tbAdvice.setFatherId(tbAdviceService
						.findByReadmeId(tbAdvice.getReadmeId()).get(0)
						.getAdviceId());
			}
		}
		
		tbAdviceService.addAdvice(tbAdvice);//增加一条调理建议记录
		advice_nember=tbReadmeService.findFatherPQ(a).size();//统计导师服务记录条数
		getRequest().setAttribute("advice_nember",advice_nember);//将统计到的数量放进request传到前台
		myAppointment = tbReadmeService.findByMentorId(a);//根据导师id查询所有预约了该导师的健康自述记录
		tbReadmeList1 = tbReadmeService.findBypersonalid();//查询所有没有指定导师的健康咨询记录
		myAppointment_number = tbReadmeService.findByMentorId(a).size();//查询我的预约的数量
		otherAppointment_number=tbReadmeService.findBypersonalid().size();//查询其他预约的数量
		contentList = orService.coverNewsList(con, getPage(), getRow());//学习园地
		request.setAttribute("tbReadmeList",tbReadmeList);
		request.setAttribute("alert","success");
		setForwardView(MEMBER_JSP);
		return SUCCESS;
	}
	/**
	 * 
	* @Title: openAdviceDetail 
	* @author 软件开发中心   陈洁
	* @Description: 显示一条健康自述记录的详细信息（会员基本信息+咨询内容）
	* @return String 
	* @date 2017年7月7日 上午9:16:17 
	* @throws
	 */
	public String openAdviceDetail() throws Exception{
		System.out.println("shais"+getIdd());
		referDataList = personalDataDetailService.findAdviceDetail(getIdd());//根据readmeid查询该条记录的详细信息
		fatherHealthList = personalDataDetailService.findByreadmeId(getIdd());//根据健康自述id查询
		fatherAdviceList = personalDataDetailService.findByAdvicereadmeId(getIdd());////根据会员健康自述id查询会员的非子级健康自述记录
		childHealthList = personalDataDetailService.findByChildMemberId(getPersonalid());//根据会员id查询该会员的子级所有调理建议记录
		setForwardView(ReferData_JSP);
    	return SUCCESS;
	}
	
	/**
	 * 
	* @Title: openConsultingRecords 
	* @author 软件开发中心   陈洁
	* @Description: 以往记录界面，查询出健康自述  调理建议  效果反馈（微信界面）
	* @return String 
	* @date 2017年7月7日 上午9:17:02 
	* @throws
	 */
	public String openConsultingRecords() throws Exception {
		int personalId = (Integer) getRequest().getSession().getAttribute(
				"personalId");
		int a = (Integer) getRequest().getSession().getAttribute("personalId");
		int b = (Integer) getRequest().getSession().getAttribute("Level");
		tbPersonalData = tbPersonalDataService.findById(a);// 根据id查询个人数据
		if (b == 0 || b == 1) {// 如果该会员为正式会员（即已缴费）
			/*
			 * Date date = new Date(); DateFormat format = new
			 * SimpleDateFormat("yyyy-MM-dd"); String time =
			 * format.format(date);
			 */
			String time = MyTime.getStringDateShort();
			tbPersonalData = tbPersonalDataService.find(tbPersonalData);
			String time1 = (tbPersonalData.getEndTime()).toString();// 获取会员结束时间，并将其转成string类型
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");// 类型转换
			long m = 0;
			m = sdf.parse(time1).getTime() - sdf.parse(time).getTime();// 计算会员剩余天数

			if (m < 0) {// 如果会员已过期
				getRequest().setAttribute("tip", "会员身份已过期，请续费");
			} else {
				if (b == 0) {// 如果该会员为普通会员

					tbPersonalData1 = tbPersonalDataService.findThp();// 查询所有普通导师
					getRequest().setAttribute("tip", "选择导师");

				} else if (b == 1) {// 如果该会员为高级会员

					tbPersonalData1 = tbPersonalDataService.findTh();// 查询所有导师
					getRequest().setAttribute("tip", "选择导师");

				}
			}
		} else {// 如果该会员为非正式会员（即未缴费）

			getRequest().setAttribute("tip", "缴费后成为VIP会员即可咨询");

		}
		fatherHealthList = personalDataDetailService
				.findByFatherPersonalId(personalId);// 根据会员id查询会员的非子级健康自述记录
		fatherAdviceList = personalDataDetailService
				.findByFatherAdvicePersonalId(personalId);// 根据会员id查询会员的所有调理建议记录
		childHealthList = personalDataDetailService
				.findByChildMemberId(personalId);// 根据会员id查询该会员的子级所有健康记录
		throughFeedbackList = personalDataDetailService
				.findByFeedbackMemberId(personalId);// 根据会员id查询该会员的所有效果反馈记录
		setForwardView(Homelink_JSP);
		return SUCCESS;
	}
	
	/**
	 * 
	* @Title: OpenFeedback 
	* @author 软件开发中心   陈洁
	* @Description: 追加反馈界面（微信界面）
	* @return String 
	* @date 2017年7月7日 上午9:23:13 
	* @throws
	 */
	public String OpenFeedback() throws Exception{  
		
		tbReadmeList=tbReadmeService.findFKtype(getIdd());
		//System.out.println(tbReadmeList.get(0).getFeedbackState());
		if (tbReadmeList.get(0).getReplyState() == 0) {
			setForwardView(Refered_JSP);
			int personalId = (Integer) getRequest().getSession().getAttribute(
					"personalId");
			fatherHealthList = personalDataDetailService
					.findByFatherPersonalId(personalId);// 根据会员id查询会员的非子级健康自述记录
			fatherAdviceList = personalDataDetailService
					.findByFatherAdvicePersonalId(personalId);// 根据会员id查询会员的非子级调理建议记录
			childHealthList = personalDataDetailService
					.findByChildMemberId(personalId);// 根据会员id查询该会员的子级所有调理建议记录
			throughFeedbackList = personalDataDetailService
					.findByFeedbackMemberId(personalId);// 根据会员id查询该会员的所有效果反馈记录
			getRequest().setAttribute("tishi1", "fail1");
		} else if (tbReadmeList.get(0).getFeedbackState() != 0) {
			int personalId = (Integer) getRequest().getSession().getAttribute(
					"personalId");
			fatherHealthList = personalDataDetailService
					.findByFatherPersonalId(personalId);// 根据会员id查询会员的非子级健康自述记录
			fatherAdviceList = personalDataDetailService
					.findByFatherAdvicePersonalId(personalId);// 根据会员id查询会员的非子级调理建议记录
			childHealthList = personalDataDetailService
					.findByChildMemberId(personalId);// 根据会员id查询该会员的子级所有调理建议记录
			throughFeedbackList = personalDataDetailService
					.findByFeedbackMemberId(personalId);// 根据会员id查询该会员的所有效果反馈记录
			setForwardView(Refered_JSP);
			getRequest().setAttribute("tishi", "fail");
		} else {
			HttpServletRequest request = ServletActionContext.getRequest();
			/*System.out.println(getIdd() + "dsfgfd" + getMentorId() + "dsfgfd"
					+ getMentorId());*/
			int personalId = (Integer) getRequest().getSession().getAttribute(
					"personalId");
			fatherHealthList = personalDataDetailService
					.findByreadmeId(getIdd());// 根据健康自述id查询

			/*fatherAdviceList = personalDataDetailService
					.findByAdvicereadmeId(getIdd());// //根据会员健康自述id查询会员的非子级健康自述记录
*/			fatherAdviceList = personalDataDetailService	
        			.findByFatherAdvicePersonalId(personalId);// 根据会员id查询会员的所有调理建议记录
			childHealthList = personalDataDetailService
					.findByChildMemberId(personalId);// 根据会员id查询该会员的子级所有健康记录
			request.setAttribute("readmeId", getIdd());
			request.setAttribute("mentorId", getMentorId());
			setForwardView(FeedBack_JSP);
		}
    	return SUCCESS;
	}
	/**
	 * 
	* @Title: OpenFeedbackkk 
	* @author 软件开发中心   陈洁
	* @Description: 追加反馈界面（微信界面）
	* @return String 
	* @date 2017年7月7日 上午9:26:58 
	* @throws
	 */
	public String OpenFeedbackkk() throws Exception{  
		tbReadmeList=tbReadmeService.findFKtype(getIdd());
		
		//System.out.println(tbReadmeList.get(0).getFeedbackState());
		if (tbReadmeList.get(0).getReplyState() == 0) {
			setForwardView(Home_JSP);
			int personalId = (Integer) getRequest().getSession().getAttribute(
					"personalId");
			consult_number = tbReadmeService.findCS(personalId);// 统计已咨询记录条数
			answer_number = tbReadmeService.findFahterReplyPQ(personalId)
					.size();// 统计已回复记录条数
			feedback_nember = tbReadmeService
					.findFatherNoFeedbackPQ(personalId).size();// 统计未反馈记录条数
			getRequest().setAttribute("consult_number", consult_number);// 将数据通过request传到前台
			getRequest().setAttribute("answer_number", answer_number);
			getRequest().setAttribute("feedback_nember", feedback_nember);
			fatherHealthList = personalDataDetailService
					.findByFatherPersonalId(personalId);// 根据会员id查询会员的非子级健康自述记录
			fatherAdviceList = personalDataDetailService
					.findByFatherAdvicePersonalId(personalId);// 根据会员id查询会员的非子级调理建议记录
			childHealthList = personalDataDetailService
					.findByChildMemberId(personalId);// 根据会员id查询该会员的子级所有调理建议记录
			throughFeedbackList = personalDataDetailService
					.findByFeedbackMemberId(personalId);// 根据会员id查询该会员的所有效果反馈记录
			getRequest().setAttribute("tishi1", "fail1");
			contentList = orService.coverNewsList(con, getPage(), getRow());//学习园地
		} else if (tbReadmeList.get(0).getFeedbackState() != 0) {
			int personalId = (Integer) getRequest().getSession().getAttribute(
					"personalId");
			//tbPersonalData1= tbPersonalDataService.findTh();//查询所有导师数据
			consult_number = tbReadmeService.findCS(personalId);// 统计已咨询记录条数
			answer_number = tbReadmeService.findFahterReplyPQ(personalId)
					.size();// 统计已回复记录条数
			feedback_nember = tbReadmeService
					.findFatherNoFeedbackPQ(personalId).size();// 统计未反馈记录条数
			getRequest().setAttribute("consult_number", consult_number);// 将数据通过request传到前台
			getRequest().setAttribute("answer_number", answer_number);
			getRequest().setAttribute("feedback_nember", feedback_nember);
			fatherHealthList = personalDataDetailService
					.findByFatherPersonalId(personalId);// 根据会员id查询会员的非子级健康自述记录
			/*fatherAdviceList = personalDataDetailService
					.findByFatherAdvicePersonalId(personalId);// 根据会员id查询会员的非子级调理建议记录*/
			childHealthList = personalDataDetailService
					.findByChildMemberId(personalId);// 根据会员id查询该会员的子级所有健康自述记录
					
			fatherAdviceList = personalDataDetailService	
		             .findByFatherAdvicePersonalId(personalId);// 根据会员id查询会员的所有调理建议记录
			throughFeedbackList = personalDataDetailService
					.findByFeedbackMemberId(personalId);// 根据会员id查询该会员的所有效果反馈记录
			contentList = orService.coverNewsList(con, getPage(), getRow());//学习园地
			setForwardView(Home_JSP);
			getRequest().setAttribute("tishi", "fail");
		} else {
			HttpServletRequest request = ServletActionContext.getRequest();
			/*System.out.println(getIdd() + "dsfgfd" + getMentorId() + "dsfgfd"
					+ getMentorId());*/
			int personalId = (Integer) getRequest().getSession().getAttribute(
					"personalId");
			fatherHealthList = personalDataDetailService
					.findByreadmeId(getIdd());// 根据健康自述id查询非子级健康自述记录

			fatherAdviceList = personalDataDetailService	
		             .findByFatherAdvicePersonalId(personalId);// 根据会员id查询会员的所有调理建议记录
			childHealthList = personalDataDetailService
					.findByChildMemberId(personalId);// 根据会员id查询该会员的子级所有健康记录
			request.setAttribute("readmeId", getIdd());
			request.setAttribute("mentorId", getMentorId());
			setForwardView(FeedBack_JSP);
		}
    	return SUCCESS;
	}
	/**
	 * 
	* @Title: OpenMemberDetails 
	* @author 软件开发中心   陈洁
	* @Description: 会员详情界面（微信界面）
	* @return String 
	* @date 2017年7月7日 上午9:28:22 
	* @throws
	 */
	public String OpenMemberDetails() throws Exception{ 
		
		tbPersonalData2=tbPersonalDataService.findById(getIdd());
		fatherHealthList = personalDataDetailService.findByFatherPersonalId(getIdd());//根据会员id查询会员的非子级健康自述记录
		fatherAdviceList = personalDataDetailService.findByFatherAdvicePersonalId(getIdd());//根据会员id查询会员的所有调理建议记录
		childHealthList = personalDataDetailService
				.findByChildMemberId(getIdd());// 根据会员id查询该会员的子级所有健康记录
		throughFeedbackList = personalDataDetailService.findByFeedbackMemberId(getIdd());//根据会员id查询该会员的所有效果反馈记录
		setForwardView(RECORDS1_JSP); 
    	return SUCCESS;
	}
	
	/**
	 * 
	* @Title: openRefered 
	* @author 软件开发中心   陈洁
	* @Description: 已咨询界面，查询出健康自述  调理建议  效果反馈（微信界面）
	* @return String 
	* @date 2017年7月7日 上午9:28:42 
	* @throws
	 */
	public String openRefered() throws Exception{
		int personalId= (Integer) getRequest().getSession().getAttribute("personalId");
		fatherHealthList = personalDataDetailService.findByFatherPersonalId(personalId);//根据会员id查询会员的非子级健康自述记录
		fatherAdviceList = personalDataDetailService.findByFatherAdvicePersonalId(personalId);//根据会员id查询会员的非子级调理建议记录
		childHealthList = personalDataDetailService.findByChildMemberId(personalId);//根据会员id查询该会员的子级所有调理建议记录
		throughFeedbackList = personalDataDetailService.findByFeedbackMemberId(personalId);//根据会员id查询该会员的所有效果反馈记录
		setForwardView(Refered_JSP); 
    	return SUCCESS;
	}
	
	/**
	 * 打开追加回复界面
	 * @return
	 * @throws Exception
	 * @author 莫然源
	 * @date 2015.8.8
	 */
	public String openAddiAdvice() throws Exception{
		
		tbReadmeList = tbReadmeService.findByReadmeId(idd);//根据健康自述id查询对应记录
        
		
		if(tbReadmeList.get(0).getFeedbackState()==1){//若会员已进行过反馈，则返回原来的界面并提示无需追加回复
			int personalId=(Integer) getRequest().getSession().getAttribute("personalId");
			fatherPreviousquestions=tbReadmeService.findFatherPQ(personalId);
			adviceList=tbReadmeService.findAdviceByMentorId(personalId);
			tbFeedback=tbReadmeService.findFoodbackByMentorId(personalId);
			childPreviousquestions=tbReadmeService.findChildPQ(personalId);
			advice_nember=tbReadmeService.findFatherPQ(personalId).size();//统计导师服务记录条数
			getRequest().setAttribute("advice_nember",advice_nember);//将统计到的数量放进request传到前台
		getRequest().setAttribute("fail","fail");//将统计到的数量放进request传到前台
		setForwardView(SERVICERE_JSP); 
    	return SUCCESS;
		}else{
		getRequest().setAttribute("fatherId",idd2);//将统计到的数量放进request传到前台	
		getRequest().setAttribute("readmeId",idd);//将健康自述ID放进request传到前台	
		getRequest().setAttribute("memberId",idd1);//将會員ID放进request传到前台	
		setForwardView(ADDIADVICE_JSP); 
    	return SUCCESS;
		}
		
	}
	
	

	@Override
	public Object getModel() {
		
		return tbAdvice;
	}

	public TbAdvice getTbAdvice() {
		return tbAdvice;
	}

	public void setTbAdvice(TbAdvice tbAdvice) {
		this.tbAdvice = tbAdvice;
	}

	public TbReadme getTbReadme() {
		return tbReadme;
	}

	public void setTbReadme(TbReadme tbReadme) {
		this.tbReadme = tbReadme;
	}

	public TbReadmeService getTbReadmeService() {
		return tbReadmeService;
	}

	public void setTbReadmeService(TbReadmeService tbReadmeService) {
		this.tbReadmeService = tbReadmeService;
	}

	public List<TbAdvice> getTbAdviceList() {
		return tbAdviceList;
	}

	public void setTbAdviceList(List<TbAdvice> tbAdviceList) {
		this.tbAdviceList = tbAdviceList;
	}

	public List<TbPersonalData> getTbPersonalData1() {
		return tbPersonalData1;
	}

	public void setTbPersonalData1(List<TbPersonalData> tbPersonalData1) {
		this.tbPersonalData1 = tbPersonalData1;
	}

	public List<TbPersonalData> getTbPersonalDataList() {
		return tbPersonalDataList;
	}

	public void setTbPersonalDataList(List<TbPersonalData> tbPersonalDataList) {
		this.tbPersonalDataList = tbPersonalDataList;
	}

	public TbPersonalData getTbPersonalData() {
		return tbPersonalData;
	}

	public void setTbPersonalData(TbPersonalData tbPersonalData) {
		this.tbPersonalData = tbPersonalData;
	}

	public TbFeedbackService getTbFeedbackService() {
		return tbFeedbackService;
	}

	public void setTbFeedbackService(TbFeedbackService tbFeedbackService) {
		this.tbFeedbackService = tbFeedbackService;
	}

	public TbFeedback getTbfeedback() {
		return tbfeedback;
	}

	public void setTbfeedback(TbFeedback tbfeedback) {
		this.tbfeedback = tbfeedback;
	}

	public List<TbFeedback> getTbFeedbackList() {
		return tbFeedbackList;
	}

	public void setTbFeedbackList(List<TbFeedback> tbFeedbackList) {
		this.tbFeedbackList = tbFeedbackList;
	}

	public List<ReferData> getReferDataList() {
		return referDataList;
	}

	public void setReferDataList(List<ReferData> referDataList) {
		this.referDataList = referDataList;
	}

	public int getIdd() {
		return idd;
	}

	public void setIdd(int idd) {
		this.idd = idd;
	}

	public List<TbReadme> getFatherHealthList() {
		return fatherHealthList;
	}

	public void setFatherHealthList(List<TbReadme> fatherHealthList) {
		this.fatherHealthList = fatherHealthList;
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

	public FatherHealth getFatherHealth() {
		return fatherHealth;
	}

	public void setFatherHealth(FatherHealth fatherHealth) {
		this.fatherHealth = fatherHealth;
	}

	public ThroughFeedback getThroughFeedback() {
		return throughFeedback;
	}

	public void setThroughFeedback(ThroughFeedback throughFeedback) {
		this.throughFeedback = throughFeedback;
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

	public List<TbAdvice> getFatherAdviceList() {
		return fatherAdviceList;
	}

	public void setFatherAdviceList(List<TbAdvice> fatherAdviceList) {
		this.fatherAdviceList = fatherAdviceList;
	}

	public int getPersonalid() {
		return personalid;
	}

	public void setPersonalid(int personalid) {
		this.personalid = personalid;
	}

	public TbPersonalData getTbPersonalData2() {
		return tbPersonalData2;
	}

	public void setTbPersonalData2(TbPersonalData tbPersonalData2) {
		this.tbPersonalData2 = tbPersonalData2;
	}





	public List<TbReadme> getChildPreviousquestions() {
		return childPreviousquestions;
	}

	public void setChildPreviousquestions(List<TbReadme> childPreviousquestions) {
		this.childPreviousquestions = childPreviousquestions;
	}

	public List<TbReadme> getFatherPreviousquestions() {
		return fatherPreviousquestions;
	}

	public void setFatherPreviousquestions(List<TbReadme> fatherPreviousquestions) {
		this.fatherPreviousquestions = fatherPreviousquestions;
	}



	public List<TbAdvice> getAdviceList() {
		return adviceList;
	}

	public void setAdviceList(List<TbAdvice> adviceList) {
		this.adviceList = adviceList;
	}

	public List<TbFeedback> getTbFeedback() {
		return tbFeedback;
	}

	public void setTbFeedback(List<TbFeedback> tbFeedback) {
		this.tbFeedback = tbFeedback;
	}

	public int getIdd1() {
		return idd1;
	}

	public void setIdd1(int idd1) {
		this.idd1 = idd1;
	}

	public int getIdd2() {
		return idd2;
	}

	public void setIdd2(int idd2) {
		this.idd2 = idd2;
	}

	public int getIdd3() {
		return idd3;
	}

	public void setIdd3(int idd3) {
		this.idd3 = idd3;
	}

	public List<MyAppointment> getTbReadmeList1() {
		return tbReadmeList1;
	}

	public void setTbReadmeList1(List<MyAppointment> tbReadmeList1) {
		this.tbReadmeList1 = tbReadmeList1;
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

	public Result<Content> getContentList() {
		return contentList;
	}

	public void setContentList(Result<Content> contentList) {
		this.contentList = contentList;
	}
	public Content getCon() {
		return con;
	}
	public void setCon(Content con) {
		this.con = con;
	}

	public List<MyAppointment> getMyAppointment() {
		return myAppointment;
	}

	public void setMyAppointment(List<MyAppointment> myAppointment) {
		this.myAppointment = myAppointment;
	}
	
}
