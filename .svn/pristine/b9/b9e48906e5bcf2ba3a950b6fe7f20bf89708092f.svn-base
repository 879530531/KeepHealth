package com.gxuwz.KeepHealth.business.entity;

import java.sql.Timestamp;

/**
 * 健康自述表   实体类
 * @author 梧州学院 软件研发中心  陈洁
 * <br>Copyright (C), 2017, 梧州学院 软件研发中心 
 * <br>Program Name: TbReadme
 * <br>Date: 2017-03-01
 */
public class TbReadme implements java.io.Serializable {

	// Fields

	private Integer readmeId;//健康自述ID
	private Integer fatherId;//父级ID
	private Integer mentorId;//导师ID
	private Integer replyState;//回复状态   0未回复   1已回复
	private Integer flagType;
	private String readmeContent;//自述内容
	private Timestamp readmeTime;//自述时间
	private Integer personalId;//自述人ID
	private String memberName;//会员名称
	private Integer feedbackState;//反馈状态  0未反馈  1已反馈
	private String mentorName;//导师名称

	// Constructors

	/** default constructor */
	public TbReadme() {
	}

	/** minimal constructor */
	public TbReadme(String readmeContent, Timestamp readmeTime,
			Integer personalId, String memberName) {
		this.readmeContent = readmeContent;
		this.readmeTime = readmeTime;
		this.personalId = personalId;
		this.memberName = memberName;
	}

	/** full constructor */
	public TbReadme(Integer fatherId, Integer mentorId, Integer replyState,
			Integer flagType, String readmeContent, Timestamp readmeTime,
			Integer personalId, String memberName, Integer feedbackState,
			String mentorName) {
		this.fatherId = fatherId;
		this.mentorId = mentorId;
		this.replyState = replyState;
		this.flagType = flagType;
		this.readmeContent = readmeContent;
		this.readmeTime = readmeTime;
		this.personalId = personalId;
		this.memberName = memberName;
		this.feedbackState = feedbackState;
		this.mentorName = mentorName;
	}

	// Property accessors

	public Integer getReadmeId() {
		return this.readmeId;
	}

	public void setReadmeId(Integer readmeId) {
		this.readmeId = readmeId;
	}

	public Integer getFatherId() {
		return this.fatherId;
	}

	public void setFatherId(Integer fatherId) {
		this.fatherId = fatherId;
	}

	public Integer getMentorId() {
		return this.mentorId;
	}

	public void setMentorId(Integer mentorId) {
		this.mentorId = mentorId;
	}

	public Integer getReplyState() {
		return this.replyState;
	}

	public void setReplyState(Integer replyState) {
		this.replyState = replyState;
	}

	public Integer getFlagType() {
		return this.flagType;
	}

	public void setFlagType(Integer flagType) {
		this.flagType = flagType;
	}

	public String getReadmeContent() {
		return this.readmeContent;
	}

	public void setReadmeContent(String readmeContent) {
		this.readmeContent = readmeContent;
	}

	public Timestamp getReadmeTime() {
		return this.readmeTime;
	}

	public void setReadmeTime(Timestamp readmeTime) {
		this.readmeTime = readmeTime;
	}

	public Integer getPersonalId() {
		return this.personalId;
	}

	public void setPersonalId(Integer personalId) {
		this.personalId = personalId;
	}

	public String getMemberName() {
		return this.memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public Integer getFeedbackState() {
		return this.feedbackState;
	}

	public void setFeedbackState(Integer feedbackState) {
		this.feedbackState = feedbackState;
	}

	public String getMentorName() {
		return this.mentorName;
	}

	public void setMentorName(String mentorName) {
		this.mentorName = mentorName;
	}

}