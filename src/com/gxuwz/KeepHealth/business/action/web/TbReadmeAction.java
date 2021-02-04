package com.gxuwz.KeepHealth.business.action.web;

import java.util.List;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import util.MyTime;

import com.gxuwz.KeepHealth.business.entity.Content;
import com.gxuwz.KeepHealth.business.entity.FatherHealth;
import com.gxuwz.KeepHealth.business.entity.HealthRecord;
import com.gxuwz.KeepHealth.business.entity.PersonalDataDetail;
import com.gxuwz.KeepHealth.business.entity.TbAdvice;
import com.gxuwz.KeepHealth.business.entity.TbFeedback;
import com.gxuwz.KeepHealth.business.entity.TbPersonalData;
import com.gxuwz.KeepHealth.business.entity.TbReadme;
import com.gxuwz.KeepHealth.business.entity.ThroughFeedback;
import com.gxuwz.KeepHealth.business.service.ContentService;
import com.gxuwz.KeepHealth.business.service.PersonalDataDetailService;
import com.gxuwz.KeepHealth.business.service.TbAdviceService;
import com.gxuwz.KeepHealth.business.service.TbPersonalDataService;
import com.gxuwz.KeepHealth.business.service.TbReadmeService;
import com.gxuwz.core.pagination.Result;
import com.gxuwz.core.web.action.BaseAction;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
/**
 * 健康自述表控制器
 * @author  梧州学院 软件研发中心 陈洁
 * <br>Copyright (C), 2017, 梧州学院 软件研发中心
 * <br>This program is protected by copyright laws.
 * <br>Program Name: TbReadmeAction
 * <br>Date: 2017-03-01
 */
