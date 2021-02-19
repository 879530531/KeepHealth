package com.gxuwz.KeepHealth.business.service;

import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gxuwz.KeepHealth.business.dao.TbReadmeDAO;
import com.gxuwz.KeepHealth.business.entity.MyAppointment;
import com.gxuwz.KeepHealth.business.entity.TbAdvice;
import com.gxuwz.KeepHealth.business.entity.TbFeedback;
import com.gxuwz.KeepHealth.business.entity.TbReadme;

/**
 * 
* @ClassName: TbReadmeServiceImpl 
* @Description: 健康自述信息Service实现类
* @author 软件开发中心  陈洁 
* @date 2017年7月7日 上午9:50:42
 */
@Service("tbReadmeService")
public class TbReadmeServiceImpl implements TbReadmeService {
	@Autowired
	private TbReadmeDAO tbReadmeDAO;
	
	/**
	 * 根据readmeId返回信息
	 * @author 杨世宇
	 * @data 2017.07.07
	 * @return
	 */
	@Override
	public TbReadme returnByReadmeId(int readmeId) {
		System.out.println("返回了tbreadme对象");
		return tbReadmeDAO.get(TbReadme.class,readmeId);
	}
	
	
	
	/**
	 * 添加健康自述
	 * @author   陈洁
	 * @param TbReadme
	 */
	
	@Override
	public void addReadme(TbReadme tbReadme) {
		tbReadmeDAO.save(tbReadme);
	}
	/**
	 * 更新健康自述
	 * @author   陈洁
	 * @param readmeId
	 */
	@Override
	public void updateReadme(int readmeId) {
		
		tbReadmeDAO.updateReadme(readmeId);
		
	}
	
	/**
	 * 更新健康自述反馈状态
	 * @author   陈洁
	 * @param readmeId
	 */
	@Override
	public void updateReadmeback(int readmeId) {
		
		tbReadmeDAO.updateReadmeback(readmeId);
		
	}
	/**
	 * 根据导师编号进行查询
	 * @author   陈洁
	 * @param mentorId
	 * @return list
	 */
	public List<MyAppointment> findByMentorId(int mentorId){
		
		
		return tbReadmeDAO.findByMentorId(mentorId);
		
	}
	/**
	 * 根据会员编号进行查询
	 * @author   陈洁
	 * @param personalId
	 * @return list
	 */
	public List<TbReadme> findByPersonalId(int personalId){
		
		
		return tbReadmeDAO.findByPersonalId(personalId);
		
	}
	/**
	 * 根据健康自述编号进行查询
	 * @author   陈洁
	 * @param readmeId
	 * @return list
	 */
	public List<TbReadme> findByReadmeId(int readmeId){
		
		
		return tbReadmeDAO.findByReadmeId(readmeId);
		
	}
	/**
	 * 根据会员编号查询所有已咨询记录条数
	 * @author   陈洁
	 * @param a 会员ID
	 */
	public int findCS(int a) {
		return tbReadmeDAO.findCS(a);
	}


	/**
	 * 查询所有未指定导师的自述记录
	 * @author   莫然源
	 * @return list
	 */
	public List<MyAppointment> findBypersonalid(){
		return tbReadmeDAO.findBypersonalId();
	}
	/**
	 * 记录导师id
	 * @param sysUserRole
	 */
	
