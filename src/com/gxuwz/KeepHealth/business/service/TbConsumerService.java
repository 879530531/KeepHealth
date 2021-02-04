package com.gxuwz.KeepHealth.business.service;

import java.util.List;

import com.gxuwz.KeepHealth.business.entity.SysUnit;
import com.gxuwz.KeepHealth.business.entity.TbConsumer;
import com.gxuwz.core.pagination.Result;

/**
 * 咨询用户Service接口类
 * @author 董冰雪
 *@version 2019.3.3
 */
public interface TbConsumerService {



	/*根据条件查找分页
	 * @param sysMerchantUnit 模型
	 * @param page 第几页
	 * @param row 长度
	 */
	//Result<TbConsumer> queryConsumerList(String string, int page, int row,Integer consumerId);
	public Result<TbConsumer> find(TbConsumer tbConsumer, int page, int row);
	
	
	public TbConsumer findName(String openid);
	
	public String changeState(Integer consumerId);
	public Result<TbConsumer> queryConsumerList(String query,
			int page, int row);
	public TbConsumer queryTbConsumerById(Integer consumerId);

	/**
	 * 添加用户
	 * @author 叶城廷
	 * @version	2019.03.07
	 */
	public boolean addConsumer(TbConsumer queryConsumer);

	/**
	 * 根据openId查询用户
	 * @author 叶城廷
	 * @version	2019.03.09
	 * @param openId
	 */
	public  TbConsumer queryConsumerByOpenid(String openId);
	/**
	 * 查询用户信息
	 * 董冰雪
	 * 2019.3.30
	 * @param
	 * @return
	 */
	public List<TbConsumer> findByconsumerquery();
	
	/**
	 * 查询用户信息
	 * 齐美琳
	 * 2019.3.30
	 */
	public List<TbConsumer> findByconsumer();
	
}
