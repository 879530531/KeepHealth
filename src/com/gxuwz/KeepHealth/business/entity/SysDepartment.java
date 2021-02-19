package com.gxuwz.KeepHealth.business.entity;

/**
 * SysDepartment entity. @author MyEclipse Persistence Tools
 */

public class SysDepartment implements java.io.Serializable {

	// Fields

	private Integer deptId;//部门id
	private String deptCod;//部门编码
	private String deptName;//部门名称
	private String deptUnit;//所属部门
	private String flagType;//部门类型  
	// Constructors

	/** default constructor */
	public SysDepartment() {
	}

	/** full constructor */
	public SysDepartment(String deptCod, String deptName, String deptUnit) {
		this.deptCod = deptCod;
		this.deptName = deptName;
		this.deptUnit = deptUnit;
	}

	// Property accessors

	public Integer getDeptId() {
		return this.deptId;
	}

	public void setDeptId(Integer deptId) {
		this.deptId = deptId;
	}

	public String getDeptCod() {
		return this.deptCod;
	}

	public void setDeptCod(String deptCod) {
		this.deptCod = deptCod;
	}

	public String getDeptName() {
		return this.deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public String getDeptUnit() {
		return this.deptUnit;
	}

	public void setDeptUnit(String deptUnit) {
		this.deptUnit = deptUnit;
	}

	
}