package com.gxuwz.KeepHealth.business.entity;

/**
 * TbFee entity. @author MyEclipse Persistence Tools
 */

public class TbFee implements java.io.Serializable {

	// Fields

	private Integer feeId;
	private String feeNum;
	public Integer getFeeId() {
		return feeId;
	}
	public void setFeeId(Integer feeId) {
		this.feeId = feeId;
	}
	public String getFeeNum() {
		return feeNum;
	}
	public void setFeeNum(String feeNum) {
		this.feeNum = feeNum;
	}
	public TbFee(Integer feeId, String feeNum) {
		super();
		this.feeId = feeId;
		this.feeNum = feeNum;
	}

	public TbFee() {
		
	}

}