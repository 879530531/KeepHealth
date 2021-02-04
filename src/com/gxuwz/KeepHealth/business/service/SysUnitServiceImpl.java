package com.gxuwz.KeepHealth.business.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;




import com.gxuwz.KeepHealth.business.dao.SysUnitDAO;
import com.gxuwz.KeepHealth.business.entity.SysUnit;
import com.gxuwz.KeepHealth.business.entity.TbPersonalData;
import com.gxuwz.core.pagination.Result;


/**
* @ClassName: SysUnitServiceImpl
* @Description: 公司管理的增删查改的实现
* @author 潘海森
* @date 2017年7月7日 上午9:42:57
*/
@Service("sysUnitService")
public  class SysUnitServiceImpl implements SysUnitService {
	@Autowired
	private SysUnitDAO sysUnitDAO;
	
	/**
	 * 根据条件查找分页
	 * @param sysMerchantUnit 模型
	 * @param page 第几页
	 * @param row 长度
	 * @return
	 * @author 潘海森
	 * @date 2017.3.10
	 */
	public Result<SysUnit> find(SysUnit sysUnit, int page, int row) {
		
		return sysUnitDAO.find(sysUnit, page, row);
	}


	/**
	 * 添加公司
	 * @author 陆云秋
	 * @date 2017.4.26
	 */
	@Override
	public void add(SysUnit sysUnit) {
		
		
		sysUnitDAO.save(sysUnit);
	}
		
	

	/**
	 * 根据id查询一条记录
	 * @param id
	 * @return
	 * @author 潘海森
	 * @date 2017.3.10
	 */
	@Override
	public SysUnit findById(int unitId) {
		
		return sysUnitDAO.get(SysUnit.class, unitId);
	}

	/**
	 * 保存修改公司信息
	 * @param sysUnit 
	 * @author 陆云秋
	 * @date 2017.4.26
	 */
	@Override
	public void update(SysUnit sysUnit) {
		sysUnitDAO.update(sysUnit);
	}

	/**
	 * 根据id删除一条记录
	 * @param id
	 * @author 潘海森
	 * @date 2017.3.10
	 */
	@Override
	public SysUnitService delete(int unitId) {
	sysUnitDAO.remove(findById(unitId));
	return null;
		
	}

	/**
	 * 查询所有权限
	 * @return
	 */
	@Override
	public List<SysUnit> getUnitAll() {
		return sysUnitDAO.getAllUnit();
	}
	

	/**
	 * 验证公司编号是否重复
	 * @param unitId 公司编号
	 */
	@Override
	public String checkUnitId(int unitId) {
		SysUnit sysUnit = sysUnitDAO.get(SysUnit.class, unitId);
		if(null != sysUnit){
			return "no";
		}else{
			return "ok";
		}
	}

	/**
	 * 检验公司编码是否存在
	 * @param unitCode
	 * @return
	 * @author 陆云秋
	 * @data 2017.04.26
	 */
	@Override
	public boolean checkunitCod(String unitCod){
		boolean result = false;
		List<SysUnit> SysUnit = sysUnitDAO.checkUnitCod(unitCod);
		if(null != SysUnit && SysUnit.size()>0){
			result = true;
		}
		return result;
	}
}