package com.gxuwz.KeepHealth.business.dao;

import org.springframework.stereotype.Repository;

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
import com.gxuwz.core.dao.impl.BaseDaoImpl;
import com.gxuwz.core.pagination.Result;
@Repository("PersonalDataDetailDAO")
public class PersonalDataDetailDAO extends BaseDaoImpl<PersonalDataDetail>{
	
	/**
	 * 查询每一条咨询对应的建议、建议时间、导师名称、反馈、反馈时间
	 * @return
	 * @throws Exception
	 * @author 陈洁
	 * @Date 2017.03.24
	 */
	@SuppressWarnings("unchecked")
	public Result<HealthRecord> find(int personalId, int page, int row){
		String queryString="select new com.gxuwz.KeepHealth.business.entity.HealthRecord(" +
				"a.adviceContent,a.adviceTime,a.mentorName,b.readmeId,b.readmeContent,b.readmeTime,b.memberName,c.feedbackContent,c.feedbackTime" +
				") " +
				"from TbAdvice a,TbReadme b,TbFeedback c " +
				"where b.fatherId=0 and a.readmeId=b.readmeId and c.readmeId=b.readmeId and  " +
				"b.personalId='"+personalId+"' and c.memberId='"+personalId+"' and b.feedbackState=1";
		//System.out.println(queryString);
		int start=(page-1)*row;
		int limit =row;
		
		return (Result<HealthRecord>)super.find(queryString, null, null, start, limit);
	}
	
	/**
	 * 查询该会员所有的父级健康自述（多表）
	 * @return
	 * @throws Exception
	 * @author 陈洁
	 * @Date 2017.03.24
	 */
	@SuppressWarnings("unchecked")
	public Result<FatherHealth> findByPersonalId(int personalId, int page, int row){
		String queryString="select new com.gxuwz.KeepHealth.business.entity.FatherHealth(" +
				"b.readmeId,b.readmeContent,b.readmeTime,b.mentorId,a.name" +
				") " +
				"from TbReadme b ,TbPersonalData a  " +
				"where b.fatherId=0 and " +
				"b.personalId='"+personalId+"' and b.personalId=a.personalId";
		//System.out.println(queryString);
		int start=(page-1)*row;
		int limit =row;
		
		return (Result<FatherHealth>)super.find(queryString, null, null, start, limit);
	}
	
	
	/**
	 * 查询该会员的所有非追加调理建议
	 * @return
	 * @throws Exception
	 * @author 陈洁
	 * @Date 2017.03.24
	 */
	@SuppressWarnings("unchecked")
	public Result<TbAdvice> findByAdvicePersonalId(int personalId, int page, int row){
		String queryString="from TbAdvice a  " +
				"where a.memberId='"+personalId+"' and fatherId=0";
		//System.out.println(queryString);
		int start=(page-1)*row;
		int limit =row;
		
		return (Result<TbAdvice>)super.find(queryString, null, null, start, limit);
	}
	
