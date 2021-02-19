package com.gxuwz.KeepHealth.business.service;

import java.util.List;
import com.gxuwz.KeepHealth.business.entity.SysUnit;
import com.gxuwz.core.pagination.Result;


/**
* @ClassName: SysUnitService
* @Description: 公司管理的增删查改
* @author 潘海森   陆云秋
* @date 2017年7月7日 上午9:39:22
*/
public interface SysUnitService {
	/**
	 * 根据条件查找分页
	 * @param sysMerchantUnit 模型
	 * @param page 第几页
	 * @param row 长度
	 * @return
	 * @author 潘海森
	 * @date 2017.3.10
	 */
	public Result<SysUnit> find(SysUnit sysUnit, int page, int row);
	/**
	 * 添加公司
	 * @param sysUnit
	 * @author 陆云秋
	 * @date 2017.4.26
	 */
	public void add(SysUnit sysUnit);
	/**
	 * 根据id查询一条记录
	 * @param id
	 * @return
	 * @author 潘海森
	 * @date 2017.3.10
	 */
	public SysUnit findById(int unitId);
	/**
	 * 保存修改公司信息
	 * @param sysUnit
	 * @author 潘海森
	 * @date 2017.3.10
	 */
	public void update(SysUnit sysUnit);
	/**
	 * 根据id删除一条记录
	 * @param id
	 * @author 潘海森
	 * @date 2017.3.10
	 */
	public SysUnitService delete(int unitId);
	/**
	 * 
	* @Title: getUnitAll
	* @Description: 查询所有公司
	* @author 潘海森
	* @date  2017年7月7日 上午9:40:34
	* @return
	 */
	public List<SysUnit> getUnitAll();
     /**
      * 
     * @Title: checkUnitId
     * @Description: 查询公司编码是否重复
     * @author 潘海森
     * @date  2017年7月7日 上午9:42:15
     * @param unitId
     * @return
      */
	public String checkUnitId(int unitId);
	
	/**
	 * 检验公司编码是否存在
	 * @return
	 * @author 陆云秋
	 * @data 2017.04.26
	 */
	public boolean checkunitCod(String unitCod);
	
}