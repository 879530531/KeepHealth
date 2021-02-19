package com.gxuwz.KeepHealth.business.service;


import java.io.File;
import java.util.List;

import com.gxuwz.KeepHealth.business.entity.TbConsumer;
import com.gxuwz.KeepHealth.business.entity.TbPersonalData;
import com.gxuwz.KeepHealth.business.entity.TbTeacher;
import com.gxuwz.core.pagination.Result;


import com.gxuwz.KeepHealth.business.entity.TbTeacher;
import com.gxuwz.core.pagination.Result;


public interface TbTeacherService {
	 Result<TbTeacher> queryTeacherList(String string, int page, int row);
	 /**
		 * 根据条件查找分页
		 * @param page 第几页
		 * @param row 长度
		 * @author 陈紫丽
		 * @date 2019.03.04
		 */
		public Result<TbTeacher> find(String string,int page, int row);
		/**
		 * 用户添加
		 * @author 陈紫丽
		 * @data 2019.03.04
		 */
		public void add(TbTeacher tbTeacher);
		
		/**
		 * 保存個人信息
		 * @author 陈紫丽
		 * @data 2019.03.04
		 */
		public List<TbTeacher> addWeb(TbTeacher tbTeacher, File[] uploadFile,
				String[] uploadFileName, String[] imageType);
		
		/**  
	     * 根据设置的宽高等比例压缩图片文件<br> 先保存原文件，再压缩、上传  
	     * @param oldFile  要进行压缩的文件  
	     * @param newFile  新文件  
	     * @param width  宽度 //设置宽度时（高度传入0，等比例缩放）  
	     * @param height 高度 //设置高度时（宽度传入0，等比例缩放）  
	     * @param quality 质量  
	     * @author 陈紫丽
	     * @date 2019.3.04
	     * @return 返回压缩后的文件的全路径  
	     */  
		 public List<TbTeacher> zipImageFile(TbTeacher tbTeacher, File oldFile, int width, int height);	
		    
		    
			/**
			 * 检验老师电话是否存在
			 * @return
			 * @author 陈紫丽
			 * @data 2019.03.04
			 */
			public boolean checkTeacherPhone(String teacherPhone);
			
			/**
			 * 修改头像-微信
			 * @author 杨世宇
			 * @date 2017.04.27
			 */
		//	public void changeImg(int personalId, File[] uploadFile, String[] uploadFileName, String[] imageType);
			/**
			 * 根据用户编号查询用户对象
			 * @author 陈紫丽
			 * @data 2019.03.04
			 */
			public TbTeacher findByTeacherIdWeb(int TeacherId);
			/**
			 * 修改用户
			 * @author 陈紫丽
			 * @data 2019.03.10
			 */
			public List<TbTeacher> updateWeb(TbTeacher tbTeacher, File[] uploadFile,
					String[] uploadFileName, String[] imageType);
			
	Result<TbTeacher> queryTeacherListByQueryText(String query, int page, int row);
	 /**
     * 重置老师密码
     * @author 陈紫丽
     * @Data 2018.03.10
     * */
	public void changePwd(int teacherId);
	 /**
     * 删除老师
     * @author 陈紫丽
     * @Data 2019.05.6
     * */
	public void delete(int teacherId);
    /**
     * 验证老师用户名
     * @param tbTeacher 被验证老师
     * @author 陈紫丽
     * @version 2019.03.09（3.20）
     * @return
     */
    TbTeacher queryTeacher(TbTeacher tbTeacher);

    /**
     * 检查老师是否首次登录，如首次登录补齐微信唯一码
     * @param tbTeacher 被检查老师
     * @param openId 微信唯一码
     * @author 陈紫丽
     * @version 2019.03.09（3.20）
     * @return
     */
    boolean queryFirstLogin(TbTeacher tbTeacher, TbConsumer tbConsumer);

    
    /**
	 * 微信端修改密码
	 * @author 陈紫丽
	 * @data 2019.03.30
	 */
	public int updatePassword(TbTeacher tbTeacher,String oldPassword,String teacherPasswork);
		List<TbTeacher> queryTeacher();

    TbTeacher findByTeacherId(Integer teacherId);

    /**
     * @Author zuofengwei
     * @Description 获得所有老师中topId的最大值
     * @Date 2019/5/9 15:27
     * @param
     * @return int
     **/
	int getMaxNumber();

	/**
	 * @Author zuofengwei
	 * @Description 置顶老师
	 * @Date 2019/5/9 15:43
	 * @param tbTeacher
	 * @param currMaxNum
	 * @return void
	 **/
	void updateTopId(TbTeacher tbTeacher, int currMaxNum);

	/**
	 * @Author zuofengwei
	 * @Description 更新老师
	 * @Date 2019/5/9 16:03
	 * @param teacher
	 * @return void
	 **/
	void updateTeacher(TbTeacher teacher);

	int getMinNumber();

	int getTopId(Integer teacherId);
	
	List<TbTeacher> findByTeacherName();

    TbTeacher findByTeacherNameLike(String teacherName);
}
