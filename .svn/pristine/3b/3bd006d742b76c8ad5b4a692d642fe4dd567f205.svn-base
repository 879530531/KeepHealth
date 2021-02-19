package com.gxuwz.KeepHealth.business.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.gxuwz.KeepHealth.business.entity.TbPersonalData;
import com.gxuwz.KeepHealth.business.entity.TbReadDevice;
import com.gxuwz.core.dao.impl.BaseDaoImpl;
import com.gxuwz.core.pagination.Result;
/**
 * 与自助听读器管理相关的数据交互Dao层
 * @author yechengting
 * @version 2019.1.21
 */
@Repository
public class TbReadDeviceDao extends BaseDaoImpl<TbReadDevice>{

	/**
	 * 根据听读数字串查询数据库中是否有相同数字串且mediaId仍在有效期
	 * @param str 数字串
	 * @return mediaId/null
	 * @author 叶城廷
	 * @version 2019.1.31
	 */
	public String queryReadDeviceBystr(String str) {
		
		return null;
	}

	/**
	 * 新增一条已上传至微信平台的临时素材-听读器语音
	 * @author 叶城廷
	 * @version 2019.1.31
	 */
	public void addReadDeviceVoice() {
			
		
	}
	/**
	 * 根据条件查找分页
	 * @param TbReadDevice 模型
	 * @param page 第几页
	 * @param row 长度
	 * @return
	 * @author 陈紫丽
	 * @date 2019.01.24
	 */
	@SuppressWarnings("unchecked")
	public Result<TbReadDevice> find(TbReadDevice tbReadDevice, int page, int size){
		
		
		
		//先全部列出
		String queryString = "from TbReadDevice where 1=1";
		
		//		String queryString = "from TbPersonalData p left join TbFinance f on p.personalId=f.mentorId where 1=1 and p.flag_type= '"+tbPersonalData.getFlagType()+"'";

		//如果对象中有值，则进行模糊查询
		if(null != tbReadDevice.getReadId()){
			queryString = queryString + " and read_id like '%"+tbReadDevice.getReadId()+"%'";
		}
		if(null != tbReadDevice.getReadNumber()){
			queryString = queryString + " and read_number like '%"+tbReadDevice.getReadNumber()+"%'";
		}
		if(null != tbReadDevice.getReadFilePath()){
			queryString = queryString + " and read_file_path like '%"+tbReadDevice.getReadFilePath()+"%'";
		}
//		if(null != TbFinance.getBalance()){
//			queryString = queryString + " and balance like '%"+TbFinance.getBalance()+"%'";
//		
		
		int start=(page-1)*size;
		int limit =size;
		return (Result<TbReadDevice> )super.find(queryString, null, null, start, limit);
		
	}
	/**
	 * 验证听读器数字是否重复
	 * @param readNumber
	 * @author 陈紫丽
	 * @data 2019.01.31
	 * @return
	 */
	
	@SuppressWarnings("unchecked")
	public List<TbReadDevice> checkReadNumber(String readNumber){
		String hql = "from tbReadDevice where readNumber = '"+readNumber+"'";
		return this.getHibernateTemplate().find(hql);
	}
	
}


