package com.gxuwz.KeepHealth.business.action.web;

import java.io.File;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import util.MyTime;

import com.gxuwz.KeepHealth.SystemContext;
import com.gxuwz.KeepHealth.business.dao.SysUserDAO;
import com.gxuwz.KeepHealth.business.dao.TbPersonalDataDAO;
import com.gxuwz.KeepHealth.business.dao.TbReadmeDAO;
import com.gxuwz.KeepHealth.business.entity.MyAppointment;
import com.gxuwz.KeepHealth.business.entity.SysUser;
import com.gxuwz.KeepHealth.business.entity.TbPersonalData;
import com.gxuwz.KeepHealth.business.entity.TbReadme;
import com.gxuwz.KeepHealth.business.entity.Untreated;
import com.gxuwz.KeepHealth.business.entity.Healthdata;
import com.gxuwz.KeepHealth.business.entity.Vip;
import com.gxuwz.KeepHealth.business.service.SysUserService;
import com.gxuwz.KeepHealth.business.service.TbAdviceService;
import com.gxuwz.KeepHealth.business.service.TbPersonalDataService;
import com.gxuwz.KeepHealth.business.service.TbReadmeService;
import com.gxuwz.core.pagination.Result;
import com.gxuwz.core.web.action.BaseAction;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

/**
 * 
 * Title:TbPersonalDataAction
 * Description: personalDate 控制层
 * flagType==0 会员  flagType==1 导师
 * @author 梧州学院软件开发中心 杨世宇
 * @date 2017年7月5日
 */
public class TbPersonalDataAction extends BaseAction implements Preparable, ModelDriven{

	private static final long serialVersionUID = -4104125263890869018L;
	protected static final String MEMBER_JSP = "/weixin/Member_center.jsp";
	protected static final String LOGIN_JSP = "/weixin/MemberLogin.jsp";
	protected static final String UPDATE_JSP = "/weixin/Change_information.jsp";
	protected static final String UPDATE2_JSP = "/weixin/Change_information2.jsp";
	protected static final String DETAILS_JSP = "/weixin/Information_details.jsp";
	protected static final String Health_JSP = "/weixin/Health_advice.jsp";
	protected static final String Index_JSP = "/WEB-INF/page/index.jsp";
	protected static final String LIST_JSP = "/WEB-INF/page/web/health_manage/SysMember_list.jsp";
	protected static final String LIST1_JSP = "/WEB-INF/page/web/health_manage/SysTeacher_list.jsp";
    protected static final String LIST2_JSP = "/WEB-INF/page/web/health_manage/Untreated_consulting.jsp";
    protected static final String LIST3_JSP = "/WEB-INF/page/web/health_manage/Vip_manage.jsp";
	protected static final String ADD_JSP = "/WEB-INF/page/web/health_manage/SysMember_add.jsp";
	protected static final String EDIT_JSP = "/WEB-INF/page/web/health_manage/personal_edit.jsp";
	protected static final String EDIT1_JSP = "/WEB-INF/page/web/health_manage/Teacher_edit.jsp";
	protected static final String DETAIL_JSP = "/WEB-INF/page/web/health_manage/personal_detail.jsp";
	protected static final String DETAIL1_JSP = "/WEB-INF/page/web/health_manage/Teacher_detail.jsp";
	protected static final String DATA_JSP = "/WEB-INF/page/web/health_manage/Health_data.jsp";
	protected static final String SET_JSP = "/WEB-INF/page/web/health_manage/SysMember_set.jsp";
	protected static final String MYAPPOINT_JSP = "/weixin/My_appointment.jsp";
	protected static final String OTHERAPPOINT_JSP = "/weixin/Other_appointment.jsp";
	protected static final String MENTORDE_JSP = "/weixin/mentor_details.jsp";
	protected static final String MEMDATA_JSP = "/weixin/Member_data.jsp";
	protected static final String CHANGEPASSW_JSP = "/weixin/Change_password.jsp";
	protected static final String SAVEOK_JSP = "/weixin/SaveOK.jsp";
	protected static final String MENDATA_JSP = "/weixin/Mentor_data.jsp";
	protected static final String REGISTER_JSP = "/weixin/Register.jsp";
	protected static final String MENTORADD_JSP = "/WEB-INF/page/web/health_manage/SysTeacher_add.jsp";
	private File[] upload;
	private String[] uploadFileName;
	private String[] uploadContentType;
	
//	private File oldFile;
	
