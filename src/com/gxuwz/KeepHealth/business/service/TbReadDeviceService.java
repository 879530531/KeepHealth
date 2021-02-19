
package com.gxuwz.KeepHealth.business.service;

import java.io.File;
import java.util.List;

import com.gxuwz.KeepHealth.SystemContext;
import com.gxuwz.KeepHealth.business.entity.TbPersonalData;
import com.gxuwz.KeepHealth.business.entity.TbReadDevice;

import com.gxuwz.core.pagination.Result;

/**
 * 自助听读器管理Service接口类
 * @author yechengting
 *@version 2019.1.21
 */

public interface TbReadDeviceService {
	/**
	 * 根据条件查找分页
	 * @param page 第几页
	 * @param row 长度
	 * @author 陈紫丽
	 * @date 2019.01.24
	 */
	public Result<TbReadDevice> find(TbReadDevice tbReadDevice,int page, int row);
	/**
	 * 根据听读器编号查询听读器对象
	 * @author 陈紫丽
	 * @data 2019.01.27
	 */
	public TbReadDevice findByReadIdWeb(int readId);
	/**
	 * 删除听读器数据
	 * @author 陈紫丽
	 * @Date 2017.01.27
	 */
	public void delete(int readId);
	/**
	 * 保存听读器信息
	 * @author 陈紫丽
	 * @data 2019.01.31
	 */
	public List<TbReadDevice> addWeb(TbReadDevice tbPersonalData, File[] uploadFile,
			String[] uploadFileName, String[] fType);


/**
 * 听读器添加
 * @author 陈紫丽
 * @data 2019.01.31
 */
public void add(TbReadDevice tbReadDevice);
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
//public List<TbReadDevice> zipImageFile(TbReadDevice tbReadDevice, File oldFile);	
/**
 * 修改听读器
 * @author 陈紫丽
 * @data 2019.01.31
 */
public List<TbReadDevice> updateWeb(TbReadDevice tbReadDevice, File[] uploadFile,
		String[] uploadFileName, String[] imageType);
/**
 * 检验听读器数字编号是否存在
 * @return
 * @author 陈紫丽
 * @data 2019.01.31
 */


//public boolean checkReadNumber(String readNumber);
}
