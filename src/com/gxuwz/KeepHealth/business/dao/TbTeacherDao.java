package com.gxuwz.KeepHealth.business.dao;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.springframework.jdbc.object.SqlQuery;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.stereotype.Repository;

import com.gxuwz.KeepHealth.business.entity.TbPersonalData;
import com.gxuwz.KeepHealth.business.entity.SysUser;
import com.gxuwz.KeepHealth.business.entity.TbConsultationRecord;

import com.gxuwz.KeepHealth.business.entity.TbTeacher;
import com.gxuwz.core.dao.impl.BaseDaoImpl;
import com.gxuwz.core.pagination.Result;
/**
 * 与咨询老师表相关的数据交互Dao层
 * @author 叶城廷
 * @version 2019.03.01
 *
 */
@Repository
public class TbTeacherDao extends BaseDaoImpl<TbTeacher>{
	/**
	 * 根据条件查找分页
	 * @param TbTeacher 模型
	 * @param page 第几页
	 * @param row 长度
	 * @return
	 * @author 陈紫丽
	 * @date 2019.03.04
	 */
	@SuppressWarnings("unchecked")
	public Result<TbTeacher> queryTeacherList(String string, int page, int size) {
		String queryString= "from TbTeacher where (teacherId like '%"+string+"%' or teacherName like '%"+string+"%' or openId like '%"+string+"%') and isDelete != '1' order by topId desc";
		int start=(page-1)*size;
		int limit =size;
		return (Result<TbTeacher>)super.find(queryString, null, null, start, limit);
	}
	/**
	 * 根据条件查找分页
	 * @param TbTeacher 模型
	 * @param page 第几页
	 * @param row 长度
	 * @return
	 * @author 陈紫丽
	 * @date 2019.03.04
	 */
	@SuppressWarnings("unchecked")
	public Result<TbTeacher> find(String string, int page, int size){
		
		
		
		//先全部列出
		String queryString = "from TbTeacher where 1=1 and isDelete != '1' order by topId desc";
		
		//		String queryString = "from TbPersonalData p left join TbFinance f on p.personalId=f.mentorId where 1=1 and p.flag_type= '"+tbPersonalData.getFlagType()+"'";


		//如果对象中有值，则进行模糊查询
//		if(null != tbReadDevice.getReadId()){
//			queryString = queryString + " and read_id like '%"+tbReadDevice.getReadId()+"%'";
//		}
//		if(null != tbReadDevice.getReadNumber()){
//			queryString = queryString + " and read_number like '%"+tbReadDevice.getReadNumber()+"%'";
//		}
//		if(null != tbReadDevice.getReadFilePath()){
//			queryString = queryString + " and read_file_path like '%"+tbReadDevice.getReadFilePath()+"%'";
//		}
//		if(null != TbFinance.getBalance()){
//			queryString = queryString + " and balance like '%"+TbFinance.getBalance()+"%'";
//		
		
		int start=(page-1)*size;
		int limit =size;
		return (Result<TbTeacher> )super.find(queryString, null, null, start, limit);
		
	}
	/**
	 * 验证手机号是否重复
	 * @param teacherPhone
	 * @author 陈紫丽
	 * @data 2019.03.04
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<TbTeacher> checkTeacherPhone(String teacherPhone){
		String hql = "from TbTeacher where teacherPhone = '"+teacherPhone+"' and isDelete = 0";
		return this.getHibernateTemplate().find(hql);
	}

	public Result<TbTeacher> queryTeacherListByQueryText(String string, int page, int size) {
		
			String queryString= "from TbTeacher where teacherId like '%"+string+"%' or teacherName like '%"+string+"%'";
		
					
		int start=(page-1)*size;
		int limit =size;
		return (Result<TbTeacher>)super.find(queryString, null, null, start, limit);
	}

	/**
	 * 查询最大个人Number
	 * @param 
	 * @author 陈紫丽
	 * @data 2019.03.10
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<TbPersonalData> findMaxPersonalNumber(){
		String hql = "select max(personalNumber) from TbPersonalData ";
		return this.getHibernateTemplate().find(hql);
	}
	  /**
	   * @author 陈紫丽
	   * @data 2019.03.21
     * 查询所有导师
     */
    @SuppressWarnings("unchecked")
    public TbTeacher findByTeacherPhone(String teacherPhone){
    	TbTeacher TbTeacher1 = null;
        String hql = "from TbTeacher where teacherPhone='"+teacherPhone+"' and isDelete = 0";

        List<TbTeacher> list = this.getHibernateTemplate().find(hql);
		if(null != list && 0<list.size()){
			TbTeacher1 = list.get(0);
		}
        //TbTeacher1=(TbTeacher) getHibernateTemplate().find(hql).get(0);    

		return TbTeacher1;
    }

