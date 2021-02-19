package com.gxuwz.KeepHealth.business.service;

import java.sql.Timestamp;
import java.util.List;

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

public interface PersonalDataDetailService {
	
	/**
	 * 查询每一条咨询对应的建议、建议时间、导师名称、反馈、反馈时间
	 * @return
	 * @throws Exception
	 * @author 陈洁
	 * @Date 2017.03.24
	 */
	public Result<HealthRecord> find(int personalId, int page, int row);
	/**
	 * 查询所有父级健康自述
	 * @return
	 * @throws Exception
	 * @author 陈洁
	 * @Date 2017.03.24
	 */
	public Result<FatherHealth> findByPersonalId(int personalId, int page, int row);
	
	/**
	 * 查询所有父级健康自述对应的调理建议
	 * @return
	 * @throws Exception
	 * @author 陈洁
	 * @Date 2017.03.24
	 */
	public Result<TbAdvice> findByAdvicePersonalId(int personalId, int page, int row);
	/**
	 * 查询所有父级健康自述对应的效果反馈
	 * @return
	 * @throws Exception
	 * @author 陈洁
	 * @Date 2017.03.24
	 */
	public Result<TbFeedback> findFeedbackMemberId(int personalId, int page, int row);
	
	/**
	 * 查询所有父级健康自述
	 * @return
	 * @throws Exception
	 * @author 陈洁
	 * @Date 2017.03.24
	 */
	public List<FatherHealth> findByPersonalId(int personalId);
	
	/**
	 * 查询所有父级健康自述对应的调理建议，用于导出Excel
	 * @return
	 * @throws Exception
	 * @author 陈洁
	 * @Date 2017.03.24
	 */
	public List<TbAdvice> findByAdvicePersonalId(int personalId);
	
	/**
	 * 查询所有父级健康自述对应的效果反馈，用于导出Excel
	 * @return
	 * @throws Exception
	 * @author 陈洁
	 * @Date 2017.03.24
	 */
	public List<TbFeedback> findFeedbackMemberId(int personalId);
	/**
	 * 查询一条记录的各种详细信息（会员基本信息+咨询+建议+追问+反馈）
	 * @return 
	 * @throws Exception
	 * @author 陈洁
	 * @Date 2017.03.24
	 */
	public List<PersonalDataDetail> findByReadmeId(int readmeId);
	/**
	 * 显示一条健康自述记录的详细信息（会员基本信息+咨询内容）
	 * @return 
	 * @throws Exception
	 * @author 陈洁 findAdviceDetail
	 * @Date 2017.03.24
	 */
	public List<ReferData> findAdviceDetail(int readmeId);
	/**
	 * 查询每个导师的服务记录以及各个星级评价的数量
	 * @return
	 * @throws Exception
	 * @author 陈洁
	 * @Date 2017.03.24
	 */
	public List<MentorServicesStatistics> findServicesList(MentorServicesStatistics mentorServicesStatistics);
	/**
	 * 查询每个导师的服务记录以及各个星级评价的数量
	 * @return
	 * @throws Exception
	 * @author 陈洁
	 * @Date 2017.03.24
	 */
	public List<listserviceNumber> findserviceNumberList(MentorServicesStatistics mentorServicesStatistics);
	/**
	 * 导出每个导师的服务记录以及各个星级评价的数量列表
	 * @return
	 * @throws Exception
	 * @author 陈洁
	 * @Date 2017.03.24
	 */
	public List<MentorServicesStatistics> findExcelList(MentorServicesStatistics mentorServicesStatistics);

	/**
	 * 
	* @Title: findByFatherPersonalId 
	* @author 软件开发中心   陈洁
	* @Description: 根据会员id查询该会员所有fatherid=0的咨询记录跟调理建议
	* @return List<TbReadme> 
	* @date 2017年7月8日 上午3:14:23 
	* @throws
	 */
	public List<TbReadme> findByFatherPersonalId(int personalId);
	/**
	 * 
	* @Title: findByFatherAdvicePersonalId 
	* @author 软件开发中心   陈洁
	* @Description: 根据会员id查询该会员对应所有的调理建议
	* @return List<TbAdvice> 
	* @date 2017年7月8日 上午3:15:25 
	* @throws
	 */
	public List<TbAdvice> findByFatherAdvicePersonalId(int personalId);
	/**
	 * 
	* @Title: findByFatherAdvice1PersonalId 
	* @author 软件开发中心   陈洁
	* @Description: 根据会员id查询该会员对应所有追问调理建议
	* @return List<TbAdvice> 
	* @date 2017年7月8日 上午3:15:55 
	* @throws
	 */
	public List<TbAdvice> findByFatherAdvice1PersonalId(int personalId);
	/**
	 * 
	* @Title: findByChildMemberId 
	* @author 软件开发中心   陈洁
	* @Description: 根据父级id查询该健康自述记录下的所有追问的咨询记录
	* @return List<TbReadme> 
	* @date 2017年7月8日 上午3:16:27 
	* @throws
	 */
	public List<TbReadme> findByChildMemberId(int personalId);
	/**
	 * 
	* @Title: findByFeedbackMemberId 
	* @author 软件开发中心   陈洁
	* @Description: 根据会员id查询该会员所有的效果反馈
	* @return List<ThroughFeedback> 
	* @date 2017年7月8日 上午3:16:52 
	* @throws
	 */
	public List<ThroughFeedback> findByFeedbackMemberId(int personalId);
	/**
	 * 
	* @Title: findByreadmeId 
	* @author 软件开发中心   陈洁
	* @Description: 根据会员id查询该会员所有fatherid=0的咨询记录跟调理建议
	* @return List<TbReadme> 
	* @date 2017年7月8日 上午3:17:23 
	* @throws
	 */
	public List<TbReadme> findByreadmeId(int readmeId);
	/**
	 * 
	* @Title: findByAdvicereadmeId 
	* @author 软件开发中心   陈洁
	* @Description: 根据会员id查询该会员所有fatherid=0的咨询记录跟调理建议
	* @return List<TbAdvice> 
	* @date 2017年7月8日 上午3:17:48 
	* @throws
	 */
	public List<TbAdvice> findByAdvicereadmeId(int readmeId);
}
