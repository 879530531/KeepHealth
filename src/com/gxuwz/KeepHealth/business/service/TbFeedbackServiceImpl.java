package com.gxuwz.KeepHealth.business.service;


import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gxuwz.KeepHealth.business.dao.TbFeedbackDAO;
import com.gxuwz.KeepHealth.business.entity.TbAdvice;
import com.gxuwz.KeepHealth.business.entity.TbFeedback;
import com.gxuwz.core.pagination.Result;

/**
 * 
* @ClassName: TbFeedbackServiceImpl 
* @Description: 实现类   用户反馈数据操作
* @author 软件开发中心  陆云秋
* @date 2017年7月8日 上午3:19:40
 */
@Service("tbFeedbackService")
public class TbFeedbackServiceImpl implements TbFeedbackService {

	@Autowired
	TbFeedbackDAO tbFeedbackDAO;
	
	/**
	 * 添加反馈信息
	 * @param TbFeedback
	 */
	@Override
	public void addFeedback(TbFeedback tbfeedback) {
		
        Timestamp d = new Timestamp(System.currentTimeMillis());
		tbfeedback.setFeedbackTime(d);
		tbFeedbackDAO.save(tbfeedback);

	}
	
	
	public List<TbFeedback> findByMemberId(int memberId){
		
		
		return tbFeedbackDAO.findByMemberId(memberId);
		
	}



	@Override
	public Result<TbFeedback> find(TbFeedback tbfeedback, int page, int row) {
	
		return tbFeedbackDAO.find(tbfeedback, page, row);
	}

}
