package com.gxuwz.KeepHealth.business.dao;

import org.springframework.stereotype.Repository;

import com.gxuwz.KeepHealth.business.entity.Content;
import com.gxuwz.KeepHealth.business.entity.TbFee;
import com.gxuwz.core.dao.BaseDao;
import com.gxuwz.core.dao.impl.BaseDaoImpl;

@Repository
public class TbFeeDao extends BaseDaoImpl<TbFee>{

	
	public TbFee findById(int feeId) {
		return this.getHibernateTemplate().get(TbFee.class, feeId);
		
	}
	

}
