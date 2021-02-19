package com.gxuwz.KeepHealth.business.action.web;


import java.util.List;

import com.gxuwz.KeepHealth.business.entity.*;
import com.gxuwz.KeepHealth.business.service.TbExceptionalService;
import org.springframework.beans.factory.annotation.Autowired;

import com.gxuwz.KeepHealth.business.service.PersonalDataDetailService;
import com.gxuwz.KeepHealth.business.service.TbPersonalDataService;
import com.gxuwz.KeepHealth.util.ExportExcel;
import com.gxuwz.core.pagination.Result;
import com.gxuwz.core.web.action.BaseAction;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
/**
 * 
* @ClassName: ExportExcelAction 
* @Description: 文件导出
* @author 软件开发中心  陈洁 
* @date 2017年4月11日 上午1:24:55
 */
@SuppressWarnings("serial")
public class ExportExcelAction  extends BaseAction  implements ModelDriven, Preparable {
	
	@SuppressWarnings("rawtypes")
	private ExportExcel exportExcel;
	private MentorServicesStatistics mentorServicesStatistics;
    private List<FatherHealth> fatherHealthList;
	private List<TbAdvice> fatherAdviceList;
	private List<TbFeedback> throughFeedbackList;
	private List<MentorServicesStatistics> mentorServicesStatisticsList;//导师服务统计列表
   	private List<listserviceNumber> listserviceNumberList;//各个导师的总服务数量列表
   	private List<TbPersonalData> tbPersonalDataList;//分页
	private int personalid = 0;
    @Autowired
	private PersonalDataDetailService personalDataDetailService; 
    @Autowired
    private TbExceptionalService tbExceptionalService;

    //选择的起始时间
    private String queryText1;
    //选择的结束时间
    private String queryText2;
    /**
	 * 导出Excel   导师服务记录（web界面）
	 * @return
	 * @throws Exception
	 * @author 陈洁
	 * @date 2017.04.11
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void Exports(){
    	
		ExportExcel exportExcel = new ExportExcel();
		tbPersonalDataList = (List<TbPersonalData>)getRequest().getSession().getAttribute("tbPersonalDataList");
		mentorServicesStatisticsList = (List<MentorServicesStatistics>)getRequest().getSession().getAttribute("mentorServicesStatisticsList");
		listserviceNumberList = (List<listserviceNumber>)getRequest().getSession().getAttribute("listserviceNumberList");
		exportExcel.ExportTeacherExcel(tbPersonalDataList,mentorServicesStatisticsList,listserviceNumberList);//调用导出Excel方法进行导出
        }
        /**
         * 导出指定交易对账记录
         * @author 叶城廷
         * @date 2019-07-13 14:30:05
         **/
	public void Exceptional(){
		ExportExcel exportExcel = new ExportExcel();
        Result<TbExceptional> pageResult = tbExceptionalService.queryExceptionalList(queryText1, queryText2, 0, 999999999);
		exportExcel.ExportExceptionalExcel(pageResult.getData());//调用导出Excel方法进行导出
	}

	/**
	 * 导出Excel   健康记录（web界面）
	 * @return
	 * @throws Exception
	 * @author 陈洁
	 * @date 2017.04.11
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void ExportHealthRecord(){
		int personalId = getPersonalid();//获取前台传过来的数据
		System.out.println(personalId+"========");
		ExportExcel exportExcel = new ExportExcel();
		fatherHealthList = personalDataDetailService.findByPersonalId(personalId);//根据会员id查询会员所有健康自述记录
		fatherAdviceList = personalDataDetailService.findByAdvicePersonalId(personalId);//根据会员id查询会员所有调理建议记录
		throughFeedbackList = personalDataDetailService.findFeedbackMemberId(personalId);//根据会员id查询该会员的所有效果反馈记录
		exportExcel.ExportRecordExcel(fatherHealthList,fatherAdviceList,throughFeedbackList);
        }
	
	

	public MentorServicesStatistics getMentorServicesStatistics() {
		return mentorServicesStatistics;
	}

	public void setMentorServicesStatistics(MentorServicesStatistics mentorServicesStatistics) {
		this.mentorServicesStatistics = mentorServicesStatistics;
	}

	@SuppressWarnings("rawtypes")
	public ExportExcel getExportExcel() {
		return exportExcel;
	}

	@SuppressWarnings("rawtypes")
	public void setExportExcel(ExportExcel exportExcel) {
		this.exportExcel = exportExcel;
	}

	public List<FatherHealth> getFatherHealthList() {
		return fatherHealthList;
	}

	public void setFatherHealthList(List<FatherHealth> fatherHealthList) {
		this.fatherHealthList = fatherHealthList;
	}

	public List<TbAdvice> getFatherAdviceList() {
		return fatherAdviceList;
	}

	public void setFatherAdviceList(List<TbAdvice> fatherAdviceList) {
		this.fatherAdviceList = fatherAdviceList;
	}


	public List<TbFeedback> getThroughFeedbackList() {
		return throughFeedbackList;
	}

	public void setThroughFeedbackList(List<TbFeedback> throughFeedbackList) {
		this.throughFeedbackList = throughFeedbackList;
	}

	public int getPersonalid() {
		return personalid;
	}

	public void setPersonalid(int personalid) {
		this.personalid = personalid;
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

    @Override
	public void prepare() throws Exception {
		// TODO Auto-generated method stub
		
	}



	@Override
	public Object getModel() {
		// TODO Auto-generated method stub
		return null;
	}
}
