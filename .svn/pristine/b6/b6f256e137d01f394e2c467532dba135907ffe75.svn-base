package com.gxuwz.KeepHealth.business.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.gxuwz.KeepHealth.business.entity.TbAudio;
import com.gxuwz.KeepHealth.business.entity.TbFormula;
import com.gxuwz.KeepHealth.business.entity.TbSoundSource;
import com.gxuwz.KeepHealth.business.entity.TbTeacher;
import com.gxuwz.core.dao.impl.BaseDaoImpl;
import com.gxuwz.core.pagination.Result;
/**
 * 与念数机音频相关的数据交互Dao层
 * @author 齐美琳
 *@version 2019.3.21
 */
@Repository("TbAudioDao")
public class TbAudioDao extends BaseDaoImpl<TbAudio>{
	@SuppressWarnings("unchecked")
	public Result<TbAudio> queryAudioList(String string, int page, int size) {
		String queryString= "from TbAudio where audioId like '%"+string+"%' or audioNumber like '%"+string+"%' or audioSoundSource like '%"+string+"%'";	
		int start=(page-1)*size;
		int limit =size;
		return (Result<TbAudio>)super.find(queryString, null, null, start, limit);
	}
	
	@SuppressWarnings("unchecked")
	public Result<TbAudio> queryList(String string, int page, int size) {
		String queryString= "from TbAudio where audioSoundSource = '"+string+"'";	
		int start=(page-1)*size;
		int limit =size;
		return (Result<TbAudio>)super.find(queryString, null, null, start, limit);
	}
	
	public List<TbAudio> getBySoundName(String soundName){
		String queryString = "from TbAudio where audioSoundSource= '"+soundName+"'";
		return (List<TbAudio>)super.findByHql(queryString, null);
	}
	
	public TbSoundSource getSoundBySoundName(String soundName){
		String hql = "from TbSoundSource where soundName= '"+soundName+"'";
		return (TbSoundSource) getHibernateTemplate().find(hql).get(0);
	}

	
}
