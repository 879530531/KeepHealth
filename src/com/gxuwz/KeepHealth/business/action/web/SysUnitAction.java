package com.gxuwz.KeepHealth.business.action.web;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.gxuwz.KeepHealth.business.dao.SysUnitDAO;
import com.gxuwz.KeepHealth.business.entity.SysDepartment;



import com.gxuwz.KeepHealth.business.entity.SysUnit;
import com.gxuwz.KeepHealth.business.service.SysDepartmentService;
import com.gxuwz.KeepHealth.business.service.SysUnitService;
import com.gxuwz.core.pagination.Result;
import com.gxuwz.core.web.action.BaseAction;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

/**
 * <p>Title: 类名：公司管理-控制器</p>
 * <p>Description:控制器/n</p>
 * @author:	潘海森，陆云秋
 * @date:2017.03.11
 */
public class SysUnitAction extends BaseAction implements Preparable, ModelDriven{
	
	protected static final String LIST_JSP = "/WEB-INF/page/web/SysUnit_list.jsp";
	protected static final String ADD_JSP = "/WEB-INF/page/web/SysUnit_add.jsp";
	protected static final String EDIT_JSP = "/WEB-INF/page/web/SysUnit_edit.jsp";
	
	protected final Log logger=LogFactory.getLog(getClass());
	
	private Result<SysUnit> pageResult; //分页
	private SysUnit sysUnit;
	@Autowired
	private SysUnitService sysUnitService;
	@Autowired
	private SysUnitDAO sysUnitDAO;
	
	@Override
	public void prepare() throws Exception {
		if(null == sysUnit){
			sysUnit = new SysUnit();
		}
		
	}

	/**
	 * 列表
	 * @return
	 * @throws Exception
	 * @author 潘海森
	 * @date 2017.3.10
	 */
	public String list()throws Exception{
		logger.info("##ysRole列表读取...");
		 if("".equals(sysUnit.getUnitName())){
			 sysUnit.setUnitName(null);
			}
			if("".equals(sysUnit.getUnitCod())){
				sysUnit.setUnitCod(null);
			}
			if("".equals(sysUnit.getUnitType())){
				sysUnit.setUnitType(null);
			}
		pageResult = sysUnitService.find(sysUnit, getPage(), getRow());
		setForwardView(LIST_JSP);
		return SUCCESS;
	}
	/**
	 * 添加公司
	 * @return
	 * @throws Exception
	 * @author 陆云秋
	 * @date 2017.4.26
	 */
	public String add() throws Exception{

		//查询数据库中最大个人编号，并转换为字符串
		String maxNumber = String.valueOf(sysUnitDAO.findMaxUnitCod());
		System.out.println("maxNumber"+maxNumber);
		
		
		if("[null]".equals(maxNumber)){
			maxNumber = null;
			int a = 1001;
			String number = String.valueOf(a);
			String newName = number;
			//System.out.println("newName"+newName);
			sysUnit.setUnitCod(newName);
		}
		
		else{
			//截取序号，并将其转换成int类型
			String numberString = maxNumber.substring(1, maxNumber.length()-1);
			//System.out.println("numberString"+numberString);
			int a = Integer.valueOf(numberString)+1;
			//System.out.println("a"+a);
			String number = String.valueOf(a);
			String newName = number;
			//System.out.println("newName"+newName);
			
			if(4 == newName.length()){
				sysUnit.setUnitCod(newName);
			}
		}
		sysUnitService.add(sysUnit);
		sysUnit = new SysUnit();
		return list();
	}
	/**
	 * 保存修改信息
	 * @return
	 * @throws Exception
	 * @author 潘海森
	 * @date 2017.3.10
	 */
	public String update() throws Exception{
		sysUnitService.update(sysUnit);
		sysUnit = new SysUnit();
		return list();
	}
	/**
	 * 删除公司
	 * @return
	 * @throws Exception
	 */
	public String delete() throws Exception{

        sysUnitService.delete(sysUnit.getUnitId());
		return list();
	}
	
	/**
	 * 页面跳转
	 * @return
	 * @author 潘海森
	 * @date 2017.3.10
	 */
	public String openList(){
		
		return SUCCESS;
	}
	/**
	 * 跳转到添加页面
	 * @return
	 */
	public String openAdd(){
		forwardView = ADD_JSP;
		return SUCCESS;
	}
	/**
	 * 跳转到修改页面
	 * @return
	 * @author 潘海森
	 * @date 2017.3.10
	 */
	public String openEdit(){
		sysUnit = sysUnitService.findById(sysUnit.getUnitId());
		forwardView = EDIT_JSP;
		return SUCCESS;
	}
	
	@Override
	public Object getModel() {
		
		return sysUnit;
	}


	public Result<SysUnit> getPageResult() {
		return pageResult;
	}

	public void setPageResult(Result<SysUnit> pageResult) {
		this.pageResult = pageResult;
	}

	public SysUnit getSysUnit() {
		return sysUnit;
	}

	public void setSysUnit(SysUnit sysUnit) {
		this.sysUnit = sysUnit;
	}

	


}