	@Autowired
    private TbReadmeService tbReadmeService;
	@Autowired
	private TbPersonalDataService tbPersonalDataService; //个人数据接口
	
	@Autowired
	private SysUserService sysUserService;
	@Autowired
	private TbPersonalDataDAO tbPersonalDataDAO; //个人数据表 数据访问层
	@Autowired
	private SysUserDAO sysUserDAO;
	@Autowired
	private TbReadmeDAO tbReadmeDAO;
	

//	private SysUser sysUser; //用户模型

	private String[] roleId; //权限ID
	
    private String tib;
    private List<MyAppointment> myAppointment;//健康自述列表
	private TbReadme tbReadme; //健康自述表模型
	private SysUser sysUser; //健康自述表模型
	private TbPersonalData tbPersonalData; //personal对象
	private TbPersonalData tbPersonalData2; //personal对象
	private Vip vip; 
	private List<TbPersonalData> tbPersonalData1;
	private Result<TbPersonalData> pageResult;//分页
	private Result<Vip> pageResult3;//分页
	private Result<Untreated> pageResult1;//分页
	private Result<Healthdata> pageResult2;//分页
	 private List<TbReadme> tbReadmeList;
	 int advice_nember = 0;
	 @Autowired
	 private TbAdviceService tbAdviceService;
//	@SuppressWarnings("rawtypes")
//	private ArrayList consultList;
	 private String telephone;
	private Untreated untreated;
	private Healthdata healthdata;
	int consult_number = 0;
	int answer_number = 0;
	private String oldPassword;


	private int readmeId = 0;
	int feedback_nember = 0;
	private int personalId;
	
	public void prepare() throws Exception{
		if(null == tbPersonalData){
			tbPersonalData = new TbPersonalData();
		}
		if(null == untreated){
			untreated = new Untreated();
		}
		if(null == healthdata){
			healthdata = new Healthdata();
		}
		if(null == vip){
			vip = new Vip();
		}
		if(null == tbReadme){
			tbReadme = new TbReadme();
		}
		if(null == sysUser){
			sysUser = new SysUser();
		}
	}
	
	@Override
	public String execute() throws Exception {
		
		return SUCCESS;
	}
	/**
	 * 未处理咨询列表
	 * @return
	 * @throws Exception
	 * @author 莫然源
	 * @date 2017.3.24
	 */
	public String listUntreated()throws Exception{//未处理咨询列表
		//System.out.println(untreated.getUsertime());
		//System.out.println(untreated.getUsertime1());
		if("".equals(untreated.getPersonalNumber())){//将未输入值的用户id设置为null
			untreated.setPersonalNumber(null);
		}
		if("".equals(untreated.getRealName())){//将未输入值的用户真实姓名设置为null
			untreated.setRealName(null);
		}
		pageResult1 = tbPersonalDataService.findUntreated
				(untreated, getPage(), getRow());//根据条件查找未处理咨询的列表
		 setForwardView(LIST2_JSP);
	    return SUCCESS;
	}
	/**
	 * 健康数据列表
	 * @return
	 * @throws Exception
	 * @author 莫然源
	 * @date 2017.3.24
	 */
	public String listHealthdata()throws Exception{//健康数据列表
		if("".equals(healthdata.getPersonalNumber())){//将未输入值的用户id设置为null
			healthdata.setPersonalNumber(null);
		}
		if("".equals(healthdata.getRealName())){//将未输入值的用户真实姓名设置为null
			healthdata.setRealName(null);
		}
		if("".equals(healthdata.getMobilePhone())){//将未输入值的手机号设置为null
			healthdata.setMobilePhone(null);
		}
		pageResult2 = tbPersonalDataService.findHealthdata(healthdata, getPage(), getRow());
		//根据条件查找健康数据的列表
		 setForwardView(DATA_JSP);
	    return SUCCESS;
	}
	
	/**
	 * 未处理咨询-删除
	 * @author 杨世宇
	 * @return
	 * @throws Exception
	 * @date 2017.07.07
	 */
	public String deleteUntreated()throws Exception{
		tbReadme = tbReadmeService.returnByReadmeId(getReadmeId());
		//System.out.println("readme表 - 未处理咨询"+tbReadme.getReadmeId());
		//System.out.println(tbReadme.getReplyState());
		tbReadme.setReplyState(1);
		tbReadmeDAO.remove(tbReadme);;
		return listUntreated();
	}
	
	
	
	
    /**
     * VIP管理列表
     * @return
     * @throws Exception
     * @author 陆云秋
     * @date 2017.3.25
      */
    public String listVip()throws Exception{
        //System.out.println("123456");
        if("".equals(vip.getPersonalNumber())){
        	vip.setPersonalNumber(null);
		}
		if("".equals(vip.getRealName())){
			vip.setRealName(null);
		}
        pageResult3 = tbPersonalDataService.findMember(vip,getPage(), getRow());
        setForwardView(LIST3_JSP);
        return SUCCESS;
    }
    
