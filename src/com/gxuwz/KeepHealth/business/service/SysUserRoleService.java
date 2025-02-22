package com.gxuwz.KeepHealth.business.service;

import java.util.List;

import com.gxuwz.KeepHealth.business.entity.SysUserRole;

public interface SysUserRoleService {
	/**
	 * 添加用户角色
	 * @param sysUserRole
	 */
	public void addUserRole(SysUserRole sysUserRole);

	/**
	 * 根据id删除用户角色
	 * @param sysUserRole
	 */
	public void deleteUserRole(String id);
	/**
	 * 根据用户编号查询出所有权限
	 * @param userId
	 * @return
	 */
	public List<SysUserRole> findByUserId(String userId);
}
