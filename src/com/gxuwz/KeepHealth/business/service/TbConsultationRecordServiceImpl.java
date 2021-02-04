package com.gxuwz.KeepHealth.business.service;

import java.util.List;

import com.gxuwz.KeepHealth.business.action.web.front.WeixinPayAction;
import com.gxuwz.KeepHealth.business.dao.*;
import com.gxuwz.KeepHealth.business.entity.*;
import com.gxuwz.KeepHealth.wx.util.WeixinUtil;
import com.gxuwz.KeepHealth.wx.util.WxPayUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import util.MyTime;

import com.gxuwz.core.pagination.Result;
/**
 * 咨询列表Service实现类
 * @author 陈天昊
 *@version 2019.3.2
 */
@Service("tbConsultationRecordService")
public  class TbConsultationRecordServiceImpl implements TbConsultationRecordService {

	@Autowired
	TbConsultationRecordDao tbConsultationRecordDao ;

	@Autowired
	TbExceptionalDao tbExceptionalDao ;

	@Autowired
	TbExceptionalService tbExceptionalService ;

	@Autowired
	TbTeacherDao tbTeacherDao;

	@Autowired
	TbSettlementDao tbSettlementDao;

	@Autowired
	TbConsumerDao tbConsumerDao;


	@Autowired
	TbSettlementService tbSettlementService;
	
	public void teacherAdvise(TbConsultationRecord tbConsultationRecord){
		tbConsultationRecordDao.getHibernateTemplate().saveOrUpdate(tbConsultationRecord);
	}

	@Override
	public TbConsultationRecord findByRecordId(Integer recordId) {

		return tbConsultationRecordDao.get(TbConsultationRecord.class,recordId);
	}

	@Override
	public void updateExceptionalStatus(TbConsultationRecord tbCr) {
		tbCr.setExceptionalStatus(1);
		tbConsultationRecordDao.getHibernateTemplate().saveOrUpdate(tbCr);
	}

	/**
	 * @Author zuofengwei
	 * @Description 用户打赏后更新咨询记录信息
	 * @Date 2019/4/17 17:58
	 * @param tbConsultationRecord
     * @param waterNumber
	 * @return void
	 **/
	@Override
	public void ConsultationRecord(TbConsultationRecord tbConsultationRecord, String waterNumber) {
		tbConsultationRecord.setExceptionalStatus(1);
		tbConsultationRecord.setWaterNumber(waterNumber);
		tbConsultationRecordDao.getHibernateTemplate().saveOrUpdate(tbConsultationRecord);
	}

	@Override
	public TbTeacher getByTeacherId(Integer teacherId) {
		return tbTeacherDao.getByTeacherId(teacherId);
	}

	/**
	 * 标记关闭订单
	 * @author 叶城廷
	 * @date 2019-05-01 12:35:03
	 **/
	@Override
	public void closeOrder(String prepayId) {
		TbExceptional byHql = tbExceptionalDao.findByHql("from TbExceptional where prepayId='" + prepayId+"'");
		byHql.setDealStatus(0);
		byHql.setExceptionalTime(MyTime.getNowForTimestamp());
		byHql.setWaterNumber(prepayId);//支付失败，流水号则为调起微信支付的prepayId
		tbExceptionalDao.save(byHql);
	}

	/**
	 * 拉起未支付的订单时，检查是否有流水，二次避免数据的不完整性
	 * @author 叶城廷
	 * @date 2019-05-02 18:13:03
	 **/
	@Override
	public void queryWater(String recordId, String prepayId) {
		//查询是否存在相关流水
		try {
			TbExceptional byHql = tbExceptionalDao.findByHql("from TbExceptional where prepayId='"+prepayId+"'");
			if (byHql==null){
				//检查出存在数据不完整,二次保存记录
				TbConsultationRecord tbConsultationRecord =symptom_description(Integer.valueOf(recordId));
				TbExceptional tbExceptional=new TbExceptional();
				//交易中
				tbExceptional.setDealStatus(2);
				tbExceptional.setPrepayId(prepayId);
				tbExceptional.setExceptionalMoney(99.00);
				TbTeacher tbTeacher = tbTeacherDao.get(TbTeacher.class,tbConsultationRecord.getTeacherId());
				tbExceptional.setTeacherOpenId(tbTeacher.getOpenId());
				tbExceptional.setTeacherName(tbTeacher.getTeacherName());
				tbExceptional.setPrepayTime(String.valueOf(WxPayUtil.getCurrentTimestamp()));
				//转业务层保存
				tbExceptionalDao.save(tbExceptional);
			}
		}catch (Exception e){
			e.printStackTrace();
		}

	}