    /**
     * 查询所有导师
     */
    @SuppressWarnings("unchecked")
    public TbTeacher findByID(int teacherId){
    	TbTeacher tbTeacher = null;
        String hql = "from TbTeacher where teacherId='"+teacherId+"'";
        List<TbTeacher> list = this.getHibernateTemplate().find(hql);
		if(null != list && 0<list.size()){
			tbTeacher = list.get(0);
		}
		return tbTeacher;
    }
    /**
	 * 修改密码信息
	 * @param tbTeacher 模型
	 * @return
	 * @author 陈紫丽
	 * @date 2019.03.30
	 */
 
    public void updateTeacherPasswork(TbTeacher a){
        String hql = "update TbTeacher set teacherPasswork='"+a.getTeacherPasswork()+"'where teacherId="+a.getTeacherId()+"";
         getHibernateTemplate().bulkUpdate(hql);
        }
    /**
  	 * 删除
  	 * @param tbTeacher 模型
  	 * @return
  	 * @author 陈紫丽
  	 * @date 2019.05.6
  	 */
   
      public void list1(int teacherId){
    	 // TbTeacher tbTeacher = findByID(teacherId);
         //tbTeacher.setIsDelete(isDelete);
          String hql = "update TbTeacher set isDelete='1',openId=null where teacherId='"+teacherId+"'";
           getHibernateTemplate().bulkUpdate(hql);
          }
    
      
      
      public List<TbTeacher> getByTeacherName(){
      	String hql = "from TbTeacher";
      	return (List<TbTeacher>) getHibernateTemplate().find(hql);
      } 
      
    public TbTeacher getByTeacherId(Integer teacherId){
    	String hql = "from TbTeacher where teacherId='"+teacherId+"'";
    	return (TbTeacher) getHibernateTemplate().find(hql).get(0);
    }

	public TbTeacher getByTeacherName(String teacherName) {
		String hql = "from TbTeacher where teacherName='"+teacherName+"'";
		return (TbTeacher) getHibernateTemplate().find(hql).get(0);
	}

	/**
	 * @Author zuofengwei
	 * @Description 获得topId的最大值
	 * @Date 2019/5/9 15:41
	 * @param
	 * @return int
	 **/
	public int getMaxNumber() {
      	List list = getHibernateTemplate().execute(new HibernateCallback<List>() {
			String sql = "select max(t.top_id) from tb_teacher t ";
			@Override
			public List doInHibernate(Session session) throws HibernateException, SQLException {
				SQLQuery query = session.createSQLQuery(sql);
				return query.list();
			}
		});
      	return (Integer) list.get(0);
	}

    public int getMinNumber() {
		List list = getHibernateTemplate().execute(new HibernateCallback<List>() {
			String sql = "select min(t.top_id) from tb_teacher t ";
			@Override
			public List doInHibernate(Session session) throws HibernateException, SQLException {
				SQLQuery query = session.createSQLQuery(sql);
				return query.list();
			}
		});
		return (Integer) list.get(0);
    }

    public TbTeacher getByTeacherNameLike(String teacherName) {
		String hql = "from TbTeacher where teacherName like '%"+teacherName+"%'";
		return (TbTeacher) getHibernateTemplate().find(hql).get(0);
    }
}
