package com.gxuwz.KeepHealth.business.service;

import java.util.List;



import com.gxuwz.KeepHealth.business.entity.MyAppointment;
import com.gxuwz.KeepHealth.business.entity.TbAdvice;
import com.gxuwz.KeepHealth.business.entity.TbFeedback;
import com.gxuwz.KeepHealth.business.entity.TbReadme;

/**
 * 
* @ClassName: TbReadmeService 
* @Description: 健康自述信息Service接口
* @author 软件开发中心  陈洁 
* @date 2017年7月7日 上午9:52:55
 */
public interface TbReadmeService {
	
	/**
	 * 根据readmeId返回信息
	 * @author 杨世宇
	 * @data 2017.07.07
	 * @return
	 */
	public TbReadme returnByReadmeId(int readmeId);
	

	/**
	 * 添加健康自述信息
	 * @author   陈洁
	 * @param TbReadme 实体类
	 */
	public void addReadme(TbReadme tbReadme);
	
	/**
	 * 根据导师ID查询所有的健康自述记录
	 * @author   陈洁
	 * @param mentorId 导师ID
	 * @return list
	 */
	public List<MyAppointment> findByMentorId(int mentorId);
	
	/**
	 * 查询所有未指定导师的自述记录
	 * @author   莫然源
	 * @return list
	 */
	public List<MyAppointment> findBypersonalid();
	
	/**
	 * 根据会员ID查询所有的健康自述记录
	 * @author   陈洁
	 * @param personalId 会员ID
	 * @return list
	 */
	public List<TbReadme> findByPersonalId(int personalId);
	
	/**
	 * 根据健康自述ID更新健康自述信息
	 * @author   陈洁
	 * @param readmeId 健康自述ID
	 */
	public void updateReadme(int readmeId);
	
	/**
	 * 根据健康自述ID更新健康自述信息
	 * @author   陈洁
	 */
	public void updatementorId(int montorId,int readmeId,String name);
	
	/**
	 * 根据健康自述ID查询健康自述信息
	 * @author   陈洁
	 * @param readmeId 健康自述ID
	 * @return list
	 */
	public List<TbReadme> findByReadmeId(int readmeId);
	
	/**
	 * 根据会员ID查询已咨询记录总条数
	 * @author   陈洁
	 * @param a 会员ID
	 * @return int
	 */
	public int findCS(int a);

	
	public List<TbReadme> findFKtype(int readmeId);
	/**
	 * @Title: findFatherPQ 
	 * @Description: 查询该导师所有fatherId=0的咨询记录
	 * @return List<TbReadme>    返回类型 
	 * @author: 莫然源
	 * @Date 2017年7月7日
	 * @throws
	 */
	public List<TbReadme> findFatherPQ(int personalId);
	/**
	 * @Title: findFoodbackByMentorId 
	 * @Description: 查询该导师所有的效果反馈
	 * @return List<TbFeedback>    返回类型 
	 * @author: 莫然源
	 * @Date 2017年7月7日
	 * @throws
	 */
	public List<TbFeedback> findFoodbackByMentorId(int personalId);
    /**
     * @Title: findChildPQ 
     * @Description: 查询该导师所有fatherId!=0的咨询记录
     * @return List<TbReadme>    返回类型 
     * @author: 莫然源
     * @Date 2017年7月7日
     * @throws
     */
	public List<TbReadme> findChildPQ(int personalId);
	/**
	 * 
	 * @Title: findChildPQByReadmeId 
	 * @Description: 根据readmeId查询所有fatherId!=0的咨询记录
	 * @return List<TbReadme>    返回类型 
	 * @author: 莫然源
	 * @Date 2017年7月7日
	 * @throws
	 */
	public List<TbReadme> findChildPQByReadmeId(int readmeId);
	/**
	 * 
	 * @Title: findAdviceByMentorId 
	 * @Description: 查询该导师所有的调理建议
	 * @return List<TbAdvice>    返回类型 
	 * @author: 莫然源
	 * @Date 2017年7月7日
	 * @throws
	 */
	public List<TbAdvice> findAdviceByMentorId(int personalId);
	/**
	 * @Title: findFatherNoFeedbackPQ 
	 * @Description: 查询该用户所有fatherId=0未反馈的健康自述
	 * @return List<TbReadme>    返回类型 
	 * @author: 莫然源
	 * @Date 2017年7月7日
	 * @throws
	 */
	public List<TbReadme> findFatherNoFeedbackPQ(int personalId);
	/**
	 * 
	 * @Title: findAdviceByMemberId 
	 * @Description: 查询该用户所有的调理建议
	 * @return List<TbAdvice>    返回类型 
	 * @author: 莫然源
	 * @Date 2017年7月7日
	 * @throws
	 */
	public List<TbAdvice> findAdviceByMemberId(int personalId);
	/**
	 * 
	 * @Title: findChildNoFeedbackPQ 
	 * @Description: 查询该用户所有fatherId!=0的健康自述
	 * @return List<TbReadme>    返回类型 
	 * @author: 莫然源
	 * @Date 2017年7月7日
	 * @throws
	 */
	public List<TbReadme> findChildNoFeedbackPQ(int personalId);
	/**
	 * 
	 * @Title: findFahterReplyPQ 
	 * @Description: 查询该用户所有fatherId=0的已答复的健康自述
	 * @return List<TbReadme>    返回类型 
	 * @author: 莫然源
	 * @Date 2017年7月7日
	 * @throws
	 */
	public List<TbReadme> findFahterReplyPQ(int personalId);
	
	public void updateReadmeback(int readmeId);

	public void update(TbReadme tbReadme);
	/**
	 * 根据导师ID查询所有的健康自述记录
	 * @author   陈洁
	 * @param mentorId 导师ID
	 * @return list
	 */
	public List<TbReadme> findReadmeByMentorId();
}