    /**
     * 列表查看
     * @author 杨世宇
     * @data 2017.03.22
     * @return
     * @throws Exception
     */
	public String list() throws Exception {
		
		//检查对象搜索的关键字是否为空，不为空则置NULL;
		if ("".equals(tbPersonalData.getPersonalNumber())) {
			tbPersonalData.setPersonalNumber(null);
		}
		if ("".equals(tbPersonalData.getRealName())) {
			tbPersonalData.setRealName(null);
		}
		if ("".equals(tbPersonalData.getMobilePhone())) {
			tbPersonalData.setMobilePhone(null);
		}
		
		//list查询，结果返回pageResult
		pageResult = tbPersonalDataService.find(tbPersonalData, getPage(),
				getRow());
		
		//flagType==0 会员  flagType==1 导师
		if (tbPersonalData.getFlagType() == 0) {
			//跳转到会员列表
			setForwardView(LIST_JSP);
		} else if (tbPersonalData.getFlagType() == 1) {
			//跳转到导师列表
			setForwardView(LIST1_JSP);
		}
		return SUCCESS;
	}
    
    
	/**
	 * 微信端注册
	 * @return
	 * @throws Exception
	 * @author 莫然源
	 * @date 2017.03.23
	 */
	public String add() throws Exception{
		boolean result = tbPersonalDataService.checkMobilePhone(tbPersonalData.getMobilePhone());
		//System.out.println(result+tbPersonalData.getMobilePhone());
		if(!result){
        //将用户类型和等级设置为默认值
		tbPersonalData.setFlagType(0);
		tbPersonalData.setLevel(3);
		tbPersonalData.setImage("default_img.png");
		//获取当前时间戳
//		String currentTime = System.currentTimeMillis()+"";

		//Date date = new Date(System.currentTimeMillis());
		//设置日期格式
	   // SimpleDateFormat format =  new SimpleDateFormat("yyyyMMddHHmmss");  
	   // String time = format.format(date);    
		//查询数据库中最大个人编号，并转换为字符串
		String time = MyTime.getCurrentTimeMillisTime();
		String maxNumber = String.valueOf(tbPersonalDataDAO.findMaxPersonalNumber());
		//System.out.println("maxNumber"+maxNumber);
		
		
		if("[null]".equals(maxNumber)){
			maxNumber = null;
			int a = 10001;
			String number = String.valueOf(a);
			String newName = time+tbPersonalData.getFlagType()+number;
			tbPersonalData.setPersonalNumber(newName);
		}
		
		else{
			//截取序号，并将其转换成int类型
			String numberString = maxNumber.substring(16, maxNumber.length()-1);
			int a = Integer.valueOf(numberString)+1;
			String number = String.valueOf(a);
			String newName = time+tbPersonalData.getFlagType()+number;
			
			if(20 == newName.length()){
				tbPersonalData.setPersonalNumber(newName);
			}
		}
		tbPersonalDataService.add(tbPersonalData);//添加用户信息
		tib="success";
    	setForwardView(LOGIN_JSP);
		return SUCCESS;
		}else{
			tib="fail";
			setForwardView(REGISTER_JSP);
			return SUCCESS;
		}
	}
	
