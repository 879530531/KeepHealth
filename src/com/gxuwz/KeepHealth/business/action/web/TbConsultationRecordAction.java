package com.gxuwz.KeepHealth.business.action.web;

import com.gxuwz.KeepHealth.business.entity.TbConsultationRecord;
import com.gxuwz.KeepHealth.business.entity.TbConsumer;
import com.gxuwz.KeepHealth.business.entity.TbTeacher;
import com.gxuwz.KeepHealth.business.service.TbConsultationRecordService;
import com.gxuwz.KeepHealth.business.service.TbConsumerService;
import com.gxuwz.KeepHealth.business.service.TbTeacherService;
import com.gxuwz.KeepHealth.wx.util.WeixinUtil;
import com.gxuwz.core.pagination.Result;
import com.gxuwz.core.web.action.BaseAction;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import util.MyTime;

import java.util.ArrayList;
import java.util.List;

/**
 * 与咨询记录、服务统计相关的控制器
 *
 * @author 叶城廷
 * @version 2019.03.01
 */
public class TbConsultationRecordAction extends BaseAction implements Preparable, ModelDriven<TbConsultationRecord> {

    private static final long serialVersionUID = 1L;
    protected static final String LIST_JSP = "/WEB-INF/page/web/health_consult_record/record_list.jsp";
    protected static final String STATIS_LIST_JSP = "/WEB-INF/page/web/health_consult_statistics/statis_list.jsp";
    protected static final String MY_RECORD_JSP = "/weixin/ConsultationRecord_mine.jsp";
    protected static final String ADVICE = "/weixin/ConsultationRecord_advice.jsp";
    protected static final String ADVICE2 = "/weixin/aaa.jsp";
    protected static final String ADD_ADVICE = "/weixin/add_advise.jsp";//追加路径
    protected static final String RECORD_DETAILS_JSP = "/weixin/ConsultationRecord_details.jsp";
    protected static final String TEACHER_REPLY_JSP = "/weixin/ConsultationRecord_teacherReply.jsp";
    protected static final String READNUMBER_JSP = "/weixin/Read_number.jsp";
    protected static final String WXCONSUMER_JSP = "/weixin/NotReply.jsp";
    protected static final String WX_READY_JSP = "/weixin/ReadyReply.jsp";
    protected static final String CONSULTATION_ADD_JSP = "/weixin/ConsultationRecord_add.jsp";
    protected static final String WX_NOTREWARD = "/weixin/NotReward.jsp";
    protected static final String WX_OPENREWARD = "/weixin/OpenReward.jsp";
    //protected static final String CONSULTATION_ADD_JSP="/weixin/ConsultationRecord_add.jsp";


    private List<TbConsultationRecord> recordList;
    private Result<TbConsultationRecord> pageResult;//分页
    private Result<TbTeacher> pageResult2;
    private static final TbConsultationRecord Null = null;

    private List<TbConsultationRecord> notReplyList;
    private List<TbConsumer> consumerList;
    private List<TbConsultationRecord> notRewardList;

    //综合查询内容
    private String queryText;
    private String queryTimeText1;
    private String queryTimeText2;
    private TbConsultationRecord tbConsultationRecord;
    private TbTeacher tbTeacher;
    private String teacherName;
    private TbConsumer tbConsumer;
    private String ConsultationText;
    private Integer recordId;

    public Integer getRecordId() {
        return recordId;
    }

    public void setRecordId(Integer recordId) {
        this.recordId = recordId;
    }


    @Autowired
    private TbConsumerService tbConsumerService;
    private List<TbConsultationRecord> readyReplyList;
    @Autowired
    private TbConsultationRecordService tbConsultationRecordService;
    @Autowired
    private TbTeacherService tbTeacherService;


    @Override
    public TbConsultationRecord getModel() {
        if (null == tbConsultationRecord) {
            tbConsultationRecord = new TbConsultationRecord();
        }
        return tbConsultationRecord;
    }

    @Override
    public void prepare() throws Exception {
        if (null == tbTeacher) {
            tbTeacher = new TbTeacher();
        }


    }


    /**
     * 追加回复写入页，与提交
     *
     * @author chentianhao
     * @version 2019.04.11
     */
    public String addTeacherAdvise() {
        int id3 = tbConsultationRecord.getRecordId();
        TbConsultationRecord symptom = tbConsultationRecordService.symptom_description(id3);
        symptom.setAdditionalAdvice(tbConsultationRecord.getAdditionalAdvice());
        //获取当前时间
        symptom.setAdditionalAdviceTime(MyTime.getNowForTimestamp());

        tbConsultationRecordService.addTeacherAdvise(symptom);

        return readyReply();
    }

