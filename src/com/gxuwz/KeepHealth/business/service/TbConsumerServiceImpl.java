package com.gxuwz.KeepHealth.business.service;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.gxuwz.KeepHealth.wx.util.WeixinUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gxuwz.KeepHealth.business.dao.TbConsumerDao;
import com.gxuwz.KeepHealth.business.entity.TbConsumer;
import com.gxuwz.core.pagination.Result;

/**
 * 订单管理Service实现类
 * @author yechengting
 *@version 2019.1.21
 */
@Service("tbConsumerService")
public class TbConsumerServiceImpl implements TbConsumerService {

	@Autowired
	private TbConsumerDao tbConsumerDao;

	@Override
	public Result<TbConsumer> find(TbConsumer tbConsumer, int page, int row) {
		
		return tbConsumerDao.find(tbConsumer, page, row);
	}
	@Override
	public TbConsumer queryTbConsumerById(Integer consumerId) {
		return tbConsumerDao.queryTbConsumerById(consumerId);
	}

	@Override
	public Result<TbConsumer> queryConsumerList(String query,
			int page, int row) {
		return tbConsumerDao.getList(query,
				page, row);
		
	}
	@Override
	public String changeState(Integer consumerId) {
		// TODO Auto-generated method stub
		return null;
	}
	/**
	 * 添加用户
	 * @author 叶城廷
	 * @version	2019.03.07
	 */
	@Override
	public boolean addConsumer(TbConsumer queryConsumer) {
	    boolean flag=false;
	    TbConsumer tbConsumer=queryConsumer;
	    try {
	        tbConsumerDao.save(tbConsumer);
	        flag=true;
        }catch (Exception e){
	        e.printStackTrace();
            tbConsumerDao.save(tbConsumer);
        }
	    tbConsumerDao.save(queryConsumer);
		return  flag;
	}
	/**
	 * 根据openId查询用户
	 * @author 叶城廷
	 * @version	2019.03.09
	 * @param openId
	 */
	@Override
	public TbConsumer queryConsumerByOpenid(String openId) {
	    boolean flag=false;
		TbConsumer consumber=null;
        List<TbConsumer> byHql = tbConsumerDao.queryConsumerByOpenid(openId);
		try {
			if(byHql.size()==0){
				//执行用户信息存储
                consumber = WeixinUtil.queryConsumer(openId);
                flag= addConsumer(consumber);
                if (flag){
                }else {
                    consumber = WeixinUtil.queryConsumer(openId);
                    addConsumer(consumber);
                }
            }else{
               consumber=byHql.get(0);
            }
		}catch (Exception e){
			e.printStackTrace();
		}

		return consumber;
	}





	/**
	 * 查询用户信息
	 * @author 董冰雪
	 * @version	2019.03.23
	 */
	public List<TbConsumer> findByconsumerquery() {
		return tbConsumerDao.findByconsumerquery();
	}
	
	/**
	 * 查询用户信息
	 * 齐美琳
	 * 2019.3.30
	 */
	public List<TbConsumer> findByconsumer() {
		return tbConsumerDao.findByconsumer();
	}
	
	
	
	

	@SuppressWarnings("null")
	@Override
	public TbConsumer findName(String openid) {
		TbConsumer consumber=null;
		consumber = tbConsumerDao.findByHql("from TbConsumer where openId ='" + openid + "'");
		if(consumber == null) {
			TbConsumer consumber2 = new TbConsumer();
			consumber2.setOpenId(openid);
			consumber2.setConsumerName("wxkh");
			consumber2.setConsumerSex(0);
			tbConsumerDao.save(consumber2);
			
			return consumber2;
		}else {
			return consumber;
		}
		
		
	}


}

