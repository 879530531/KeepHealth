package com.gxuwz.KeepHealth.business.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.List;

import com.gxuwz.KeepHealth.business.dao.PersonalDataDetailDAO;
import com.gxuwz.KeepHealth.business.entity.FatherHealth;
import com.gxuwz.KeepHealth.business.entity.HealthRecord;
import com.gxuwz.KeepHealth.business.entity.MentorServicesStatistics;
import com.gxuwz.KeepHealth.business.entity.PersonalDataDetail;
import com.gxuwz.KeepHealth.business.entity.ReferData;
import com.gxuwz.KeepHealth.business.entity.TbAdvice;
import com.gxuwz.KeepHealth.business.entity.TbFeedback;
import com.gxuwz.KeepHealth.business.entity.TbReadme;
import com.gxuwz.KeepHealth.business.entity.ThroughFeedback;
import com.gxuwz.KeepHealth.business.entity.listserviceNumber;
import com.gxuwz.core.pagination.Result;
/**
 * 
* @ClassName: PersonalDataDetailServiceImpl 
* @Description: 实现类   多表数据操作
* @author 软件开发中心  陈洁 
* @date 2017年7月8日 上午3:19:40
 */
@Service("personalDataDetailService")
public class PersonalDataDetailServiceImpl implements PersonalDataDetailService{
	@Autowired
	private PersonalDataDetailDAO personalDataDetailDAO;
	
	
	/**
	 * 分页   根据id进行查询
	 * @return
	 * @throws Exception
	 * @author 陈洁
	 * @Date 2017.03.24
	 */
	public Result<HealthRecord> find(int personalId, int page, int row) {
		
		return personalDataDetailDAO.find(personalId, page, row);
	}
	
	/**
	 * 分页   根据会员id进行查询所有父级健康自述
	 * @return
	 * @throws Exception
	 * @author 陈洁
	 * @Date 2017.03.24
	 */
	public Result<FatherHealth> findByPersonalId(int personalId, int page, int row) {
		
		return personalDataDetailDAO.findByPersonalId(personalId, page, row);
	}
	
	/**
	 * 分页   根据会员id进行查询所有调理建议
	 * @return
	 * @throws Exception
	 * @author 陈洁
	 * @Date 2017.03.24
	 */
	public Result<TbAdvice> findByAdvicePersonalId(int personalId, int page, int row) {
		
		return personalDataDetailDAO.findByAdvicePersonalId(personalId, page, row);
	}
	
	/**
	 * 分页   根据会员id进行查询所有效果反馈
	 * @return
	 * @throws Exception
	 * @author 陈洁
	 * @Date 2017.03.24
	 */
	public Result<TbFeedback> findFeedbackMemberId(int personalId, int page, int row) {
		
		return personalDataDetailDAO.findFeedbackMemberId(personalId, page, row);
	}
	
	
	
//	用于导出Excel文件------------代码开始
	/**
	 * 分页   根据会员id进行查询所有父级健康自述
	 * @return
	 * @throws Exception
	 * @author 陈洁
	 * @Date 2017.04.11
	 */
	public List<FatherHealth> findByPersonalId(int personalId) {
		
		return personalDataDetailDAO.findByPersonalId(personalId);
	}
	
	/**
	 * 分页   根据会员id进行查询所有调理建议
	 * @return
	 * @throws Exception
	 * @author 陈洁
	 * @Date 2017.04.11
	 */
	public List<TbAdvice> findByAdvicePersonalId(int personalId) {
		
		return personalDataDetailDAO.findByAdvicePersonalId(personalId);
	}
	
	/**
	 * 分页   根据会员id进行查询所有效果反馈
	 * @return
	 * @throws Exception
	 * @author 陈洁
	 * @Date 2017.04.11
	 */
	public List<TbFeedback> findFeedbackMemberId(int personalId) {
		
		return personalDataDetailDAO.findFeedbackMemberId(personalId);
	}
//	用于导出Excel文件-------代码结束
	
	
	/**
	 * list   根据id进行查询
	 * @return
	 * @throws Exception
	 * @author 陈洁
	 * @Date 2017.03.24
	 */
	public List<PersonalDataDetail> findByReadmeId(int readmeId){
		
		return personalDataDetailDAO.findByReadmeId(readmeId);
		
	}
	
	
	
	/**
	 * 显示一条健康自述记录的详细信息（会员基本信息+咨询内容）
	 * @return 
	 * @throws Exception
	 * @author 陈洁 findAdviceDetail
	 * @Date 2017.03.24
	 */
	public List<ReferData> findAdviceDetail(int readmeId){
		
		return personalDataDetailDAO.findAdviceDetail(readmeId);
		
	}
	
