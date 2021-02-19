package com.gxuwz.KeepHealth.business.action.web;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;

import util.MyTime;

import com.gxuwz.KeepHealth.business.entity.TbPayNotes;
import com.gxuwz.KeepHealth.business.entity.TbPersonalData;
import com.gxuwz.KeepHealth.business.service.TbPayNotesService;
import com.gxuwz.KeepHealth.business.service.TbPersonalDataService;
import com.gxuwz.core.pagination.Result;
import com.gxuwz.core.web.action.BaseAction;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
/**
 * 缴费记录表控制器
 * @author  梧州学院 软件研发中心 陈洁
 * <br>Copyright (C), 2017, 梧州学院 软件研发中心
 * <br>This program is protected by copyright laws.
 * <br>Program Name: TbReadmeAction
 * <br>Date: 2017-03-01
 */
public class TbPayNotesAction extends BaseAction implements Preparable, ModelDriven{

	
	
	private static final long serialVersionUID = -4104125263890869018L;
	protected static final String LIST_JSP = "/WEB-INF/page/web/health_manage/SysMember_list.jsp";

	@Autowired
	private TbPayNotesService tbPayNotesService;
	private Result<TbPersonalData> pageResult;// 分页
	private TbPayNotes tbPayNotes;
	private Timestamp startTime;
	private Timestamp endTime;
	private int idd;
	private int level;

	//

	@Autowired
	private TbPersonalDataService tbPersonalDataService;

	private TbPersonalData tbPersonalData;

	public void prepare() throws Exception {
		if (null == tbPayNotes) {
			tbPayNotes = new TbPayNotes();
		}
		if (null == tbPersonalData) {
			tbPersonalData = new TbPersonalData();
		}
	}

	@Override
	public String execute() throws Exception {

		return SUCCESS;
	}

	/**
	 * 列表
	 * 
	 * @return
	 * @throws Exception
	 */
	public String list() throws Exception {
		// pageResult = sysUserService.find(sysUser, getPage(), getRow());
		// setForwardView(LIST_JSP);
		return SUCCESS;
	}

	/**
	 * 添加用户
	 * 
	 * @return
	 * @throws Exception
	 * @author 黄子珍
	 * @date 2017.03.23
	 */
	public String add() throws Exception {
		// System.out.println("123456222");
		// 获取当前系统时间
		String time = MyTime.getStringDate();
		/*
		 * Date date=new Date(); DateFormat format=new
		 * SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); String time =
		 * format.format(date);
		 */
		Timestamp payTime = Timestamp.valueOf(time);// 把String 类型转换成 Timestamp
													// 类型
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		int personalId = getIdd();
		String startTime = format.format(getStartTime());
		String endTime = format.format(getEndTime());
		int level = getLevel();
		tbPayNotes.setPersonalId(personalId);
		tbPayNotes.setPayTime(payTime);
		tbPayNotes.setPayWay(0);
		tbPayNotesService.addPayNotes(tbPayNotes);// 将缴费信息存进数据库
		tbPersonalData.setFlagType(0);
		tbPersonalDataService.updatePayNotes(personalId, startTime, endTime,
				level);// 更新客户数据，给客户添加会员等级、会员有效期
		tbPersonalData.setFlagType(0);
		pageResult = tbPersonalDataService.find(tbPersonalData, getPage(),
				getRow());
		setForwardView(LIST_JSP);
		return SUCCESS;
	}

	@Override
	public Object getModel() {

		return tbPayNotes;
	}

	public TbPayNotes getTbPayNotes() {
		return tbPayNotes;
	}

	public void setTbPayNotes(TbPayNotes tbPayNotes) {
		this.tbPayNotes = tbPayNotes;
	}

	public TbPersonalDataService getTbPersonalDataService() {
		return tbPersonalDataService;
	}

	public void setTbPersonalDataService(
			TbPersonalDataService tbPersonalDataService) {
		this.tbPersonalDataService = tbPersonalDataService;
	}

	public Timestamp getStartTime() {
		return startTime;
	}

	public void setStartTime(Timestamp startTime) {
		this.startTime = startTime;
	}

	public Timestamp getEndTime() {
		return endTime;
	}

	public void setEndTime(Timestamp endTime) {
		this.endTime = endTime;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public int getIdd() {
		return idd;
	}

	public void setIdd(int idd) {
		this.idd = idd;
	}

	public Result<TbPersonalData> getPageResult() {
		return pageResult;
	}

	public void setPageResult(Result<TbPersonalData> pageResult) {
		this.pageResult = pageResult;
	}
}
