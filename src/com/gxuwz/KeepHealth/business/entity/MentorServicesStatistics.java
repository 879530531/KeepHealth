package com.gxuwz.KeepHealth.business.entity;

import java.sql.Timestamp;
/**
 * 
* @ClassName: MentorServicesStatistics 
* @Description: 导师服务统计实体类      封装多表查询得到的结果
* @author 软件开发中心  陈洁 
* @date 2017年7月8日 上午3:03:33
 */
public class MentorServicesStatistics {
	
	private String personalNumber;//导师编号
	private Integer personalId;//导师id
	private String realName;//导师真实姓名
	private Long serviceNumber;//服务总数量
	private Long badNumber;//评价为差的服务数量
	private Long generalNumber;//评价为一般的服务数量
	private Long goodNumber;//评价为满意的服务数量
	private Long bettergoodNumber;//评价为比较满意的服务数量
	private Long satisfaction;//评价为非常满意的服务数量
	private Timestamp time1;//咨询时间
	private Timestamp time2;//咨询时间
	/**
	 * 
	* @Title: MentorServicesStatistics 
	* @author 软件开发中心   陈洁
	* @Description: 构造函数
	* @return 
	* @date 2017年7月8日 上午3:08:35 
	* @throws
	 */
	public MentorServicesStatistics(String personalNumber,Integer personalId, String realName,Long serviceNumber,Long badNumber,Long generalNumber,Long goodNumber, Long bettergoodNumber,Long satisfaction) throws java.text.ParseException{
		   super();
		   this.personalNumber=personalNumber;
		   this.personalId=personalId;
		   this.realName=realName;
		   this.serviceNumber = serviceNumber;
		   this.badNumber=badNumber;
		   this.generalNumber = generalNumber;
		   this.goodNumber=goodNumber;
		   this.bettergoodNumber=bettergoodNumber;
		   this.satisfaction = satisfaction;
		}
	

	public MentorServicesStatistics() {
		// TODO Auto-generated constructor stub
	}
	/**
	 * 
	* @Title: MentorServicesStatistics 
	* @author 软件开发中心   陈洁
	* @Description: 构造函数
	* @date 2017年7月8日 上午3:08:35 
	* @throws
	 */
	public MentorServicesStatistics(Integer personalId, Long badNumber,
			Long generalNumber, Long goodNumber, Long bettergoodNumber,
			Long satisfaction) {
		super();
		this.personalId = personalId;
		this.badNumber = badNumber;
		this.generalNumber = generalNumber;
		this.goodNumber = goodNumber;
		this.bettergoodNumber = bettergoodNumber;
		this.satisfaction = satisfaction;
	}

	public Integer getPersonalId() {
		return personalId;
	}
	public void setPersonalId(Integer personalId) {
		this.personalId = personalId;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	public Long getServiceNumber() {
		return serviceNumber;
	}
	public void setServiceNumber(Long serviceNumber) {
		this.serviceNumber = serviceNumber;
	}
	public Long getBadNumber() {
		return badNumber;
	}
	public void setBadNumber(Long badNumber) {
		this.badNumber = badNumber;
	}
	public Long getGeneralNumber() {
		return generalNumber;
	}
	public void setGeneralNumber(Long generalNumber) {
		this.generalNumber = generalNumber;
	}
	public Long getGoodNumber() {
		return goodNumber;
	}
	public void setGoodNumber(Long goodNumber) {
		this.goodNumber = goodNumber;
	}
	public Long getBettergoodNumber() {
		return bettergoodNumber;
	}
	public void setBettergoodNumber(Long bettergoodNumber) {
		this.bettergoodNumber = bettergoodNumber;
	}
	public Long getSatisfaction() {
		return satisfaction;
	}
	public void setSatisfaction(Long satisfaction) {
		this.satisfaction = satisfaction;
	}

	public Timestamp getTime1() {
		return time1;
	}

	public void setTime1(Timestamp time1) {
		this.time1 = time1;
	}

	public Timestamp getTime2() {
		return time2;
	}

	public void setTime2(Timestamp time2) {
		this.time2 = time2;
	}

	public String getPersonalNumber() {
		return personalNumber;
	}

	public void setPersonalNumber(String personalNumber) {
		this.personalNumber = personalNumber;
	}

/*	public Timestamp getFeedbackTime() {
		return feedbackTime;
	}

	public void setFeedbackTime(Timestamp feedbackTime) {
		this.feedbackTime = feedbackTime;
	}*/

}
