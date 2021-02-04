package com.gxuwz.KeepHealth.business.service;

import java.io.File;
import java.io.Serializable;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.gxuwz.KeepHealth.business.entity.Content;
import com.gxuwz.core.pagination.Result;


public interface ContentService {
	
	/**
	 * 保存HTML编辑内容
	 * @param title 标题
	 * @param content 编辑器的内容
	 * @return 返回文件url
	 * @author  涛 @date:2017年4月6日
	 */
	public String saveMessage (HttpServletRequest request, String title,String content);
	
	/**
	 * 加载新闻内容，源文件地址存在OperateRecord实体的upload属性下
	 * @param srcFile 需要加载的内容源文件地址
	 * @return
	 * @author  涛 
	 * @date 2017年4月10日
	 */
	public String loadContent(File srcFile);
	
	/**
	 * 将图片保存到服务器/upload/images/目录对应的日期文件夹下，返回图片的url地址
	 * @param request
	 * @param imgFile 上传的源文件
	 * @param ex 文件扩展名
	 * @return 图片的url
	 * @author  涛 
	 * @date 2017年4月10日
	 */
	public String uploadImg(HttpServletRequest request, File imgFile, String ex);
	
	public void save(Content entity);
	public Content findById(Serializable id);
	public void delete(Content entity);
	public void update(Content entity);
	public Result<Content> coverNewsList(Content content, int page, int row);
	public Result<Content> findByPage(Content content, int page, int row);
	public List<Content> coverNewsList(Content content);
	/**
	 * 查找各个类型的内容的总数
	 * @author  涛 
	 * @date 2017年5月3日
	 */
	public List<Object[]> pool();
	
}
