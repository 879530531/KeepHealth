package com.gxuwz.KeepHealth.business.action.web;

import org.springframework.beans.factory.annotation.Autowired;

import com.gxuwz.KeepHealth.business.entity.SysUserRole;
import com.gxuwz.core.pagination.Result;
import com.gxuwz.core.web.action.BaseAction;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

public class SysUserRoleAction  extends BaseAction implements Preparable, ModelDriven{
	

	protected static final String LIST_JSP = "/WEB-INF/page/web/SysUserRole_list.jsp";
	private SysUserRole sysUserRole;
	private Result<SysUserRole> pageResult;//分页

	public void prepare() throws Exception{
		if(null == sysUserRole){
			sysUserRole = new SysUserRole();
		}
		}

	/**
	 * 列表
	 * @return
	 * @throws Exception
	 */
	public String list()throws Exception{
		//pageResult = sysUserRoleService.find(sysUserRole, getPage(), getRow());
		forwardView = LIST_JSP;
		return SUCCESS;
	}
	
	
	
	
	@Override
	public Object getModel() {
		return sysUserRole;
	}

	public Result<SysUserRole> getPageResult() {
		return pageResult;
	}

	public void setPageResult(Result<SysUserRole> pageResult) {
		this.pageResult = pageResult;
	}
	
	
}
