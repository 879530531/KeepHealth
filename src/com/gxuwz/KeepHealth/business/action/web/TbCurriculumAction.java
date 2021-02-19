package com.gxuwz.KeepHealth.business.action.web;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.gxuwz.KeepHealth.SystemContext;
import com.gxuwz.KeepHealth.business.entity.TbCurriculum;
import com.gxuwz.KeepHealth.business.service.TbCurriculumService;
import com.gxuwz.KeepHealth.util.FileUtil;
import com.gxuwz.core.pagination.Result;
import com.gxuwz.core.web.action.BaseAction;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

public class TbCurriculumAction  extends BaseAction implements Preparable, ModelDriven<TbCurriculum>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	protected static final String ADD_JSP = "/WEB-INF/page/web/health_tbCurriculum/tbCurriculum_add.jsp";
	protected static final String EDIT_JSP = "/WEB-INF/page/web/health_tbCurriculum/tbCurriculum_edit.jsp";
	protected HttpServletRequest request = ServletActionContext.getRequest(); //request
	private Result<TbCurriculum> pageResult;//分页
	private TbCurriculum tbCurriculum;
	private List<TbCurriculum> list;
	private String actionState;
	private File wkAudio;
	private String wkAudioFileName;
	private File img;
	private String imgFileName;
	@Autowired
	private TbCurriculumService  tbCurriculumService;
	
	@Override
	public TbCurriculum getModel() {
		// TODO Auto-generated method stub
		return tbCurriculum;
	}

	@Override
	public void prepare() throws Exception {
		if(null == tbCurriculum){
			tbCurriculum = new TbCurriculum();
		}
		
	}
	
	public String openAdd() {
		setForwardView(ADD_JSP);
		return SUCCESS;
	}
	public String addTbCurriculum() {
		if(img !=null){ 
			String ex = imgFileName.substring(imgFileName.lastIndexOf(".")+1); 
			String imgUrl = tbCurriculumService.uploadImg(request, img, ex);
			tbCurriculum.setPicture(imgUrl);
		}
		if(wkAudio !=null){ 
			String ex = wkAudioFileName.substring(wkAudioFileName.lastIndexOf(".")+1); 
			String path = tbCurriculumService.uploadAudio(request, wkAudio, String.valueOf(tbCurriculum.getIssueId()), ex);
			tbCurriculum.setAudio(path);
			tbCurriculum.setFileSize(String.valueOf(wkAudio.length()));
			tbCurriculum.setDuration(FileUtil.Mp3Time(request.getServletContext().getRealPath("/")+path));
		}
		
		tbCurriculumService.add(tbCurriculum);
		//System.out.print(tbCurriculum);
		//setForwardView(ADD_JSP);
		return SUCCESS;
	}
	public String openeditTbCurriculum() {
		int curriculumId = Integer.parseInt(request.getParameter("curriculumId"));
		tbCurriculum = tbCurriculumService.findById(curriculumId);
		setForwardView(EDIT_JSP);
		return SUCCESS;
	}
	public String editTbCurriculum() {
		if(img !=null){ 
			String path = request.getServletContext().getRealPath("/")+tbCurriculum.getPicture();
			FileUtil.delectFile(path);
			String ex = imgFileName.substring(imgFileName.lastIndexOf(".")+1); 
			String imgUrl = tbCurriculumService.uploadImg(request, img, ex);
			tbCurriculum.setPicture(imgUrl);
		}
		if(wkAudio !=null){ 
			String pathDel = request.getServletContext().getRealPath("/")+tbCurriculum.getAudio();
			FileUtil.delectFile(pathDel);
			String ex = wkAudioFileName.substring(wkAudioFileName.lastIndexOf(".")+1); 
			String path = tbCurriculumService.uploadAudio(request, wkAudio, String.valueOf(tbCurriculum.getIssueId()), ex);
			tbCurriculum.setAudio(path);
			tbCurriculum.setFileSize(String.valueOf(wkAudio.length()));
			tbCurriculum.setDuration(FileUtil.Mp3Time(request.getServletContext().getRealPath("/")+path));
		}
		
		tbCurriculumService.edit(tbCurriculum);
		return SUCCESS;
	}

	public Result<TbCurriculum> getPageResult() {
		return pageResult;
	}

	public void setPageResult(Result<TbCurriculum> pageResult) {
		this.pageResult = pageResult;
	}

	public TbCurriculum getTbCurriculum() {
		return tbCurriculum;
	}

	public void setTbCurriculum(TbCurriculum tbCurriculum) {
		this.tbCurriculum = tbCurriculum;
	}

	public List<TbCurriculum> getList() {
		return list;
	}

	public void setList(List<TbCurriculum> list) {
		this.list = list;
	}

	public String getActionState() {
		return actionState;
	}

	public void setActionState(String actionState) {
		this.actionState = actionState;
	}

	public File getWkAudio() {
		return wkAudio;
	}

	public void setWkAudio(File wkAudio) {
		this.wkAudio = wkAudio;
	}

	public String getWkAudioFileName() {
		return wkAudioFileName;
	}

	public void setWkAudioFileName(String wkAudioFileName) {
		this.wkAudioFileName = wkAudioFileName;
	}

	public File getImg() {
		return img;
	}

	public void setImg(File img) {
		this.img = img;
	}

	public String getImgFileName() {
		return imgFileName;
	}

	public void setImgFileName(String imgFileName) {
		this.imgFileName = imgFileName;
	}




}