	/**
	 * 添加用户
	 * @return
	 * @throws Exception
	 * @author 杨世宇
	 * @date 2017.03.22
	 */
	public String addWeb() throws Exception{
//		System.out.println("123456"+tbPersonalData.getPassword());
//		tbPersonalData.setFlagType(2);
		boolean result = tbPersonalDataService.checkMobilePhone(tbPersonalData.getMobilePhone());
		//System.out.println(result+tbPersonalData.getMobilePhone());
		if(!result){
		//设置默认密码
		tbPersonalData.setPassword("0774123");
		//如果为会员，则设置等级为3
		if(tbPersonalData.getFlagType() == 0){
			tbPersonalData.setLevel(3);
		}


		//获取当前时间戳
//		String currentTime = System.currentTimeMillis()+"";
		/*Date date = new Date(System.currentTimeMillis());
		
		//设置日期格式
	    SimpleDateFormat format =  new SimpleDateFormat("yyyyMMddHHmmss");  
	    String time = format.format(date); */   
//	    System.out.println("date"+date);
//		System.out.println("time"+time);
//		System.out.println("currentTime"+currentTime);
		String time = MyTime.getCurrentTimeMillisTime();
		//查询数据库中最大个人编号，并转换为字符串
		String maxNumber = String.valueOf(tbPersonalDataDAO.findMaxPersonalNumber());
//		System.out.println("maxNumber"+maxNumber);
		
		//如果最大编号为空，则设置序号为10001
		//编号格式 = 时间+类型（flagType）+序号
		if("[null]".equals(maxNumber)){
			maxNumber = null;
			int a = 10001;
			String number = String.valueOf(a);
			String newName = time+tbPersonalData.getFlagType()+number;
//			System.out.println("newName"+newName);
			tbPersonalData.setPersonalNumber(newName);
		}else{
			//截取序号，并将其转换成int类型
			String numberString = maxNumber.substring(16, maxNumber.length()-1);
//			System.out.println("numberString"+numberString);
			
			//序号+1
			int a = Integer.valueOf(numberString)+1;
//			System.out.println("a"+a);
			String number = String.valueOf(a);
			//设置编号格式
			String newName = time+tbPersonalData.getFlagType()+number;
//			System.out.println("newName"+newName);
			
			//如果编号长度为20，则setPersonalNumber
			if(20 == newName.length()){
				tbPersonalData.setPersonalNumber(newName);
			}
		}

//		System.out.println("123456"+tbPersonalData.getQq());
		
		//反向添加到user表
		if(tbPersonalData.getFlagType() == 1){
//		System.out.println("导师添加"+tbPersonalData.getFlagType());
		SysUser sysUser = new SysUser();
		sysUser.setUserId(tbPersonalData.getPersonalNumber());
		sysUser.setUserType(2);
		sysUser.setUserName(tbPersonalData.getMobilePhone());
		sysUser.setUserTelephone(tbPersonalData.getMobilePhone());
		sysUser.setUserEmail(tbPersonalData.getEmail());
		sysUser.setUserRealName(tbPersonalData.getRealName());
		sysUser.setUserSex(tbPersonalData.getSex());
		sysUser.setUserQq(tbPersonalData.getQq());
		sysUser.setUserPassword(tbPersonalData.getPassword());

		sysUserService.add(sysUser,roleId);
		}
		
		//添加导师 导师简介暂定80字
	    tbPersonalDataService.addWeb(tbPersonalData,upload,uploadFileName,uploadContentType);

		tbPersonalData.setPersonalNumber(null);
		tbPersonalData.setRealName(null);
		tbPersonalData.setMobilePhone(null);
		return list();
	}else if (tbPersonalData.getFlagType() == 0) {
		//跳转到添加会员
		tib="have";
		setForwardView(ADD_JSP);
		
	} else if (tbPersonalData.getFlagType() == 1) {
		//跳转到添加导师
		tib="have";
		setForwardView(MENTORADD_JSP);
		
	}
		return SUCCESS;
}
	
	
	/**
	 * 保存修改的用户信息
	 * @return
	 * @throws Exception
	 * @author 杨世宇
	 * @Date 2017.03.22
	 */
	public String updateWeb() throws Exception {
		
		tbPersonalDataService.updateWeb(tbPersonalData, upload, uploadFileName,
				uploadContentType);
		System.out.println("type"+tbPersonalData.getFlagType());

		//反向存入user表
		if (tbPersonalData.getFlagType() == 1) {
			SysUser sysUser = sysUserService.findByUserId(tbPersonalData.getPersonalNumber());
			
			sysUser.setUserName(tbPersonalData.getName());
			sysUser.setUserRealName(tbPersonalData.getRealName());
			sysUser.setUserTelephone(tbPersonalData.getMobilePhone());
			sysUser.setUserEmail(tbPersonalData.getEmail());
			sysUser.setUserPassword(tbPersonalData.getPassword());
			sysUser.setUserSex(tbPersonalData.getSex());
			sysUser.setUserAddress(tbPersonalData.getAddress());
			sysUser.setUserQq(tbPersonalData.getQq());
		}

		tbPersonalData.setPersonalNumber(null);
		tbPersonalData.setRealName(null);
		tbPersonalData.setMobilePhone(null);
		return list();
		
	}

	
	/**
	 * 修改个人信息
	 * @return
	 * @throws Exception
	 * @author 莫然源
	 * @Date 2017.03.21
	 */
		public String update() throws Exception{
    	boolean result;
    	tbPersonalData2=(TbPersonalData) getRequest().getSession().getAttribute("personaldata");
		if(tbPersonalData2.getMobilePhone().equals(tbPersonalData.getMobilePhone())){
			result=false;
		}else{
	     result = tbPersonalDataService.checkMobilePhone(tbPersonalData.getMobilePhone());
		}
        int personalId=(Integer) getRequest().getSession().getAttribute("personalId");
        //获取保存在session里的用户id。
        tbPersonalData.setPersonalId(personalId);
        int flagtype=(Integer)getRequest().getSession().getAttribute("flagtype");
        if(!result){
        
        tbPersonalDataService.update(tbPersonalData,flagtype);//更新用户信息
        sysUser.setUserTelephone(tbPersonalData.getMobilePhone());
        sysUserService.updateMobilePhone(tbPersonalData2.getMobilePhone(), tbPersonalData.getMobilePhone());
      //获取保存在session里的用户类型。
      	ActionContext ac = ActionContext.getContext();
      	Map session = ac.getSession();
      	session.remove("Name");
      	session.remove("mobilePhone");
      	getRequest().getSession().setAttribute("Name",tbPersonalData.getName());
      	getRequest().getSession().setAttribute("mobilePhone",tbPersonalData.getMobilePhone());
      	//更新session里的昵称信息
      	if(flagtype==0){//根据用户类型来实现返回到导师或会员界面
	    setForwardView(MEMDATA_JSP);
      	}else{
      	advice_nember=tbReadmeService.findFatherPQ(personalId).size();//统计导师服务记录条数
		getRequest().setAttribute("advice_nember",advice_nember);//将统计到的数量放进request传到前台
      	setForwardView(MENDATA_JSP);
      	}
      	}else{
			tib="fail";
			if(flagtype==0){//根据用户类型来实现返回到导师或会员界面
			    setForwardView(UPDATE_JSP);
		      	}else{
		      	advice_nember=tbReadmeService.findFatherPQ(personalId).size();//统计导师服务记录条数
				getRequest().setAttribute("advice_nember",advice_nember);//将统计到的数量放进request传到前台
		      	setForwardView(UPDATE2_JSP);
		      	}
		}
        return SUCCESS;
	}
    	/**
    	 * 修改个人密码
    	 * @return
    	 * @throws Exception
    	 * @author 莫然源
    	 * @Date 2017.04.26
    	 */
            public String changePassword() throws Exception{
            tbPersonalData.setPersonalId((Integer)getRequest().getSession().getAttribute("personalId"));
          //获取保存在session里的用户id。
            int passwordtype;//修改状态。若等于1，则修改失败，等于其他则修改成功
            passwordtype=tbPersonalDataService.updatePassword(tbPersonalData,getOldPassword());
           if(passwordtype==1){
        	   setForwardView(CHANGEPASSW_JSP);
        	   getRequest().setAttribute("ti","no");
           }else{//修改成功后清除cookie和session并退出到登录界面。
        	   HttpServletRequest request =ServletActionContext.getRequest();
       		HttpServletResponse response1=ServletActionContext.getResponse();
       		//清除所有session
       		HttpSession session = request.getSession();
       		Enumeration ee=session.getAttributeNames();
       		while(ee.hasMoreElements()){ String sessionName=(String)ee.nextElement();
       		//System.out.println("存在的session有："+sessionName);
       		session.removeAttribute(sessionName); }
       		//删除cookie里的数据
       		
       		Cookie deleteCookie = new Cookie("username",null); 
       		deleteCookie.setMaxAge(0); 
       		deleteCookie.setPath("/");
       		response1.addCookie(deleteCookie);
       		
       		Cookie deleteCookie1 = new Cookie("password",null); 
       		deleteCookie1.setMaxAge(0); 
       		deleteCookie1.setPath("/");
       		response1.addCookie(deleteCookie1);
       		
       		setForwardView(SAVEOK_JSP);
           }
    	    
    	    return SUCCESS;
    	}
        
        
    	/**
    	 * 打开修改信息页面
    	 * @return
    	 * @author 杨世宇
    	 * @Date 2017.03.19
    	 */
	public String openEditWeb() {
		// 根据个人PersonalId查询用户信息
		tbPersonalData = tbPersonalDataService.findByPersonalIdWeb(tbPersonalData.getPersonalId());
		
		if (tbPersonalData.getFlagType() == 0) {
			//跳转到会员修改界面
			setForwardView(EDIT_JSP);
		} else if (tbPersonalData.getFlagType() == 1) {
			//跳转到导师修改界面
			setForwardView(EDIT1_JSP);
		}
		return SUCCESS;
	}
    	
