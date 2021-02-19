package com.gxuwz.KeepHealth.business.action.web;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.gxuwz.KeepHealth.business.dao.SysDepartmentDAO;
import com.gxuwz.KeepHealth.business.entity.SysDepartment;



import com.gxuwz.KeepHealth.business.service.SysDepartmentService;
import com.gxuwz.core.pagination.Result;
import com.gxuwz.core.web.action.BaseAction;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

/**
 * <p>Title: 类名：部门管理-控制器</p>
 * <p>Description:控制器/n</p>
 * @author:	潘海森， 陆云秋
 * @date:2017.04.26
 */
public class SysDepartmentAction extends BaseAction implements Preparable, ModelDriven{
	
	protected static final String LIST_JSP = "/WEB-INF/page/web/SysDepartment_list.jsp";
	protected static final String ADD_JSP = "/WEB-INF/page/web/SysDepartment_add.jsp";
	protected static final String EDIT_JSP = "/WEB-INF/page/web/SysDepartment_edit.jsp";
	
	protected final Log logger=LogFactory.getLog(getClass());
	
	private Result<SysDepartment> pageResult; //分页
	private SysDepartment sysDepartment;
	@Autowired
	private SysDepartmentService sysDepartmentService;
	@Autowired
	private SysDepartmentDAO sysDepartmentDAO;
	
	@Override
	public void prepare() throws Exception {
		if(null == sysDepartment){
			sysDepartment = new SysDepartment();
		}
		
	}

	/**
	 * 部门列表
	 * @return
	 * @throws Exception
	 * @author 潘海森
	 * @date 2017.3.10
	 */
	public String list()throws Exception{
		logger.info("##ysRole列表读取...");
		 if("".equals(sysDepartment.getDeptCod())){
			 sysDepartment.setDeptCod(null);
			}
			if("".equals(sysDepartment.getDeptName())){
				sysDepartment.setDeptName(null);
			}
			if("".equals(sysDepartment.getDeptUnit())){
				sysDepartment.setDeptUnit(null);
			}
		pageResult = sysDepartmentService.find(sysDepartment, getPage(), getRow());
		setForwardView(LIST_JSP);
		return SUCCESS;
	}

	/**
	 * 添加部门
	 * @return
	 * @throws Exception
	 * @author 陆云秋
	 * @date 2017.4.26
	 * */
	public String add() throws Exception{

		//查询数据库中最大个人编号，并转换为字符串
		String maxNumber = String.valueOf(sysDepartmentDAO.findMaxDeptCod());
		//System.out.println("maxNumber"+maxNumber);
		
		
		if("[null]".equals(maxNumber)){
			maxNumber = null;
			int a = 10001;
			String number = String.valueOf(a);
			String newName = number;
			//System.out.println("newName"+newName);
			sysDepartment.setDeptCod(newName);
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
			
			if(5 == newName.length()){
				sysDepartment.setDeptCod(newName);
			}
		}
		sysDepartmentService.add(sysDepartment);
	    sysDepartment = new SysDepartment();
		return list();
	}
	
	
	/**
	 * 保存修改信息
	 * @return
	 * @throws Exception
	 * @author 陆云秋
	 * @date 2017.4.26
	 */
	public String update() throws Exception{
		sysDepartmentService.update(sysDepartment);
		sysDepartment = new SysDepartment();
		return list();
	}
	/**
	 * 删除部门
	 * @return
	 * @throws Exception
	 * @author 潘海森
	 */
	public String delete() throws Exception{
		sysDepartmentService.delete(sysDepartment.getDeptId());
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
		
		sysDepartment = sysDepartmentService.findById(sysDepartment.getDeptId());
		forwardView = EDIT_JSP;
		return SUCCESS;
	}
	
	@Override
	public Object getModel() {
		
		return sysDepartment;
	}


	public Result<SysDepartment> getPageResult() {
		return pageResult;
	}

	public void setPageResult(Result<SysDepartment> pageResult) {
		this.pageResult = pageResult;
	}

	public SysDepartment getSysDepartment() {
		return sysDepartment;
	}

	public void setSysDepartment(SysDepartment sysDepartment) {
		this.sysDepartment = sysDepartment;
	}

	


}