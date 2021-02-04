
package com.gxuwz.KeepHealth.business.dao;

import org.springframework.stereotype.Repository;

import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.gxuwz.KeepHealth.business.entity.SysRoleRight;
import com.gxuwz.KeepHealth.business.entity.SysUser;
import com.gxuwz.KeepHealth.business.entity.TbPersonalData;
import com.gxuwz.core.dao.impl.BaseDaoImpl;
import com.gxuwz.core.pagination.Result;

/**
 * 
 * @ClassName: WxLoginDAO 
 * @Description:  微信登录DAO层
 * @author 软件开发中心  莫然源
 * @date 2017年7月7日 下午9:36:25
 */
@Repository("WxLoginDAO")
public class WxLoginDAO extends BaseDaoImpl<TbPersonalData>{

	/**
	 * 根据property属性的值value获取对象
	 * @param property SysUser对象的属性
	 * @param value 值
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public TbPersonalData findWxLoginByProperty(String property,String value){
		TbPersonalData tbPersonalData = null;
	
		String hql = "from TbPersonalData where "+property+" = '"+value+"'";
		List<TbPersonalData> list = this.getHibernateTemplate().find(hql);
		if(null != list && 0<list.size()){
			tbPersonalData = list.get(0);
		}
		return tbPersonalData;
	}


	/**
	 * 根据用户id查询用户的权限id
	 * @param userId
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<SysRoleRight> findUserPermissions(String userId) {
		String queryString="select new com.gxuwz.Market.business.entity.SysRoleRight(srr.rightId) " +
				   "from SysUser su,SysUserRole sur,SysRole sr,SysRoleRight srr "+
		           "where su.userId=sur.userId and sur.roleId=sr.roleId and sr.roleId=srr.roleId and su.userId='"+userId+"'";
		return getHibernateTemplate().find(queryString);
	}
}