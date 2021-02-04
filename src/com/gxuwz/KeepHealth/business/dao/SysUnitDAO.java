package com.gxuwz.KeepHealth.business.dao;



import java.util.List;

import org.springframework.stereotype.Repository;

import com.gxuwz.KeepHealth.business.entity.SysDepartment;
import com.gxuwz.KeepHealth.business.entity.SysRight;
import com.gxuwz.KeepHealth.business.entity.SysUnit;
import com.gxuwz.KeepHealth.business.entity.TbPersonalData;
import com.gxuwz.KeepHealth.business.entity.Vip;
import com.gxuwz.core.dao.impl.BaseDaoImpl;
import com.gxuwz.core.pagination.Result;

@Repository("sysUnitDAO")
public class SysUnitDAO extends BaseDaoImpl<SysUnit>{
	/**
	 * 公司查询功能
	 * @author 潘海森
	 * @data 2017.04.10
	 */

	@SuppressWarnings("unchecked")
	public Result<SysUnit> find(SysUnit sysUnit, int page,int size){
		String queryString="from SysUnit where 1=1";
		//System.out.println("1"+sysUnit.getUnitName());
//		System.out.println(tbPersonalData.getPersonalId());
//		System.out.println("ooooooo"+tbPersonalData.getMobilePhone());
		
		if(null != sysUnit.getUnitCod()){              //根据公司编码查询
			//System.out.println("ooooooo1"+sysUnit.getUnitName());
			//System.out.println("ooooooo1"+sysUnit.getUnitType());
			queryString = queryString + " and unit_cod like '%"+sysUnit.getUnitCod()+"%'";
		}
		if(null != sysUnit.getUnitName()){             //根据公司名称查询
			//System.out.println("oo232222410"+sysUnit.getUnitName());
			//System.out.println("ooooooo2"+sysUnit.getUnitType());
			queryString = queryString + " and unit_name like '%"+sysUnit.getUnitName()+"%'";
		}
		if(null != sysUnit.getUnitType()){             //根据公司类型查询
			//System.out.println("ooooooo3"+sysUnit.getUnitType());
//			System.out.println("======"+tbPersonalData.getMobilePhone());
			queryString = queryString + " and unit_type like '%"+sysUnit.getUnitType()+"%'";
		}
				  int start=(page-1)*size;
			      int limit =size;
	        return (Result<SysUnit> )super.find(queryString, null, null, start, limit);
	    }
		

	/**
	 * 升序查询所有公司
	 * @author 潘海森
	 * @data 2017.04.10
	 */
	 
	@SuppressWarnings("unchecked")
	public List<SysUnit> getAllUnit(){
		String queryString="from SysUnit where 1=1 order by unitId asc";
		List<SysUnit> list=getHibernateTemplate().find(queryString);
		return list;
	}
	/**
	 * 查询最大公司编号
	 * @param unitCod
	 * @author 杨世宇
	 * @data 2017.04.10
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<SysUnit> findMaxUnitCod(){
		String hql = "select max(unitCod) from SysUnit ";
		return this.getHibernateTemplate().find(hql);
	}
	
	/**
	 * 验证公司编码是否重复
	 * @param unitCode
	 * @author 陆云秋
	 * @data 2017.04.26
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<SysUnit> checkUnitCod(String unitCod){
		String hql = "from SysUnit where unitCod = '"+unitCod+"'";
		return this.getHibernateTemplate().find(hql);
	}
	

	
}
