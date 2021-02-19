package com.gxuwz.KeepHealth.business.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.gxuwz.KeepHealth.business.entity.SysUser;
import com.gxuwz.KeepHealth.business.entity.TbPersonalData;
import com.gxuwz.KeepHealth.business.entity.TbReadme;
import com.gxuwz.KeepHealth.business.entity.Untreated;
import com.gxuwz.KeepHealth.business.entity.Healthdata;
import com.gxuwz.KeepHealth.business.entity.Vip;
import com.gxuwz.core.dao.impl.BaseDaoImpl;
import com.gxuwz.core.pagination.Result;


@Repository("TbPersonalDataDAO")
public class TbPersonalDataDAO extends BaseDaoImpl<TbPersonalData>{
	
    
    /**
     * 查询所有导师
     */
    @SuppressWarnings("unchecked")
    public List<TbPersonalData> findTh(){
        String hql = "from TbPersonalData where flagType=1 order by personalNumber desc";
        List<TbPersonalData> list=getHibernateTemplate().find(hql);    
        
     return list;
    }
    /**
     * 查询所有导师
     */
    @SuppressWarnings("unchecked")
    public TbPersonalData findByPersonalNumber(String personalNumber){
    	TbPersonalData tbPersonalData1 = null;
        String hql = "from TbPersonalData where personalNumber='"+personalNumber+"'";
        List<TbPersonalData> list=getHibernateTemplate().find(hql);    
        if(null != list && 0<list.size()){
        	for(int i=0;i<list.size();i++){
        		tbPersonalData1 = list.get(i);
    			//System.out.println("---list"+list.get(i++));
        	}
			
		}
		return tbPersonalData1;
    }
    /**
     * 查询所有导师
     */
    @SuppressWarnings("unchecked")
    public TbPersonalData findByID(int personalId){
    	TbPersonalData tbPersonalData = null;
        String hql = "from TbPersonalData where personalId='"+personalId+"'";
        List<TbPersonalData> list = this.getHibernateTemplate().find(hql);
		if(null != list && 0<list.size()){
			tbPersonalData = list.get(0);
		}
		return tbPersonalData;
    }
    
    /**
     * 查询所有普通导师
     */
    @SuppressWarnings("unchecked")
    public List<TbPersonalData> findThp(){
        String hql = "from TbPersonalData where flagType=1 and (level=0 or level=1)";
        List<TbPersonalData> list=getHibernateTemplate().find(hql);    
        
     return list;
    }
    
    /**
     * 查询所有会员
     */
    @SuppressWarnings("unchecked")
    public List<TbPersonalData> findMember(){
        String hql = "from TbPersonalData where flagType=0";
        List<TbPersonalData> list=getHibernateTemplate().find(hql);    
        
     return list;
    }
    
//    /**
//     * 根据personalName查询对象
//     * @author 杨世宇
//     * @date 2017.05.15
//     */
//    public TbPersonalData fingByPersonalName(String personalName){
//		return getHibernateTemplate().get(TbPersonalData.class,personalName);
//	}
//   
   
