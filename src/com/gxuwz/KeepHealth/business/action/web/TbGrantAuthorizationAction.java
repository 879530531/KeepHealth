package com.gxuwz.KeepHealth.business.action.web;

import com.gxuwz.KeepHealth.business.dao.SysUserDAO;
import com.gxuwz.KeepHealth.business.dao.TbPersonalDataDAO;
import com.gxuwz.KeepHealth.business.dao.TbReadmeDAO;
import com.gxuwz.KeepHealth.business.entity.*;
import com.gxuwz.KeepHealth.business.service.SysUserService;
import com.gxuwz.KeepHealth.business.service.TbAdviceService;
import com.gxuwz.KeepHealth.business.service.TbPersonalDataService;
import com.gxuwz.KeepHealth.business.service.TbReadmeService;
import com.gxuwz.core.pagination.Result;
import com.gxuwz.core.web.action.BaseAction;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.File;
import java.util.List;

/**
 * <p>Title: 类名：授权管理-控制器--实现</p>
 * <p>Description:控制器/n</p>
 * @author:	梧州学院 软件开发中心  潘昌峰  <a href=mailto:879530531@qq.com>潘昌峰 </a>
 * @date:2020.12.17
 */
public class TbGrantAuthorizationAction extends BaseAction implements Preparable, ModelDriven{

    protected static final String MEMBER_JSP = "/weixin/Member_center.jsp";
    protected static final String LOGIN_JSP = "/weixin/MemberLogin.jsp";
    protected static final String UPDATE_JSP = "/weixin/Change_information.jsp";
    protected static final String UPDATE2_JSP = "/weixin/Change_information2.jsp";
    protected static final String DETAILS_JSP = "/weixin/Information_details.jsp";
    protected static final String Health_JSP = "/weixin/Health_advice.jsp";
    protected static final String Index_JSP = "/WEB-INF/page/index.jsp";
    protected static final String LIST_JSP = "/WEB-INF/page/web/health_grantAuthorization/GrantAuthorization_list.jsp";
    protected static final String LIST1_JSP = "/WEB-INF/page/web/health_manage/SysTeacher_list.jsp";
    protected static final String LIST2_JSP = "/WEB-INF/page/web/health_manage/Untreated_consulting.jsp";
    protected static final String LIST3_JSP = "/WEB-INF/page/web/health_manage/Vip_manage.jsp";
    protected static final String ADD_JSP = "/WEB-INF/page/web/health_manage/SysMember_add.jsp";
    protected static final String EDIT_JSP = "/WEB-INF/page/web/health_grantAuthorization/GrantAuthorization_edit.jsp";
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

    @Override
    public Object getModel() {
        return tbPersonalData;
    }

    @Override
    public void prepare() throws Exception {
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
     * 列表查看
     * @author 潘昌峰
     * @data 2021/01/19
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
        pageResult = tbPersonalDataService.find(tbPersonalData, getPage(),getRow());

        setForwardView(LIST_JSP);

        return SUCCESS;
    }

    /**
     * 跳转到授权页面
     * @return
     * @author 潘昌峰
     * @date 2021.1.23
     */
    public String openEdit(){

        //sysRoleRight.setRoleId(sysRole.getRoleId());
        //查询角色的权限
        //roleRights = sysRoleRightService.findByRole(sysRoleRight.getRoleId());
        //查询权限表
        //sysRights = sysRightService.getRightAll();
        //根据角色编号查询角色信息
        tbPersonalData = tbPersonalDataService.findById(tbPersonalData.getPersonalId());
        forwardView = EDIT_JSP;
        return SUCCESS;
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
