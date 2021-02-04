package com.gxuwz.KeepHealth.business.service;

import com.gxuwz.KeepHealth.business.entity.TbConsultationRecord;
import com.gxuwz.KeepHealth.business.entity.TbTeacher;
import com.gxuwz.core.pagination.Result;

import java.util.List;

public interface TbConsultationRecordService {
	

	public TbConsultationRecord symptom_description(int id);
	Result<TbConsultationRecord> queryList(TbConsultationRecord string, int page, int row);
	Result<TbConsultationRecord> recordList(String string, int page, int row);
	List<TbConsultationRecord> record(String openId);
	TbTeacher getByTeacherName(String teacherName);
	TbConsultationRecord recordDetails(int recordId);
	
	List<Object[]> getAwardCount();
	List<Object[]> getUnawardCount();
	List<Object[]> getServeCount();
	List<Object[]> getUnserveCount();

	/**
	 * @Title:  
	 * @Description: 查询该老师师所有已回复的记录
	 * @return List<TbConsultationRecord>    返回类型 
	 * @author: 陈紫丽
	 * @Date 2019年3月22日
	 * @throws
	 */
	public List<TbConsultationRecord> findYhf(Integer teacherId);
	/**
	 * @Title:  
	 * @Description: 查询该老师师所有未回复的记录
	 * @return List<TbConsultationRecord>    返回类型 
	 * @author: 陈紫丽
	 * @Date 2019年3月22日
	 * @throws
	 */
	public List<TbConsultationRecord> findWhf(Integer teacherId);
	/**
	 * @Title:  
	 * @Description: 查询该老师师所有已打赏的记录
	 * @return List<TbConsultationRecord>    返回类型 
	 * @author: 陈紫丽
	 * @Date 2019年3月22日
	 * @throws
	 */
	public List<TbConsultationRecord> findYds(Integer teacherId);
	/**
	 * @Title:  
	 * @Description: 查询该老师师所有未打赏的记录
	 * @return List<TbConsultationRecord>    返回类型 
	 * @author: 陈紫丽
	 * @Date 2019年3月22日
	 * @throws
	 */
	public List<TbConsultationRecord> findWds(Integer teacherId);


	

//	void saveConsultationRecord(String teacherName, Integer consumerId,
//			String consultationText);
//	public void teacherAdvise(TbConsultationRecord symptom);

	
	/**
	 * 未回复查询
	 * 董冰雪
	 * 2019.3.30
	 * @param tbTeacher1
	 * @return
	 */
	List<TbConsultationRecord> findByNotReply(TbTeacher tbTeacher1);
	
	/**
	 * 已回复查询
	 * 齐美琳
	 * 2019.3.30
	 * @return
	 */
	List<TbConsultationRecord> findByreadyReply(TbTeacher tbTeacher1);

	/**
	 * 未打赏
	 * 董冰雪
	 * 2019.4.2
	 * @param tbTeacher1
	 * @return
	 */
	List<TbConsultationRecord> findByReward(TbTeacher tbTeacher1);

	/**
	 * 已打赏查询
	 * 陈紫丽
	 * @return
	 */
	List<TbConsultationRecord> findyds(TbTeacher tbTeacher1);

	 void saveConsultationRecord(Integer teacherId, String openId,
			String consultationText);
	 void teacherAdvise(TbConsultationRecord symptom);
	 void addTeacherAdvise(TbConsultationRecord symptom);


    TbConsultationRecord findByRecordId(Integer recordId);

	 void updateExceptionalStatus(TbConsultationRecord tbCr);
	 boolean queryOrder(String recordId);

	void saveWaterNumber(String cordId, String prepay_id);

	 void successOrder(String recordId);

    void ConsultationRecord(TbConsultationRecord tbConsultationRecord, String waterNumber);

	TbTeacher getByTeacherId(Integer teacherId);

	 void closeOrder(String prepayId);

	void queryWater(String recordId, String prepayId);

	Result<Object[]> findRecordList(TbConsultationRecord tbConsultationRecord, int page, int row,String teacherName);

	/**
	 * @Author zuofengwei
	 * @Description 删除调理建议为空的咨询记录
	 * @Date 2019/6/2 10:11
	 * @param recordId
	 * @return void
	 **/
	void deleteConsultationRecord(Integer recordId);
}