    	/**
    	 * 打开详细信息页面
    	 * @return
    	 * @author 杨世宇
    	 * @Date 2017.03.19
    	 */
	public String openDetailWeb() {
		// 根据个人PersonalId查询用户信息
		tbPersonalData = tbPersonalDataService
				.findByPersonalIdWeb(tbPersonalData.getPersonalId());
		
		if (tbPersonalData.getFlagType() == 0) {
			//跳转到会员详情界面
			setForwardView(DETAIL_JSP);
		} else if (tbPersonalData.getFlagType() == 1) {
			//跳转到导师详情界面
			setForwardView(DETAIL1_JSP);
		}
		return SUCCESS;
	}
    	
    	public String openAdd(){
    		forwardView = ADD_JSP;
    		return SUCCESS;
    	}
        /**
    	 * 微信端打开修改会员信息界面
    	 * @return
    	 * @throws Exception
    	 * @author 莫然源
    	 * @Date 2017.03.30
    	 */
    	public String openMemberEdit(){
    		
            int a= (Integer) getRequest().getSession().getAttribute("personalId");
          //获取保存在session里的用户id。
            tbPersonalData= tbPersonalDataService.findById(a);
            //获取编号对应的用户信息。
            setForwardView(UPDATE_JSP); 
    		return SUCCESS;
    	}
        /**
     	 * 打开修改导师信息界面
     	 * @return
     	 * @throws Exception
     	 * @author 莫然源
     	 * @Date 2017.05.03
     	 */
     	public String openMentorEdit(){
     		
             int a= (Integer) getRequest().getSession().getAttribute("personalId");
           //获取保存在session里的用户id。
             tbPersonalData= tbPersonalDataService.findById(a);
             //获取编号对应的用户信息。
             setForwardView(UPDATE2_JSP); 
     		return SUCCESS;
     	}
    	
