package com.gxuwz.KeepHealth.business.entity;

/**
 * SysUnit entity. @author MyEclipse Persistence Tools
 */

public class SysUnit implements java.io.Serializable {

	// Fields

	private Integer unitId;//公司id
	private String unitArea;//所属行政区域
	private String unitCod;//公司编码
	private String unitName;//公司名称
	private String unitType;//公司类型
	private String unitSubjection;//公司隶属
	private String businessType;//业务类型
	private String unitsType;

	// Constructors

	/** default constructor */
	public SysUnit() {
	}

	/** minimal constructor */
	public SysUnit(String unitArea, String unitCod, String unitName,
			String unitType, String unitSubjection, String businessType) {
		this.unitArea = unitArea;
		this.unitCod = unitCod;
		this.unitName = unitName;
		this.unitType = unitType;
		this.unitSubjection = unitSubjection;
		this.businessType = businessType;
	}

	/** full constructor */
	public SysUnit(String unitArea, String unitCod, String unitName,
			String unitType, String unitSubjection, String businessType,
			String unitsType) {
		this.unitArea = unitArea;
		this.unitCod = unitCod;
		this.unitName = unitName;
		this.unitType = unitType;
		this.unitSubjection = unitSubjection;
		this.businessType = businessType;
		this.unitsType = unitsType;
	}

	// Property accessors

	public Integer getUnitId() {
		return this.unitId;
	}

	public void setUnitId(Integer unitId) {
		this.unitId = unitId;
	}

	public String getUnitArea() {
		return this.unitArea;
	}

	public void setUnitArea(String unitArea) {
		this.unitArea = unitArea;
	}

	public String getUnitCod() {
		return this.unitCod;
	}

	public void setUnitCod(String unitCod) {
		this.unitCod = unitCod;
	}

	public String getUnitName() {
		return this.unitName;
	}

	public void setUnitName(String unitName) {
		this.unitName = unitName;
	}

	public String getUnitType() {
		return this.unitType;
	}

	public void setUnitType(String unitType) {
		this.unitType = unitType;
	}

	public String getUnitSubjection() {
		return this.unitSubjection;
	}

	public void setUnitSubjection(String unitSubjection) {
		this.unitSubjection = unitSubjection;
	}

	public String getBusinessType() {
		return this.businessType;
	}

	public void setBusinessType(String businessType) {
		this.businessType = businessType;
	}

	public String getUnitsType() {
		return this.unitsType;
	}

	public void setUnitsType(String unitsType) {
		this.unitsType = unitsType;
	}

}