	/**
	 * 查询该会员的所有效果反馈
	 * @return
	 * @throws Exception
	 * @author 陈洁
	 * @Date 2017.03.24
	 */
	@SuppressWarnings("unchecked")
	public Result<TbFeedback> findFeedbackMemberId(int personalId, int page, int row){
		String queryString="from TbFeedback c  " +
				"where c.memberId='"+personalId+"'";
		//System.out.println(queryString);
		int start=(page-1)*row;
		int limit =row;
		return (Result<TbFeedback>)super.find(queryString, null, null, start, limit);
	}
	
	
	
	
	
	
	/**
	 * 查询该会员所有的父级健康自述
	 * @return
	 * @throws Exception
	 * @author 陈洁
	 * @Date 2017.03.24
	 */
	@SuppressWarnings("unchecked")
	public List<FatherHealth> findByPersonalId(int personalId){
		String queryString="select new com.gxuwz.KeepHealth.business.entity.FatherHealth(" +
				"b.readmeId,b.readmeContent,b.readmeTime,b.mentorId,a.name" +
				") " +
				"from TbReadme b ,TbPersonalData a  " +
				"where b.fatherId=0 and " +
				"b.personalId='"+personalId+"' and b.personalId=a.personalId";
		//System.out.println(queryString);
		
		return (List<FatherHealth>)this.getHibernateTemplate().find(queryString);
	}
	
	
	/**
	 * 查询该会员的所有调理建议
	 * @return
	 * @throws Exception
	 * @author 陈洁
	 * @Date 2017.03.24
	 */
	@SuppressWarnings("unchecked")
	public List<TbAdvice> findByAdvicePersonalId(int personalId){
		String queryString="from TbAdvice a  " +
				"where a.memberId='"+personalId+"' and fatherId=0";
		//System.out.println(queryString);
		
		return (List<TbAdvice>)this.getHibernateTemplate().find(queryString);
	}
	
	
	/**
	 * 查询该会员的所有效果反馈
	 * @return
	 * @throws Exception
	 * @author 陈洁
	 * @Date 2017.03.24
	 */
	@SuppressWarnings("unchecked")
	public List<TbFeedback> findFeedbackMemberId(int personalId){
		String queryString="from TbFeedback c  " +
				"where c.memberId='"+personalId+"'";
		//System.out.println(queryString);
		return (List<TbFeedback>)this.getHibernateTemplate().find(queryString);
	}
	
	
	
	
	
	
	
	
	
	/**
	 * 查询一条记录的各种详细信息（会员基本信息+咨询+建议+追问+反馈）
	 * @return 
	 * @throws Exception
	 * @author 陈洁 findAdviceDetail
	 * @Date 2017.03.24
	 */
	
	@SuppressWarnings("unchecked")
	public List<PersonalDataDetail> findByReadmeId(int readmeId){
		String hql = "select new com.gxuwz.KeepHealth.business.entity.PersonalDataDetail(" +
				"a.qq,a.name,a.realName,a.sex,a.placeDomicile,a.mobilePhone,a.image,a.email,a.birthday,a.idCard," +
				"a.maritalStatus,a.professional,a.address )  " +
				"from TbPersonalData a, TbReadme b " +
				"where b.readmeId='"+readmeId+"' and a.personalId = b.personalId ";
		return (List<PersonalDataDetail>)this.getHibernateTemplate().find(hql);
		
	}
	
	/**
	 * 显示一条健康自述记录的详细信息（会员基本信息+咨询内容）
	 * @return 
	 * @throws Exception
	 * @author 陈洁 findAdviceDetail
	 * @Date 2017.03.24
	 */
	@SuppressWarnings("unchecked")
	public List<ReferData> findAdviceDetail(int readmeId){
		//System.out.println(readmeId);
		String hql = "select new com.gxuwz.KeepHealth.business.entity.ReferData(" +
				"a.qq,a.name,a.realName,a.sex,a.placeDomicile,a.mobilePhone,a.image,a.email,a.birthday,a.idCard," +
				"a.maritalStatus,a.professional,a.address,b.readmeContent,b.readmeTime,b.mentorName) " +
				"from TbPersonalData a, TbReadme b  " +
				"where b.readmeId='"+readmeId+"' and a.personalId = b.personalId ";
		return (List<ReferData>)this.getHibernateTemplate().find(hql);
		
	}
	
	/**
	 * 查询每个导师的服务记录以及各个星级评价的数量
	 * @return
	 * @throws Exception
	 * @author 陈洁
	 * @Date 2017.03.24
	 */
	@SuppressWarnings("unchecked")
	public List<MentorServicesStatistics> findServicesList(MentorServicesStatistics mentorServicesStatistics){
		String hql = "select new com.gxuwz.KeepHealth.business.entity.MentorServicesStatistics(" +
				"a.personalId," +
				
				"sum(case when (b.starEvaluation=1) then 1 else 0 end ) as badNumber," +
				"sum(case when (b.starEvaluation=2) then 1 else 0 end ) as generalNumber, " +
				"sum(case when (b.starEvaluation=3) then 1 else 0 end ) as goodNumber," +
				"sum(case when (b.starEvaluation=4) then 1 else 0 end ) as bettergoodNumber," +
				"sum(case when (b.starEvaluation=5) then 1 else 0 end ) as satisfaction" +
				")  " +
				"from TbPersonalData a,TbFeedback b " +
				"where a.flagType=1 and a.personalId = b.personalId ";
		if(null != mentorServicesStatistics.getTime1()){
			hql = hql + " and  b.feedbackTime between'"+mentorServicesStatistics.getTime1()+"' and '"+mentorServicesStatistics.getTime2()+"' ";
		}
		hql = hql + " group by a.personalId";
		return (List<MentorServicesStatistics>)this.getHibernateTemplate().find(hql);
		
	}
	
