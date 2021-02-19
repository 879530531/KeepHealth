package com.gxuwz.KeepHealth.business.entity;

/**
 * 配方实体类（又名症状表）
 * @author 叶城廷
 * @version 2019.03.01
 */
public class TbFormula implements java.io.Serializable {

	// Fields

	private Integer formulaId;//配方编号
	private String formulaContext;//配方内容（数字串）
	private Integer formulaState;//配方状态0:未上线 1：已上线
	private String formulaType;//配方类型
	private String formulaSymptom;//症状
	private String formulaSymptomDetails;//详细症状

	// Constructors

	/** default constructor */
	public TbFormula() {
	}

	/** minimal constructor */
	public TbFormula(Integer formulaState) {
		this.formulaState = formulaState;
	}

	/** full constructor */
	public TbFormula(String formulaContext, Integer formulaState, String formulaType, String formulaSymptom,
			String formulaSymptomDetails) {
		this.formulaContext = formulaContext;
		this.formulaState = formulaState;
		this.formulaType = formulaType;
		this.formulaSymptom = formulaSymptom;
		this.formulaSymptomDetails = formulaSymptomDetails;
	}

	// Property accessors

	public Integer getFormulaId() {
		return this.formulaId;
	}

	public void setFormulaId(Integer formulaId) {
		this.formulaId = formulaId;
	}

	public String getFormulaContext() {
		return this.formulaContext;
	}

	public void setFormulaContext(String formulaContext) {
		this.formulaContext = formulaContext;
	}

	public Integer getFormulaState() {
		return this.formulaState;
	}

	public void setFormulaState(Integer formulaState) {
		this.formulaState = formulaState;
	}

	public String getFormulaType() {
		return this.formulaType;
	}

	public void setFormulaType(String formulaType) {
		this.formulaType = formulaType;
	}

	public String getFormulaSymptom() {
		return this.formulaSymptom;
	}

	public void setFormulaSymptom(String formulaSymptom) {
		this.formulaSymptom = formulaSymptom;
	}

	public String getFormulaSymptomDetails() {
		return this.formulaSymptomDetails;
	}

	public void setFormulaSymptomDetails(String formulaSymptomDetails) {
		this.formulaSymptomDetails = formulaSymptomDetails;
	}

}