public class TbReadmeAction extends BaseAction implements Preparable,
		ModelDriven {

	private static final long serialVersionUID = -4104125263890869018L;
	protected static final String MEMBER_JSP = "/weixin/Member_home.jsp";
	protected static final String REGULATE_JSP = "/weixin/Regulate_advice.jsp";
	protected static final String HealthRecord_JSP = "/WEB-INF/page/web/health_manage/Health_record.jsp";
	protected static final String PersonalData_JSP = "/WEB-INF/page/web/health_manage/Personal_data.jsp";
	protected static final String SERVICE_JSP = "/weixin/Service_record.jsp";
	protected static final String NOFEED_JSP = "/weixin/Nofeedback_record.jsp";
	protected static final String REPLIED_JSP = "/weixin/Replied_record.jsp";
	protected static final String MENTORDE_JSP = "/weixin/mentor_personal_details.jsp";
	@Autowired
	private TbReadmeService tbReadmeService;// 健康自述接口
	@Autowired
	private TbAdviceService tbAdviceService;// 调理建议接口
	@Autowired
	private TbPersonalDataService tbPersonalService;// 个人数据表接口
	@Autowired
	private ContentService orService; // 用户信息处理接口

	private Result<Content> contentList;// 新闻信息集合
	private Content con;// 新闻信息模型
	private TbReadme tbReadme; // 健康自述表模型
	private TbAdvice tbAdvice;// 调理建议表模型
	private HealthRecord healthRecord;// 健康记录模型（封装多表查询得到的结果）
	@Autowired
	private TbPersonalDataService tbPersonalDataService;

	private TbPersonalData tbPersonalData; // 个人数据表模型
	private List<TbPersonalData> tbPersonalDataa;// 个人数据表列表
	private List<TbPersonalData> tbPersonalData1;
	private List<TbReadme> tbReadmeList;// 健康自述列表
	private List<TbReadme> tbReadmelie;
	private List<TbAdvice> adviceList;// 调理建议列表
	private List<TbFeedback> tbFeedback;// 效果反馈列表
	private PersonalDataDetail personalDataDetail;// 个人数据详情模型（封装多表查询得到的结果）
	private List<PersonalDataDetail> PersonalDataDetailList;// 个人数据详情列表
	private List<TbReadme> fatherPreviousquestions;// 父级健康自述列表，即fatherID=0的记录
	private List<TbReadme> childPreviousquestions;// 子级调理建议列表，即fatherID!=0的记录

	@Autowired
	private PersonalDataDetailService personalDataDetailService;
	private Result<HealthRecord> pageResult; // 分页
	private List<TbReadme> fatherHealthList;// 父级健康自述列表，即fatherID=0的记录
											// （多表查询得到的结果）
	private List<TbAdvice> fatherAdviceList;// 父级调理建议列表，即fatherID=0的记录
											// （多表查询得到的结果）
	private List<TbAdvice> childAdviceList;// 子级调理建议列表，即fatherID=0的记录
											// （多表查询得到的结果）
	private List<TbReadme> childHealthList;// 子级健康自述列表，即fatherID!=0的记录
											// （多表查询得到的结果）
	private List<ThroughFeedback> throughFeedbackList;
	private Result<FatherHealth> fatherHealthResult;// 分页
	private Result<TbAdvice> fatherAdviceResult;// 分页
	private Result<ThroughFeedback> throughFeedbackResult;// 分页
	private int personalid = 0;// 个人数据ID
	private String name = "";// 名称
	int consult_number = 0;// 已咨询记录条数
	int answer_number = 0;// 已回复记录条数
	int advice_nember = 0;// 导师服务记录条数
	int feedback_nember = 0;// 已反馈记录条数

	public void prepare() throws Exception {
		if (null == tbReadme) {
			tbReadme = new TbReadme();
		}
	}

	@Override
	public String execute() throws Exception {

		return SUCCESS;
	}

	/**
	 * 添加健康自述（微信界面）
	 * 
	 * @return
	 * @throws Exception
	 * @author 陈洁
	 * @date 2017.03.22
	 */
	public String add() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		int personalId = (Integer) getRequest().getSession().getAttribute(
				"personalId");
		String name = (String) getRequest().getSession().getAttribute(
				"realName");
		// 获取当前系统时间
		String time = MyTime.getStringDate();
		/*
		 * Date date=new Date(); DateFormat format=new
		 * SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); String time =
		 * format.format(date);
		 */
		Timestamp adviceTime = Timestamp.valueOf(time);// 把String 类型转换成
														// Timestamp 类型
		if (tbReadme.getMentorId() != 0) {
			String name1 = tbPersonalDataService.findById(
					tbReadme.getMentorId()).getRealName();
			tbReadme.setMentorName(name1);
		}else{
			tbReadme.setMentorName("");
		}
		tbReadme.setReadmeTime(adviceTime);
		tbReadme.setPersonalId(personalId);
		tbReadme.setMemberName(name);
		tbReadme.setFatherId(0);
		tbReadme.setReplyState(0);
		tbReadme.setFeedbackState(0);
		// tbPersonalDataa= tbPersonalDataService.findTh();//查询所有导师数据
		tbReadmeService.addReadme(tbReadme);// 增加健康自述记录
		// tbPersonalData1= tbPersonalDataService.findTh();//查询所有导师数据
		consult_number = tbReadmeService.findCS(personalId);// 统计已咨询记录条数
		answer_number = tbReadmeService.findFahterReplyPQ(personalId).size();// 统计已回复记录条数
		feedback_nember = tbReadmeService.findFatherNoFeedbackPQ(personalId)
				.size();// 统计未反馈记录条数
		getRequest().setAttribute("consult_number", consult_number);// 将数据通过request传到前台
		getRequest().setAttribute("feedback_nember", feedback_nember);
		getRequest().setAttribute("answer_number", answer_number);
		fatherHealthList = personalDataDetailService
				.findByFatherPersonalId(personalId);// 根据会员id查询会员的非子级健康自述记录
		fatherAdviceList = personalDataDetailService
				.findByFatherAdvicePersonalId(personalId);// 根据会员id查询会员的所有调理建议记录
		childHealthList = personalDataDetailService
				.findByChildMemberId(personalId);// 根据会员id查询该会员的子级所有健康记录
		throughFeedbackList = personalDataDetailService
				.findByFeedbackMemberId(personalId);// 根据会员id查询该会员的所有效果反馈记录
		contentList = orService.coverNewsList(con, getPage(), getRow());// 学习园地
		request.setAttribute("alert", "success");
		setForwardView(MEMBER_JSP);
		return SUCCESS;
	}

	/**
	 * 追加提问（微信界面）
	 * 
	 * @return
	 * @throws Exception
	 * @author 陈洁
	 * @date 2017.03.22
	 */
	public String addZhuijia() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		int personalId = (Integer) getRequest().getSession().getAttribute(
				"personalId");
		String name = (String) getRequest().getSession().getAttribute("Name");
		// 获取当前系统时间
		String time = MyTime.getStringDate();
		/*
		 * Date date=new Date(); DateFormat format=new
		 * SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); String time =
		 * format.format(date);
		 */
		Timestamp adviceTime = Timestamp.valueOf(time);// 把String 类型转换成
														// Timestamp 类型
		String name1 = tbPersonalDataService.findById(tbReadme.getMentorId())
				.getRealName();
		tbReadme.setMentorName(name1);
		tbReadme.setReadmeTime(adviceTime);
		tbReadme.setPersonalId(personalId);
		// System.out.println("6666666"+tbReadme.getFatherId());
		tbReadme.setMemberName(name);
		tbReadme.setReplyState(0);
		tbReadme.setFeedbackState(0);
		tbReadmeService.addReadme(tbReadme);// 增加健康自述记录
		// tbPersonalData1= tbPersonalDataService.findTh();//查询所有导师数据
		consult_number = tbReadmeService.findCS(personalId);// 统计已咨询记录条数
		answer_number = tbReadmeService.findFahterReplyPQ(personalId).size();// 统计已回复记录条数
		feedback_nember = tbReadmeService.findFatherNoFeedbackPQ(personalId)
				.size();// 统计未反馈记录条数
		getRequest().setAttribute("consult_number", consult_number);// 将数据通过request传到前台
		getRequest().setAttribute("feedback_nember", feedback_nember);
		getRequest().setAttribute("answer_number", answer_number);
		fatherHealthList = personalDataDetailService
				.findByFatherPersonalId(personalId);// 根据会员id查询会员的非子级健康自述记录
		fatherAdviceList = personalDataDetailService
				.findByFatherAdvicePersonalId(personalId);// 根据会员id查询会员的所有调理建议记录
		childHealthList = personalDataDetailService
				.findByChildMemberId(personalId);// 根据会员id查询该会员的子级所有健康记录
		throughFeedbackList = personalDataDetailService
				.findByFeedbackMemberId(personalId);// 根据会员id查询该会员的所有效果反馈记录
		contentList = orService.coverNewsList(con, getPage(), getRow());// 学习园地
		request.setAttribute("alert", "success");
		setForwardView(MEMBER_JSP);
		return SUCCESS;
	}

	/**
	 * 查询出会员以及健康自述的内容（微信界面）
	 * 
	 * @return
	 * @throws Exception
	 * @author 陈洁
	 * @Date 2017.03.22
	 */

	public String OpenRegulateAdvice() throws Exception {
		tbPersonalData1 = tbPersonalDataService.findByPersonalId(tbReadme
				.getPersonalId());// 根据会员id查询出会员资料
		tbReadmeList = tbReadmeService.findByReadmeId(tbReadme.getReadmeId());// 根据健康自述id查询对应记录
		setForwardView(REGULATE_JSP);
		return SUCCESS;
	}

	/**
	 * 健康数据记录（web界面）
	 * 
	 * @return
	 * @throws Exception
	 * @author 陈洁
	 * @Date 2017.03.23
	 */
	public String openHealthRecord() throws Exception {
		int personalId = getPersonalid();// 获取前台传过来的数据
		String aa = getName();
		aa = new String(aa.getBytes("ISO8859-1"), "UTF-8");
		fatherHealthResult = personalDataDetailService.findByPersonalId(
				personalId, getPage(), getRow());// 根据会员id查询会员所有健康自述记录
		fatherAdviceList = personalDataDetailService
				.findByAdvicePersonalId(personalId);// 根据会员id查询会员所有调理建议记录
		throughFeedbackList = personalDataDetailService
				.findByFeedbackMemberId(personalId);// 根据会员id查询该会员的所有效果反馈记录
		getRequest().setAttribute("name", aa);
		getRequest().setAttribute("personalid", personalId);
		setForwardView(HealthRecord_JSP);
		return SUCCESS;
	}

	/**
	 * 健康数据记录详细数据（web界面）
	 * 
	 * @return
	 * @throws Exception
	 * @author 陈洁
	 * @Date 2017.03.24
	 */
	public String openHealthRecordDetail() throws Exception {
		int reameId = tbReadme.getReadmeId();// 获取前台传过来的数据
		int personalId = getPersonalid();// 获取前台传过来的数据
		String aa = getName();
		aa = new String(aa.getBytes("ISO8859-1"), "UTF-8");
		// System.out.println("shabi"+reameId);
		PersonalDataDetailList = personalDataDetailService
				.findByReadmeId(reameId);// 根据健康自述id查询会员信息
		fatherHealthList = personalDataDetailService.findByreadmeId(reameId);// 根据健康自述id查询
		fatherAdviceList = personalDataDetailService
				.findByFatherAdvicePersonalId(personalId);// 根据会员id查询会员的非追加调理建议记录
		// childAdviceList =
		// personalDataDetailService.findByFatherAdvice1PersonalId(personalId);//根据会员id查询会员的所有追加调理建议记录
		// System.out.println(childAdviceList.size()+"jjjjj");
		childHealthList = personalDataDetailService
				.findByChildMemberId(personalId);// 根据会员id查询该记录的子级所有健康自述记录
		throughFeedbackList = personalDataDetailService
				.findByFeedbackMemberId(personalId);// 根据会员id查询该会员的所有效果反馈记录
		getRequest().setAttribute("name", aa);
		setForwardView(PersonalData_JSP);
		return SUCCESS;
	}

	/**
	 * 以往作答列表
	 * 
	 * @return
	 * @throws Exception
	 * @author 莫然源
	 * @Date 2017.03.27
	 */
	public String listPQ() throws Exception {
		int personalId = (Integer) getRequest().getSession().getAttribute(
				"personalId");
		// 获取保存在session里的导师id。
		fatherPreviousquestions = tbReadmeService.findFatherPQ(personalId);// 查询该导师所有fatherId=0的咨询记录
		adviceList = tbReadmeService.findAdviceByMentorId(personalId);// 查询该导师所有的调理建议
		tbFeedback = tbReadmeService.findFoodbackByMentorId(personalId);// 查询该导师所有的效果反馈
		childPreviousquestions = tbReadmeService.findChildPQ(personalId);// 查询该导师所有fatherId!=0的咨询记录
		advice_nember = tbReadmeService.findFatherPQ(personalId).size();// 统计导师服务记录条数
		getRequest().setAttribute("advice_nember", advice_nember);// 将统计到的数量放进request传到前台
		setForwardView(SERVICE_JSP);
		return SUCCESS;
	}

	/**
	 * 未反馈
	 * 
	 * @return
	 * @throws Exception
	 * @author 莫然源
	 * @Date 2017.03.27
	 */
	public String listFK() throws Exception {
		int personalId = (Integer) getRequest().getSession().getAttribute(
				"personalId");
		// 获取保存在session里的用户id。
		fatherPreviousquestions = tbReadmeService
				.findFatherNoFeedbackPQ(personalId);
		// 查询该用户所有fatherId=0未反馈的健康自述
		adviceList = tbReadmeService.findAdviceByMemberId(personalId);
		// 查询该用户所有的调理建议
		childPreviousquestions = tbReadmeService
				.findChildNoFeedbackPQ(personalId);
		// 查询该用户所有fatherId!=0的健康自述
		setForwardView(NOFEED_JSP);
		return SUCCESS;
	}

	/**
	 * 已答复
	 * 
	 * @return
	 * @throws Exception
	 * @author 莫然源
	 * @Date 2017.03.28
	 */
	public String listAR() throws Exception {
		int personalId = (Integer) getRequest().getSession().getAttribute(
				"personalId");
		// 获取保存在session里的用户id。
		fatherPreviousquestions = tbReadmeService.findFahterReplyPQ(personalId);
		// 查询该用户所有fatherId=0的已答复的健康自述
		adviceList = tbReadmeService.findAdviceByMemberId(personalId);
		// 查询该用户所有的调理建议
		childPreviousquestions = tbReadmeService
				.findChildNoFeedbackPQ(personalId);
		// 查询该用户所有fatherId!=0的健康自述
		setForwardView(REPLIED_JSP);
		return SUCCESS;
	}

	/**
	 * 打开导师个人详情
	 * 
	 * @return
	 * @throws Exception
	 * @author 莫然源
	 * @Date 2017.03.28
	 */
	public String openMPD() throws Exception {
		int personalId = (Integer) getRequest().getSession().getAttribute(
				"personalId");
		// 获取保存在session里的用户id。
		tbPersonalData = tbPersonalDataService.findById(personalId);// 根据id查询个人资料
		setForwardView(MENTORDE_JSP);
		return SUCCESS;
	}

	@Override
	public Object getModel() {

		return tbReadme;
	}

	public TbReadme getTbReadme() {
		return tbReadme;
	}

	public void setTbReadme(TbReadme tbReadme) {
		this.tbReadme = tbReadme;
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

	public List<TbReadme> getTbReadmeList() {
		return tbReadmeList;
	}

	public void setTbReadmeList(List<TbReadme> tbReadmeList) {
		this.tbReadmeList = tbReadmeList;
	}

	public List<TbReadme> getTbReadmelie() {
		return tbReadmelie;
	}

	public void setTbReadmelie(List<TbReadme> tbReadmelie) {
		this.tbReadmelie = tbReadmelie;
	}

	public TbAdvice getTbAdvice() {
		return tbAdvice;
	}

	public void setTbAdvice(TbAdvice tbAdvice) {
		this.tbAdvice = tbAdvice;
	}

	public List<TbAdvice> getAdviceList() {
		return adviceList;
	}

	public void setAdviceList(List<TbAdvice> adviceList) {
		this.adviceList = adviceList;
	}

	public TbAdviceService getTbAdviceService() {
		return tbAdviceService;
	}

	public void setTbAdviceService(TbAdviceService tbAdviceService) {
		this.tbAdviceService = tbAdviceService;
	}

	public HealthRecord getHealthRecord() {
		return healthRecord;
	}

	public void setHealthRecord(HealthRecord healthRecord) {
		this.healthRecord = healthRecord;
	}

	public PersonalDataDetail getPersonalDataDetail() {
		return personalDataDetail;
	}

	public void setPersonalDataDetail(PersonalDataDetail personalDataDetail) {
		this.personalDataDetail = personalDataDetail;
	}

	public List<PersonalDataDetail> getPersonalDataDetailList() {
		return PersonalDataDetailList;
	}

	public void setPersonalDataDetailList(
			List<PersonalDataDetail> PersonalDataDetailList) {
		this.PersonalDataDetailList = PersonalDataDetailList;
	}

	public int getPersonalid() {
		return personalid;
	}

	public void setPersonalid(int personalid) {
		this.personalid = personalid;
	}

	public Result<HealthRecord> getPageResult() {
		return pageResult;
	}

	public void setPageResult(Result<HealthRecord> pageResult) {
		this.pageResult = pageResult;
	}

	public List<TbReadme> getFatherPreviousquestions() {
		return fatherPreviousquestions;
	}

	public void setFatherPreviousquestions(
			List<TbReadme> fatherPreviousquestions) {
		this.fatherPreviousquestions = fatherPreviousquestions;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public Result<FatherHealth> getFatherHealthResult() {
		return fatherHealthResult;
	}

	public void setFatherHealthResult(Result<FatherHealth> fatherHealthResult) {
		this.fatherHealthResult = fatherHealthResult;
	}

	public Result<TbAdvice> getFatherAdviceResult() {
		return fatherAdviceResult;
	}

	public void setFatherAdviceResult(Result<TbAdvice> fatherAdviceResult) {
		this.fatherAdviceResult = fatherAdviceResult;
	}

	public Result<ThroughFeedback> getThroughFeedbackResult() {
		return throughFeedbackResult;
	}

	public void setThroughFeedbackResult(
			Result<ThroughFeedback> throughFeedbackResult) {
		this.throughFeedbackResult = throughFeedbackResult;
	}

	public List<TbFeedback> getTbFeedback() {
		return tbFeedback;
	}

	public void setTbFeedback(List<TbFeedback> tbFeedback) {
		this.tbFeedback = tbFeedback;
	}

	public List<TbPersonalData> getTbPersonalDataa() {
		return tbPersonalDataa;
	}

	public void setTbPersonalDataa(List<TbPersonalData> tbPersonalDataa) {
		this.tbPersonalDataa = tbPersonalDataa;
	}

	public List<TbReadme> getChildPreviousquestions() {
		return childPreviousquestions;
	}

	public void setChildPreviousquestions(List<TbReadme> childPreviousquestions) {
		this.childPreviousquestions = childPreviousquestions;
	}

	public List<TbAdvice> getChildAdviceList() {
		return childAdviceList;
	}

	public void setChildAdviceList(List<TbAdvice> childAdviceList) {
		this.childAdviceList = childAdviceList;
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

}