    /**
     * 点击未回复中某个症状的追加回复写入页
     *
     * @author chentianhao
     * @version 2019.04.11
     */
    public String addSymptomDescription() {
        int id2 = tbConsultationRecord.getRecordId();


        TbConsultationRecord symptom = tbConsultationRecordService.symptom_description(id2);

        //查询用户姓名
        String openid = symptom.getOpenId();
        TbConsumer tbConsumer = tbConsumerService.findName(openid);
        String username = tbConsumer.getConsumerName();

        ServletActionContext.getRequest().setAttribute("username", username);
        ServletActionContext.getRequest().setAttribute("symptom", symptom.getSymptomDescription());
        ServletActionContext.getRequest().setAttribute("time", symptom.getConsultTime());
        ServletActionContext.getRequest().setAttribute("recordid", id2);
        ServletActionContext.getRequest().setAttribute("photo", tbConsumer.getConsumerHeadImgUrl());

        setForwardView(ADD_ADVICE);
        return SUCCESS;
    }


    /**
     * 会员名称显示
     *
     * @author chentianhao
     * @version 2019.03.27
     */
    public String consumerName() {
        TbConsultationRecord symptom = tbConsultationRecordService.symptom_description(1);
        String openid = symptom.getOpenId();
        //System.out.println("++++++++" + openid);
        TbConsumer tbConsumer = tbConsumerService.findName(openid);
        String username = tbConsumer.getConsumerName();
        //System.out.println("++++++++" + tbConsumer.getConsumerName());
        ServletActionContext.getRequest().setAttribute("username", username);

        setForwardView(ADVICE);
        return SUCCESS;
    }

    /**
     * 回复写入页→加入模板消息通知
     *
     * @author chentianhao→叶城廷
     * @version 2019.03.20→2019.05.07
     */
    public String teacherAdvise() {
        int id3 = tbConsultationRecord.getRecordId();
        TbConsultationRecord symptom = tbConsultationRecordService.symptom_description(id3);
        if(tbConsultationRecord.getAdvice() == null){
            return openNotReply();
        }
        //System.out.println("........" + id3);
        //System.out.println(tbConsultationRecord.getAdvice());
        symptom.setAdvice(tbConsultationRecord.getAdvice());
        //获取当前时间
        symptom.setAdviceTime(MyTime.getNowForTimestamp());

        //tbConsultationRecord.getAdvice();
        tbConsultationRecordService.teacherAdvise(symptom);
//		setForwardView(WXCONSUMER_JSP);
//		return SUCCESS;

        //执行微信公众号对用户的通知
        WeixinUtil.sendConsumerTemplateMessage(symptom.getOpenId(),symptom.getSymptomDescription(),symptom.getConsultTime().toString());
        return openNotReply();
    }

    /**
     * 点击未回复中某个症状的回复写入页
     *
     * @author chentianhao
     * @version 2019.03.20
     */
    public String symptomDescription() {
        int id2 = tbConsultationRecord.getRecordId();

        //System.out.println(id2);
        //int id =(Integer) ServletActionContext.getServletContext().getAttribute("recordId");
//		 ActionContext context = ActionContext.getContext();
//		HttpServletRequest request = (HttpServletRequest) context
//                .get(ServletActionContext.HTTP_REQUEST);
        //System.out.println("TTTTTT=="+id);
        TbConsultationRecord symptom = tbConsultationRecordService.symptom_description(id2);
       // System.out.println(symptom.getSymptomDescription());

        //查询用户姓名
        //symptom =tbConsultationRecordService.symptom_description(1);
        String openid = symptom.getOpenId();
        System.out.println("++++++++" + openid);
        TbConsumer tbConsumer = tbConsumerService.findName(openid);
        String username = tbConsumer.getConsumerName();
        //System.out.println("++++++++" + tbConsumer.getConsumerName());
        ServletActionContext.getRequest().setAttribute("username", username);

        ServletActionContext.getRequest().setAttribute("symptom", symptom.getSymptomDescription());
        ServletActionContext.getRequest().setAttribute("time", symptom.getConsultTime());
        ServletActionContext.getRequest().setAttribute("recordid", id2);
        ServletActionContext.getRequest().setAttribute("photo", tbConsumer.getConsumerHeadImgUrl());

        setForwardView(ADVICE);
        return SUCCESS;
    }