	/**
	 * @Author zuofengwei
	 * @Description 获取所有的咨询记录以及设置总记录数
	 * @Date 2019/5/22 13:00
	 * @param tbConsultationRecord
	 * @param page
	 * @param row
	 * @return com.gxuwz.core.pagination.Result<java.lang.Object[]>
	 **/
	@Override
	public Result<Object[]> findRecordList(TbConsultationRecord tbConsultationRecord, int page, int row,String teacherName) {

		Result<Object[]> rs = tbConsultationRecordDao.findRecordList(tbConsultationRecord,page,row,teacherName);
		int start=(page-1)*row;
		if(start != -1 && row != -1){
			rs.setTotal(tbConsultationRecordDao.getTotal().intValue());
		}


		return rs;
	}

	/**
	 * @Author zuofengwei
	 * @Description 删除调理建议为空的咨询记录
	 * @Date 2019/6/2 10:11
	 * @param recordId
	 * @return void
	 **/
	@Override
	public void deleteConsultationRecord(Integer recordId) {

		TbConsultationRecord record = findByRecordId(recordId);
		tbConsultationRecordDao.getHibernateTemplate().delete(record);
	}

	@Override
	public void addTeacherAdvise(TbConsultationRecord symptom) {
		tbConsultationRecordDao.getHibernateTemplate().saveOrUpdate(symptom);
		
	}

	/**
	 * 核对微信支付订单
	 * @param recordId 咨询记录号
	 * @author 叶城廷
	 * @version 2019.04.15
	 * @return
	 */
	@Override
	public boolean queryOrder(String recordId) {
		boolean flag=false;
		try{
			String flagStr = WeixinUtil.queryOrder(recordId,"trade_state");
			if (flagStr.equals(WeixinUtil.RESULT_CODE_SUCCESS)){
				flag=true;
			}
		}catch (Exception e){
			e.printStackTrace();
			flag=false;
		}
		return  flag;
	}

    /**
     * 保存流水编号但未完成支付
     * @author 叶城廷
     * @version 2019.04.15
     * @return
     */
    @Override
    public void saveWaterNumber(String cordId, String prepay_id) {
    	try {

			TbConsultationRecord tbConsultationRecord = symptom_description(Integer.valueOf(cordId));
			tbConsultationRecord.setWaterNumber(prepay_id);
			tbConsultationRecordDao.save(tbConsultationRecord);
			//查询该老师
			TbTeacher byHql = tbTeacherDao.getByTeacherId(tbConsultationRecord.getTeacherId());
			TbExceptional tbExceptional=new TbExceptional();
			//交易中
			tbExceptional.setDealStatus(2);
			tbExceptional.setExceptionalMoney(99.00);
			tbExceptional.setTeacherName(byHql.getTeacherName());
			tbExceptional.setPrepayId(prepay_id);
			tbExceptional.setTeacherOpenId(byHql.getOpenId());
			tbExceptional.setPrepayTime(String.valueOf(WxPayUtil.getCurrentTimestamp()));
			//流水业务层记录流水
			tbExceptionalDao.save(tbExceptional);

		}catch (Exception e){
			System.out.println("保存记录出现异常");
    		e.printStackTrace();
		}

    }

	/**
	 * 完成支付，修改咨询记录打赏状态
	 * @author 叶城廷
	 * @version 2019.04.15
	 * @return
	 */
	@Override
	public void successOrder(String recordId) {
		TbConsultationRecord tbConsultationRecord =symptom_description(Integer.valueOf(recordId));
		tbConsultationRecord.setExceptionalStatus(1);
		tbConsultationRecordDao.update(tbConsultationRecord);

		//变更流水
		TbExceptional byHql = tbExceptionalDao.findByHql("from TbExceptional where prepayId = '" + tbConsultationRecord.getWaterNumber()+"'");
		byHql.setDealStatus(1);
		byHql.setExceptionalTime(MyTime.getNowForTimestamp());
		
		//向微信发送核对订单支付请求
		//记录流水
		String transaction_id = WeixinUtil.queryOrder(recordId, "transaction_id");
		byHql.setWaterNumber(transaction_id);
		tbExceptionalDao.update(byHql);

		//查询老师结算是否重复
		List<TbSettlement> byHql2 = tbSettlementDao.findByHql("from TbSettlement where recordId=" + recordId, null);
		if (byHql2.size()==0){
		    TbSettlement tbSettlement=new TbSettlement();
		    tbSettlement.setTeacherName(byHql.getTeacherName());
		    tbSettlement.setTeacherId(tbConsultationRecord.getTeacherId());
		    tbSettlement.setSettlementMoney(99.00);
		    tbSettlement.setRecordId(Integer.valueOf(recordId));
		    tbSettlement.setSettlementStatus(0);
		    tbSettlementService.save(tbSettlement);
		}


		//添加老师计算
	}

	public TbConsultationRecord symptom_description(int id){
		//return tbConsultationRecordDao.get(TbConsultationRecord.class, id);
        return (TbConsultationRecord)tbConsultationRecordDao.getHibernateTemplate().find("from TbConsultationRecord where recordId="+id).get(0);
	}

	@Override
	public Result<TbConsultationRecord> recordList(String string, int page,
			int row) {
		return tbConsultationRecordDao.recordList(string, page, row);
	}
	
