package com.gxuwz.KeepHealth.business.dao;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Repository;

import com.gxuwz.core.dao.impl.BaseDaoImpl;
import com.gxuwz.core.pagination.Result;
import com.gxuwz.KeepHealth.business.entity.Content;
import com.gxuwz.KeepHealth.business.entity.FatherHealth;

@Repository
public class ContentDao extends BaseDaoImpl<Content>{

	@SuppressWarnings("unchecked")
	public Result<Content> coverNewsList(Content content, int page, int row) {
		String queryString = " from Content  where 1=1 ";/*
		if(content.getType()!=null){
			queryString+=" and type ="+content.getType();
		}*/
		queryString+=" order by operateTime desc";
		int start=(page-1)*row;
        int limit =row;
		return super.find(queryString, null, null, start, limit);
	}
	
	@SuppressWarnings("unchecked")
	public List<Content> coverNewsList(Content content) {
		String queryString = " from Content  where 1=1 ";/*
		if(content.getType()!=null){
			queryString+=" and type ="+content.getType();
		}*/
		queryString+=" order by operateTime desc";
		return (List<Content>)this.getHibernateTemplate().find(queryString);
	}
	
	@SuppressWarnings("unchecked")
	public Result<Content> findByPage(Content content, int page, int row){
		String hql ="from Content where 1=1 ";
		
		if(content.getType()!=null){
			hql+=" and type = "+content.getType();
		}
		if(!StringUtils.isBlank(content.getTitle())){
			System.out.println(content.getTitle());
			hql += " and title like '%"+content.getTitle()+"%' or detail like '%"+content.getDetail()+"%'";
		}
		hql+=" order by operateTime desc";
		int start=(page-1)*row;
        int limit =row;
		return super.find(hql, null, null, start, limit);
	}
	/**
	 * 根据类型汇总文章总数
	 * @return   Object[0]表示总数，Object[1]表示类型
	 * @author  涛 
	 * @date 2017年5月3日
	 */
	public List<Object[]> pool() {
		String sql ="select count(*),type from (select * from content c order by type asc ) cont group by cont.type";
		return super.findBySQL(sql, null);
	}

}
