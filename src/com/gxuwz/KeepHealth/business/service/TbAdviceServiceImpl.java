package com.gxuwz.KeepHealth.business.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gxuwz.KeepHealth.business.dao.TbAdviceDAO;
import com.gxuwz.KeepHealth.business.entity.TbAdvice;
import com.gxuwz.KeepHealth.business.entity.TbPersonalData;
import com.gxuwz.KeepHealth.business.entity.TbReadme;
/**
 * 
* @ClassName: TbAdviceServiceImp 
* @Description: 实现  調理建議表service接口
* @author 软件开发中心  陈洁 
* @date 2017年7月7日 上午10:07:49
 */
@Service("tbAdviceService")
public class TbAdviceServiceImpl implements TbAdviceService {
	@Autowired
	private TbAdviceDAO tbAdviceDAO;
	/**
	 * 添加用户角色
	 * @param sysUserRole
	 */
	@Override
	public void addAdvice(TbAdvice tbadvice) {
		tbAdviceDAO.save(tbadvice);
	}
	/**
	 * 根据id统计导师服务记录条数
	 * @author 莫然源
	 * @date 2017.04.09
	 */
	public int findAD(int a) {
		return tbAdviceDAO.findAD(a);
	}
	
	/*@Override
	public List<TbAdvice> findByMemberId(List<TbReadme> tbReadmeList) {
		return tbAdviceDAO.findByMemberId(tbReadmeList);
	}*/
	/**
	 * 根据會員ID查詢所有調理建議
	 * @author 陈洁
	 * @date 2017.04.09
	 */
	public List<TbAdvice> findByMemberId(int personalId){
		
		
		return tbAdviceDAO.findByMemberId(personalId);
		
	}
	/**
	 * 根据健康自述ID查詢所有調理建議
	 * @author 陈洁
	 * @date 2017.04.09
	 */
	public List<TbAdvice> findByReadmeId(int readmeId){
		return tbAdviceDAO.findByReadmeId(readmeId);
	}

	/**
	 * 根据id删除用户角色
	 * @param sysUserRole
	 
	@Override
	public void deleteUserRole(String id) {
		sysUserRoleDAO.deleteByUserId(id);
	}
	/**
	 * 根据用户编号查询出所有权限
	 * @param userId
	 * @return
	 
	@Override
	public List<TbAdvice> findByUserId(String userId) {
		return sysUserRoleDAO.findByUserId(userId);
	}
	*/

}
