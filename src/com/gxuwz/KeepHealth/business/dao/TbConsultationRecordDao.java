package com.gxuwz.KeepHealth.business.dao;

import java.util.List;


import org.hibernate.HibernateException;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;
import com.gxuwz.KeepHealth.business.entity.TbConsultationRecord;
import com.gxuwz.KeepHealth.business.entity.TbConsumer;
import com.gxuwz.KeepHealth.business.entity.TbFormula;

import com.gxuwz.KeepHealth.business.entity.TbPersonalData;
import com.gxuwz.KeepHealth.business.entity.TbTeacher;

import com.gxuwz.KeepHealth.business.entity.TbConsumer;

import com.gxuwz.KeepHealth.business.entity.TbReadme;
import com.gxuwz.core.dao.impl.BaseDaoImpl;
import com.gxuwz.core.pagination.Result;
/**
 * 与咨询记录表相关的数据交互Dao层
 * @author 叶城廷
 * @version 2019.03.01
 */
@Repository
public class TbConsultationRecordDao extends BaseDaoImpl<TbConsultationRecord>{
//	/**
//	 * 微信端调理建议的主要症状查询根据老师openid
//	 * @author chentianhao
//	 *@version 2019.3.18
//	 */
//	@SuppressWarnings("unchecked")
//	public String symptom_description(){
//		String queryString= "from TbConsultationRecord  where openId= and symptomDescription=";
//		
//		return ;
//	}
	
	
	/**
	 * 咨询列表的Dao层
	 * @author chentianhao
	 *@version 2019.3.2
	 */
	@SuppressWarnings("unchecked")
	public Result<TbConsultationRecord> recordList(String string, int page, int size) {
		String queryString= "from TbConsultationRecord order by consultTime desc";	
		int start=(page-1)*size;
		int limit =size;
		return (Result<TbConsultationRecord>)super.find(queryString, null, null, start, limit);
	}// where 1=1 or teacherName like '%"+string+"%'
	
	/**
	 * 咨询用户咨询记录
	 * @author 丁程强
	 * @version 2019.3.24
	 */
	@SuppressWarnings("unchecked")
	public List<TbConsultationRecord> record(String openId) {
		//String hql= "from TbConsultationRecord where openId='"+openId+"'";
		String hql= "from TbConsultationRecord where openId='"+openId+"' ORDER BY consultTime  DESC ";
		return (List<TbConsultationRecord>)this.getHibernateTemplate().find(hql);
	}
	
	/**
	 * 咨询详情
	 * @param recordId
	 * @author 丁程强
	 * @version 2019.3.27
	 */
	@SuppressWarnings("unchecked")
	public List<TbConsultationRecord> recordDetails(int recordId){
		String hql = "from TbConsultationRecord where recordId='"+recordId+"'";
		return (List<TbConsultationRecord>)this.getHibernateTemplate().find(hql);
	}
	
	
	/**
	 * 查询列表的Dao层
	 * @author chentianhao
	 *@version 2019.3.2
	 */
	@SuppressWarnings("unchecked")
	public Result<TbConsultationRecord> queryList(TbConsultationRecord tbConsultationRecord, int page, int size) {
		String queryString= " from TbConsultationRecord where 1=1 ";
		
		if(null!=tbConsultationRecord.getTeacherId()){
			queryString =queryString+" and teacherId ='"+tbConsultationRecord.getTeacherId()+"' ";
		}
		if(null != tbConsultationRecord.getConsultTime2()){
			queryString = queryString + " and consultTime between '"+tbConsultationRecord.getConsultTime2().toString()+"' and '"+tbConsultationRecord.getConsultTime3().toString()+"'";
			//System.out.println("我执行了:"+untreated.getUsertime());
		}
					
		int start=(page-1)*size;
		int limit =size;
		return (Result<TbConsultationRecord>)super.find(queryString, null, null, start, limit);
	}
	
	@SuppressWarnings("all")
	//已打赏
	public List<Object[]> getAwardCount(){
		List<Object[]> list = getHibernateTemplate().execute(new HibernateCallback<List>() {
			String sql = "SELECT modelTwe.teacher_id,IFNULL(modelOne.exc,0) as exceptional_status FROM (SELECT  teacher_id, COUNT(*) as  exc from tb_consultation_record WHERE exceptional_status=1 group by teacher_id) as modelOne RIGHT JOIN (SELECT DISTINCT teacher_id FROM tb_teacher ) as modelTwe on modelOne.teacher_id=modelTwe.teacher_id;";
			@Override
			public List doInHibernate(Session session) throws HibernateException {
				SQLQuery query = session.createSQLQuery(sql);
				return query.list();
			}
		});
		return list;
	}
	