	/**
	 * 分页 
	 * @return
	 * @throws Exception
	 * @author 陈洁
	 * @Date 2017.03.24
	 */
	public  List<MentorServicesStatistics> findServicesList(MentorServicesStatistics mentorServicesStatistics) {
		return personalDataDetailDAO.findServicesList(mentorServicesStatistics);
	}
	
	/**
	 * 分页 
	 * @return
	 * @throws Exception
	 * @author 陈洁
	 * @Date 2017.04.11
	 */
	public  List<MentorServicesStatistics> findExcelList(MentorServicesStatistics mentorServicesStatistics) {
		return personalDataDetailDAO.findExcelList(mentorServicesStatistics);
	}
	
	/**
	 * 
	* @Title: findByFatherPersonalId 
	* @author 软件开发中心   陈洁
	* @Description: 根据会员id查询该会员所有fatherid=0的咨询记录跟调理建议
	* @return List<TbReadme> 
	* @date 2017年7月8日 上午3:14:23 
	* @throws
	 */
	public List<TbReadme> findByFatherPersonalId(int personalId){
		
		return personalDataDetailDAO.findByFatherPersonalId(personalId);
		
	}
	/**
	 * 
	* @Title: findByFatherAdvicePersonalId 
	* @author 软件开发中心   陈洁
	* @Description: 根据会员id查询该会员对应所有的调理建议
	* @return List<TbAdvice> 
	* @date 2017年7月8日 上午3:15:25 
	* @throws
	 */
	public List<TbAdvice> findByFatherAdvicePersonalId(int personalId){
		
		return personalDataDetailDAO.findByFatherAdvicePersonalId(personalId);
		
	}
	/**
	 * 
	* @Title: findByFatherAdvice1PersonalId 
	* @author 软件开发中心   陈洁
	* @Description: 根据会员id查询该会员对应所有追问调理建议
	* @return List<TbAdvice> 
	* @date 2017年7月8日 上午3:15:55 
	* @throws
	 */
	public List<TbAdvice> findByFatherAdvice1PersonalId(int personalId){
		
		return personalDataDetailDAO.findByFatherAdvice1PersonalId(personalId);
		
	}
	/**
	 * 
	* @Title: findByChildMemberId 
	* @author 软件开发中心   陈洁
	* @Description: 根据父级id查询该健康自述记录下的所有追问的咨询记录
	* @return List<TbReadme> 
	* @date 2017年7月8日 上午3:16:27 
	* @throws
	 */
	public List<TbReadme> findByChildMemberId(int personalId){
		
		return personalDataDetailDAO.findByChildMemberId(personalId);
		
	}
	/**
	 * 
	* @Title: findByFeedbackMemberId 
	* @author 软件开发中心   陈洁
	* @Description: 根据会员id查询该会员所有的效果反馈
	* @return List<ThroughFeedback> 
	* @date 2017年7月8日 上午3:16:52 
	* @throws
	 */
	public List<ThroughFeedback> findByFeedbackMemberId(int personalId){
		
		return personalDataDetailDAO.findByFeedbackMemberId(personalId);
		
	}
	
	/**
	 * 
	* @Title: findByreadmeId 
	* @author 软件开发中心   陈洁
	* @Description: 根据会员id查询该会员所有fatherid=0的咨询记录跟调理建议
	* @return List<TbReadme> 
	* @date 2017年7月8日 上午3:17:23 
	* @throws
	 */
	public List<TbReadme> findByreadmeId(int readmeId){
		
		return personalDataDetailDAO.findByreadmeId(readmeId);
		
	}
	/**
	 * 
	* @Title: findByAdvicereadmeId 
	* @author 软件开发中心   陈洁
	* @Description: 根据会员id查询该会员所有fatherid=0的咨询记录跟调理建议
	* @return List<TbAdvice> 
	* @date 2017年7月8日 上午3:17:48 
	* @throws
	 */
	public List<TbAdvice> findByAdvicereadmeId(int readmeId){
			
			return personalDataDetailDAO.findByAdvicereadmeId(readmeId);
			
		}
	/**
	 * 查询每个导师的服务记录以及各个星级评价的数量
	 * @return
	 * @throws Exception
	 * @author 陈洁
	 * @Date 2017.03.24
	 */
	public List<listserviceNumber> findserviceNumberList(MentorServicesStatistics mentorServicesStatistics){
		return personalDataDetailDAO.findserviceNumberList(mentorServicesStatistics);
	}

}
