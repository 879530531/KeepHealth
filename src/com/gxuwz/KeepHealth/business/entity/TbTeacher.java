package com.gxuwz.KeepHealth.business.entity;

/**
 * TbTeacher entity. @author MyEclipse Persistence Tools
 */

public class TbTeacher implements java.io.Serializable {

	// Fields

	private Integer teacherId;//老师编号
	private String teacherQq;//老师QQ
	private Integer teacherSex;//老师性别
	private String teacherName;//老师名称
	private String professional;//老师职业
	private Integer maritalStatus;//婚姻状况
	private String image;//头像
	private String teacherEmail;//邮箱
	private String openId;//微信唯一码
	private String teacherPhone;//老师电话（作为老师登录的用户名）
	private Integer teacherLevel;//老师等级1-5级（默认5级最低）
	private String guidanceDirection;//指导方向
	private String teacherIntroduction;//导师简介
	private String address;//现居住地
	private String placeDomicile;//户籍所在地
	private String teacherPasswork;//密码（作为老师登录的密码）
	private Integer isDelete;//状态（0未删除，1已删除）

	private Integer topId; //用于排序，置顶，数值大的排在前面，小的排在后面。
	// Constructors

	/** default constructor */
	public TbTeacher() {
	}

	/** minimal constructor */
	public TbTeacher(Integer teacherId, Integer teacherSex, String teacherName, String teacherPhone,
			Integer teacherLevel, String teacherPasswork,Integer isDelete) {
		this.teacherId = teacherId;
		this.teacherSex = teacherSex;
		this.teacherName = teacherName;
		this.teacherPhone = teacherPhone;
		this.teacherLevel = teacherLevel;
		this.teacherPasswork = teacherPasswork;
		this.isDelete = isDelete;
		
	}

	/** full constructor */
	public TbTeacher(Integer teacherId, String teacherQq, Integer teacherSex, String teacherName, String professional,
			Integer maritalStatus, String image, String teacherEmail, String openId, String teacherPhone,
			Integer teacherLevel, String guidanceDirection, String teacherIntroduction, String address,
			String placeDomicile, String teacherPasswork,Integer isDelete) {
		this.teacherId = teacherId;
		this.teacherQq = teacherQq;
		this.teacherSex = teacherSex;
		this.teacherName = teacherName;
		this.professional = professional;
		this.maritalStatus = maritalStatus;
		this.image = image;
		this.teacherEmail = teacherEmail;
		this.openId = openId;
		this.teacherPhone = teacherPhone;
		this.teacherLevel = teacherLevel;
		this.guidanceDirection = guidanceDirection;
		this.teacherIntroduction = teacherIntroduction;
		this.address = address;
		this.placeDomicile = placeDomicile;
		this.teacherPasswork = teacherPasswork;
		this.isDelete = isDelete;
		
	}

	// Property accessors

	public Integer getTeacherId() {
		return this.teacherId;
	}

	public void setTeacherId(Integer teacherId) {
		this.teacherId = teacherId;
	}

	public String getTeacherQq() {
		return this.teacherQq;
	}

	public void setTeacherQq(String teacherQq) {
		this.teacherQq = teacherQq;
	}

	public Integer getTeacherSex() {
		return this.teacherSex;
	}

	public void setTeacherSex(Integer teacherSex) {
		this.teacherSex = teacherSex;
	}

	public String getTeacherName() {
		return this.teacherName;
	}

	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}

	public String getProfessional() {
		return this.professional;
	}

	public void setProfessional(String professional) {
		this.professional = professional;
	}

	public Integer getMaritalStatus() {
		return this.maritalStatus;
	}

	public void setMaritalStatus(Integer maritalStatus) {
		this.maritalStatus = maritalStatus;
	}

	public String getImage() {
		return this.image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getTeacherEmail() {
		return this.teacherEmail;
	}

	public void setTeacherEmail(String teacherEmail) {
		this.teacherEmail = teacherEmail;
	}

	public String getOpenId() {
		return this.openId;
	}

	public void setOpenId(String openId) {
		this.openId = openId;
	}

	public String getTeacherPhone() {
		return this.teacherPhone;
	}

	public void setTeacherPhone(String teacherPhone) {
		this.teacherPhone = teacherPhone;
	}

	public Integer getTeacherLevel() {
		return this.teacherLevel;
	}

	public void setTeacherLevel(Integer teacherLevel) {
		this.teacherLevel = teacherLevel;
	}

	public String getGuidanceDirection() {
		return this.guidanceDirection;
	}

	public void setGuidanceDirection(String guidanceDirection) {
		this.guidanceDirection = guidanceDirection;
	}

	public String getTeacherIntroduction() {
		return this.teacherIntroduction;
	}

	public void setTeacherIntroduction(String teacherIntroduction) {
		this.teacherIntroduction = teacherIntroduction;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPlaceDomicile() {
		return this.placeDomicile;
	}

	public void setPlaceDomicile(String placeDomicile) {
		this.placeDomicile = placeDomicile;
	}

	public String getTeacherPasswork() {
		return this.teacherPasswork;
	}

	public void setTeacherPasswork(String teacherPasswork) {
		this.teacherPasswork = teacherPasswork;
	}

	public Integer getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(Integer isDelete) {
		this.isDelete = isDelete;
	}

	public Integer getTopId() {
		return topId;
	}

	public void setTopId(Integer topId) {
		this.topId = topId;
	}
}