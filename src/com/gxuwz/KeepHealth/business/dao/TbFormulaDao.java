package com.gxuwz.KeepHealth.business.dao;

import java.util.List;
import org.springframework.stereotype.Repository;
import com.gxuwz.KeepHealth.business.entity.TbFormula;
import com.gxuwz.core.dao.impl.BaseDaoImpl;
import com.gxuwz.core.pagination.Result;
/**
 * 与念数机配方相关的数据交互Dao层
 * @author yechengting
 *@version 2019.2.16
 */
@Repository
public class TbFormulaDao extends BaseDaoImpl<TbFormula>{

	@SuppressWarnings("unchecked")
	public Result<TbFormula> queryFormulaList(String string, int page, int size) {
		String queryString= "from TbFormula where formulaId like '%"+string+"%' or formulaContext like '%"+string+"%' or formulaType like '%"+string+"%' order by formulaType";
		int start=(page-1)*size;
		int limit =size;
		return (Result<TbFormula>)super.find(queryString, null, null, start, limit);
	}

	public TbFormula queryFormulaById(Integer formulaId) {
		TbFormula tbFormula=null;
		String hql = "from TbFormula where formulaId = '"+formulaId+"'";
		List<TbFormula> list = this.getHibernateTemplate().find(hql);
		try {
			tbFormula = list.get(0);
		}catch (Exception e) {
			tbFormula=null;
			e.printStackTrace();
		}
	   return tbFormula;
	}


	public boolean deleteFormula(Integer formulaId) {
		boolean flag=false;
		
		try {
			remove(TbFormula.class, formulaId);
			flag=true;
		} catch (Exception e) {
			flag=false;
			e.printStackTrace();
		}
		return flag;
	}

	public boolean queryFormulaByContext(TbFormula tbFormula) {
		boolean flag=false;
		String hql = "from TbFormula where formulaContext = '"+tbFormula.getFormulaContext()+"' and formulaType='"+tbFormula.getFormulaType()+"'";
		List<TbFormula> list = this.getHibernateTemplate().find(hql);
		if(list.size()==0) {
			flag=true;
		}
	   return flag;
	}


	/**
	 * @Author zuofengwei
	 * @Description  通过配方的症状和详情获取配方内容
	 * @Date 2019/4/14 17:04
	 * @param formulaSymptom
     * @param formulaSymptomDetails
	 * @return java.lang.String
	 **/
	public String queryFormulaContext(String formulaSymptom, String formulaSymptomDetails) {
		TbFormula tbFormula;
		String hql = "from TbFormula where formulaSymptom='"+formulaSymptom+"' and formulaSymptomDetails='"+formulaSymptomDetails+"'";
		List<TbFormula> list = this.getHibernateTemplate().find(hql);
		try {
			tbFormula = list.get(0);
		}catch (Exception e) {
			tbFormula=null;
			e.printStackTrace();
		}
		return tbFormula.getFormulaContext();
	}
}