	/**
	 * 查询每个导师的服务记录以及各个星级评价的数量,用于导出Excel
	 * @return
	 * @throws Exception
	 * @author 陈洁
	 * @Date 2017.03.24
	 */
	@SuppressWarnings("unchecked")
	public List<MentorServicesStatistics> findExcelList(MentorServicesStatistics mentorServicesStatistics){
		String hql = "select new com.gxuwz.KeepHealth.business.entity.MentorServicesStatistics(" +
				"a.personalNumber,a.personalId,a.realName," +
				"sum(case when (a.personalId = b.personalId) then 1 else 0 end ) as serviceNumber," +
				"sum(case when (b.starEvaluation=1) then 1 else 0 end ) as badNumber," +
				"sum(case when (b.starEvaluation=2) then 1 else 0 end ) as generalNumber, " +
				"sum(case when (b.starEvaluation=3) then 1 else 0 end ) as goodNumber," +
				"sum(case when (b.starEvaluation=4) then 1 else 0 end ) as bettergoodNumber," +
				"sum(case when (b.starEvaluation=5) then 1 else 0 end ) as satisfaction" +
				")  " +
				"from TbPersonalData a,TbFeedback b  " +
				"where a.flagType=1 and a.personalId = b.personalId ";
		//System.out.println("GJHKd45J"+mentorServicesStatistics.getTime1());
		if(null != mentorServicesStatistics.getPersonalNumber()){
			hql = hql + " and  a.personalNumber = '"+mentorServicesStatistics.getPersonalNumber()+"'";
		}
		if(null != mentorServicesStatistics.getRealName()){
			hql = hql + " and a.realName = '"+mentorServicesStatistics.getRealName()+"'";
		}
		if(null != mentorServicesStatistics.getTime1()&&null != mentorServicesStatistics.getTime2()){
			hql = hql + " and b.feedbackTime between '"+mentorServicesStatistics.getTime1().toString()+"' and '"+mentorServicesStatistics.getTime2().toString()+"'";
		}
		hql = hql + " group by a.personalId";
		//System.out.println(hql);
		List<MentorServicesStatistics> list = getHibernateTemplate().find(hql);
		return list;
		
	}
	
	
	/**
	 * 根据会员id查询该会员所有fatherid=0的咨询记录跟调理建议
	 * @return 
	 * @throws Exception
	 * @author 陈洁 
	 * @Date 2017.03.24
	 */
	@SuppressWarnings("unchecked")
	public List<TbReadme> findByFatherPersonalId(int personalId){
		String hql = "from TbReadme a " +
				"where a.personalId='"+personalId+"' and a.fatherId=0 order by a.readmeTime desc";
		List<TbReadme> list = getHibernateTemplate().find(hql);
		return list;
		
	}
	
	/**
	 * 根据会员id查询该会员对应所有的调理建议
	 * @return 
	 * @throws Exception
	 * @author 陈洁 
	 * @Date 2017.03.24
	 */
	@SuppressWarnings("unchecked")
	public List<TbAdvice> findByFatherAdvicePersonalId(int personalId){
		String hql = "from TbAdvice b " +
				"where b.memberId='"+personalId+"'  order by b.adviceTime asc";
		return (List<TbAdvice>)this.getHibernateTemplate().find(hql);
		
	}
	
