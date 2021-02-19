package com.gxuwz.KeepHealth.business.service;

import java.io.File;
import java.util.List;

import com.gxuwz.KeepHealth.business.entity.SysUser;
import com.gxuwz.KeepHealth.business.entity.TbPersonalData;
import com.gxuwz.KeepHealth.business.entity.Untreated;
import com.gxuwz.KeepHealth.business.entity.Healthdata;
import com.gxuwz.KeepHealth.business.entity.Vip;
import com.gxuwz.core.pagination.Result;
/**
 * 
* @ClassName: TbPersonalDataService 
* @Description:  用户管理Service接口
* @author 软件开发中心  莫然源
* @date 2017年7月7日 下午9:41:45
 */
public interface TbPersonalDataService {
	
	/**
	 * 根据条件查找分页
	 * @param page 第几页
	 * @param row 长度
	 * @author 杨世宇
	 * @date 2017.03.22
	 */
	public Result<TbPersonalData> find(TbPersonalData tbPersonalData,int page, int row);
	
    
    /**
     * 根据条件查找分页
     * @param page 第几页
     * @param row 长度
     */
    public Result<Vip> findMember(Vip tbPersonalData,int page, int row);
	
	/**
	 * 根据条件查找未处理咨询的分页
	 * @param page 第几页
	 * @param row 长度
	 * @author 莫然源
	 * @date 2017.03.24
	 */
    public Result<Untreated> findUntreated(Untreated untreated,int page, int row);
    
    
    
	/**
	 * 根据条件查找健康咨询的分页
	 * @param page 第几页
	 * @param row 长度
	 * @author 莫然源
	 * @date 2017.03.24
	 */
    public Result<Healthdata> findHealthdata(Healthdata healthdata,int page, int row);
	/**
	 * 根据用户编号查询用户对象
	 * @author 杨世宇
	 * @data 2017.03.24
	 */
	public TbPersonalData findByPersonalIdWeb(int findByPersonalId);
	/**
	 * 
	 * 根据personalName查询用户对象
	 * @author 杨世宇
	 * @data 2017.05.15
	 */
	public TbPersonalData findByPersonalNameWeb(String findByPersonalName);

	/**
	 * 
	 * 根据mobilePhone查询用户对象
	 * @author 杨世宇
	 * @data 2017.07.12
	 */
	public TbPersonalData fingByMobilePhone(String mobilePhone);
	
	/**
	 * 微信端用户注册
	 * @author 莫然源
	 * @data 2017.03.03
	 */
	public void add(TbPersonalData tbPersonalData);
	
	/**
	 * 微信端修改用户信息
	 * @author 莫然源
	 * @data 2017.03.21
	 */
	public void update(TbPersonalData tbPersonalData,int flagtype);
	/**
	 * 微信端修改密码
	 * @author 莫然源
	 * @data 2017.04.26
	 */
	public int updatePassword(TbPersonalData tbPersonalData,String oldPassword);
	
	/**
	 * 修改用户角色
	 * @author 杨世宇
	 * @data 2017.03.24
	 */
	public List<TbPersonalData> updateWeb(TbPersonalData tbPersonalData, File[] uploadFile,
			String[] uploadFileName, String[] imageType);
	
	/**
	 * 保存個人信息
	 * @author 杨世宇
	 * @data 2017.03.22
	 */
	public List<TbPersonalData> addWeb(TbPersonalData tbPersonalData, File[] uploadFile,
			String[] uploadFileName, String[] imageType);
	
	/**  
     * 根据设置的宽高等比例压缩图片文件<br> 先保存原文件，再压缩、上传  
     * @param oldFile  要进行压缩的文件  
     * @param newFile  新文件  
     * @param width  宽度 //设置宽度时（高度传入0，等比例缩放）  
     * @param height 高度 //设置高度时（宽度传入0，等比例缩放）  
     * @param quality 质量  
     * @author 杨世宇
     * @date 2017.04.18
     * @return 返回压缩后的文件的全路径  
     */    
    public List<TbPersonalData> zipImageFile(TbPersonalData tbPersonalData, File oldFile, int width, int height);	
    
    
	/**
	 * 检验用户编号是否存在
	 * @return
	 * @author 杨世宇
	 * @data 2017.03.24
	 */
	public boolean checkMobilePhone(String mobilePhone);
	
	/**
	 * 修改头像-微信
	 * @author 杨世宇
	 * @date 2017.04.27
	 */
	public void changeImg(int personalId, File[] uploadFile, String[] uploadFileName, String[] imageType);
	
	/**
	 * 添加用户角色
	 * @param sysUserRole
	 */
	public TbPersonalData find(TbPersonalData tbPersonalData);
	/**
	 * 根据id查找用户信息
	 * @author 莫然源
	 * @date 2017.03.30
	 */
	public TbPersonalData findById(int personalId);
	
	/**
	 * 删除用户
	 * @author 杨世宇
	 * @Date 2017.03.22
	 */
	public void delete(int personalId);
	
	
	/**
	 * 更新
	 * @author 黄子珍
	 * @date 2017.03.23
	 */
	public void updatePayNotes(int personalId,String startTime,String endTime,int level);
	
	public List<TbPersonalData> findTh();
	
	public List<TbPersonalData> findThp();
	
	
	public List<TbPersonalData> findMember();
	
	
	public List<TbPersonalData> findByPersonalId(int personalId);

    /**
     * 重置密码
     * @author 陆云秋
     * @Data 2017.05.06
     * */
	public int resetPwd(int personalId);
	
    /**
     * 重置导师密码
     * @author 莫然源
     * @Data 2017.05.15
     * */
	public void changePwd(int personalId);

	/*public ArrayList findByMemberId(List<TbPersonalData> tbPersonalDataList);*/
    
	/**
	 * 
	 * @param tbReadmeList
	 * @return
	 */
	/*public List<TbPersonalData> findByMentorId(List<TbReadme> tbReadmeList);*/

	/**
	 * 根据id删除用户角色
	 * @param sysUserRole
	 */
	// public void delete(String id);
	
	/**
	 * 根据用户编号查询出所有权限
	 * @param userId
	 * @return
	
	public List<TbAdvice> findByUserId(String userId);
	*/
	 public Result<TbPersonalData> findAllMentor(TbPersonalData tbPersonalData,int page, int row);
	 public List<TbPersonalData> findAllMentorExcel(TbPersonalData tbPersonalData);
}
