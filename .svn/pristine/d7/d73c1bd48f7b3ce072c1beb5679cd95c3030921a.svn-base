package com.gxuwz.KeepHealth.business.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.gxuwz.KeepHealth.business.entity.SysRight;
import com.gxuwz.KeepHealth.business.entity.TbAdvice;
import com.gxuwz.KeepHealth.business.entity.TbPersonalData;
import com.gxuwz.KeepHealth.business.entity.TbReadme;
import com.gxuwz.core.dao.impl.BaseDaoImpl;
import com.gxuwz.core.pagination.Result;
/**
 * 
* @ClassName: TbAdviceDAO 
* @Description: 調理建議表DAO
* @author 软件开发中心  陈洁 
* @date 2017年7月7日 上午10:11:50
 */
@Repository("sysAdvicetDAO")
public class TbAdviceDAO extends BaseDaoImpl<TbAdvice>{
	
	
	@SuppressWarnings("unchecked")
	/**
	 * 根据id统计导师服务记录条数
	 * @author 莫然源
	 * @date 2017.04.09
	 */
	public int findAD(int a){
		String hql = "from TbReadme where mentorId="+a+" and replyState=1 and fatherId=0";
		List<TbPersonalData> list=getHibernateTemplate().find(hql);	
	 return list.size();
	}
	/**
	 * 根据會員ID查詢所有調理建議
	 * @author 陈洁
	 * @date 2017.04.09
	 */
	@SuppressWarnings("unchecked")
	public List<TbAdvice> findByMemberId(int personalId){
		String hql = "from TbAdvice where memberId='"+personalId+"'";
		return (List<TbAdvice>)this.getHibernateTemplate().find(hql);
		
	}
	/**
	 * 根据健康自述ID查詢所有調理建議
	 * @author 陈洁
	 * @date 2017.04.09
	 */
	@SuppressWarnings("unchecked")
	public List<TbAdvice> findByReadmeId(int readmeId){
		String hql = "from TbAdvice where readmeId='"+readmeId+"' and fatherId=0";
		return (List<TbAdvice>)this.getHibernateTemplate().find(hql);
		
	}
	
	/*public List<TbAdvice> findByMemberId(List<TbReadme> tbReadmeList) {
		String  queryString = "from TbAdvice where 1=1";
		if(null != tbReadmeList && tbReadmeList.size()>0){
			queryString = queryString +"and (";
			for(int i = 0 ; i<tbReadmeList.size();i++){
				if(i != tbReadmeList.size() -1){
					queryString = queryString + "(memberId ='"+tbReadmeList.get(i).getPersonalId()+"') or";
				}else{
					queryString = queryString + "(memberId ='"+tbReadmeList.get(i).getPersonalId()+"'))";
				}
				
			}
		}
		System.out.println("queryString:"+queryString);
		return getHibernateTemplate().find(queryString);
	}
*/
	
	/**
	 * 根据条件查找分页
	 * @param SysRole 模型
	 * @param page 第几页
	 * @param row 长度
	 * @return
	 *
	@SuppressWarnings("unchecked")
	public Result<SysRight> find(SysRight sysRight, int page, int row){
		String queryString="from SysRight where 1=1";
		if(null != sysRight.getRightName()){
			queryString = queryString + " and rightName like '%"+sysRight.getRightName()+"%'";
		}
		int start=(page-1)*row;
		int limit =row;
		
		return (Result<SysRight>)super.find(queryString, null, null, start, limit);
	}
	/**
	 * 升序查询所有权限
	 * @return
	 *
	public List<SysRight> getAllRight(){
		String queryString="from SysRight where 1=1 order by rightSortOrder asc";
		return getHibernateTemplate().find(queryString);
	}*/
}