	/**
	 * 根据会员id查询该会员对应所有追问调理建议
	 * @return 
	 * @throws Exception
	 * @author 陈洁 
	 * @Date 2017.03.24
	 */
	@SuppressWarnings("unchecked")
	public List<TbAdvice> findByFatherAdvice1PersonalId(int personalId){
		String hql = "from TbAdvice b " +
				"where b.memberId='"+personalId+"' and fatherId !=0";
		return (List<TbAdvice>)this.getHibernateTemplate().find(hql);
		
	}
	
	
	
	/**
	 * 根据父级id查询该健康自述记录下的所有追问的咨询记录
	 * @return 
	 * @throws Exception
	 * @author 陈洁 findByChildMemberId
	 * @Date 2017.03.24
	 */
	@SuppressWarnings("unchecked")
	public List<TbReadme> findByChildMemberId(int personalId){
		String hql = "from TbReadme a " +
				"where a.personalId='"+personalId+"' and a.fatherId !=0  order by a.readmeTime asc";
		return (List<TbReadme>)this.getHibernateTemplate().find(hql);
		
	}
	
	
	
	/**
	 * 根据会员id查询该会员所有的效果反馈
	 * @return 
	 * @throws Exception
	 * @author 陈洁 
	 * @Date 2017.03.24
	 */
	@SuppressWarnings("unchecked")
	public List<ThroughFeedback> findByFeedbackMemberId(int personalId){
		String hql = "select new com.gxuwz.KeepHealth.business.entity.ThroughFeedback(" +
				"a.readmeId,b.feedbackContent,b.feedbackTime,b.starEvaluation) " +
				"from TbReadme a,TbFeedback b " +
				"where a.personalId='"+personalId+"' and a.readmeId = b.readmeId  order by b.feedbackTime desc";
		return (List<ThroughFeedback>)this.getHibernateTemplate().find(hql);
		
	}
	
	
	/**
	 * 根据会员id查询该会员所有fatherid=0的咨询记录跟调理建议
	 * @return 
	 * @throws Exception
	 * @author 陈洁 
	 * @Date 2017.03.24
	 */
	@SuppressWarnings("unchecked")
	public List<TbReadme> findByreadmeId(int readmeId){
		String hql = "from TbReadme a where a.readmeId='"+readmeId+"'";
		return (List<TbReadme>)this.getHibernateTemplate().find(hql);
		
	}
	
	/**
	 * 根据会员id查询该会员所有fatherid=0的咨询记录跟调理建议
	 * @return 
	 * @throws Exception
	 * @author 陈洁 
	 * @Date 2017.03.24
	 */
	@SuppressWarnings("unchecked")
	public List<TbAdvice> findByAdvicereadmeId(int readmeId){
		String hql = "from TbAdvice b " +
				"where b.readmeId='"+readmeId+"' and fatherId=0";
		return (List<TbAdvice>)this.getHibernateTemplate().find(hql);
		
	}
	
	/**
	 * 根据会员id查询该会员所有fatherid=0的咨询记录跟调理建议
	 * @return 
	 * @throws Exception
	 * @author 陈洁 
	 * @Date 2017.03.24
	 */
	@SuppressWarnings("unchecked")
	public List<listserviceNumber> findserviceNumberList(MentorServicesStatistics mentorServicesStatistics){
		String hql = "select new com.gxuwz.KeepHealth.business.entity.listserviceNumber("
				+"sum(case when (a.personalId = b.personalId) then 1 else 0 end ) as serviceNumber,b.personalId"
				+")"
				+"from TbPersonalData a,TbAdvice b where a.personalId = b.personalId and a.flagType=1 and b.fatherId=0 ";
		if(null != mentorServicesStatistics.getTime1()){
			hql = hql + " and  b.adviceTime between'"+mentorServicesStatistics.getTime1()+"' and '"+mentorServicesStatistics.getTime2()+"' ";
		}
		hql = hql + " group by a.personalId";
		return (List<listserviceNumber>)this.getHibernateTemplate().find(hql);
		
	}

}