    	/**
    	 * 查询会员详细资料，打开会员详情界面
    	 * @return
    	 * @throws Exception
    	 * @author 莫然源
    	 * @Date 2017.03.24
    	 */
    	public String find() throws ParseException{
    		HttpServletRequest request =ServletActionContext.getRequest();
    		int Level = (Integer) getRequest().getSession().getAttribute("Level");
    		//获取保存在session里的用户等级。
    		int a= (Integer) getRequest().getSession().getAttribute("personalId");
    		//获取保存在session里的用户id。
            tbPersonalData= tbPersonalDataService.findById(a);//根据id查询个人资料
    		if(Level==3){//如果会员为没有缴费的会员（没有会员开始时间跟结束时间，不需要计算）
    			long m = 0;
    			request.setAttribute("time",( m / (1000 * 60 * 60 * 24) ));//将剩余天数通过request传到前台
    		}else{
    			/*Date date=new Date();
	    		DateFormat format=new SimpleDateFormat("yyyy-MM-dd");
	    		String time = format.format(date); */
    			String time = MyTime.getStringDateShort();//获取当前时间
	            String time1 = (tbPersonalData.getEndTime()).toString();//获取会员结束时间，并将其转成string类型
	            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");//类型转换
	            long m = 0;
	           m=sdf.parse(time1).getTime() - sdf.parse(time).getTime();//计算会员剩余天数
		           if(m<0){
		            	m=0;
		            	}
    			/*long m = mytime.getday();*/
		        
	            //System.out.println("相差天数:"+ ( m / (1000 * 60 * 60 * 24) ));
	            request.setAttribute("time",( m / (1000 * 60 * 60 * 24) ));//将剩余天数通过request传到前台
    		}
             setForwardView(DETAILS_JSP); 
    		return SUCCESS;
    	}
    	
    	

    	
	/**
	 * 打开健康自述界面
	 * @return
	 * @throws Exception
	 * @author 陈洁
	 * @Date 2017.03.21
	 */
/*	public String openHealthAdvice() throws Exception{
		int a= (Integer) getRequest().getSession().getAttribute("personalId");
		int b= (Integer) getRequest().getSession().getAttribute("Level");
        tbPersonalData= tbPersonalDataService.findById(a);//根据id查询个人数据
        if(b==0||b==1){//如果该会员为正式会员（即已缴费）
        Date date=new Date();
 		DateFormat format=new SimpleDateFormat("yyyy-MM-dd");
 		String time = format.format(date); 
        String time = MyTime.getStringDateShort();
 		tbPersonalData= tbPersonalDataService.find(tbPersonalData);
 		String time1 = (tbPersonalData.getEndTime()).toString();//获取会员结束时间，并将其转成string类型
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");//类型转换
        long m = 0;
        m=sdf.parse(time1).getTime() - sdf.parse(time).getTime();//计算会员剩余天数
         
		        if(m<0){//如果会员已过期
		        	getRequest().setAttribute("tip","会员身份已过期，请续费");
		         }
		        else{
						if(b==0){//如果该会员为普通会员
							
							tbPersonalData1= tbPersonalDataService.findThp();//查询所有普通导师
							getRequest().setAttribute("tip","选择导师");
							
						}
						else if (b==1){//如果该会员为高级会员
							
							tbPersonalData1= tbPersonalDataService.findTh();//查询所有导师
							getRequest().setAttribute("tip","选择导师");
							
						}
						}
		        }
		else{//如果该会员为非正式会员（即未缴费）
			
			getRequest().setAttribute("tip","缴费后成为VIP会员即可咨询");
			
		}
		
		setForwardView(Health_JSP); 
    	return SUCCESS;
	}*/