	@SuppressWarnings("all")
	//未打赏
		public List<Object[]> getUnawardCount() {
			
			List<Object[]> list = getHibernateTemplate().execute(new HibernateCallback<List>() {
				String sql = "SELECT modelTwe.teacher_id,IFNULL(modelOne.exc,0) as exceptional_status FROM (SELECT  teacher_id, COUNT(*) as  exc from tb_consultation_record WHERE exceptional_status=0 group by teacher_id) as modelOne RIGHT JOIN (SELECT DISTINCT teacher_id FROM tb_teacher ) as modelTwe on modelOne.teacher_id=modelTwe.teacher_id;";
				@Override
				public List doInHibernate(Session session) throws HibernateException {
					SQLQuery query = session.createSQLQuery(sql);
					return query.list();
				}
			});
			return list;
		}
		
		@SuppressWarnings("all")
		//已服务
		public List<Object[]> getServeCount() {
			List<Object[]> list = getHibernateTemplate().execute(new HibernateCallback<List>() {
				String sql = "SELECT modelTwe.teacher_id,IFNULL(modelOne.exc,0) as exceptional_status FROM (SELECT  teacher_id, COUNT(*) as  exc from tb_consultation_record WHERE advice is not null group by teacher_id) as modelOne RIGHT JOIN (SELECT DISTINCT teacher_id FROM tb_teacher ) as modelTwe on modelOne.teacher_id=modelTwe.teacher_id;";
				@Override
				public List doInHibernate(Session session) throws HibernateException {
					SQLQuery query = session.createSQLQuery(sql);
					return query.list();
				}
			});
			return list;
		}
		
		@SuppressWarnings("all")
		//未服务
		public List<Object[]> getUnserveCount() {
			List<Object[]> list = getHibernateTemplate().execute(new HibernateCallback<List>() {
				String sql = "SELECT modelTwe.teacher_id,IFNULL(modelOne.exc,0) as exceptional_status FROM (SELECT  teacher_id, COUNT(*) as  exc from tb_consultation_record WHERE advice is null group by teacher_id) as modelOne RIGHT JOIN (SELECT DISTINCT teacher_id FROM tb_teacher ) as modelTwe on modelOne.teacher_id=modelTwe.teacher_id;";
				@Override
				public List doInHibernate(Session session) throws HibernateException {
					SQLQuery query = session.createSQLQuery(sql);
					return query.list();
				}
			});
			return list;
		}
		/**
		 * 根据导师teacherName查询该导师所有已回复的咨询记录
		 * @return 
		 * @throws Exception
		 * @author 陈紫丽 
		 * @Date 2019.03.22
		 */
		
		@SuppressWarnings("unchecked")
		public List<TbConsultationRecord> findYhf(Integer teacherId){
	        String hql = "from TbConsultationRecord a where a.teacherId='"+teacherId+"' and a.advice!=null order by a.consultTime desc";
	         List<TbConsultationRecord> list=null;
	        list=getHibernateTemplate().find(hql);
	        return list;
	     }
		/**
		 * 根据导师teacherName查询该导师所有未回复的咨询记录
		 * @return 
		 * @throws Exception
		 * @author 陈紫丽 
		 * @Date 2019.03.22
		 */
		
		@SuppressWarnings("unchecked")
		public List<TbConsultationRecord> findWhf(Integer teacherId){
	        String hql = "from TbConsultationRecord a where a.teacherId='"+teacherId+"' and a.advice=null order by a.consultTime desc";
	         List<TbConsultationRecord> list=null;
	        list=getHibernateTemplate().find(hql);
	        return list;
	     }

       /**
        * 未回复查询并返回
        * 董冰雪
        * 2019.3.30
        * @param tbTeacher1
        * @return
        */
		public List<TbConsultationRecord>  findByNotReply(TbTeacher tbTeacher1) {
			
				String hql = "from TbConsultationRecord where teacherId='"+tbTeacher1.getTeacherId()+"' and advice is null order by consultTime desc";
				List<TbConsultationRecord> list=getHibernateTemplate().find(hql);	
			 return list;
			
		}
		
