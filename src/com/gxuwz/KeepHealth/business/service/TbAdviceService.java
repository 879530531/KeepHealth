package com.gxuwz.KeepHealth.business.service;

import java.util.List;

import com.gxuwz.KeepHealth.business.entity.TbAdvice;
import com.gxuwz.KeepHealth.business.entity.TbPersonalData;
import com.gxuwz.KeepHealth.business.entity.TbReadme;
/**
 * 
* @ClassName: TbAdviceService 
* @Description: 調理建議表service接口
* @author 软件开发中心  陈洁 
* @date 2017年7月7日 上午10:07:49
 */
public interface TbAdviceService {
	/**
	 * 添加用户角色
	 * @param sysUserRole
	 */
	public void addAdvice(TbAdvice tbadvice);
	/**
	 * 根据id统计导师服务记录条数
	 * @author 莫然源
	 * @date 2017.04.09
	 */
	public int findAD(int a);
	
	/*public List<TbAdvice> findByMemberId(List<TbReadme> tbReadmeList);*/
	/**
	 * 
	* @Title: findByMemberId 
	* @author 软件开发中心   陈洁
	* @Description: 根據會員ID查詢所有調理建議
	* @return List<TbAdvice> 
	* @date 2017年7月7日 上午10:08:18 
	* @throws
	 */
	public List<TbAdvice> findByMemberId(int personalId);
	
	/**
	 * 
	* @Title: findByReadmeId 
	* @author 软件开发中心   陈洁
	* @Description: 根據健康自述ID查詢所有調理建議
	* @return List<TbAdvice> 
	* @date 2017年7月7日 上午10:09:07 
	* @throws
	 */
	public List<TbAdvice> findByReadmeId(int readmeId);

	/**
	 * 根据id删除用户角色
	 * @param sysUserRole
	 
	public void deleteUserRole(String id);
	/**
	 * 根据用户编号查询出所有权限
	 * @param userId
	 * @return
	
	public List<TbAdvice> findByUserId(String userId);
	*/
}