	/**
	 * 删除用户
     * @author 杨世宇
	 * @Date 2017.03.22
	 */
	public String delete() throws Exception{
		tbPersonalDataService.delete(tbPersonalData.getPersonalId());
		tbPersonalData.setPersonalId(null);
		tbPersonalData.setRealName(null);
		tbPersonalData.setMobilePhone(null);
		
		return list();
	}
	
	/**
	 * 重置密码
	 * @author 陆云秋
	 * @throws Exception 
	 * @Date 2017.05.06
	 */
/*	public String resetPwd() throws Exception{
		 tbPersonalDataService.resetPwd(tbPersonalData.getPersonalId());
		 tbPersonalData = tbPersonalDataService.findByPersonalIdWeb(tbPersonalData.getPersonalId());
		 tbPersonalData.setPersonalNumber(null);
		 tbPersonalData.setPersonalId(null);
		 tbPersonalData.setRealName(null);
		 tbPersonalData.setMobilePhone(null);
		 getRequest().setAttribute("tip","fail");
 		 return list();
		
	}*/ 
	/**
	 * 重置导师密码
	 * @author 莫然源
	 * @throws Exception 
	 * @Date 2017.05.15
	 */
	public String changePwd() throws Exception{
		 tbPersonalDataService.changePwd(tbPersonalData.getPersonalId());
		 tbPersonalData = tbPersonalDataService.findByPersonalIdWeb(tbPersonalData.getPersonalId());
		 tbPersonalData.setPersonalNumber(null);
		 tbPersonalData.setPersonalId(null);
		 tbPersonalData.setRealName(null);
		 tbPersonalData.setMobilePhone(null);
		 getRequest().setAttribute("tip","fail");
 		 return list();
		
	} 
	
	/**
	 * 打开会员设置页面
	 * @return
	 * @author 黄子珍
	 * @Date 2017.03.26
	 */
   	public String openSetWeb(){
   		tbPersonalData = tbPersonalDataService.findByPersonalIdWeb(tbPersonalData.getPersonalId());
   		getRequest().setAttribute("personalId",tbPersonalData.getPersonalId());
		forwardView = SET_JSP;
		return SUCCESS;
	}
   	
   	/**
	 * 打开web端首页
	 * @return String
	 * @author 陈洁
	 * @Date 2017.03.26
	 */
   	public String openIndex(){
		forwardView = Index_JSP;
		return SUCCESS;
	}
   	/**
	 * 我的预约界面
	 * @return
	 * @author 莫然源
	 * @Date 2017.04.09
	 */
 /*  	public String myappointment(){
   		int a= (Integer) getRequest().getSession().getAttribute("personalId");
   	    //获取保存在session里的用户id。
		advice_nember=tbAdviceService.findAD(a);//统计导师服务记录条数
		getRequest().setAttribute("advice_nember",advice_nember);//将统计到的数量放进request传到前台
   		
		myAppointment = tbReadmeService.findByMentorId(a);//根据导师id查询所有健康自述记录
		forwardView = MYAPPOINT_JSP;
		return SUCCESS;
	}*/
   	