	/**
	 * 根据property属性的值value获取对象
	 * @param property SysUser对象的属性
	 * @param value 值
     * @author 杨世宇
     * @date 2017.05.15
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public TbPersonalData findByProperty(String property,String value){
		TbPersonalData tbPersonalData = null;
		String hql = "from TbPersonalData where "+property+" = '"+value+"'";
		List<TbPersonalData> list = this.getHibernateTemplate().find(hql);
		if(null != list && 0<list.size()){
			tbPersonalData = list.get(0);
		}
		return tbPersonalData;
	}

	@SuppressWarnings("unchecked")
	public TbPersonalData fingByMobilePhone(String userName){
		TbPersonalData tbPersonalData = null;
		tbPersonalData = this.findByProperty("mobilePhone", userName);
		if(null == tbPersonalData){
			tbPersonalData = this.findByProperty("personalNumber", userName);
		}
		return tbPersonalData;
	}

    
    
    /**
     * 根据条件查找分页
     * @param tbPersonalData 模型
     * @param page 第几页
     * @param row 长度
     * @return
     * @author 陆云秋
     * @date 2017.03.22
     */
    @SuppressWarnings("unchecked")
    public Result<Vip> findMember(Vip vip,int page, int size){
        String queryString = "select new com.gxuwz.KeepHealth.business.entity.Vip(" +
        		"a.personalNumber,a.realName,a.mobilePhone,a.startTime,a.endTime,DATEDIFF(endTime,startTime) as surplusDay) " +
        		"from TbPersonalData a" +
        		" where 1=1 and a.flagType=0 and a.startTime !=''";
        //System.out.println("GJHKd45J"+vip.getPersonalNumber());
        if(null != vip.getPersonalNumber()){
        	
        	queryString = queryString + " and a.personalNumber like '%"+vip.getPersonalNumber()+"%'";
			
		}
        if(null != vip.getRealName()){
        	
			queryString = queryString + " and a.realName like '%"+vip.getRealName()+"%'";
		}
        int start=(page-1)*size;
        int limit =size;
        return (Result<Vip> )super.find(queryString, null, null, start, limit);
    }
	/**
	 * 修改密码信息
	 * @param tbPersonalData 模型
	 * @return
	 * @author 莫然源
	 * @date 2017.04.26
	 */
 
    public void updatePassword(TbPersonalData a){
        String hql = "update TbPersonalData set password='"+a.getPassword()+"'where personalId="+a.getPersonalId()+"";
         getHibernateTemplate().bulkUpdate(hql);
        }
	/**
	 * 修改个人信息
	 * @param tbPersonalData 模型
	 * @return
	 * @author 莫然源
	 * @date 2017.04.26
	 */
 
    public void update1(TbPersonalData a, int flagtype){
        String hql = "update TbPersonalData set  name='"+a.getName()+"', qq='"+a.getQq()+"',mobilePhone='"+a.getMobilePhone()+"', professional='"+a.getProfessional()+"' ,address='"+a.getAddress()+"',email='"+a.getEmail()+"'";
        if(1==flagtype){
        	hql+=",introduction='"+a.getIntroduction()+"'";
        }else{
        	hql+=",birthday='"+a.getBirthday()+"'";
        }
        hql+=" where personalId="+a.getPersonalId()+"";
        getHibernateTemplate().bulkUpdate(hql);
        }
	
	/**
	 * 根据条件查找分页
	 * @param tbPersonalData 模型
	 * @param page 第几页
	 * @param row 长度
	 * @return
	 * @author 杨世宇
	 * @date 2017.03.22
	 */
	@SuppressWarnings("unchecked")
	public Result<TbPersonalData> find(TbPersonalData tbPersonalData, int page, int size){
		//先全部列出
		String queryString = "from TbPersonalData where 1=1 and flag_type= '"+tbPersonalData.getFlagType()+"'";

		//如果对象中有值，则进行模糊查询
		if(null != tbPersonalData.getPersonalNumber()){
			queryString = queryString + " and personal_number like '%"+tbPersonalData.getPersonalNumber()+"%'";
		}
		if(null != tbPersonalData.getRealName()){
			queryString = queryString + " and real_name like '%"+tbPersonalData.getRealName()+"%'";
		}
		if(null != tbPersonalData.getMobilePhone()){
			queryString = queryString + " and mobile_phone like '%"+tbPersonalData.getMobilePhone()+"%'";
		}
		int start=(page-1)*size;
		int limit =size;
		return (Result<TbPersonalData> )super.find(queryString, null, null, start, limit);
	}
	
