package com.gxuwz.KeepHealth.business.action.web;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.commons.httpclient.HttpConnection;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import util.MyTime;

import com.gxuwz.KeepHealth.business.entity.Content;
import com.gxuwz.KeepHealth.business.entity.MentorServicesStatistics;
import com.gxuwz.KeepHealth.business.entity.TbAdvice;
import com.gxuwz.KeepHealth.business.entity.TbFeedback;
import com.gxuwz.KeepHealth.business.entity.TbPersonalData;
import com.gxuwz.KeepHealth.business.entity.TbReadme;
import com.gxuwz.KeepHealth.business.entity.ThroughFeedback;
import com.gxuwz.KeepHealth.business.entity.listserviceNumber;
import com.gxuwz.KeepHealth.business.service.ContentService;
import com.gxuwz.KeepHealth.business.service.PersonalDataDetailService;
import com.gxuwz.KeepHealth.business.service.TbFeedbackService;
import com.gxuwz.KeepHealth.business.service.TbPersonalDataService;
import com.gxuwz.KeepHealth.business.service.TbReadmeService;
import com.gxuwz.core.pagination.Result;
import com.gxuwz.core.web.action.BaseAction;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

/**
 * 用户反馈表控制器
 * @author  梧州学院 软件研发中心 陆云秋
 * <br>Copyright (C), 2017, 梧州学院 软件研发中心
 * <br>This program is protected by copyright laws.
 * <br>Program Name: TbFeedbackAction
 * <br>Date: 2017-03-01
 */
@SuppressWarnings({ "rawtypes", "unused" })
public class TbFeedbackAction extends BaseAction implements Preparable, ModelDriven{
	private static final long serialVersionUID = -4104125263890869018L;
	protected static final String MEMBER_JSP = "/weixin/Member_home.jsp";
	protected static final String TeacherCount_JSP = "/WEB-INF/page/web/health_manage/Teacher_count.jsp";
	protected final Log logger=LogFactory.getLog(getClass());

	
	@Autowired
	private TbReadmeService tbReadmeService;//健康自述接口
	@Autowired
	private TbFeedbackService tbFeedbackService;//效果反馈接口
	@Autowired
	private TbPersonalDataService tbPersonalDataService;//个人数据表接口
	@Autowired
	private ContentService orService;	//用户信息处理接口
	private Result<Content> contentList;//新闻信息集合
	private Content con;//新闻信息模型
	private TbPersonalData tbPersonalData; //个人数据模型
	private List<TbPersonalData> tbPersonalData1;//个人数据列表
    private TbFeedback tbfeedback;//效果反馈表模型
    private TbReadme tbReadme;//健康自述模型
    private List<TbPersonalData> tbPersonalDataList;//个人数据列表
    private List<MentorServicesStatistics> mentorServicesStatisticsList;//导师服务统计列表
   	private List<listserviceNumber> listserviceNumberList;//各个导师的总服务数量列表
   	@Autowired
	private PersonalDataDetailService personalDataDetailService; //个人数据详情接口（查询结果封装层）
   	private MentorServicesStatistics mentorServicesStatistics;//导师服务统计模型层（查询结果封装层）
   	private List<MentorServicesStatistics> pageResult2;//导师服务统计列表
   	private List<listserviceNumber> pageResult1;
	private List<TbReadme> fatherHealthList;//父级健康自述列表
	private List<TbAdvice> fatherAdviceList;//父级调理建议列表
	private List<TbReadme> childHealthList;//子级健康自述列表
	private List<ThroughFeedback> throughFeedbackList;//效果反馈列表（对多表查询结果进行封装）
	private Result<TbPersonalData> pageResult;//分页
	private int personalId;//个人数据ID
	int consult_number = 0;//已咨询数量
	int answer_number = 0;//已答复数量
	int advice_nember = 0;//导师服务数量
	int feedback_nember = 0;//未反馈数量
	private String mark ;//标记用户点击的是哪个按钮
	@Override	
	public void prepare() throws Exception{
		if(null == tbfeedback){
			tbfeedback = new TbFeedback();
		}
		if(null == mentorServicesStatistics){
			mentorServicesStatistics = new MentorServicesStatistics();
		}
		if(null == tbPersonalData){
			tbPersonalData = new TbPersonalData();
		}
	}
	@Override
	public Object getModel() {
		return tbfeedback;
	}
	@Override
	public String execute() throws Exception {
		return SUCCESS;
	}
	
