package com.gxuwz.KeepHealth.business.service;

import com.gxuwz.KeepHealth.business.entity.TbConsultationRecord;
import com.gxuwz.KeepHealth.business.entity.TbExceptional;
import com.gxuwz.KeepHealth.business.entity.TbTeacher;
import com.gxuwz.core.pagination.Result;

/**
 * 与交易对账相关（打赏）Service接口类
 * @author 丁程强
 * @version 2019年3月2日
 */
public interface TbExceptionalService {
	public Result<TbExceptional> queryExceptionalList(String string1, String string2, int page, int row);

	public Result<TbExceptional> queryExceptionalList2(
			TbExceptional tbExceptional, int page, int row);

	/**
	 * @Author zuofengwei
	 * @Description 向数据库中添加打赏记录
	 * @Date 2019/4/9 23:25
	 * @param dealStatus
	 * @param waterNumber
	 * @param tbTeacher
	 * @return void
	 **/
	public void addExceptional(Integer dealStatus, String waterNumber, TbTeacher tbTeacher);


	public  String queryPrepayId(String waterNumber);


	boolean queryPrepayTime(String prepayId);
}
