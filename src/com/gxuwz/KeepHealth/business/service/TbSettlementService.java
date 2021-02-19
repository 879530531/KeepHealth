package com.gxuwz.KeepHealth.business.service;

import java.util.List;

import com.gxuwz.KeepHealth.business.entity.TbConsultationRecord;
import com.gxuwz.KeepHealth.business.entity.TbSettlement;
import com.gxuwz.KeepHealth.business.entity.TbTeacher;
import com.gxuwz.core.pagination.Result;

public interface TbSettlementService {

	Result<TbSettlement> querySettlementList(String string, int page, int row,Integer settlementStatus);

	void updateSettlement(List<String> list);


	/**
	 * @Author zuofengwei
	 * @Description 向数据库中添加结算记录
	 * @Date 2019/4/9 23:23
	 * @param tbConsultationRecord
	 * @param tbTeacher
	 * @return void
	 **/
    void addSettlement(TbConsultationRecord tbConsultationRecord, TbTeacher tbTeacher);

	void save(TbSettlement tbSettlement);
}