	/**
	 * 根据条件查找分页
	 * @param tbPersonalData 模型
	 * @param page 第几页
	 * @param row 长度
	 * @return
	 * @author 莫然源
	 * @date 2017.03.24
	 */
	@SuppressWarnings("unchecked")
	public Result<Untreated> findUntreated(Untreated untreated, int page, int size){
		String queryString = "select new com.gxuwz.KeepHealth.business.entity.Untreated(a.personalNumber,a.personalId, a.realName, b.readmeId, b.readmeContent,b.readmeTime) from TbPersonalData a,TbReadme b where a.personalId=b.personalId and a.flagType=0 and b.replyState=0 and b.fatherId=0";

	if(null != untreated.getPersonalNumber()){
		queryString = queryString + " and  a.personalNumber like'%"+untreated.getPersonalNumber()+"%'";
		//System.out.println("我执行了:"+untreated.getPersonalNumber());
	}
	if(null != untreated.getRealName()){
		queryString = queryString + " and a.realName like '%"+untreated.getRealName()+"%'";
		//System.out.println("我执行了:"+untreated.getRealName());
	}
	if(null != untreated.getUsertime()){
		queryString = queryString + " and b.readmeTime between '"+untreated.getUsertime().toString()+"' and '"+untreated.getUsertime1().toString()+"'";
		//System.out.println("我执行了:"+untreated.getUsertime());
	}
	int start=(page-1)*size;
	int limit =size;
	return (Result<Untreated> )super.find(queryString, null, null, start, limit);
}

	
	/**
	 * 根据条件查找分页
	 * @param tbPersonalData 模型
	 * @param page 第几页
	 * @param row 长度
	 * @return
	 * @author 莫然源
	 * @date 2017.03.24
	 */
	@SuppressWarnings("unchecked")
	public Result<Healthdata> findHealthdata(Healthdata healthdata, int page, int size){
		String queryString = "select new com.gxuwz.KeepHealth.business.entity.Healthdata( a.personalNumber,a.personalId, a.realName,a.mobilePhone,a.level,a.image,count(b.readmeId),sum(b.feedbackState)) from TbPersonalData a,TbReadme b where a.personalId=b.personalId and a.flagType=0";

	if(null != healthdata.getPersonalNumber()){
		queryString = queryString + " and  a.personalNumber like '%"+healthdata.getPersonalNumber()+"%'";
		//System.out.println("1.结果为："+healthdata.getPersonalNumber());
	}
	if(null != healthdata.getRealName()){
		queryString = queryString + " and a.realName like'%"+healthdata.getRealName()+"%'";
		//System.out.println("2.结果为："+healthdata.getPersonalNumber());
	}
	if(null != healthdata.getMobilePhone()){
		
		queryString = queryString + " and mobile_phone like '%"+healthdata.getMobilePhone()+"%'";
		//System.out.println("3.结果为："+healthdata.getPersonalNumber());
	}
	queryString = queryString + "group by a.personalId";
	int start=(page-1)*size;
	int limit =size;
	return (Result<Healthdata> )super.find(queryString, null, null, start, limit);
}
	
	
	
	public List<TbPersonalData> findByMentorId(List<TbReadme> tbReadmeList) {
		String  queryString = "from TbPersonalData where 1=1";
		if(null != tbReadmeList && tbReadmeList.size()>0){
			queryString = queryString +"and (";
			for(int i = 0 ; i<tbReadmeList.size();i++){
				if(i != tbReadmeList.size() -1){
					queryString = queryString + "(personalId ='"+tbReadmeList.get(i).getPersonalId()+"') or";
				}else{
					queryString = queryString + "(personalId ='"+tbReadmeList.get(i).getPersonalId()+"'))";
				}
				
			}
		}
		//System.out.println("queryString:"+queryString);
		return getHibernateTemplate().find(queryString);
	}
	/*//计算每个会员的所有咨询记录条数
	public ArrayList findByMemberId(List<TbPersonalData> tbPersonalDataList) {
		String hql = "";
		if(null != tbPersonalDataList && tbPersonalDataList.size()>0){
			for(int i = 0 ; i<tbPersonalDataList.size();i++){
				if(i != tbPersonalDataList.size() -1){
					hql = "select personalId count(readmeId) from TbReadme where personalId="+tbPersonalDataList.get(i).getPersonalId()+" and fatherId=0";
				}else{
					hql = "select count(readmeId) from TbReadme where personalId="+tbPersonalDataList.get(i).getPersonalId()+" and fatherId=0";
				}
				
			}
		}
		ArrayList list=(ArrayList) getHibernateTemplate().find(hql);
		return list;
	}*/
	