   	/**
	 * 其他预约界面
	 * @return
	 * @author 莫然源
	 * @Date 2017.04.09
	 */
  /* 	public String otherappointment(){
   		int a= (Integer) getRequest().getSession().getAttribute("personalId");
     	//获取保存在session里的用户id。
		advice_nember=tbAdviceService.findAD(a);//统计导师服务记录条数
		getRequest().setAttribute("advice_nember",advice_nember);//将统计到的数量放进request传到前台
		myAppointment = tbReadmeService.findBypersonalid();//查询所有未指定导师的自述记录
		forwardView = OTHERAPPOINT_JSP;
		return SUCCESS;
	}*/
   	
   	/**
	 * 打开导师详情界面
	 * @return
	 * @author 莫然源
	 * @Date 2017.04.20
	 */
   	public String openTeatherInformation(){
   		//System.out.println("16316546841"+tbPersonalData.getPersonalId());
   		//System.out.println("16316546841"+getPersonalId());
   		tbPersonalData= tbPersonalDataService.findById(tbPersonalData.getPersonalId());//根据id查询个人资料
   		
		forwardView = MENTORDE_JSP;
		return SUCCESS;
	}
   	
   	/**
   	 * 修改头像-微信
   	 * @author 杨世宇
   	 * @date 2017.04.26
   	 */

	public String changeImg(){
		tbPersonalDataService.changeImg(tbPersonalData.getPersonalId(),upload,uploadFileName,uploadContentType);
		//跳转到提示修改成功界面
		setForwardView(SAVEOK_JSP);
		return SUCCESS;
	}
   	/**
   	 * 返回登录界面
   	 * @author 莫然源
   	 * @date 2017.07.22
   	 */

	public String returnMemberLogin(){
		setForwardView(LOGIN_JSP);
		return SUCCESS;
	}
	

	@Override
	public Object getModel() {
		
		return tbPersonalData;
	}

	public TbPersonalData getTbAdvice() {
		return tbPersonalData;
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

	public Result<TbPersonalData> getPageResult() {
		return pageResult;
	}

	public void setPageResult(Result<TbPersonalData> pageResult) {
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

	public Result<Healthdata> getPageResult2() {
		return pageResult2;
	}

	public void setPageResult2(Result<Healthdata> pageResult2) {
		this.pageResult2 = pageResult2;
	}
	public Result<Untreated> getPageResult1() {
		return pageResult1;
	}

	public void setPageResult1(Result<Untreated> pageResult1) {
		this.pageResult1 = pageResult1;
	}



	public Healthdata getHealthdata() {
		return healthdata;
	}

	public void setHealthdata(Healthdata healthdata) {
		this.healthdata = healthdata;
	}

	public Untreated getUntreated() {
		return untreated;
	}

	public void setUntreated(Untreated untreated) {
		this.untreated = untreated;
	}

	public Result<Vip> getPageResult3() {
		return pageResult3;
	}

	public void setPageResult3(Result<Vip> pageResult3) {
		this.pageResult3 = pageResult3;
	}

	public Vip getVip() {
		return vip;
	}

	public void setVip(Vip vip) {
		this.vip = vip;
	}

	public List<TbReadme> getTbReadmeList() {
		return tbReadmeList;
	}

	public void setTbReadmeList(List<TbReadme> tbReadmeList) {
		this.tbReadmeList = tbReadmeList;
	}

	public int getPersonalId() {
		return personalId;
	}

	public void setPersonalId(int personalId) {
		this.personalId = personalId;
	}

	public String getOldPassword() {
		return oldPassword;
	}

	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}

	public String[] getRoleId() {
		return roleId;
	}

	public void setRoleId(String[] roleId) {
		this.roleId = roleId;
	}

	public int getReadmeId() {
		return readmeId;
	}

	public void setReadmeId(int readmeId) {
		this.readmeId = readmeId;
	}

	public List<MyAppointment> getMyAppointment() {
		return myAppointment;
	}

	public void setMyAppointment(List<MyAppointment> myAppointment) {
		this.myAppointment = myAppointment;
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

	public TbPersonalData getTbPersonalData2() {
		return tbPersonalData2;
	}

	public void setTbPersonalData2(TbPersonalData tbPersonalData2) {
		this.tbPersonalData2 = tbPersonalData2;
	}

	public SysUser getSysUser() {
		return sysUser;
	}

	public void setSysUser(SysUser sysUser) {
		this.sysUser = sysUser;
	}

}
