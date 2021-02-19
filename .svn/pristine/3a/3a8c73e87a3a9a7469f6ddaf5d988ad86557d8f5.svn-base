package com.gxuwz.KeepHealth.business.entity;

import java.sql.Timestamp;

/**
 * 结算流水表
 * @author 叶城廷
 * @version 2019.03.01→2019.03.03增加结算状态字段
 */
@SuppressWarnings("serial")
public class TbSettlement implements java.io.Serializable {

	// Fields

	private Integer settlementId;//结算流水编号
	private Integer teacherId;//老师编号
	private String teacherName;//老师名称
	private Timestamp settlementDate;//结算时间（如未结算时为空）
	private Double settlementMoney;//结算金额（固定每单31元）
	private Integer recordId;//对应咨询记录的编号
    private Integer settlementStatus;//结算状态0：未结算 1：已结算
	// Constructors

	/** default constructor */
	public TbSettlement() {
	}

	/** minimal constructor */
	public TbSettlement(Integer settlementId, Integer recordId) {
		this.settlementId = settlementId;
		this.recordId = recordId;
	}

	/** full constructor */
	public TbSettlement(Integer settlementId, Integer teacherId, String teacherName, Timestamp settlementDate,
			Double settlementMoney, Integer recordId, Integer settlementStatus) {
		super();
		this.settlementId = settlementId;
		this.teacherId = teacherId;
		this.teacherName = teacherName;
		this.settlementDate = settlementDate;
		this.settlementMoney = settlementMoney;
		this.recordId = recordId;
		this.settlementStatus = settlementStatus;
	}

	// Property accessors

	public Integer getSettlementId() {
		return this.settlementId;
	}



	public Integer getSettlementStatus() {
		return settlementStatus;
	}

	public void setSettlementStatus(Integer settlementStatus) {
		this.settlementStatus = settlementStatus;
	}

	public void setSettlementId(Integer settlementId) {
		this.settlementId = settlementId;
	}

	public Integer getTeacherId() {
		return this.teacherId;
	}

	public void setTeacherId(Integer teacherId) {
		this.teacherId = teacherId;
	}

	public String getTeacherName() {
		return this.teacherName;
	}

	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}

	public Timestamp getSettlementDate() {
		return this.settlementDate;
	}

	public void setSettlementDate(Timestamp settlementDate) {
		this.settlementDate = settlementDate;
	}

	public Double getSettlementMoney() {
		return this.settlementMoney;
	}

	public void setSettlementMoney(Double settlementMoney) {
		this.settlementMoney = settlementMoney;
	}

	public Integer getRecordId() {
		return this.recordId;
	}

	public void setRecordId(Integer recordId) {
		this.recordId = recordId;
	}

}