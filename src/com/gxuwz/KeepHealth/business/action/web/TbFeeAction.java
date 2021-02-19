package com.gxuwz.KeepHealth.business.action.web;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.gxuwz.KeepHealth.business.entity.TbFee;
import com.gxuwz.KeepHealth.business.service.TbFeeService;
import com.gxuwz.KeepHealth.util.ResSecurty;
import com.gxuwz.KeepHealth.wx.util.WxPayUtil;
import com.gxuwz.core.web.action.BaseAction;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;

public class TbFeeAction extends BaseAction implements ModelDriven<TbFee>{
	private TbFee tbFee = new TbFee();
	private ResSecurty res = new ResSecurty();
	@Autowired
	private TbFeeService tbFeeService;
	protected static final String EDITMONEY_JSP = "/WEB-INF/page/web/health_settlement/Money_edit.jsp";
	
	/**
	 * 修改咨询金额
	 * @return
	 */
	public String update() {
		try {
			tbFee.setFeeNum(res.jiami(tbFee.getFeeNum()));//把输入的金额通过jiami（）来加密保存到数据库
			
			tbFeeService.update(tbFee);
			return openEditMoney();
		} catch (Exception e) {
			return openEditMoney();
		}
	}
	
	/**
	 * 打开修改页面
	 * @return
	 */
	public String openEditMoney(){
		tbFee = tbFeeService.findById(1);
		tbFee.setFeeNum(res.jiemi(tbFee.getFeeNum()));//从数据库取出加密的金额 通过 jiemi（）来解密
		Map request=(Map)ActionContext.getContext().get("request");
		
		request.put("tbFee", tbFee);
		setForwardView(EDITMONEY_JSP);
		return SUCCESS;
	}
	
	

	@Override
	public TbFee getModel() {
		// TODO Auto-generated method stub
		return tbFee;
	}

}