	public void updatementorId(int mentorId,int readmeId,String name){
		tbReadmeDAO.updatemontorId(mentorId,readmeId,name);
	}
	
	
	/**
	 * @Title: findFatherPQ 
	 * @Description: 查询该导师所有fatherId=0的咨询记录
	 * @return List<TbReadme>    返回类型 
	 * @author: 莫然源
	 * @Date 2017年7月7日
	 * @throws
	 */
	public List<TbReadme> findFatherPQ(int personalId){
		return tbReadmeDAO.findFatherPQ(personalId);
	}
	/**
     * @Title: findChildPQ 
     * @Description: 查询该导师所有fatherId!=0的咨询记录
     * @return List<TbReadme>    返回类型 
     * @author: 莫然源
     * @Date 2017年7月7日
     * @throws
     */
	public List<TbReadme> findChildPQ(int personalId){
		return tbReadmeDAO.findChildPQ(personalId);
	}
	/**
     * @Title: findChildPQByReadmeId 
     * @Description: 根据readmeId查询所有fatherId!=0的咨询记录
     * @return List<TbReadme>    返回类型 
     * @author: 莫然源
     * @Date 2017年7月7日
     * @throws
     */
	public List<TbReadme> findChildPQByReadmeId(int readmeId){
		return tbReadmeDAO.findChildPQByReadmeId(readmeId);
	}
	/**
	 * @Title: findFoodbackByMentorId 
	 * @Description: 查询该导师所有的效果反馈
	 * @return List<TbFeedback>    返回类型 
	 * @author: 莫然源
	 * @Date 2017年7月7日
	 * @throws
	 */
	public List<TbFeedback> findFoodbackByMentorId(int personalId){
		return tbReadmeDAO.findFoodbackByMentorId(personalId);
	}
	/**
	 * 
	 * @Title: findAdviceByMentorId 
	 * @Description: 查询该导师所有的调理建议
	 * @return List<TbAdvice>    返回类型 
	 * @author: 莫然源
	 * @Date 2017年7月7日
	 * @throws
	 */
	public List<TbAdvice> findAdviceByMentorId(int personalId){
		return tbReadmeDAO.findAdviceByMentorId(personalId);
	}
	/**
	 * @Title: findFatherNoFeedbackPQ 
	 * @Description: 查询该用户所有fatherId=0未反馈的健康自述
	 * @return List<TbReadme>    返回类型 
	 * @author: 莫然源
	 * @Date 2017年7月7日
	 * @throws
	 */
	public List<TbReadme> findFatherNoFeedbackPQ(int personalId){
		return tbReadmeDAO.findFatherNoFeedbackPQ(personalId);
	}
	/**
	 * 
	 * @Title: findAdviceByMemberId 
	 * @Description: 查询该用户所有的调理建议
	 * @return List<TbAdvice>    返回类型 
	 * @author: 莫然源
	 * @Date 2017年7月7日
	 * @throws
	 */
	public List<TbAdvice> findAdviceByMemberId(int personalId){
		return tbReadmeDAO.findAdviceByMemberId(personalId);
	}
	/**
	 * 
	 * @Title: findChildNoFeedbackPQ 
	 * @Description: 查询该用户所有fatherId!=0的健康自述
	 * @return List<TbReadme>    返回类型 
	 * @author: 莫然源
	 * @Date 2017年7月7日
	 * @throws
	 */
	public List<TbReadme> findChildNoFeedbackPQ(int personalId){
		return tbReadmeDAO.findChildNoFeedbackPQ(personalId);
	}
	/**
	 * 
	 * @Title: findFahterReplyPQ 
	 * @Description: 查询该用户所有fatherId=0的已答复的健康自述
	 * @return List<TbReadme>    返回类型 
	 * @author: 莫然源
	 * @Date 2017年7月7日
	 * @throws
	 */
	public List<TbReadme> findFahterReplyPQ(int personalId){
		return tbReadmeDAO.findFahterReplyPQ(personalId);
	}
	/**
	 * 查询回复状态
	 * @param sysUserRole
	 */
	public List<TbReadme> findFKtype(int readmeId){
		return tbReadmeDAO.findFKtype(readmeId);
	}
    public void update(TbReadme tbReadme){
    	tbReadmeDAO.save(tbReadme);
    }
	/**
	 * 根据导师ID查询所有的健康自述记录
	 * @author   陈洁
	 * @param mentorId 导师ID
	 * @return list
	 */
	public List<TbReadme> findReadmeByMentorId(){
		
		return tbReadmeDAO.findAllReamde();
	}
}
