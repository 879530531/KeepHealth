package com.gxuwz.KeepHealth.business.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.gxuwz.KeepHealth.business.entity.SysUser;
import com.gxuwz.KeepHealth.business.entity.SysUserRole;
import com.gxuwz.KeepHealth.business.entity.TbFeedback;
import com.gxuwz.core.dao.impl.BaseDaoImpl;
import com.gxuwz.core.pagination.Result;

@Repository
public class TbFeedbackDAO extends BaseDaoImpl<TbFeedback>{
	
	/**
	 * 根据条件查找分页
	 * @param sysUser 模型
	 * @param page 第几页
	 * @param row 长度
	 * @return
	 * @author 卢善坚，潘恒飞
	 * @date 2015.8.8
	 */
	@SuppressWarnings("unchecked")
	public Result<TbFeedback> find(TbFeedback tbFeedback, int page, int size){
		String queryString = "from TbFeedback where 1=1";
		int start=(page-1)*size;
		int limit =size;
		return (Result<TbFeedback> )super.find(queryString, null, null, start, limit);
	}

	/**
	 * 根据会员编号查询反馈信息
	 * @param userId
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<TbFeedback> findByFeedback(String personalId){
		String hql = "from TbFeedback where personalId = '"+personalId+"'";
		return (List<TbFeedback>)this.getHibernateTemplate().find(hql);
	}
	
	@SuppressWarnings("unchecked")
	public List<TbFeedback> findByMemberId(int memberId){
		String hql = "from TbFeedback where memberId = '"+memberId+"'";
		return (List<TbFeedback>)this.getHibernateTemplate().find(hql);
	}
}
