package com.gxuwz.KeepHealth.business.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.gxuwz.KeepHealth.business.entity.MyAppointment;
import com.gxuwz.KeepHealth.business.entity.TbAdvice;
import com.gxuwz.KeepHealth.business.entity.TbFeedback;
import com.gxuwz.KeepHealth.business.entity.TbPersonalData;
import com.gxuwz.KeepHealth.business.entity.TbReadme;
import com.gxuwz.core.dao.impl.BaseDaoImpl;

/**
 * 
* @ClassName: TbReadmeDAO 
* @Description:健康自述信息DAO 
* @author 软件开发中心  陈洁 
* @date 2017年7月7日 上午9:54:05
 */
@Repository("tbReadmeDAO")
public class TbReadmeDAO extends BaseDaoImpl<TbReadme>{
	/**
	 * 
	* @Title: findByMentorId 
	* @author 软件开发中心   陈洁
	* @Description: 根據導師ID查詢所有健康自述
	* @return List<MyAppointment> 
	* @date 2017年7月7日 上午9:54:28 
	* @throws
	 */
	@SuppressWarnings("unchecked")
	public List<MyAppointment> findByMentorId(int mentorId){
		String hql = "select new com.gxuwz.KeepHealth.business.entity.MyAppointment(" +
				"a.personalId,a.readmeId,a.readmeContent,a.readmeTime,a.memberName,b.image" +
				") " +
				"from TbReadme a ,TbPersonalData b  where a.mentorId='"+mentorId+"' and a.personalId = b.personalId and a.replyState=0 order by a.readmeTime desc";
		List<MyAppointment> list=getHibernateTemplate().find(hql);
	 return list;
	}
	/**
	 * 
	* @Title: findBypersonalId 
	* @author 软件开发中心   陈洁
	* @Description: 查詢所有未指定導師并且沒有答復的健康咨詢記錄
	* @return List<MyAppointment> 
	* @date 2017年7月7日 上午9:55:24 
	* @throws
	 */
	@SuppressWarnings("unchecked")
	public List<MyAppointment> findBypersonalId(){
		String hql = "select new com.gxuwz.KeepHealth.business.entity.MyAppointment(" +
				"a.personalId,a.readmeId,a.readmeContent,a.readmeTime,a.memberName,b.image" +
				") " +
				"from TbReadme a ,TbPersonalData b  where a.personalId = b.personalId and a.mentorId=0 and a.replyState=0 order by a.readmeTime desc";
		List<MyAppointment> list=getHibernateTemplate().find(hql);
	 return list;
	}
	/**
	 * 
	* @Title: updatemontorId 
	* @author 软件开发中心   陈洁
	* @Description: 根據健康自述編號更新健康自述記錄
	* @return void 
	* @date 2017年7月7日 上午9:57:39 
	* @throws
	 */
	@SuppressWarnings("unchecked")
	public void updatemontorId(int mentorId,int readmeId,String name){
		String hql = "update TbReadme set mentorId='"+mentorId+"',mentorName='"+name+"' where readmeId="+readmeId+"";
        getHibernateTemplate().bulkUpdate(hql);
	}
	/**
	 * 
	* @Title: findByPersonalId 
	* @author 软件开发中心   陈洁
	* @Description: 根據個人數據編號查詢所有健康自述并按健康自述時間降序
	* @return List<TbReadme> 
	* @date 2017年7月7日 上午9:58:24 
	* @throws
	 */
	@SuppressWarnings("unchecked")
	public List<TbReadme> findByPersonalId(int personalId){
		String hql = "from TbReadme  where personalId='"+personalId+"' order by readmeTime desc";
		List<TbReadme> list=getHibernateTemplate().find(hql);
	 return list;
	}
	/**
	 * 
	* @Title: findByReadmeId 
	* @author 软件开发中心   陈洁
	* @Description: 根據健康自述編號查詢健康自述記錄
	* @return List<TbReadme> 
	* @date 2017年7月7日 上午10:00:16 
	* @throws
	 */
	@SuppressWarnings("unchecked")
	public List<TbReadme> findByReadmeId(int readmeId){
		String hql = "from TbReadme where readmeId='"+readmeId+"'";
		return (List<TbReadme>)this.getHibernateTemplate().find(hql);
		
	}
	
	/**
	 * 
	* @Title: findByReadmeId 
	* @author 软件开发中心   陈洁
	* @Description: 根據会员编号查询所有父级健康自述
	* @return List<TbReadme> 
	* @date 2017年7月7日 上午10:00:16 
	* @throws
	 */
	@SuppressWarnings("unchecked")
	public int findCS(int a){
		String hql = "from TbReadme where personalId="+a+" and fatherId=0";
		List<TbPersonalData> list=getHibernateTemplate().find(hql);	
	 return list.size();
	}

	
    /**
     * 
    * @Title: updateReadme 
    * @author 软件开发中心   陈洁
    * @Description: 根據健康自述ID更新健康咨詢回復状态字段
    * @return void 
    * @date 2017年7月7日 上午10:01:12 
    * @throws
     */
	public void updateReadme(int readmeId){  
        String queryString = "update TbReadme set replyState = 1 where readmeId="+readmeId+"";  
        getHibernateTemplate().bulkUpdate(queryString);

		
	}
	/**
	 * 
	* @Title: updateReadmeback 
	* @author 软件开发中心   陈洁
	* @Description: 根據健康自述ID更新健康咨詢反饋状态字段
	* @return void 
	* @date 2017年7月7日 上午10:02:11 
	* @throws
	 */
	public void updateReadmeback(int readmeId){  
        String queryString = "update TbReadme set feedbackState = 1 where readmeId="+readmeId+"";  
        getHibernateTemplate().bulkUpdate(queryString);

		
	}
	/**
	 * 根据导师id查询该导师所有fatherId=0的咨询记录
	 * @return 
	 * @throws Exception
	 * @author 莫然源 
	 * @Date 2017.04.30
	 */
	