    /**
     * 接收left.jsp的转跳到咨询记录的list.jsp
     *
     * @author chentianhao => zuofengwei
     * @version 2019.03.01 => 2019.05.25
     */
    public String toRecordList() {

        /*if(teacherName != null && !teacherName.equals("")){
            tbConsultationRecord.setTeacherId(tbTeacherService.findByTeacherNameLike(teacherName).getTeacherId());
        }*/
        Result<Object[]> pageResult = tbConsultationRecordService.findRecordList(tbConsultationRecord, getPage(),6,teacherName);

        ActionContext.getContext().put("pageList",pageResult);
        setForwardView(LIST_JSP);
        return SUCCESS;
    }

    /**
     * @Author zuofengwei
     * @Description 删除调理建议为空的咨询记录
     * @Date 2019/6/2 10:06
     * @param
     * @return java.lang.String
     **/
    public String deleteOne(){
        System.out.println(tbConsultationRecord.getRecordId());
        if(tbConsultationRecord.getRecordId() != null ){
            tbConsultationRecordService.deleteConsultationRecord(tbConsultationRecord.getRecordId());
        }
        return toRecordList();
    }

    /**
     * 查询咨询记录
     *
     * @author chentianhao
     * @version 2019.03.01
     */
    public String queryList() {
        pageResult = tbConsultationRecordService.queryList(tbConsultationRecord, getPage(),6);

        setForwardView(LIST_JSP);
        return SUCCESS;
    }


    public String record() {
        tbConsumer = (TbConsumer) getSession().getAttribute("currentConsumer");
        String openId = tbConsumer.getOpenId();
//		String openId = "1001";
        recordList = tbConsultationRecordService.record(openId);
        setForwardView(MY_RECORD_JSP);
        return SUCCESS;
    }


    /**
     * 咨询记录详情
     *
     * @author 丁程强
     * @version 2019.03.27
     */
    public String recordDetails() {
        tbConsultationRecord = tbConsultationRecordService.recordDetails(tbConsultationRecord.getRecordId());
        tbTeacher = tbConsultationRecordService.getByTeacherId(tbConsultationRecord.getTeacherId());
        if (tbConsultationRecord.getExceptionalStatus() == 0) {
            setForwardView(RECORD_DETAILS_JSP);
        } else if (tbConsultationRecord.getExceptionalStatus() == 1) {
            setForwardView(TEACHER_REPLY_JSP);//已打赏
        }
        return SUCCESS;
    }


    /**
     * 未回复页面查询
     * 2019.3.30
     *
     * @param
     * @author 董冰雪
     */
    public String openNotReply() {
        TbTeacher tbTeacher1 = (TbTeacher) getSession().getAttribute("teacher");//从session中查出老师信息
        notReplyList = tbConsultationRecordService.findByNotReply(tbTeacher1);//把老师信息丢到service中根据老师姓名查找未回复信息并返回
        consumerList = tbConsumerService.findByconsumerquery();//查询所有的用户信息
        for (int i = 0; i < notReplyList.size(); i++) {
            //从未回复信息里取出openid
            String openId = notReplyList.get(i).getOpenId();
            //循环病人集合，取出对应病人信息
            for (TbConsumer consumer : consumerList) {
                if (consumer.getOpenId().equals(openId)) {
                    //把病人信息存到未回复信息里
                    notReplyList.get(i).setTbConsumer(consumer);
                }
            }

        }
        getSession().setAttribute("notReplyList", notReplyList);
        setForwardView(WXCONSUMER_JSP);//跳转回页面

        return SUCCESS;
    }

    /**
     * 已回复页面查询
     * 齐美琳
     * 2019.3.30
     */
    public String readyReply() {//readyReplyList

        TbTeacher tbTeacher2 = (TbTeacher) getSession().getAttribute("teacher");//从session中查出老师信息
        readyReplyList = tbConsultationRecordService.findByreadyReply(tbTeacher2);//把老师信息丢到service中根据老师姓名查找未回复信息并返回
        consumerList = tbConsumerService.findByconsumerquery();//查询所有的用户信息

        for (int i = 0; i < readyReplyList.size(); i++) {
            //从未回复信息里取出openid
            String openId = readyReplyList.get(i).getOpenId();
            //循环病人集合，取出对应病人信息
            for (TbConsumer consumer : consumerList) {
                if (consumer.getOpenId().equals(openId)) {
                    //把病人信息存到未回复信息里
                    readyReplyList.get(i).setTbConsumer(consumer);
                }
            }

        }
        getSession().setAttribute("readyReplyList", readyReplyList);

        setForwardView(WX_READY_JSP);//跳转回页面

        return SUCCESS;
    }

