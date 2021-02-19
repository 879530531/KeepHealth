package com.gxuwz.KeepHealth.business.entity;

import java.sql.Timestamp;

/**
 * TbFeedback entity. @author MyEclipse Persistence Tools
 */

public class TbFeedback implements java.io.Serializable {

	// Fields

	private Integer feedbackId;
	private String feedbackContent;//反馈内容
	private Timestamp feedbackTime;//反馈时间
	private Integer starEvaluation;//星级评价   
	private Integer personalId;//个人数据id
	private Integer readmeId;//健康自述id
	private Integer memberId;//会员id

	// Constructors

	/** default constructor */
	public TbFeedback() {
	}

	/** minimal constructor */
	public TbFeedback(Timestamp feedbackTime, Integer starEvaluation,
			Integer personalId, Integer readmeId, Integer memberId) {
		this.feedbackTime = feedbackTime;
		this.starEvaluation = starEvaluation;
		this.personalId = personalId;
		this.readmeId = readmeId;
		this.memberId = memberId;
	}

	/** full constructor */
	public TbFeedback(String feedbackContent, Timestamp feedbackTime,
			Integer starEvaluation, Integer personalId, Integer readmeId,
			Integer memberId) {
		this.feedbackContent = feedbackContent;
		this.feedbackTime = feedbackTime;
		this.starEvaluation = starEvaluation;
		this.personalId = personalId;
		this.readmeId = readmeId;
		this.memberId = memberId;
	}

	// Property accessors

	public Integer getFeedbackId() {
		return this.feedbackId;
	}

	public void setFeedbackId(Integer feedbackId) {
		this.feedbackId = feedbackId;
	}

	public String getFeedbackContent() {
		return this.feedbackContent;
	}

	public void setFeedbackContent(String feedbackContent) {
		this.feedbackContent = feedbackContent;
	}

	public Timestamp getFeedbackTime() {
		return this.feedbackTime;
	}

	public void setFeedbackTime(Timestamp feedbackTime) {
		this.feedbackTime = feedbackTime;
	}

	public Integer getStarEvaluation() {
		return this.starEvaluation;
	}

	public void setStarEvaluation(Integer starEvaluation) {
		this.starEvaluation = starEvaluation;
	}

	public Integer getPersonalId() {
		return this.personalId;
	}

	public void setPersonalId(Integer personalId) {
		this.personalId = personalId;
	}

	public Integer getReadmeId() {
		return this.readmeId;
	}

	public void setReadmeId(Integer readmeId) {
		this.readmeId = readmeId;
	}

	public Integer getMemberId() {
		return this.memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}

}