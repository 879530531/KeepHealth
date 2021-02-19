package com.gxuwz.KeepHealth.business.service;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import com.gxuwz.KeepHealth.business.entity.TbCurriculum;

public interface TbCurriculumService {
	/**
	 * 添加微课
	 * @author 邓开明
	 * @param tbCurriculum
	 */
	public void add(TbCurriculum tbCurriculum);
	/**
	 * 修改微课
	 * @author 邓开明
	 * @param tbCurriculum
	 */
	public void edit(TbCurriculum tbCurriculum);
	/**
	 * 根据微课编号查询微课信息
	 * @author 邓开明
	 * @param curriculumId
	 * @return
	 */
	public TbCurriculum findById(int curriculumId);
	/**
	 * 上传图片
	 * @author 邓开明
	 * @param request
	 * @param imgFile
	 * @param ex
	 * @return
	 */
	public String uploadImg(HttpServletRequest request, File imgFile, String ex);
	/**
	 * 上传音频
	 * @author 邓开明
	 * @param request
	 * @param imgFile
	 * @param issueId
	 * @param ex
	 * @return
	 */
	public String uploadAudio(HttpServletRequest request, File imgFile,String issueId, String ex);
}
