package com.gxuwz.KeepHealth.business.entity;

import java.sql.Timestamp;

/**
 * 打赏流水实体类
 * @author 叶城廷
 * @version 2019.03.01
 */
public class TbExceptional implements java.io.Serializable {

	// Fields

	private Integer exceptionalId;//打赏流水表ID
	private String teacherName;//服务老师名称
	private String teacherOpenId;//服务老师微信唯一码
	private Integer dealStatus;//打赏状态0：未打赏 1：已打赏 2:打赏中
	private Double exceptionalMoney;//打赏金额（暂时固定31元/次）
	private String waterNumber;//打赏流水单号（微信订单单号）
	private Timestamp exceptionalTime;//打赏时间
	private String prepayId;//拉起支付的编号
	private String prepayTime;//最近下单时间

	// Constructors

	/** default constructor */
	public TbExceptional() {
	}

	/** full constructor */
	public TbExceptional(String teacherName, String teacherOpenId, Integer dealStatus, Double exceptionalMoney,
			String waterNumber, Timestamp exceptionalTime,String prepayId,String prepayTime) {
		this.teacherName = teacherName;
		this.teacherOpenId = teacherOpenId;
		this.dealStatus = dealStatus;
		this.exceptionalMoney = exceptionalMoney;
		this.waterNumber = waterNumber;
		this.exceptionalTime = exceptionalTime;
		this.prepayId = prepayId;
		this.prepayTime = prepayTime;
	}

	// Property accessors

	public Integer getExceptionalId() {
		return this.exceptionalId;
	}

	public void setExceptionalId(Integer exceptionalId) {
		this.exceptionalId = exceptionalId;
	}

	public String getTeacherName() {
		return this.teacherName;
	}

	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}

	public String getTeacherOpenId() {
		return this.teacherOpenId;
	}

	public void setTeacherOpenId(String teacherOpenId) {
		this.teacherOpenId = teacherOpenId;
	}

	public Integer getDealStatus() {
		return this.dealStatus;
	}

	public void setDealStatus(Integer dealStatus) {
		this.dealStatus = dealStatus;
	}

	public Double getExceptionalMoney() {
		return this.exceptionalMoney;
	}

	public void setExceptionalMoney(Double exceptionalMoney) {
		this.exceptionalMoney = exceptionalMoney;
	}

	public String getWaterNumber() {
		return this.waterNumber;
	}

	public void setWaterNumber(String waterNumber) {
		this.waterNumber = waterNumber;
	}

	public Timestamp getExceptionalTime() {
		return this.exceptionalTime;
	}

	public void setExceptionalTime(Timestamp exceptionalTime) {
		this.exceptionalTime = exceptionalTime;
	}

	public String getPrepayId() {
		return prepayId;
	}

	public void setPrepayId(String prepayId) {
		this.prepayId = prepayId;
	}

	public String getPrepayTime() {
		return prepayTime;
	}

	public void setPrepayTime(String prepayTime) {
		this.prepayTime = prepayTime;
	}
}