package com.gxuwz.KeepHealth.business.entity;

import java.sql.Timestamp;

/**
 * 
 * Title:TbPersonalData
 * Description: personalDate 实体层
 * @author 梧州学院软件开发中心 杨世宇
 * @date 2017年7月7日
 */

public class TbPersonalData implements java.io.Serializable {

	// Fields

	private Integer personalId; //数据库中的序号
	private String personalNumber; //个人编号 格式=时间+类型(flagType)+序号  比如 20170414165709 0 10001 代表会员
	private String qq; //QQ号
	private Integer flagType; //类型 0-会员 1-导师
	private String name; //昵称
	private String realName; //真实姓名
	private String password; //密码
	private Integer sex; //性别 0-女 1-男
	private String placeDomicile; //籍贯
	private String mobilePhone; //手机号
	private String image; //头像保存路径
	private String email; //邮箱
	private Timestamp birthday; //生日 精确到秒
	private String idCard; //身份证号
	private Integer maritalStatus; //是否已婚 0-未婚  1-已婚
	private String professional; //职业
	private String address; //地址
	private String direction; //指导方向(导师)
	private String introduction; //导师简介 
	private Integer level; //等级  0-导师/VIP会员  1-普通导师/高级会员  2-高级导师  3-未缴费会员   默认值为3
	private Timestamp startTime; //会员开始时间
	private Timestamp endTime; //会员结束时间

	// Constructors

	/** default constructor */
	public TbPersonalData() {
	}

	/** minimal constructor */
	public TbPersonalData(String personalNumber, Integer flagType, String name,
			String password, Integer sex, String mobilePhone) {
		this.personalNumber = personalNumber;
		this.flagType = flagType;
		this.name = name;
		this.password = password;
		this.sex = sex;
		this.mobilePhone = mobilePhone;
	}

	/** full constructor */
	public TbPersonalData(String personalNumber, String qq, Integer flagType,
			String name, String realName, String password, Integer sex,
			String placeDomicile, String mobilePhone, String image,
			String email, Timestamp birthday, String idCard,
			Integer maritalStatus, String professional, String address,
			String direction, String introduction, Integer level,
			Timestamp startTime, Timestamp endTime) {
		this.personalNumber = personalNumber;
		this.qq = qq;
		this.flagType = flagType;
		this.name = name;
		this.realName = realName;
		this.password = password;
		this.sex = sex;
		this.placeDomicile = placeDomicile;
		this.mobilePhone = mobilePhone;
		this.image = image;
		this.email = email;
		this.birthday = birthday;
		this.idCard = idCard;
		this.maritalStatus = maritalStatus;
		this.professional = professional;
		this.address = address;
		this.direction = direction;
		this.introduction = introduction;
		this.level = level;
		this.startTime = startTime;
		this.endTime = endTime;
	}

	// Property accessors

	public Integer getPersonalId() {
		return this.personalId;
	}

	public void setPersonalId(Integer personalId) {
		this.personalId = personalId;
	}

	public String getPersonalNumber() {
		return this.personalNumber;
	}

	public void setPersonalNumber(String personalNumber) {
		this.personalNumber = personalNumber;
	}

	public String getQq() {
		return this.qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public Integer getFlagType() {
		return this.flagType;
	}

	public void setFlagType(Integer flagType) {
		this.flagType = flagType;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRealName() {
		return this.realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getSex() {
		return this.sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}

	public String getPlaceDomicile() {
		return this.placeDomicile;
	}

	public void setPlaceDomicile(String placeDomicile) {
		this.placeDomicile = placeDomicile;
	}

	public String getMobilePhone() {
		return this.mobilePhone;
	}

	public void setMobilePhone(String mobilePhone) {
		this.mobilePhone = mobilePhone;
	}

	public String getImage() {
		return this.image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Timestamp getBirthday() {
		return this.birthday;
	}

	public void setBirthday(Timestamp birthday) {
		this.birthday = birthday;
	}

	public String getIdCard() {
		return this.idCard;
	}

	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}

	public Integer getMaritalStatus() {
		return this.maritalStatus;
	}

	public void setMaritalStatus(Integer maritalStatus) {
		this.maritalStatus = maritalStatus;
	}

	public String getProfessional() {
		return this.professional;
	}

	public void setProfessional(String professional) {
		this.professional = professional;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDirection() {
		return this.direction;
	}

	public void setDirection(String direction) {
		this.direction = direction;
	}

	public String getIntroduction() {
		return this.introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public Integer getLevel() {
		return this.level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	public Timestamp getStartTime() {
		return this.startTime;
	}

	public void setStartTime(Timestamp startTime) {
		this.startTime = startTime;
	}

	public Timestamp getEndTime() {
		return this.endTime;
	}

	public void setEndTime(Timestamp endTime) {
		this.endTime = endTime;
	}

}