package com.gxuwz.KeepHealth.business.dao;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Repository;

import com.gxuwz.KeepHealth.business.entity.TbSoundSource;
import com.gxuwz.core.dao.impl.BaseDaoImpl;
import com.gxuwz.core.pagination.Result;
/**
 * 与念数机音源相关的数据交互Dao层
 * @author yechengting
 *@version 2019.2.16
 */
@Repository
public class TbSoundSourceDao extends BaseDaoImpl<TbSoundSource>{
	
	/**
	 * 根据条件查找分页
	 * @param page 第几页
	 * @return
	 * @author 丁程强
	 * @date 2019.02.21
	 */
	@SuppressWarnings("unchecked")
	public Result<TbSoundSource> find(String queryText, int page, int size){
		String queryString="from TbSoundSource where soundId like '%"+queryText+"%' or soundName like '%"+queryText+"%'";
		int start=(page-1)*size;
		int limit =size;
		return (Result<TbSoundSource>)super.find(queryString, null, null, start, limit);
	}
	
	/**
	 * 验证音源名字是否重复
	 * @param soundName
	 * @author 丁程强
	 * @data 2019.03.03
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<TbSoundSource> checkSoundName(String soundName){
		String hql = "from TbSoundSource where soundName = '"+soundName+"'";
		return this.getHibernateTemplate().find(hql);
	}

	/**
	 * 获得当前所有音源信息列表
	 * @author 叶城廷
	 * @version 2019.4.4
	 * @return
	 */
    public List<TbSoundSource> queryUpSoundSourceList() {
		return  getAll(TbSoundSource.class);
    }
}
