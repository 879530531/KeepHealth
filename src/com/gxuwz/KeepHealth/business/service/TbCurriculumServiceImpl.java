package com.gxuwz.KeepHealth.business.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gxuwz.KeepHealth.SystemContext;
import com.gxuwz.KeepHealth.business.dao.TbCurriculumDao;
import com.gxuwz.KeepHealth.business.entity.TbCurriculum;

@Service("tbCurriculumService")
public class TbCurriculumServiceImpl implements TbCurriculumService{

	@Autowired
	TbCurriculumDao tbCurriculumDao;

	@Override
	public void add(TbCurriculum tbCurriculum) {
		tbCurriculumDao.save(tbCurriculum);
		
	}

	@Override
	public void edit(TbCurriculum tbCurriculum) {
		tbCurriculumDao.update(tbCurriculum);
		
	}

	@Override
	public TbCurriculum findById(int curriculumId) {
		// TODO Auto-generated method stub
		return tbCurriculumDao.findById(curriculumId);
	}

	@Override
	public String uploadImg(HttpServletRequest request, File imgFile, String ex) {
		String date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		String secondDate = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		String savePath = request.getServletContext().getRealPath(SystemContext.IMG)+"/"+date+"/";
		String url = request.getContextPath()+SystemContext.IMG+ date+"/";
		String newFileName= secondDate+ new Random().nextInt(1000)+"."+ex;  //文件名
		//创建目录和文件
		File uploadFile = new File(savePath+newFileName);
		if(!uploadFile.getParentFile().exists()){
			uploadFile.getParentFile().mkdirs();
		}
		try {
			uploadFile.createNewFile();
			FileUtils.copyFile(imgFile, uploadFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
		//返回文件url
		return url + newFileName;
	}

	@Override
	public String uploadAudio(HttpServletRequest request, File imgFile,String issueId, String ex) {
		String date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		String secondDate = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		String savePath = request.getServletContext().getRealPath(SystemContext.MP3)+"/"+issueId+"/";
		String url = request.getContextPath()+SystemContext.MP3+ issueId+"/";
		String newFileName= secondDate+ new Random().nextInt(1000)+"."+ex;  //文件名
		//创建目录和文件
		File uploadFile = new File(savePath+newFileName);
		if(!uploadFile.getParentFile().exists()){
			uploadFile.getParentFile().mkdirs();
		}
		try {
			uploadFile.createNewFile();
			FileUtils.copyFile(imgFile, uploadFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
		//返回文件url
		return url + newFileName;
	}
}
