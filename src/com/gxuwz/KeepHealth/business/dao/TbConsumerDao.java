package com.gxuwz.KeepHealth.business.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.gxuwz.KeepHealth.business.entity.TbConsultationRecord;
import com.gxuwz.KeepHealth.business.entity.TbConsumer;
import com.gxuwz.KeepHealth.business.entity.TbTeacher;
import com.gxuwz.core.dao.impl.BaseDaoImpl;
import com.gxuwz.core.pagination.Result;
/**
 * 与咨询用户表相关的数据交互Dao层
 * @author 叶城廷
 * @version 2019.03.01
 */
@Repository("tbConsumerDao")
public class TbConsumerDao extends BaseDaoImpl<TbConsumer>{
	@SuppressWarnings("unchecked")
	public Result<TbConsumer> find(TbConsumer tbConsumer, int page, int size){
		String queryString="from TbConsumer where 1=1 ";
		
		if(null != tbConsumer.getConsumerName()){//根据昵称查询
			queryString = queryString + " and consumerName like '%"+tbConsumer.getConsumerName()+"%' ";
		}
		
		
		if(null != tbConsumer.getConsumerCity()){
			queryString = queryString + " and consumerCity like '%"+tbConsumer.getConsumerCity()+"%'";
		}		
		
		if(null != tbConsumer.getOpenId()){
			queryString = queryString + " and openId like '%"+tbConsumer.getOpenId()+"%'";
		}	
		
		int start=(page-1)*size;
		int limit =size;
		return (Result<TbConsumer>)super.find(queryString, null, null, start, limit);
	}	
	@SuppressWarnings("unchecked")
	public TbConsumer queryTbConsumerById(Integer consumerId) {
		TbConsumer tbConsumer=null;
		String hql = "from TbConsumer where consumerId = '"+consumerId+"'";
		
		List<TbConsumer> list = this.getHibernateTemplate().find(hql);
		try {
			tbConsumer = list.get(0);
		}catch (Exception e) {
			tbConsumer=null;
			e.printStackTrace();
		}
	   return tbConsumer;
	}
	public Result<TbConsumer> getList(String query, int page, int row) {
		
		String queryString = "from TbConsumer ";
		int start=(page-1)*row;
		int limit =row;
		return super.find(queryString, null, null, start, limit);
	}
	/**
	 * 查询用户信息并返回
	 * 董冰雪
	 * 2019/3/30
	 * @param
	 * @return
	 */
	public List<TbConsumer> findByconsumerquery() {
		String hql = "from TbConsumer";
		List<TbConsumer> list=getHibernateTemplate().find(hql);

		return list;
	}
	
	/**
	 * 查询用户信息并返回
	 * 齐美琳
	 * 2019.3.30
	 */
	public List<TbConsumer> findByconsumer() {
		String hql = "from TbConsumer where 1=1";
		List<TbConsumer> list=getHibernateTemplate().find(hql);	
	 return list;
	}


	public List<TbConsumer> queryConsumerByOpenid(String openId) {
		List list =null;
		try{
			String hql = "from TbConsumer where openId='"+openId+"'";
			list=getHibernateTemplate().find(hql);
		}catch (Exception e){
			e.printStackTrace();
		}
		return list;
	}
}
