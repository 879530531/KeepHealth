package com.gxuwz.KeepHealth.business.service;

import com.gxuwz.KeepHealth.business.entity.TbTeacher;
import com.gxuwz.KeepHealth.wx.util.WxPayUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gxuwz.KeepHealth.business.dao.TbExceptionalDao;
import com.gxuwz.KeepHealth.business.entity.TbConsultationRecord;
import com.gxuwz.KeepHealth.business.entity.TbExceptional;
import com.gxuwz.core.pagination.Result;
import util.MyTime;

/**
 * 与交易对账相关（打赏）Service实现类
 * @author 丁程强
 * @version 2019年3月2日
 */
@Service("tbExceptionalService")
public class TbExceptionalServiceImpl implements TbExceptionalService {
	@Autowired
	TbExceptionalDao tbExceptionalDao;
	
	@Override
	public Result<TbExceptional> queryExceptionalList(String string1, String string2, int page, int row) {
		return tbExceptionalDao.queryExceptionalList(string1, string2, page, row);
	}

	@Override
	public Result<TbExceptional> queryExceptionalList2( 
			TbExceptional tbExceptional, int page, int row) {
		return tbExceptionalDao.queryExceptionalList2(tbExceptional, page, row);
	}

    /**
     * @Author zuofengwei
     * @Description 向数据库中添加打赏记录
     * @Date 2019/4/9 23:25
     * @param dealStatus
     * @param waterNumber
     * @param tbTeacher
     * @return void
     **/
	@Override
	public void addExceptional(Integer dealStatus, String waterNumber, TbTeacher tbTeacher) {

		TbExceptional tbExceptional = new TbExceptional();
		tbExceptional.setDealStatus(dealStatus);
		tbExceptional.setExceptionalMoney(31.0);
		tbExceptional.setExceptionalTime(MyTime.getNowForTimestamp());
		tbExceptional.setTeacherName(tbTeacher.getTeacherName());
		tbExceptional.setTeacherOpenId(tbTeacher.getOpenId());
		tbExceptional.setWaterNumber(waterNumber);
		tbExceptionalDao.getHibernateTemplate().save(tbExceptional);
	}


	@Override
	public String queryPrepayId(String waterNumber) {
		TbExceptional byHql = tbExceptionalDao.findByHql("from TbExceptionalDao where waterNumber=" + waterNumber);
		return  byHql.getPrepayId();
	}

	/**
	 * 查询下单时间是否超时
	 * @author 叶城廷
	 * @date 2019-05-03 12:52:07
	 **/
	@Override
	public boolean queryPrepayTime(String prepayId) {
		boolean flag=false;
		TbExceptional byHql = tbExceptionalDao.findByHql("from TbExceptional where prepayId='" + prepayId + "'");
		if (byHql!=null){
			//判断超时
			Long prepayTime = Long.valueOf(byHql.getPrepayTime());
			Long prepayPTime=WxPayUtil.getCurrentTimestamp();
			if (prepayPTime-prepayTime>=7200){
				//超时
				flag=true;
			}
		}else {
			//假超时
			flag=true;
		}
		return flag;
	}
}
