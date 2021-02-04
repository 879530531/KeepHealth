package com.gxuwz.KeepHealth.business.entity;

import java.sql.Timestamp;

/**
 * TbAdvice entity. @author MyEclipse Persistence Tools
 */

public class TbAdvice implements java.io.Serializable {

	// Fields

	private Integer adviceId;
	private String adviceContent;
	private Timestamp adviceTime;
	private Integer readmeId;
	private Integer personalId;
	private String mentorName;
	private Integer memberId;
	private Integer fatherId;

	// Constructors

	/** default constructor */
	public TbAdvice() {
	}

	/** minimal constructor */
	public TbAdvice(String adviceContent, Timestamp adviceTime,
			Integer readmeId, Integer personalId, String mentorName,
			Integer memberId) {
		this.adviceContent = adviceContent;
		this.adviceTime = adviceTime;
		this.readmeId = readmeId;
		this.personalId = personalId;
		this.mentorName = mentorName;
		this.memberId = memberId;
	}

	/** full constructor */
	public TbAdvice(String adviceContent, Timestamp adviceTime,
			Integer readmeId, Integer personalId, String mentorName,
			Integer memberId, Integer fatherId) {
		this.adviceContent = adviceContent;
		this.adviceTime = adviceTime;
		this.readmeId = readmeId;
		this.personalId = personalId;
		this.mentorName = mentorName;
		this.memberId = memberId;
		this.fatherId = fatherId;
	}

	// Property accessors

	public Integer getAdviceId() {
		return this.adviceId;
	}

	public void setAdviceId(Integer adviceId) {
		this.adviceId = adviceId;
	}

	public String getAdviceContent() {
		return this.adviceContent;
	}

	public void setAdviceContent(String adviceContent) {
		this.adviceContent = adviceContent;
	}

	public Timestamp getAdviceTime() {
		return this.adviceTime;
	}

	public void setAdviceTime(Timestamp adviceTime) {
		this.adviceTime = adviceTime;
	}

	public Integer getReadmeId() {
		return this.readmeId;
	}

	public void setReadmeId(Integer readmeId) {
		this.readmeId = readmeId;
	}

	public Integer getPersonalId() {
		return this.personalId;
	}

	public void setPersonalId(Integer personalId) {
		this.personalId = personalId;
	}

	public String getMentorName() {
		return this.mentorName;
	}

	public void setMentorName(String mentorName) {
		this.mentorName = mentorName;
	}

	public Integer getMemberId() {
		return this.memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}

	public Integer getFatherId() {
		return this.fatherId;
	}

	public void setFatherId(Integer fatherId) {
		this.fatherId = fatherId;
	}

}