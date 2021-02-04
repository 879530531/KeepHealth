package com.gxuwz.KeepHealth.business.entity;

/**
 * SysUser entity. @author MyEclipse Persistence Tools
 */

public class SysUser implements java.io.Serializable {

	// Fields

	private Integer id;
	private String userId;
	private String userTelephone;
	private String userEmail;
	private String userPassword;
	private String userName;
	private String userRealName;
	private Integer userSex;
	private Integer userAge;
	private Integer userType;
	private String userAddress;
	private String unitName;
	private String userQq;

	// Constructors

	/** default constructor */
	public SysUser() {
	}

	/** minimal constructor */
	public SysUser(String userId, String userTelephone, String userPassword,
			String userName, String userRealName) {
		this.userId = userId;
		this.userTelephone = userTelephone;
		this.userPassword = userPassword;
		this.userName = userName;
		this.userRealName = userRealName;
	}

	/** full constructor */
	public SysUser(String userId, String userTelephone, String userEmail,
			String userPassword, String userName, String userRealName,
			Integer userSex, Integer userAge, Integer userType,
			String userAddress, String unitName, String userQq) {
		this.userId = userId;
		this.userTelephone = userTelephone;
		this.userEmail = userEmail;
		this.userPassword = userPassword;
		this.userName = userName;
		this.userRealName = userRealName;
		this.userSex = userSex;
		this.userAge = userAge;
		this.userType = userType;
		this.userAddress = userAddress;
		this.unitName = unitName;
		this.userQq = userQq;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUserId() {
		return this.userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserTelephone() {
		return this.userTelephone;
	}

	public void setUserTelephone(String userTelephone) {
		this.userTelephone = userTelephone;
	}

	public String getUserEmail() {
		return this.userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserPassword() {
		return this.userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserRealName() {
		return this.userRealName;
	}

	public void setUserRealName(String userRealName) {
		this.userRealName = userRealName;
	}

	public Integer getUserSex() {
		return this.userSex;
	}

	public void setUserSex(Integer userSex) {
		this.userSex = userSex;
	}

	public Integer getUserAge() {
		return this.userAge;
	}

	public void setUserAge(Integer userAge) {
		this.userAge = userAge;
	}

	public Integer getUserType() {
		return this.userType;
	}

	public void setUserType(Integer userType) {
		this.userType = userType;
	}

	public String getUserAddress() {
		return this.userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public String getUnitName() {
		return this.unitName;
	}

	public void setUnitName(String unitName) {
		this.unitName = unitName;
	}

	public String getUserQq() {
		return this.userQq;
	}

	public void setUserQq(String userQq) {
		this.userQq = userQq;
	}

}