    /**
     * 未打赏页面
     * 2019.4.2
     *
     * @param
     * @author 董冰雪
     */
    public String openNotReward() {
        TbTeacher tbTeacher1 = (TbTeacher) getSession().getAttribute("teacher");//从session中查出老师信息

        notRewardList = tbConsultationRecordService.findByReward(tbTeacher1);//把老师信息丢到service中根据老师姓名查找未回复信息并返回
        consumerList = tbConsumerService.findByconsumerquery();//查询所有的用户信息
        for (int i = 0; i < notRewardList.size(); i++) {
            //从未回复信息里取出openid
            String openId = notRewardList.get(i).getOpenId();
            //循环病人集合，取出对应病人信息
            for (TbConsumer consumer : consumerList) {
                if (consumer.getOpenId().equals(openId)) {
                    //把病人信息存到未回复信息里
                    notRewardList.get(i).setTbConsumer(consumer);
                }
            }

        }
        getSession().setAttribute("notRewardList", notRewardList);
        setForwardView(WX_NOTREWARD);//跳转回页面		
        return SUCCESS;
    }

    /**
     * 服务统计页面+服务统计页面综合查询
     *
     * @author zuofengwei
     * @version 2019.03.04 ->2019.03.05
     */
    public String serviceStatistics() {

        pageResult2 = tbTeacherService.queryTeacherListByQueryText(queryText, getPage(), getRow());

        List<Object[]> awardList = tbConsultationRecordService.getAwardCount();
        List<Object[]> unawardList = tbConsultationRecordService.getUnawardCount();
        List<Object[]> serveList = tbConsultationRecordService.getServeCount();
        List<Object[]> unserveList = tbConsultationRecordService.getUnserveCount();
        List<Object[]> statisList = new ArrayList<>();
        int j = 0;

        for (int i = 0; i < pageResult2.getData().size(); ++i) {

            Object[] obj = new Object[6];
            obj[0] = pageResult2.getData().get(i).getTeacherName();
            obj[1] = pageResult2.getData().get(i).getTeacherId();

            for (j = 0; j < awardList.size(); ++j) {
                if (obj[1].equals(awardList.get(j)[0])) {
                    obj[2] = awardList.get(j)[1] != null ? awardList.get(j)[1] : 0;
                }
            }

            for (j = 0; j < unawardList.size(); ++j) {
                if (obj[1].equals(unawardList.get(j)[0])) {
                    obj[3] = unawardList.get(j)[1] != null ? unawardList.get(j)[1] : 0;
                }
            }


            for (j = 0; j < serveList.size(); ++j) {
                if (obj[1].equals(serveList.get(j)[0])) {
                    obj[4] = serveList.get(j)[1] != null ? serveList.get(j)[1] : 0;
                }
            }

            for (j = 0; j < unserveList.size(); ++j) {
                if (obj[1].equals(unserveList.get(j)[0])) {
                    obj[5] = unserveList.get(j)[1] != null ? unserveList.get(j)[1] : 0;
                }
            }
            if (obj != null)
                statisList.add(obj);

        }


        ActionContext context = ActionContext.getContext();
//		context.put("awardList", awardList);
//		context.put("unawardList", unawardList);
//		context.put("serveList", serveList);
//		context.put("unserveList", unserveList);
        context.put("statisList", statisList);
        setForwardView(STATIS_LIST_JSP);
        return SUCCESS;
    }

    public String openReadNumber() {
        setForwardView(READNUMBER_JSP);
        return SUCCESS;
    }

    /**
     * 已打赏页面查询
     * 陈紫丽
     * 2019.4.2
     */
    public String openReward() {//readyReplyList
        TbTeacher tbTeacher1 = (TbTeacher) getSession().getAttribute("teacher");//从session中查出老师姓名

        readyReplyList = tbConsultationRecordService.findyds(tbTeacher1);//把老师姓名丢到service中根据老师姓名查找未回复信息并返回
        consumerList = tbConsumerService.findByconsumerquery();//查询所有的用户信息，没有用到参数

        for (int i = 0; i < readyReplyList.size(); i++) {
            //从未回复信息里取出openid
            String openId = readyReplyList.get(i).getOpenId();
            //循环病人集合，取出对应病人信息
            for (TbConsumer consumer : consumerList) {
                if (consumer.getOpenId().equals(openId)) {
                    //把病人信息存到未回复信息里
                    readyReplyList.get(i).setTbConsumer(consumer);
                }
            }

        }
        getSession().setAttribute("readyReplyList", readyReplyList);

        setForwardView(WX_OPENREWARD);//跳转回已打赏页面

        return SUCCESS;
    }