	@SuppressWarnings("unchecked")
	public List<TbPersonalData> findByPersonalId(int personalId){
		String hql = "from TbPersonalData where personalId='"+personalId+"'";
		return (List<TbPersonalData>)this.getHibernateTemplate().find(hql);
	}
	
	/**
	 * 验证手机号是否重复
	 * @param mobilePhone
	 * @author 杨世宇
	 * @data 2017.03.24
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<TbPersonalData> checkMobilePhone(String mobilePhone){
		String hql = "from TbPersonalData where mobilePhone = '"+mobilePhone+"'";
		return this.getHibernateTemplate().find(hql);
	}
	
	/**
	 * 查询最大个人Number
	 * @param mobilePhone
	 * @author 杨世宇
	 * @data 2017.04.10
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<TbPersonalData> findMaxPersonalNumber(){
		String hql = "select max(personalNumber) from TbPersonalData ";
		return this.getHibernateTemplate().find(hql);
	}

	
	public void updatePayNotes(int personalId,String startTime,String endTime,int level){  
        String queryString = "update TbPersonalData set startTime = '"+startTime+"',endTime= '"+endTime+"' ,Level= "+level+" where personalId="+personalId+"";  
        getHibernateTemplate().bulkUpdate(queryString);

		
	}
	
	public void updateData(String personalNumber,String mobilePhone,String password,String realName,int sex){  
        String queryString = "update TbPersonalData set mobilePhone= '"+mobilePhone+"' ,password= '"+password+"' ,realName='"+realName+"',sex="+sex+"  where personalNumber='"+personalNumber+"'";  
        getHibernateTemplate().bulkUpdate(queryString);

		
	}
	/**
	 * 所有导师查找分页
	 * @param tbPersonalData 模型
	 * @param page 第几页
	 * @param row 长度
	 * @return
	 * @author 莫然源
	 * @date 2017.05.26
	 */
	@SuppressWarnings("unchecked")
	public Result<TbPersonalData> findAllMentor(TbPersonalData tbPersonalData, int page, int size){

	String queryString = "from TbPersonalData where flagType=1";
	if(null != tbPersonalData.getPersonalNumber()){
		queryString = queryString + " and  personalNumber like'%"+tbPersonalData.getPersonalNumber()+"%'";
		//System.out.println("我执行了:"+tbPersonalData.getPersonalNumber());
	}
	if(null != tbPersonalData.getRealName()){
		queryString = queryString + " and realName like '%"+tbPersonalData.getRealName()+"%'";
		//System.out.println("我执行了:"+tbPersonalData.getRealName());
	}

	int start=(page-1)*size;
	int limit =size;
	return (Result<TbPersonalData>)super.find(queryString, null, null, start, limit);
}

	
	/**
	 * 查找所有导师
	 * @param tbPersonalData 模型
	 * @return
	 * @author 陈洁
	 * @date 2017.05.26
	 */
	@SuppressWarnings("unchecked")
	public List<TbPersonalData> findAllMentorExcel(TbPersonalData tbPersonalData){

	String queryString = "from TbPersonalData where flagType=1";
	if(null != tbPersonalData.getPersonalNumber()){
		queryString = queryString + " and  personalNumber like'%"+tbPersonalData.getPersonalNumber()+"%'";
		//System.out.println("我执行了:"+tbPersonalData.getPersonalNumber());
	}
	if(null != tbPersonalData.getRealName()){
		queryString = queryString + " and realName like '%"+tbPersonalData.getRealName()+"%'";
		//System.out.println("我执行了:"+tbPersonalData.getRealName());
	}
	return (List<TbPersonalData>)this.getHibernateTemplate().find(queryString);
}
	
}
