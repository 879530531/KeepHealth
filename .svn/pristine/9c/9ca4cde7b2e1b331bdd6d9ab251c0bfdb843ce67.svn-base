package com.gxuwz.KeepHealth.business.action.web;

import org.springframework.beans.factory.annotation.Autowired;

import com.gxuwz.KeepHealth.business.entity.TbConsultationRecord;
import com.gxuwz.KeepHealth.business.entity.TbExceptional;
import com.gxuwz.KeepHealth.business.entity.TbFormula;
import com.gxuwz.KeepHealth.business.service.TbExceptionalService;
import com.gxuwz.core.pagination.Result;
import com.gxuwz.core.web.action.BaseAction;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

/**
 * 与交易对账相关（打赏）的控制器
 *  @author 叶城廷
 * @version 2019.03.01
 */
public class TbExceptionalAction extends BaseAction implements Preparable, ModelDriven<TbExceptional>{
	
	private static final long serialVersionUID = 1L;
	private static final String LIST_JSP = "/WEB-INF/page/web/health_exceptional/Exceptional_list.jsp";
	private static final String LIST_JSP2="/WEB-INF/page/web/health_exceptional/jump_to_water.jsp";
	
	private Result<TbExceptional> pageResult;//分页
	private TbExceptional tbExceptional;
	private TbConsultationRecord tbConsultationRecord;
	//选择的起始时间
	private String queryText1;
	//选择的结束时间
	private String queryText2;
	@Autowired
	private TbExceptionalService  tbExceptionalService;
	
	@Override
	public TbExceptional getModel() {
		if(null == tbExceptional) {
			tbExceptional = new TbExceptional();
		}return tbExceptional;
	}

	@Override
	public void prepare() throws Exception {
		if(null == tbExceptional) {
			tbExceptional = new TbExceptional();
		}
		if(null == tbConsultationRecord) {
			tbConsultationRecord = new TbConsultationRecord();
		}
	}

	/**
	 * 交易对账查询列表
	 * @return
	 * @author 丁程强
	 * @date 2019年3月2日
	 */
	public String queryList(){
		pageResult = tbExceptionalService.queryExceptionalList(queryText1, queryText2, getPage(), getRow());
		setForwardView(LIST_JSP);
		return SUCCESS;
	}
	
	/**
	 * 交易对账列表
	 * @return
	 * @author 丁程强
	 * @date 2019年3月2日
	 */
	public String openList(){
		pageResult = tbExceptionalService.queryExceptionalList("", "", getPage(), getRow());
		setForwardView(LIST_JSP);
		return SUCCESS;
	}
	public String openList2(){
		pageResult = tbExceptionalService.queryExceptionalList2(tbExceptional, getPage(), getRow());
		setForwardView(LIST_JSP2);
		return SUCCESS;
	}
	
	/**
	 * 咨询记录中打赏流水链接的转跳
	 *  @author 陈天昊
	 * @version 2019.03.01
	 
	public String waterDetail (String waterNumber){
		tbExceptionalService.queryWaterDetail(waterNumber);
		
	}
*/
	public TbExceptionalService getTbExceptionalService() {
		return tbExceptionalService;
	}

	public void setTbExceptionalService(TbExceptionalService tbExceptionalService) {
		this.tbExceptionalService = tbExceptionalService;
	}

	public Result<TbExceptional> getPageResult() {
		return pageResult;
	}

	public void setPageResult(Result<TbExceptional> pageResult) {
		this.pageResult = pageResult;
	}

	public TbExceptional getTbExceptional() {
		return tbExceptional;
	}

	public void setTbExceptional(TbExceptional tbExceptional) {
		this.tbExceptional = tbExceptional;
	}

	public String getQueryText1() {
		return queryText1;
	}

	public void setQueryText1(String queryText1) {
		this.queryText1 = queryText1;
	}

	public String getQueryText2() {
		return queryText2;
	}

	public void setQueryText2(String queryText2) {
		this.queryText2 = queryText2;
	}

	public TbConsultationRecord getTbConsultationRecord() {
		return tbConsultationRecord;
	}

	public void setTbConsultationRecord(TbConsultationRecord tbConsultationRecord) {
		this.tbConsultationRecord = tbConsultationRecord;
	}

	

}
