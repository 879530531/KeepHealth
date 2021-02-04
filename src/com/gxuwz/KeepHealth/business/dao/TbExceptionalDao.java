package com.gxuwz.KeepHealth.business.dao;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.gxuwz.KeepHealth.business.entity.TbExceptional;
import com.gxuwz.core.dao.impl.BaseDaoImpl;
import com.gxuwz.core.pagination.Result;
import com.gxuwz.core.util.DateUtils;
/**
 * 与打赏流水表相关的数据交互Dao层
 * @author 叶城廷 → 丁程强
 * @version 2019.03.01 → 2019.03.02
 */
@Repository
public class TbExceptionalDao extends BaseDaoImpl<TbExceptional>{
	
	/**
	 * 根据选择的时间段查询打赏信息
	 * @param string1,string2,page,size
	 * @author 丁程强 
	 * @date 2019.03.02
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public Result<TbExceptional> queryExceptionalList(String string1, String string2, int page, int size) {
		int start=(page-1)*size;
		int limit =size;
		String queryString = null;
		String nowdayTime = null;
		Date date = new Date();
		//时间加一天
		if(!"".equals(string2)) {
			string2 = DateUtils.plusOneDay(string2);
		}else {
			nowdayTime = DateUtils.plusOneDay(date);
		}
		if (!"".equals(string1) && !"".equals(string2)) {
			queryString = "from TbExceptional where exceptionalTime between '"
					+ string1 + "' and '" + string2
					+ "' order by exceptionalTime desc";
		} else if (!"".equals(string1) && "".equals(string2)) {
			queryString = "from TbExceptional where exceptionalTime between '"
					+ string1 + "' and '" + nowdayTime
					+ "' order by exceptionalTime desc";
		} else if ("".equals(string1) && !"".equals(string2)) {
			queryString = "from TbExceptional where exceptionalTime between '1900-01-01' and '"
					+ string2 + "' order by exceptionalTime desc";
		} else {
			queryString = "from TbExceptional where 1=1 order by exceptionalTime desc";
		}
		return (Result<TbExceptional>)super.find(queryString, null, null, start, limit);
	}

	@SuppressWarnings("unchecked")
	public Result<TbExceptional> queryExceptionalList2(TbExceptional tbExceptional,
			int page, int size) {
		int start=(page-1)*size;
		int limit =size;
		String queryString = null;
		System.out.println("------prepayid------"+tbExceptional.getPrepayId());
		queryString = "from TbExceptional where prepayId  = '"+tbExceptional.getPrepayId()+"'";
		
		//==
		List<TbExceptional> list=new ArrayList<TbExceptional>();
		list =this.getHibernateTemplate().find(queryString);
		for (TbExceptional tb : list) {
			System.out.println("=============="+tb.getTeacherName());
		}
		//==
		return (Result<TbExceptional>)super.find(queryString, null, null, start, limit);
	}
}
