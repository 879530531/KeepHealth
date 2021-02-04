package com.gxuwz.KeepHealth.business.service;

import java.util.List;

import com.gxuwz.KeepHealth.business.entity.TbAdvice;
import com.gxuwz.KeepHealth.business.entity.TbFeedback;
import com.gxuwz.core.pagination.Result;

/**
 * 
* @ClassName: TbFeedbackService 
* @Description:    用户反馈接口
* @author 软件开发中心  陆云秋
* @date 2017年7月8日 上午3:19:40
 */
public interface TbFeedbackService {
	/**
	 * 添加反馈信息
	 * @param tbFeedback
	 */
	public void addFeedback(TbFeedback tbfeedback);

	
	/**
	 * 查询反馈信息
	 * @param tbFeedback
	 */
	public Result<TbFeedback> find(TbFeedback tbfeedback, int page, int row);
	
	
	public List<TbFeedback> findByMemberId(int memberId);

}