	@SuppressWarnings("unchecked")
	public List<TbReadme> findFatherPQ(int personalId){  
        String hql = "from TbReadme a where a.fatherId=0 and a.mentorId='"+personalId+"' and a.replyState=1 order by a.readmeTime desc";  
         List<TbReadme> list=null;
        list=getHibernateTemplate().find(hql);
        return list;
     }
	/**
	 * 根据导师id查询该导师所有的效果反馈
	 * @return 
	 * @throws Exception
	 * @author 莫然源 
	 * @Date 2017.04.30
	 */
	@SuppressWarnings("unchecked")
	public List<TbFeedback> findFoodbackByMentorId(int personalId){  
        String hql = " from TbFeedback where   personalId='"+personalId+"'";  
         List<TbFeedback> list=null;
        list=getHibernateTemplate().find(hql);
        return list;
     }
	/**
	 * 根据导师id查询该导师导师所有fatherId!=0的咨询记录
	 * @return 
	 * @throws Exception
	 * @author 莫然源 
	 * @Date 2017.04.30
	 */
	@SuppressWarnings("unchecked")
	public List<TbReadme> findChildPQ(int personalId){  
        String hql = "from TbReadme a where a.fatherId!=0 and a.mentorId='"+personalId+"' order by a.readmeTime desc";  
         List<TbReadme> list=null;
         list=getHibernateTemplate().find(hql);	
         return list;
     }
	/**
	 * 根据readmeId查询该导师导师所有fatherId!=0的咨询记录
	 * @return 
	 * @throws Exception
	 * @author 莫然源 
	 * @Date 2017.04.30
	 */
	@SuppressWarnings("unchecked")
	public List<TbReadme> findChildPQByReadmeId(int readmeId){  
        String hql = "from TbReadme a where a.fatherId='"+readmeId+"' order by a.readmeTime desc";  
         List<TbReadme> list=null;
         list=getHibernateTemplate().find(hql);	
         return list;
     }
	
	/**
	 * 根据导师id查询该导师所有的调理建议
	 * @return 
	 * @throws Exception
	 * @author 莫然源 
	 * @Date 2017.04.30
	 */
	@SuppressWarnings("unchecked")
	public List<TbAdvice> findAdviceByMentorId(int personalId){  
        String hql = "from TbAdvice a where a.personalId='"+personalId+"' order by a.adviceTime asc";  
         List<TbAdvice> list=null;
         list=getHibernateTemplate().find(hql);	
         return list;
     }
	/**
	 * 根据会员id查询该会员所有的fatherId=0的未反馈记录
	 * @return 
	 * @throws Exception
	 * @author 莫然源 
	 * @Date 2017.04.30
	 */
	@SuppressWarnings("unchecked")
	public List<TbReadme> findFatherNoFeedbackPQ(int personalId){  
        String hql = "from TbReadme a where  a.feedbackState=0 and  a.fatherId=0  and  a.replyState=1 and a.personalId='"+personalId+"' order by a.readmeTime desc";  
         List<TbReadme> list=null;
         list=getHibernateTemplate().find(hql);	
         return list;
     }
	
	/**
	 * 根据会员id查询该会员所有的调理建议
	 * @return 
	 * @throws Exception
	 * @author 莫然源 
	 * @Date 2017.04.30
	 */
	@SuppressWarnings("unchecked")
	public List<TbAdvice> findAdviceByMemberId(int personalId){  
		String hql = "from TbAdvice a where a.memberId='"+personalId+"' order by a.adviceTime asc";  
         List<TbAdvice> list=null;
         list=getHibernateTemplate().find(hql);	
         return list;
     }
	/**
	 * 根据会员id查询该会员所有的fatherId!=0的未反馈记录
	 * @return 
	 * @throws Exception
	 * @author 莫然源 
	 * @Date 2017.04.30
	 */
	
	@SuppressWarnings("unchecked")
	public List<TbReadme> findChildNoFeedbackPQ(int personalId){  
		String hql = "from TbReadme a where a.fatherId!=0 and  a.personalId='"+personalId+"' order by a.readmeTime desc";  
         List<TbReadme> list=null;
         list=getHibernateTemplate().find(hql);	
         return list;
     }
	
	@SuppressWarnings("unchecked")
	public List<TbReadme> findFahterReplyPQ(int personalId){  
        String hql = "from TbReadme a where a.replyState=1 and a.fatherId=0 and a.personalId='"+personalId+"' order by a.readmeTime desc";  
         List<TbReadme> list=null;
        list=getHibernateTemplate().find(hql);
         
        return list;
     }
	@SuppressWarnings("unchecked")
	public List<TbReadme> findFKtype(int readmeId){  
        String hql = " from TbReadme  where readmeId="+readmeId+"";  
        List<TbReadme> list=null;
        list=getHibernateTemplate().find(hql);
         
        return list;
     }
/**
 * 
 * @Title: findAllReamde 
 * @Description: 查询所有的健康咨询
 * @return List<TbReadme>    返回类型 
 * @author: 莫然源
 * @Date 2017年7月8日
 * @throws
 */
	@SuppressWarnings("unchecked")
	public List<TbReadme> findAllReamde(){
		String hql = "from TbReadme  where mentorId!=0 and replyState=0 and fatherId=0 and DATEDIFF(now(),readmeTime)>1 order by readmeTime desc";
		List<TbReadme> list=getHibernateTemplate().find(hql);
	 return list;
	}
	}