	public List<TbConsultationRecord> record(String openId){
		List<TbConsultationRecord> list = tbConsultationRecordDao.record(openId);
		return list;
	}
	
	public TbConsultationRecord recordDetails(int recordId){
		return tbConsultationRecordDao.get(TbConsultationRecord.class,recordId);
	}
	
	public TbTeacher getByTeacherName(String teacherName){
		return tbTeacherDao.getByTeacherName(teacherName);
	}


	@Override
	public Result<TbConsultationRecord> queryList(TbConsultationRecord tbConsultationRecord, int page,
			int row) {
		return tbConsultationRecordDao.queryList(tbConsultationRecord, page, row);
	}

	@Override
	//已打赏
	public List<Object[]> getAwardCount() {
		return tbConsultationRecordDao.getAwardCount();
	}

	@Override
	//未打赏
	public List<Object[]> getUnawardCount() {
		
		 List<Object[]> list = tbConsultationRecordDao.getUnawardCount();
		 
		 return list;
	}

	@Override
	//已服务
	public List<Object[]> getServeCount() {
	
		return tbConsultationRecordDao.getServeCount();
	}
	
	@Override
	//未服务
	public List<Object[]> getUnserveCount() {
		
		return tbConsultationRecordDao.getUnserveCount();
	}


    /**
     * 未回复查询
     * 董冰雪
     * 2019.3.30
     */
	public List<TbConsultationRecord> findByNotReply(TbTeacher tbTeacher1) {
		return tbConsultationRecordDao.findByNotReply(tbTeacher1);
	}
	
	 /**
     * 已回复查询
     * 齐美琳
     * 2019.3.30
     */
	public List<TbConsultationRecord> findByreadyReply(TbTeacher tbTeacher1) {
		return tbConsultationRecordDao.findByreadyReply(tbTeacher1);
	}

	/**
     * 未打赏
     * 董冰雪
     * 2019.4.2
     */
	public List<TbConsultationRecord> findByReward(TbTeacher tbTeacher1) {
		return tbConsultationRecordDao.findByReward(tbTeacher1);
	}

	 /**
     * 已打赏查询
     * 陈紫丽
     * 2019.4.2
     */
	public List<TbConsultationRecord> findyds(TbTeacher tbTeacher1) {
		return tbConsultationRecordDao.findyds(tbTeacher1);
	}


	@Override
	/**
	 * 用户根据选择的老师新增咨询+消息通知
	 * @author 叶城廷
	 * @date 2019-05-07 21:53:18
	 **/
	public void saveConsultationRecord(Integer teacherId, String openid,
			String consultationText) {
		
			TbConsultationRecord csr = new TbConsultationRecord();
			csr.setOpenId(openid);
			csr.setTeacherId(teacherId);
			csr.setSymptomDescription(consultationText);
			csr.setConsultTime(MyTime.getNowForTimestamp());
			csr.setExceptionalStatus(0);
			tbConsultationRecordDao.save(csr);

			//查询用户信息
	    	TbConsumer tbConsumer = tbConsumerDao.queryConsumerByOpenid(openid).get(0);
		    //执行消息通知
		    TbTeacher tbTeacher = getByTeacherId(teacherId);
		    WeixinUtil.sendTeacherTemplateMessage(tbTeacher.getOpenId(),tbConsumer.getConsumerName(),csr.getSymptomDescription());
	}

//	@Override
//	public void saveConsultationRecord(String teacherName, Integer consumerId,
//			String consultationText) {
//		
//			TbConsultationRecord csr = new TbConsultationRecord();
//			csr.setOpenId(consumerId.toString());
//			csr.setTeacherName(teacherName);
//			csr.setSymptomDescription(consultationText);
//			csr.setConsultTime(MyTime.getNowForTimestamp());
//			csr.setExceptionalStatus(0);
//			tbConsultationRecordDao.save(csr);
//	}

	@Override
	/**
	 * 根据老师名字查询该老师师所有已回复的记录
	 * 
	 */
	public List<TbConsultationRecord> findYhf(Integer teacherId) {
		return tbConsultationRecordDao.findYhf(teacherId);
		
	}
	
	/**
	 * 根据老师名字查询该老师师所有未回复的记录
	 * 
	 */
	@Override
	public List<TbConsultationRecord> findWhf(Integer teacherId) {
		return tbConsultationRecordDao.findWhf(teacherId);
	}
	/**
	 * 根据老师名字查询该老师师所有已打赏的记录
	 * 
	 */
	@Override
	public List<TbConsultationRecord> findYds(Integer teacherId) {
		return tbConsultationRecordDao.findYds(teacherId);
	}
	/**
	 * 根据老师名字查询该老师师所有未打赏的记录
	 * 
	 */
	@Override
	public List<TbConsultationRecord> findWds(Integer teacherId) {
		return tbConsultationRecordDao.findWds(teacherId);
	}

	

}