		   /**
	        * 已回复查询并返回
	        * 齐美琳
	        * 2019.3.30
	        * @param tbTeacher2
	        * @return
	        */
			public List<TbConsultationRecord>  findByreadyReply(TbTeacher tbTeacher1) {
				
					String hql = "from TbConsultationRecord where teacherId='"+tbTeacher1.getTeacherId()+"' and advice is  not  null order by consultTime desc";
					List<TbConsultationRecord> list=getHibernateTemplate().find(hql);	
				 return list;
				
			}


			
			 /**
		        * 已打赏查询并返回
		        * 陈紫丽
		        * 2019.4.2
		        * @param tbTeacher1
		        * @return
		        */
				public List<TbConsultationRecord>  findyds(TbTeacher tbTeacher1) {
					
						String hql = "from TbConsultationRecord where teacherId='"+tbTeacher1.getTeacherId()+"' and exceptionalStatus=1 order by consultTime desc";
						List<TbConsultationRecord> list=getHibernateTemplate().find(hql);	
					 return list;
					
				}

			

			/**
		        * 未打赏
		        * 董冰雪
		        * 2019.4.2
		        * @param tbTeacher1
		        * @return
		        */
				public List<TbConsultationRecord>  findByReward(TbTeacher tbTeacher1) {
					
						String hql = "from TbConsultationRecord where teacherId='"+tbTeacher1.getTeacherId()+"' and exceptionalStatus=0 and advice is not null order by consultTime desc";
						
						List<TbConsultationRecord> list=getHibernateTemplate().find(hql);	
					 return list;
					
				}

/**
 * 根据导师teacherName查询该导师所有已打赏的咨询记录
 * @return 
 * @throws Exception
 * @author 陈紫丽 
 * @Date 2019.03.22
 */
		
@SuppressWarnings("unchecked")
public List<TbConsultationRecord> findYds(Integer teacherId){
    String hql = "from TbConsultationRecord a where a.teacherId='"+teacherId+"' and a.exceptionalStatus=1 order by a.consultTime desc";
     List<TbConsultationRecord> list=null;
    list=getHibernateTemplate().find(hql);
    return list;
 }
/**
 * 根据导师teacherName查询该导师所有未打赏的咨询记录
 * @return 
 * @throws Exception
 * @author 陈紫丽 
 * @Date 2019.03.22
 */

@SuppressWarnings("unchecked")
public List<TbConsultationRecord> findWds(Integer teacherId){
    String hql = "from TbConsultationRecord a where a.teacherId='"+teacherId+"' and a.exceptionalStatus=0 and a.advice is not null order by a.consultTime desc";
     List<TbConsultationRecord> list=null;
    list=getHibernateTemplate().find(hql);
    return list;
 }

    public Result<Object[]> findRecordList(TbConsultationRecord tbConsultationRecord, int page, int size, String teacherName) {
		int start=(page-1)*size;
		int limit =size;
		StringBuffer sb = new StringBuffer();
		sb.append("select b.open_id,a.teacher_name,b.symptom_description,b.consult_time,b.advice,b.advice_time,b.additional_advice,b.additional_advice_time,b.exceptional_status,b.water_number,b.record_id from tb_teacher a right join tb_consultation_record b on a.teacher_id=b.teacher_id where 1=1 ");

		if(null!=teacherName && !teacherName.equals("")){
			sb.append(" and a.teacher_name like '%"+teacherName+"%' ");
		}
		if(null != tbConsultationRecord.getConsultTime2() && tbConsultationRecord.getConsultTime2()!=null){
			sb.append(" and b.consult_time between '"+tbConsultationRecord.getConsultTime2().toString()+"' and '"+tbConsultationRecord.getConsultTime3().toString()+"' ");
		}
		sb.append("order by b.consult_time desc limit "+start+","+limit);
		final String sql = sb.toString();
		List<Object[]> list = getHibernateTemplate().execute(new HibernateCallback<List>() {
			@Override
			public List doInHibernate(Session session) throws HibernateException {
				SQLQuery query = session.createSQLQuery(sql);
				return query.list();
			}
		});

		if(list.size() == 0){
			list = null;
		}

		Result result = new Result(start, limit);
		result.setData(list);



		if (start == -1 && limit == -1) {
			result.setTotal(list.size());
		}

		return result;
    }

    /**
     * @Author zuofengwei
     * @Description 获取咨询记录表的总记录数
     * @Date 2019/5/22 13:01
     * @param
     * @return java.lang.Long
     **/
    public Long getTotal() {
		final String sql = "select count(*) from tb_consultation_record ";
		Object object = getHibernateTemplate().execute(new HibernateCallback<Object>() {
			@Override
			public Object doInHibernate(Session session) throws HibernateException {
				SQLQuery query = session.createSQLQuery(sql);
				return query.uniqueResult();
			}
		});

		return new Long(object.toString());
	}


}
