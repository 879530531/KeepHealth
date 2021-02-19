package com.gxuwz.KeepHealth.business.service;

import java.util.List;

import com.gxuwz.KeepHealth.business.entity.TbConsultationRecord;
import com.gxuwz.KeepHealth.business.entity.TbTeacher;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import util.MyTime;

import com.gxuwz.KeepHealth.business.dao.TbSettlementDao;
import com.gxuwz.KeepHealth.business.entity.TbSettlement;
import com.gxuwz.core.pagination.Result;

@Service("tbSettlementService")
public class TbSettlementServiceImpl implements TbSettlementService {
	@Autowired
	TbSettlementDao tbSettlementDao;

	//列表+查询
	@Override
	public Result<TbSettlement> querySettlementList(String string, int page,
			int row, Integer settlementStatus) {
		
		if(settlementStatus == null){
		return tbSettlementDao.querySettlementList(string,page,row);
		}
		return tbSettlementDao.querySettlementList2(string, page, row, settlementStatus);
	}

	
	//结算流水
	@Override
	public void updateSettlement(List<String> list) {
		
		
		for (String SettlementId : list) {
			TbSettlement tbSm = tbSettlementDao.get(TbSettlement.class, Integer.valueOf(SettlementId));
			tbSm.setSettlementDate(MyTime.getNowForTimestamp());
			if(tbSm.getSettlementStatus()==0){
				tbSm.setSettlementStatus(1);
			}else{
				tbSm.setSettlementStatus(0);
			}
			tbSettlementDao.save(tbSm);
		}
	

		
	}

	/**
	 * @Author zuofengwei
	 * @Description 向数据库中添加结算记录
	 * @Date 2019/4/9 23:23
	 * @param tbConsultationRecord
	 * @param tbTeacher
	 * @return void
	 **/
	@Override
	public void addSettlement(TbConsultationRecord tbConsultationRecord, TbTeacher tbTeacher) {

		TbSettlement tbSettlement = new TbSettlement();
		tbSettlement.setSettlementStatus(0);
		tbSettlement.setSettlementDate(MyTime.getNowForTimestamp());
		tbSettlement.setRecordId(tbConsultationRecord.getRecordId());
		tbSettlement.setTeacherId(tbTeacher.getTeacherId());
		tbSettlement.setTeacherName(tbTeacher.getTeacherName());
		tbSettlement.setSettlementMoney(31.0);

		tbSettlementDao.getHibernateTemplate().save(tbSettlement);
	}

	@Override
	public void save(TbSettlement tbSettlement) {
		tbSettlementDao.save(tbSettlement);
	}


}