	/**
	 * 追加反馈
	 * @return
	 * @throws Exception
	 * @author 陆云秋   
	 * @data 2017/3/19
	 * */
	public String add(){
		HttpServletRequest request =ServletActionContext.getRequest();
		if(tbfeedback.getStarEvaluation()==null){
			tbfeedback.setStarEvaluation(5);
		}
		int personalId= (Integer) getRequest().getSession().getAttribute("personalId");
   	    //String name=(String)getRequest().getSession().getAttribute("Name");
 		//获取当前系统时间
		String time = MyTime.getStringDate();
		/*Date date=new Date();
		DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = format.format(date); */
		Timestamp feedbackTime = Timestamp.valueOf(time);//把String 类型转换成 Timestamp 类型
		tbfeedback.setMemberId(personalId);
		tbfeedback.setFeedbackTime(feedbackTime);
		//System.out.println(tbfeedback.getStarEvaluation());
	    tbFeedbackService.addFeedback(tbfeedback);//,personalid);
	    //int id = tbfeedback.getReadmeId();//取调理建议表对应的健康自述的id值
	   // System.out.println(tbfeedback.getReadmeId());
	    tbReadmeService.updateReadmeback(tbfeedback.getReadmeId());//根据id值更新个人数据表的反馈状态字段
	   //tbPersonalData1= tbPersonalDataService.findTh();//查询所有导师数据
	    consult_number=tbReadmeService.findCS(personalId);//统计已咨询记录条数
		answer_number=tbReadmeService.findFahterReplyPQ(personalId).size();//统计已回复记录条数
		feedback_nember=tbReadmeService.findFatherNoFeedbackPQ(personalId).size();//统计未反馈记录条数
		getRequest().setAttribute("consult_number",consult_number);//将数据通过request传到前台
		getRequest().setAttribute("feedback_nember",feedback_nember);
		getRequest().setAttribute("answer_number",answer_number);
		fatherHealthList = personalDataDetailService.findByFatherPersonalId(personalId);//根据会员id查询会员的非子级健康自述记录
		fatherAdviceList = personalDataDetailService.findByFatherAdvicePersonalId(personalId);//根据会员id查询会员的所有调理建议记录
		childHealthList = personalDataDetailService.findByChildMemberId(personalId);//根据会员id查询该会员的子级所有健康记录
		throughFeedbackList = personalDataDetailService.findByFeedbackMemberId(personalId);//根据会员id查询该会员的所有效果反馈记录
		contentList = orService.coverNewsList(con, getPage(), getRow());//学习园地
		request.setAttribute("alert","success");
		setForwardView(MEMBER_JSP);
		return SUCCESS;
	}
	
	
	/**
	 * 打开导师服务统计界面并显示所有导师的服务数量（web界面）
	 * @throws Exception
	 * @author 陈洁
	 * @Date 2017.03.24
	 */
	@SuppressWarnings("unchecked")
	public String openMentorServicesStatistics() throws Exception{
		if ("".equals(tbPersonalData.getPersonalNumber())) {
			tbPersonalData.setPersonalNumber(null);
		}
		if ("".equals(tbPersonalData.getRealName())) {
			tbPersonalData.setRealName(null);
		}
		if ("".equals(mentorServicesStatistics.getTime1())) {
			mentorServicesStatistics.setTime1(null);
		}
		if ("".equals(mentorServicesStatistics.getTime2())) {
			mentorServicesStatistics.setTime2(null);
		}
		pageResult = tbPersonalDataService.findAllMentor(tbPersonalData,
				getPage(), getRow());// 查询所有导师 分页 用于页面显示
		pageResult2 = personalDataDetailService
				.findServicesList(mentorServicesStatistics);// 查询每个导师的服务数量
		pageResult1 = personalDataDetailService
				.findserviceNumberList(mentorServicesStatistics);// 查询每个导师的总服务数量
		tbPersonalDataList = tbPersonalDataService
				.findAllMentorExcel(tbPersonalData);// 查询所有导师 list 用于Excel导出
		// 清除session 每次查询都清除原session存有的数据
		HttpSession session = getRequest().getSession();
		session.removeAttribute("tbPersonalDataList");
		session.removeAttribute("listserviceNumberList");
		session.removeAttribute("mentorServicesStatisticsList");
		// 将查询得到的结果存进session 便于导出Excel文件
		getRequest().getSession().setAttribute("tbPersonalDataList",
				tbPersonalDataList);
		getRequest().getSession().setAttribute("listserviceNumberList",
				pageResult1);
		getRequest().getSession().setAttribute("mentorServicesStatisticsList",
				pageResult2);
		setForwardView(TeacherCount_JSP);
		return SUCCESS;
	}

	
	public TbFeedback getTbfeedback() {
		return tbfeedback;
	}
	public void setTbfeedback(TbFeedback tbfeedback) {
		this.tbfeedback = tbfeedback;
	}
	public int getPersonalId() {
		return personalId;
	}
	public void setPersonalId(int personalId) {
		this.personalId = personalId;
	}
	public TbFeedbackService getTbFeedbackService() {
		return tbFeedbackService;
	}
	public void setTbFeedbackService(TbFeedbackService tbFeedbackService) {
		this.tbFeedbackService = tbFeedbackService;
	}
	public List<TbPersonalData> getTbPersonalDataList() {
		return tbPersonalDataList;
	}
	public void setTbPersonalDataList(List<TbPersonalData> tbPersonalDataList) {
		this.tbPersonalDataList = tbPersonalDataList;
	}
	public MentorServicesStatistics getMentorServicesStatistics() {
		return mentorServicesStatistics;
	}
	public void setMentorServicesStatistics(MentorServicesStatistics mentorServicesStatistics) {
		this.mentorServicesStatistics = mentorServicesStatistics;
	}

