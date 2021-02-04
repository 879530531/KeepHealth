package com.gxuwz.KeepHealth.business.action.web;

import com.gxuwz.KeepHealth.business.entity.TbFormula;
import com.gxuwz.KeepHealth.business.service.TbFormulaService;
import com.gxuwz.core.pagination.Result;
import com.gxuwz.core.web.action.BaseAction;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.UnsupportedEncodingException;
import java.util.List;

/**
 * 与念数机配方相关控制器Action
 * @author yechengting
 *@version 2019.2.16
 */
public class TbFormulaAction extends BaseAction implements Preparable, ModelDriven{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	protected static final String LIST_JSP = "/WEB-INF/page/web/health_formula/Formula_list.jsp";
	protected static final String ADD_JSP = "/WEB-INF/page/web/health_formula/Formula_add.jsp";
	protected static final String EDIT_JSP = "/WEB-INF/page/web/health_formula/Formula_edit.jsp";
	protected static final String WX_FORMULA = "/weixin/CommonFormula.jsp";
	protected static final String WX_SYMPTOMS = "/weixin/CommonSymptoms.jsp";
	private Result<TbFormula> pageResult;//分页
	private TbFormula tbFormula;
	//修改进程标志
	private String actionState;
	//综合查询内容
	private String queryText;

	private List<TbFormula> list;

	private String[] tbFormulaContexts;
	@Autowired
	private TbFormulaService  tbFormulaService;
	
	@Override
	public Object getModel() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void prepare() throws Exception {
		if(null == tbFormula){
			tbFormula = new TbFormula();
		}
		
	}
	
	public String addFormula() {
		actionState=tbFormulaService.addFormula(tbFormula);
		setForwardView(ADD_JSP);
		return SUCCESS;
	}
	public String changeState() {
		actionState=tbFormulaService.changeState(tbFormula.getFormulaId());
		setForwardView(LIST_JSP);
		return SUCCESS;
	}
	
	public String deleteFormula() {
		actionState=tbFormulaService.deleteFormula(tbFormula.getFormulaId());
		setForwardView(LIST_JSP);
		return SUCCESS;
	}
	
	public String queryList() {
		pageResult=tbFormulaService.queryFormulaList(queryText,getPage(),getRow());
		setForwardView(LIST_JSP);
		return SUCCESS;
	}
	
	public String openList() {
		pageResult=tbFormulaService.queryFormulaList("",getPage(),getRow());
		setForwardView(LIST_JSP);
		return SUCCESS;
	}
	
	public String openAddFormula() {		
		setForwardView(ADD_JSP);
		return SUCCESS;
	}
	
	public String openEditFormula() {	
		tbFormula=tbFormulaService.queryFormulaById(tbFormula.getFormulaId());
		setForwardView(EDIT_JSP);
		return SUCCESS;
	}

	public String updateFormula() {
		actionState=tbFormulaService.updateFormula(tbFormula);
		setForwardView(EDIT_JSP);
		return SUCCESS;
	}
	/**
	 * @Author zuofengwei
	 * @Description 根据配方类型查询配方集合（微信症状）
	 * @Date 2019/4/14 16:11
	 * @param
	 * @return java.lang.String
	 **/
	public String queryTbFormulaList() {
		String formulaType=null;
		formulaType= tbFormula.getFormulaType();
		try {
			formulaType= new String(tbFormula.getFormulaType().getBytes("ISO-8859-1"),"UTF-8");//因服务器上支持不用比特流过滤乱码，暂停使用
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		tbFormula.setFormulaType(formulaType);
		list = tbFormulaService.queryTbFormulaListByformulaType(formulaType);
		setForwardView(WX_SYMPTOMS);
		return SUCCESS;
	}

	/**
	 * @Author zuofengwei
	 * @Description 通过配方的症状和详情获取配方内容
	 * @Date 2019/4/14 16:50
	 * @param
	 * @return java.lang.String
	 **/
	public String queryFormulaContext() {

		tbFormula = tbFormulaService.queryFormulaById(tbFormula.getFormulaId());
//		String formulaContext = tbFormulaService.queryFormulaContext(tbFormula.getFormulaSymptom(),tbFormula.getFormulaSymptomDetails());
		String formulaContext = tbFormula.getFormulaContext();

		tbFormulaContexts = formulaContext.split(",");

		setForwardView(WX_FORMULA);
		return SUCCESS;
	}

	public TbFormulaService getTbFormulaService() {
		return tbFormulaService;
	}

	public void setTbFormulaService(TbFormulaService tbFormulaService) {
		this.tbFormulaService = tbFormulaService;
	}

	public Result<TbFormula> getPageResult() {
		return pageResult;
	}

	public void setPageResult(Result<TbFormula> pageResult) {
		this.pageResult = pageResult;
	}

	public TbFormula getTbFormula() {
		return tbFormula;
	}

	public void setTbFormula(TbFormula tbFormula) {
		this.tbFormula = tbFormula;
	}

	public String getActionState() {
		return actionState;
	}

	public void setActionState(String actionState) {
		this.actionState = actionState;
	}

	public String getQueryText() {
		return queryText;
	}

	public void setQueryText(String queryText) {
		this.queryText = queryText;
	}

	public List<TbFormula> getList() {
		return list;
	}

	public void setList(List<TbFormula> list) {
		this.list = list;
	}

	public String[] getTbFormulaContexts() {
		return tbFormulaContexts;
	}

	public void setTbFormulaContexts(String[] tbFormulaContexts) {
		this.tbFormulaContexts = tbFormulaContexts;
	}
}
