package com.gxuwz.KeepHealth.business.dao;


import java.util.List;

import org.springframework.stereotype.Repository;

import com.gxuwz.KeepHealth.business.entity.SysDepartment;
import com.gxuwz.KeepHealth.business.entity.SysRight;
import com.gxuwz.KeepHealth.business.entity.TbPersonalData;
import com.gxuwz.core.dao.impl.BaseDaoImpl;
import com.gxuwz.core.pagination.Result;

@Repository("sysDepartmentDAO")
public class SysDepartmentDAO extends BaseDaoImpl<SysDepartment>{
	/**
	 * 部门查询功能
	 * @author 潘海森
	 * @data 2017.04.10
	 */
	
	@SuppressWarnings("unchecked")
	public Result<SysDepartment> find(SysDepartment sysDepartment, int page, int size){
		String queryString="from SysDepartment where 1=1";
	
		//System.out.println("1"+sysDepartment.getDeptName());

		
		if(null != sysDepartment.getDeptCod()){//根据部门编码查询
			//System.out.println("ooooooo1"+sysDepartment.getDeptName());
			//System.out.println("ooooooo1"+sysDepartment.getDeptUnit());
			queryString = queryString + " and deptCod like'%"+sysDepartment.getDeptCod()+"%'";
		}
		if(null != sysDepartment.getDeptName()){//根据部门名称进行查询
			//System.out.println("oo232222410"+sysDepartment.getDeptName());
			//System.out.println("ooooooo2"+sysDepartment.getDeptUnit());
			queryString = queryString + " and deptName like '%"+sysDepartment.getDeptName()+"%'";
		}
		if(null != sysDepartment.getDeptUnit()){//根据所属部门进行查询
			//System.out.println("ooooooo3"+sysDepartment.getDeptUnit());
//			System.out.println("======"+tbPersonalData.getMobilePhone());
			queryString = queryString + " and dept_unit like'%"+sysDepartment.getDeptUnit()+"%'";
		}
		int start=(page-1)*size;
		int limit =size;
	
		
		return (Result<SysDepartment>)super.find(queryString, null, null, start, limit);
	}
	/**
	 * 升序查询所有部门
	 * @author 潘海森
	 * @data 2017.03.12
	 * @return
	 */
	public List<SysDepartment> getAllDepartment(){
		String queryString="from SysDepartment where 1=1 order by rightSortOrder asc";
		return getHibernateTemplate().find(queryString);
	}
	/**
	 * 查询最大公司编号
	 * @param mobilePhone
	 * @author 杨世宇
	 * @data 2017.04.10
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<SysDepartment> findMaxDeptCod(){
		String hql = "select max(deptCod) from SysDepartment ";
		return this.getHibernateTemplate().find(hql);
	}
	
}

