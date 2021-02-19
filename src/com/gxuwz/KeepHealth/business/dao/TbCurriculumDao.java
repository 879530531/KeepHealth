package com.gxuwz.KeepHealth.business.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.gxuwz.KeepHealth.business.entity.TbAdvice;
import com.gxuwz.KeepHealth.business.entity.TbCurriculum;
import com.gxuwz.KeepHealth.business.entity.TbPersonalData;
import com.gxuwz.core.dao.impl.BaseDaoImpl;

@Repository("tbCurriculumDao")
public class TbCurriculumDao extends BaseDaoImpl<TbCurriculum>{
	
	@SuppressWarnings("unchecked")
	public TbCurriculum findById(int curriculumId){
		TbCurriculum tbCurriculum = null;
		String hql = "from TbCurriculum where curriculumId='"+curriculumId+"'";
		List<TbCurriculum> list = this.getHibernateTemplate().find(hql);
		if(null != list && 0<list.size()){
			tbCurriculum = list.get(0);
		}
		return (tbCurriculum);
		
	}
}
