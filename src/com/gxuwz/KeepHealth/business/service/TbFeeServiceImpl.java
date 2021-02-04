package com.gxuwz.KeepHealth.business.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gxuwz.KeepHealth.business.dao.TbFeeDao;
import com.gxuwz.KeepHealth.business.entity.TbFee;
@Service("TbFeeService")
public class TbFeeServiceImpl implements TbFeeService {
	@Autowired
	TbFeeDao tbFeeDao = new TbFeeDao();
	@Override
	public void update(TbFee tbFee) {
		tbFeeDao.update(tbFee);

	}
	@Override
	public TbFee findById(int feeId) {
		return tbFeeDao.findById(feeId);
		
	}

}
