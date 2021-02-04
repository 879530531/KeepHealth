package com.gxuwz.KeepHealth.business.action.web;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import com.gxuwz.KeepHealth.business.entity.TbConsultationRecord;
import com.gxuwz.KeepHealth.business.entity.TbTeacher;
import com.gxuwz.KeepHealth.business.service.TbConsultationRecordService;
import com.gxuwz.KeepHealth.business.service.TbExceptionalService;
import com.gxuwz.KeepHealth.business.service.TbTeacherService;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.gxuwz.KeepHealth.business.entity.TbSettlement;
import com.gxuwz.KeepHealth.business.service.TbSettlementService;
import com.gxuwz.core.pagination.Result;
import com.gxuwz.core.web.action.BaseAction;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

/**
 * 与结算管理相关的控制器
 *  @author 叶城廷
 * @version 2019.03.01---->2019.3.3 zuofengwei  结算管理
 */
public class TbSettlementAction extends BaseAction implements Preparable, ModelDriven<TbSettlement>{

	
	

	private static final long serialVersionUID = 1L;
	protected static final String LIST_JSP =  "/WEB-INF/page/web/health_settlement/Settlement_list.jsp";
	protected static final String EDITMONEY_JSP =  "/WEB-INF/page/web/health_settlement/Money_edit.jsp";
	protected static final String WX_REPLY_JSP="/weixin/ConsultationRecord_teacherReply.jsp";
	private Result<TbSettlement> pageResult;//分页
	private TbSettlement tbSettlement = new TbSettlement();
	private String queryText;
	private String settlementList;
	@Autowired
	private TbSettlementService  tbSettlementService;
	@Autowired
	private TbExceptionalService tbExceptionalService;
	@Autowired
	private TbConsultationRecordService tbConsultationRecordService;

	@Autowired
	private TbTeacherService tbTeacherService;
	private Integer recordId;
	private Integer number;

	private TbConsultationRecord tbCr;
	private TbConsultationRecord tbConsultationRecord;
	private TbTeacher tbTeacher;

	private String radio;
	
	@Override
	public TbSettlement getModel() {
		return tbSettlement;
	}

	
	@Override
	public void prepare() throws Exception {
		if(settlementList==null){
			@SuppressWarnings("unused")
			List<TbSettlement> settlementList = new ArrayList<TbSettlement>();
		}
	}


	/**
	 * @Author zuofengwei
	 * @Description 列表
	 * @Date 2019/3/9 22:14
	 * @param
	 * @return java.lang.String
	 **/
	public String list() {
		
		pageResult = tbSettlementService.querySettlementList("",getPage(),getRow(),tbSettlement.getSettlementStatus());
		setForwardView(LIST_JSP);
		return SUCCESS;
	}
	

	/**
	 * @Author zuofengwei
	 * @Description  查询
	 * @Date 2019/3/9 22:13
	 * @param
	 * @return java.lang.String
	 **/
	public String queryList() {
		try{
			radio=tbSettlement.getSettlementStatus().toString();
		}catch (Exception e){

		}
		pageResult = tbSettlementService.querySettlementList(queryText,getPage(),getRow(),tbSettlement.getSettlementStatus());
		setForwardView(LIST_JSP);
		return SUCCESS;
	}
	

	/**
	 * @Author zuofengwei
	 * @Description 结算流水
	 * @Date 2019/3/9 22:13
	 * @param
	 * @return java.lang.String
	 **/
	@SuppressWarnings("unchecked")
	public String updateSettlement(){
		
		
		Gson gson = new GsonBuilder() .setPrettyPrinting().disableHtmlEscaping().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
		List<String> SettlementIdList = (List<String>) gson.fromJson(settlementList, List.class);

		tbSettlementService.updateSettlement(SettlementIdList);
		return list();
	}


	/**
	 * @Author zuofengwei   →叶城廷
	 * @Description 微信页面中用户点击打赏按钮后的后台操作→因数据库变更，作废
	 * @Date 2019/4/9 22:16→2019.5.2
	 * @param
	 * @return java.lang.String
	 **/
/*	public String rewardTeacher() {

        //自定义流水号
		String waterNumber = UUID.randomUUID().toString().replace("-","");
		tbConsultationRecord = tbConsultationRecordService.findByRecordId(tbCr.getRecordId());
		tbConsultationRecordService.ConsultationRecord(tbConsultationRecord,waterNumber);

		tbTeacher = tbTeacherService.findByTeacherId(tbConsultationRecord.getTeacherId());
		Integer dealStatus = 1;  //自定义已打赏
		tbExceptionalService.addExceptional(dealStatus,waterNumber,tbTeacher);
		tbSettlementService.addSettlement(tbConsultationRecord,tbTeacher);

		setForwardView(WX_REPLY_JSP);
		return SUCCESS;
	}*/

	/**
	 * @Author zuofengwei
	 * @Description 转发页面
	 * @Date 2019/4/29 20:08
	 * @param
	 * @return java.lang.String
	 **/
	public String openEditMoney(){
		/*int i = 1+1;
		System.out.println(i);
		number = i;*/
		setForwardView(EDITMONEY_JSP);
		return SUCCESS;
	}

	

	public TbSettlementService getTbSettlementService() {
		return tbSettlementService;
	}

	public void setTbSettlementService(TbSettlementService tbSettlementService) {
		this.tbSettlementService = tbSettlementService;
	}
	
	public TbSettlement getTbSettlement() {
		return tbSettlement;
	}

	public void setTbSettlement(TbSettlement tbSettlement) {
		this.tbSettlement = tbSettlement;
	}

	public Result<TbSettlement> getPageResult() {
		return pageResult;
	}

	public void setPageResult(Result<TbSettlement> pageResult) {
		this.pageResult = pageResult;
	}

	public String getQueryText() {
		return queryText;
	}

	public void setQueryText(String queryText) {
		this.queryText = queryText;
	}



	public String getSettlementList() {
		return settlementList;
	}

	public void setSettlementList(String settlementList) {
		this.settlementList = settlementList;
	}



	public Integer getRecordId() {
		return recordId;
	}

	public void setRecordId(Integer recordId) {
		this.recordId = recordId;
	}

	public TbConsultationRecord getTbCr() {
		return tbCr;
	}

	public void setTbCr(TbConsultationRecord tbCr) {
		this.tbCr = tbCr;
	}

	public TbConsultationRecord getTbConsultationRecord() {
		return tbConsultationRecord;
	}

	public void setTbConsultationRecord(TbConsultationRecord tbConsultationRecord) {
		this.tbConsultationRecord = tbConsultationRecord;
	}

	public TbTeacher getTbTeacher() {
		return tbTeacher;
	}

	public void setTbTeacher(TbTeacher tbTeacher) {
		this.tbTeacher = tbTeacher;
	}

	public Integer getNumber() {
		return number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}


	public String getRadio() {
		return radio;
	}

	public void setRadio(String radio) {
		this.radio = radio;
	}
}