    /**
     * 保存用户提交的咨询记录(微信页面)→加入模板消息通知
     *
     * @return
     * @author 左丰维→叶城廷
     * @version 2019.3.20→2019.05.07
     */
    public String saveConsultationRecord() {


        //上线时的代码
        TbConsumer consumer = (TbConsumer) getSession().getAttribute("currentConsumer");
        if(ConsultationText==null||ConsultationText.length()==0){
        }else {
            tbConsultationRecordService.saveConsultationRecord(tbTeacher.getTeacherId(), consumer.getOpenId(), ConsultationText);
        }

        //测试代码
//		Integer ConsumerId = 1001;
//			System.out.println(tbTeacher.getTeacherName());
//			System.out.println(ConsultationText);
//		tbConsultationRecordService.saveConsultationRecord(tbTeacher.getTeacherName(),ConsumerId,ConsultationText);

        // 要跳转的页面



        return record();
    }


    public TbConsultationRecordService getTbConsultationRecordService() {
        return tbConsultationRecordService;
    }

    public void setTbConsultationRecordService(TbConsultationRecordService tbConsultationRecordService) {
        this.tbConsultationRecordService = tbConsultationRecordService;
    }

    public TbTeacher getTbTeacher() {
        return tbTeacher;
    }

    public TbTeacherService getTbTeacherService() {
        return tbTeacherService;
    }

    public void setTbTeacher(TbTeacher tbTeacher) {
        this.tbTeacher = tbTeacher;
    }

    public void setTbTeacherService(TbTeacherService tbTeacherService) {
        this.tbTeacherService = tbTeacherService;
    }

    public static long getSerialversionuid() {
        return serialVersionUID;
    }

    public static String getListJsp() {
        return LIST_JSP;
    }

    public static String getStatisListJsp() {
        return STATIS_LIST_JSP;
    }

    public Result<TbConsultationRecord> getPageResult() {
        return pageResult;
    }

    public String getQueryText() {
        return queryText;
    }

    public TbConsultationRecord getTbConsultationRecord() {
        return tbConsultationRecord;
    }

    public void setPageResult(Result<TbConsultationRecord> pageResult) {
        this.pageResult = pageResult;
    }

    public void setQueryText(String queryText) {
        this.queryText = queryText;
    }

    public void setTbConsultationRecord(TbConsultationRecord tbConsultationRecord) {
        this.tbConsultationRecord = tbConsultationRecord;
    }

    public String getQueryTimeText1() {
        return queryTimeText1;
    }

    public String getQueryTimeText2() {
        return queryTimeText2;
    }

    public void setQueryTimeText1(String queryTimeText1) {
        this.queryTimeText1 = queryTimeText1;
    }

    public void setQueryTimeText2(String queryTimeText2) {
        this.queryTimeText2 = queryTimeText2;
    }

    public Result<TbTeacher> getPageResult2() {
        return pageResult2;
    }

    public void setPageResult2(Result<TbTeacher> pageResult2) {
        this.pageResult2 = pageResult2;
    }


    public List<TbConsultationRecord> getNotReplyList() {
        return notReplyList;
    }

    public void setNotReplyList(List<TbConsultationRecord> notReplyList) {
        this.notReplyList = notReplyList;
    }

    public List<TbConsumer> getConsumerList() {
        return consumerList;
    }

    public void setConsumerList(List<TbConsumer> consumerList) {
        this.consumerList = consumerList;
    }


    public static String getAdvice() {
        return ADVICE;

    }


    public List<TbConsultationRecord> getRecordList() {
        return recordList;

    }


    public TbConsumerService getTbConsumerService() {
        return tbConsumerService;
    }

    public void setTbConsumerService(TbConsumerService tbConsumerService) {
        this.tbConsumerService = tbConsumerService;
    }


    public void setRecordList(List<TbConsultationRecord> recordList) {
        this.recordList = recordList;
    }


    public TbConsumer getTbConsumer() {
        return tbConsumer;
    }


    public void setTbConsumer(TbConsumer tbConsumer) {
        this.tbConsumer = tbConsumer;
    }


    public String getConsultationText() {
        return ConsultationText;
    }

    public void setConsultationText(String consultationText) {
        ConsultationText = consultationText;
    }

    public List<TbConsultationRecord> getReadyReplyList() {
        return readyReplyList;
    }

    public void setReadyReplyList(List<TbConsultationRecord> readyReplyList) {
        this.readyReplyList = readyReplyList;
    }

    public String getTeacherName() {
        return teacherName;
    }

    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
    }
}