	public TbPersonalData getTbPersonalData() {
		return tbPersonalData;
	}
	public void setTbPersonalData(TbPersonalData tbPersonalData) {
		this.tbPersonalData = tbPersonalData;
	}
	public List<TbPersonalData> getTbPersonalData1() {
		return tbPersonalData1;
	}
	public void setTbPersonalData1(List<TbPersonalData> tbPersonalData1) {
		this.tbPersonalData1 = tbPersonalData1;
	}
	public TbReadme getTbReadme() {
		return tbReadme;
	}
	public void setTbReadme(TbReadme tbReadme) {
		this.tbReadme = tbReadme;
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
	public List<listserviceNumber> getPageResult1() {
		return pageResult1;
	}
	public void setPageResult1(List<listserviceNumber> pageResult1) {
		this.pageResult1 = pageResult1;
	}
	public List<MentorServicesStatistics> getPageResult2() {
		return pageResult2;
	}
	public void setPageResult2(List<MentorServicesStatistics> pageResult2) {
		this.pageResult2 = pageResult2;
	}
	public Result<TbPersonalData> getPageResult() {
		return pageResult;
	}
	public void setPageResult(Result<TbPersonalData> pageResult) {
		this.pageResult = pageResult;
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
	public String getMark() {
		return mark;
	}
	public void setMark(String mark) {
		this.mark = mark;
	}


}
