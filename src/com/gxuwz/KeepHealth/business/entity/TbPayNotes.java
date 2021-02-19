package com.gxuwz.KeepHealth.business.entity;

import java.sql.Timestamp;

/**
 * TbPayNotes entity. @author MyEclipse Persistence Tools
 */

public class TbPayNotes implements java.io.Serializable {

	// Fields

	private Integer payId;
	private Integer payWay;//支付方式
	private Float payMoney;//支付金额
	private Timestamp payTime;//支付时间
	private Integer personalId;//关联个人数据表

	// Constructors

	/** default constructor */
	public TbPayNotes() {
	}

	/** full constructor */
	public TbPayNotes(Integer payWay, Float payMoney, Timestamp payTime,
			Integer personalId) {
		this.payWay = payWay;
		this.payMoney = payMoney;
		this.payTime = payTime;
		this.personalId = personalId;
	}

	// Property accessors

	public Integer getPayId() {
		return this.payId;
	}

	public void setPayId(Integer payId) {
		this.payId = payId;
	}

	public Integer getPayWay() {
		return this.payWay;
	}

	public void setPayWay(Integer payWay) {
		this.payWay = payWay;
	}

	public Float getPayMoney() {
		return this.payMoney;
	}

	public void setPayMoney(Float payMoney) {
		this.payMoney = payMoney;
	}

	public Timestamp getPayTime() {
		return this.payTime;
	}

	public void setPayTime(Timestamp payTime) {
		this.payTime = payTime;
	}

	public Integer getPersonalId() {
		return this.personalId;
	}

	public void setPersonalId(Integer personalId) {
		this.personalId = personalId;
	}

}