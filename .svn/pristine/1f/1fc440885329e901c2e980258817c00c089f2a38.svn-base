package com.gxuwz.KeepHealth.business.service;

import com.gxuwz.KeepHealth.business.entity.TbFormula;
import com.gxuwz.core.pagination.Result;

import java.util.List;

/**
 * 念数机配方Service接口类
 * @author yechengting
 *@version 2019.2.16
 */
public interface TbFormulaService {

	Result<TbFormula> queryFormulaList(String string, int page, int row);

	TbFormula queryFormulaById(Integer formulaId);

	String updateFormula(TbFormula tbFormula);

	String deleteFormula(Integer formulaId);

	String changeState(Integer formulaId);

	String addFormula(TbFormula tbFormula);


	/**
	 * @Author zuofengwei
	 * @Description 根据配方类型查询配方集合
	 * @Date 2019/4/14 16:59
	 * @param formulaType
	 * @return java.util.List<com.gxuwz.KeepHealth.business.entity.TbFormula>
	 **/
    List<TbFormula> queryTbFormulaListByformulaType(String formulaType);


    /**
     * @Author zuofengwei
     * @Description 通过配方的症状和详情获取配方内容
     * @Date 2019/4/14 17:03
     * @param formulaSymptom
     * @param formulaSymptomDetails
     * @return java.lang.String
     **/
	String queryFormulaContext(String formulaSymptom, String formulaSymptomDetails);
}
