package com.gxuwz.KeepHealth.business.service;

import java.util.List;

import com.gxuwz.KeepHealth.business.entity.SysDepartment;
import com.gxuwz.core.pagination.Result;



/**
* @ClassName: SysDepartmentService
* @Description: 部门管理的增删查改接口
* @author 潘海森
* @date 2017年7月7日 上午9:28:37
*/

public interface SysDepartmentService {
	/**
	 * 根据条件查找分页
	 * @param sysMerchantUnit 模型
	 * @param page 第几页
	 * @param row 长度
	 * @return
	 * @author 潘海森
	 * @date 2017.3.10
	 */
	public Result<SysDepartment> find(SysDepartment sysDepartment, int page, int row);
	/**
	 * 添加部门
	 * @param sysDepartment
	 * @author 陆云秋
	 * @date 2017.4.26
	 */
	public void add(SysDepartment sysDepartment);
	/**
	 * 根据id查询一条记录
	 * @param id
	 * @return
	 * @author 潘海森
	 * @date 2017.3.10
	 */
	public SysDepartment findById(int deptId);
	/**
	 * 保存修改部门信息
	 * @param sysDepartment
	 * @author 陆云秋
	 * @date 2017.4.26
	 */
	
	public void update(SysDepartment sysDepartment);
	/**
	 * 根据id删除一条记录
	 * @param id
	 * @author 潘海森
	 * @date 2017.3.10
	 */
	public SysDepartmentService delete(int deptId);
	/**
	 * 
	* @Title: getDepartmentAll
	* @Description: 查询所有公司
	* @author 潘海森
	* @date  2017年7月7日 上午9:26:49
	* @return
	 */
	
	public List<SysDepartment> getDepartmentAll();
	/**
	 * 
	* @Title: checkDeptId
	* @Description: 验证部门编号是否重复
	* @author 潘海森
	* @date  2017年7月7日 上午9:27:49
	* @param deptId
	* @return
	 */

	 
	public String checkDeptId(int deptId);
}