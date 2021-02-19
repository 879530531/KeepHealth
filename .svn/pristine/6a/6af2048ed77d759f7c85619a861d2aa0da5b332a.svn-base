package com.gxuwz.KeepHealth.business.entity;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.apache.http.ParseException;

/**
 * 咨询记录实体类
 * @author 叶城廷
 * @version 2019.03.01
 *
 */
public class TbConsultationRecord implements java.io.Serializable {

	// Fields

	private Integer recordId;//记录ID
	private String openId;//用户微信唯一码
	private Integer teacherId;//老师名称
	private String symptomDescription;//症状描述
	private String waterNumber;//打赏流水单号（未打赏时为空）→对应打赏流水实体类的waterNumber
	private Timestamp consultTime;//咨询时间
	private Timestamp consultTime2;//开始时间
	private Timestamp consultTime3;//结束时间
	
	//已打赏，未打赏，已服务，未服务
//	private Long award;
//	private Long unaward;
//	private Long serve;
//	private Long unserve;
	
	private TbConsumer tbConsumer;

//	public Long getAward() {
//		return award;
//	}
//
//	public Long getUnaward() {
//		return unaward;
//	}
//
//	public Long getServe() {
//		return serve;
//	}
//
//	public Long getUnserve() {
//		return unserve;
//	}
//
//	public void setAward(Long award) {
//		this.award = award;
//	}
//
//	public void setUnaward(Long unaward) {
//		this.unaward = unaward;
//	}
//
//	public void setServe(Long serve) {
//		this.serve = serve;
//	}
//
//	public void setUnserve(Long unserve) {
//		this.unserve = unserve;
//	}

	public Timestamp getConsultTime3() {
		return consultTime3;
	}

	public void setConsultTime3(Timestamp consultTime3) {
		this.consultTime3 = consultTime3;
	}

	public Timestamp getConsultTime2() {
		return consultTime2;
	}

	public void setConsultTime2(Timestamp consultTime2) {
		this.consultTime2 = consultTime2;
	}

	private String advice;//调理建议
	private Timestamp adviceTime;//建议时间
	private String additionalAdvice;//追加建议
	private Timestamp additionalAdviceTime;//追加时间
	private Integer exceptionalStatus;//打赏状态 0：未打赏 1：已打赏

	// Constructors

	/** default constructor */
	public TbConsultationRecord() {
	}

	/** minimal constructor */
	public TbConsultationRecord(String openId, Integer teacherId, String symptomDescription, Timestamp consultTime,
			String advice, Timestamp adviceTime, Integer exceptionalStatus) {
		this.openId = openId;
		this.teacherId = teacherId;
		this.symptomDescription = symptomDescription;
		this.consultTime = consultTime;
		this.advice = advice;
		this.adviceTime = adviceTime;
		this.exceptionalStatus = exceptionalStatus;
	}

	/** full constructor */
	public TbConsultationRecord(String openId, Integer teacherId, String symptomDescription, String waterNumber,
			Timestamp consultTime, String advice, Timestamp adviceTime, String additionalAdvice,
			Timestamp additionalAdviceTime, Integer exceptionalStatus) {
		this.openId = openId;
		this.teacherId = teacherId;
		this.symptomDescription = symptomDescription;
		this.waterNumber = waterNumber;
		this.consultTime = consultTime;
		this.advice = advice;
		this.adviceTime = adviceTime;
		this.additionalAdvice = additionalAdvice;
		this.additionalAdviceTime = additionalAdviceTime;
		this.exceptionalStatus = exceptionalStatus;
	}
	
	public static Timestamp stringToTimestamp(String dateStr) throws java.text.ParseException{
		 
		   SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		   Calendar cal = Calendar.getInstance();
		   try {
		    Date date = (Date) sdf.parse(dateStr);
		    date.getTime();
		    cal.setTime(date);
		    return new Timestamp(cal.getTimeInMillis());
		   } catch (ParseException e) {
		    e.printStackTrace();
		   }
		 
		   cal.setTime(new Date());
		   return new Timestamp(cal.getTimeInMillis());
		}
	
	
	// Property accessors

	public Integer getRecordId() {
		return this.recordId;
	}

	public void setRecordId(Integer recordId) {
		this.recordId = recordId;
	}

	public String getOpenId() {
		return this.openId;
	}

	public void setOpenId(String openId) {
		this.openId = openId;
	}

	public Integer getTeacherId() {
		return this.teacherId;
	}

	public void setTeacherId(Integer teacherId) {
		this.teacherId = teacherId;
	}

	public String getSymptomDescription() {
		return this.symptomDescription;
	}

	public void setSymptomDescription(String symptomDescription) {
		this.symptomDescription = symptomDescription;
	}

	public String getWaterNumber() {
		return this.waterNumber;
	}

	public void setWaterNumber(String waterNumber) {
		this.waterNumber = waterNumber;
	}

	public Timestamp getConsultTime() {
		return this.consultTime;
	}

	public void setConsultTime(Timestamp consultTime) {
		this.consultTime = consultTime;
	}

	public String getAdvice() {
		return this.advice;
	}

	public void setAdvice(String advice) {
		this.advice = advice;
	}

	public Timestamp getAdviceTime() {
		return this.adviceTime;
	}

	public void setAdviceTime(Timestamp adviceTime) {
		this.adviceTime = adviceTime;
	}

	public String getAdditionalAdvice() {
		return this.additionalAdvice;
	}

	public void setAdditionalAdvice(String additionalAdvice) {
		this.additionalAdvice = additionalAdvice;
	}

	public Timestamp getAdditionalAdviceTime() {
		return this.additionalAdviceTime;
	}

	public void setAdditionalAdviceTime(Timestamp additionalAdviceTime) {
		this.additionalAdviceTime = additionalAdviceTime;
	}

	public Integer getExceptionalStatus() {
		return this.exceptionalStatus;
	}

	public void setExceptionalStatus(Integer exceptionalStatus) {
		this.exceptionalStatus = exceptionalStatus;
	}

	public TbConsumer getTbConsumer() {
		return tbConsumer;
	}

	public void setTbConsumer(TbConsumer tbConsumer) {
		this.tbConsumer = tbConsumer;
	}

	@Override
	public String toString() {
		return "TbConsultationRecord [recordId=" + recordId + ", openId="
				+ openId + ", teacherId=" + teacherId
				+ ", symptomDescription=" + symptomDescription
				+ ", waterNumber=" + waterNumber + ", consultTime="
				+ consultTime + ", consultTime2=" + consultTime2
				+ ", consultTime3=" + consultTime3 + ", tbConsumer="
				+ tbConsumer + ", advice=" + advice + ", adviceTime="
				+ adviceTime + ", additionalAdvice=" + additionalAdvice
				+ ", additionalAdviceTime=" + additionalAdviceTime
				+ ", exceptionalStatus=" + exceptionalStatus + "]";
	}


}