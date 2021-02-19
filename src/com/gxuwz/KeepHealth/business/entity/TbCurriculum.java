package com.gxuwz.KeepHealth.business.entity;
// default package

/**
 * TbCurriculum entity. @author MyEclipse Persistence Tools
 */
/**
 * 微课管理实体类
 * @author 邓开明
 *
 * 2021年1月14日
 */
public class TbCurriculum implements java.io.Serializable {

	// Fields

	private Integer curriculumId;
	private String picture;
	private String courseName;
	private String audio;
	private Integer issueId;
	private String courseIntroduction;
	private Integer duration;
	private String fileSize;

	// Constructors

	/** default constructor */
	public TbCurriculum() {
	}

	/** full constructor */
	public TbCurriculum(String picture, String courseName, String audio, Integer issueId, String courseIntroduction,
			Integer duration, String fileSize) {
		this.picture = picture;
		this.courseName = courseName;
		this.audio = audio;
		this.issueId = issueId;
		this.courseIntroduction = courseIntroduction;
		this.duration = duration;
		this.fileSize = fileSize;
	}

	// Property accessors

	public Integer getCurriculumId() {
		return this.curriculumId;
	}

	public void setCurriculumId(Integer curriculumId) {
		this.curriculumId = curriculumId;
	}

	public String getPicture() {
		return this.picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public String getCourseName() {
		return this.courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public String getAudio() {
		return this.audio;
	}

	public void setAudio(String audio) {
		this.audio = audio;
	}

	public Integer getIssueId() {
		return this.issueId;
	}

	public void setIssueId(Integer issueId) {
		this.issueId = issueId;
	}

	public String getCourseIntroduction() {
		return this.courseIntroduction;
	}

	public void setCourseIntroduction(String courseIntroduction) {
		this.courseIntroduction = courseIntroduction;
	}

	public Integer getDuration() {
		return this.duration;
	}

	public void setDuration(Integer duration) {
		this.duration = duration;
	}

	public String getFileSize() {
		return this.fileSize;
	}

	public void setFileSize(String fileSize) {
		this.fileSize = fileSize;
	}

	@Override
	public String toString() {
		return "TbCurriculum [curriculumId=" + curriculumId + ", picture=" + picture + ", courseName=" + courseName
				+ ", audio=" + audio + ", issueId=" + issueId + ", courseIntroduction=" + courseIntroduction
				+ ", duration=" + duration + ", fileSize=" + fileSize + "]";
	}

}