package com.gxuwz.KeepHealth.business.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.gxuwz.KeepHealth.business.entity.SysRoleRight;
import com.gxuwz.core.dao.impl.BaseDaoImpl;

@Repository("sysRoleRightDAO")
public class SysRoleRightDAO extends BaseDaoImpl<SysRoleRight> {
	/**
	 * 删除对象
	 * @param roleId 角色编号
	 */
	public void deleteByRoleId(String roleId){
		String hql="delete from SysRoleRight srr where srr.roleId='"+roleId+"'";
		this.getHibernateTemplate().bulkUpdate(hql);
	}
	/**
	 * 根据角色编号查询出角色权限
	 * @param roleId 角色编号
	 */
	@SuppressWarnings("unchecked")
	public List<SysRoleRight> findByRoleId(String roleId){
		String hql = "from SysRoleRight where roleId='"+roleId+"'";
		return (List<SysRoleRight>)this.getHibernateTemplate().find(hql);
		
	}
}
