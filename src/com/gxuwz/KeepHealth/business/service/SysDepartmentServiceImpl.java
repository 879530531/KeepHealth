package com.gxuwz.KeepHealth.business.service;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import org.apache.struts2.ServletActionContext;
import org.aspectj.util.FileUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gxuwz.KeepHealth.business.dao.SysDepartmentDAO;
import com.gxuwz.KeepHealth.business.dao.SysRightDAO;
import com.gxuwz.KeepHealth.business.entity.SysDepartment;
import com.gxuwz.KeepHealth.business.entity.SysRight;
import com.gxuwz.core.pagination.Result;

/**
 * 
* @ClassName: SysDepartmentServiceImpl
* @Description: 部门管理增删改查的实现
* @author 潘海森   陆云秋
* @date 2017年7月7日 上午9:31:03
 */
@Service("sysDepartmentService")
public class SysDepartmentServiceImpl implements SysDepartmentService {
	@Autowired
	private SysDepartmentDAO sysDepartmentDAO;
	
	/**
	 * 根据条件查找分页
	 * @param sysMerchantUnit 模型
	 * @param page 第几页
	 * @param row 长度
	 * @return
	 * @author 潘海森
	 * @date 2017.3.10
	 */
	public Result<SysDepartment> find(SysDepartment sysDepartment, int page, int row) {
		
		return sysDepartmentDAO.find(sysDepartment, page, row);
	}


	/**
	 * 添加部门
	 * @author 陆云秋
	 * @date 2017.4.26
	 */
	@Override
	public void add(SysDepartment sysDepartment) {
	
		sysDepartmentDAO.save(sysDepartment);
	}
		
	

	/**
	 * 根据id查询一条记录
	 * @param id
	 * @return
	 * @author 潘海森
	 * @date 2017.3.10
	 */
	@Override
	public SysDepartment findById(int deptId) {
		
		return sysDepartmentDAO.get(SysDepartment.class, deptId);
	}

	/**
	 * 保存修改部门信息
	 * @param sysDepartment 
	 * @author 陆云秋
	 * @date 2017.4.26
	 */
	@Override
	public void update(SysDepartment sysDepartment) {
		sysDepartmentDAO.update(sysDepartment);
	}

	/**
	 * 根据id删除一条记录
	 * @param id
	 * @author 潘海森
	 * @date 2017.3.10
	 */
	@Override
	public SysDepartmentService delete(int deptId) {
	sysDepartmentDAO.remove(findById(deptId));
	return null;
		
	}

	/**
	 * 查询所有部门
	 * @author 潘海森
	 * @data 2017.3.10
	 * @return
	 */
	@Override
	public List<SysDepartment> getDepartmentAll() {
		return sysDepartmentDAO.getAllDepartment();
	}

	/**
	 * 验证部门编号是否重复
	 * @param deptId 部门编号
	 * @author 潘海森
	 * @data 2017.3.10
	 */
	@Override
	public String checkDeptId(int deptId) {
		SysDepartment sysDepartment = sysDepartmentDAO.get(SysDepartment.class, deptId);
		if(null != sysDepartment){
			return "no";
		}else{
			return "ok";
		}
	}



}