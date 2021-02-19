package com.gxuwz.KeepHealth.business.dao;

import org.springframework.stereotype.Repository;

import com.gxuwz.KeepHealth.business.entity.TbSettlement;
import com.gxuwz.core.dao.impl.BaseDaoImpl;
import com.gxuwz.core.pagination.Result;
/**
 * 与结算流水表相关的数据交互Dao层
 * @author 叶城廷
 * @version 2019.03.01
 */
@Repository
public class TbSettlementDao extends BaseDaoImpl<TbSettlement>{

	@SuppressWarnings("unchecked")
	public Result<TbSettlement> querySettlementList(String string, int page, int size) {
		
		String queryString= "from TbSettlement where teacherId like '%"+string+"%' or teacherName like '%"+string+"%' or recordId like '%"+string+"%' order by settlementId";
		int start=(page-1)*size;
		int limit =size;
		return (Result<TbSettlement>)super.find(queryString, null, null, start, limit);
		
	}

	@SuppressWarnings("unchecked")
	public Result<TbSettlement> querySettlementList2(String string, int page, int size,
			Integer settlementStatus) {
		
			String queryString= "from TbSettlement where settlementStatus = "+settlementStatus+" and (teacherId like '%"+string+"%' or teacherName like '%"+string+"%' or recordId like '%"+string+"%') order by settlementId";
		
		int start=(page-1)*size;
		int limit =size;
		return (Result<TbSettlement>)super.find(queryString, null, null, start, limit);
		
	}

	
	
	

}
