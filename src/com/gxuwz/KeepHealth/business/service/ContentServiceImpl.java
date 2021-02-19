package com.gxuwz.KeepHealth.business.service;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;





import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gxuwz.core.pagination.Result;
import com.gxuwz.KeepHealth.SystemContext;
import com.gxuwz.KeepHealth.business.dao.ContentDao;
import com.gxuwz.KeepHealth.business.entity.Content;
import com.gxuwz.KeepHealth.business.entity.TbPersonalData;
import com.gxuwz.KeepHealth.business.service.ContentService;

@Service("contentService")
public class ContentServiceImpl implements ContentService{
	@Autowired
	private ContentDao dao;
	
	public String saveMessage(HttpServletRequest request,String title,String content) {
		FileOutputStream out = null;
		String date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		String newFileName = title+".txt";
		String src = request.getServletContext().getRealPath(SystemContext.RES)+date+"/"+newFileName;
		String url = request.getContextPath()+SystemContext.RES + date+"/";
		File file = new File(src);
		if(!file.getParentFile().exists()){
			file.getParentFile().mkdirs();
		}
		try {
			while(file.exists()){
				newFileName = newFileName.replaceAll(".txt", new Random().nextInt(10)+".txt");
				src = request.getServletContext().getRealPath(SystemContext.RES)+date+"/"+newFileName;
				file = new File(src);
			}
			file.createNewFile();
			out = new FileOutputStream(file);
			out.write(content.getBytes("utf-8"));
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(out!=null){
			    try {
					out.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return url+newFileName;
	}

	@Override
	public String loadContent(File srcFile) {
		StringBuilder sb = new StringBuilder();
		String content=null;
		FileInputStream in =null;
		InputStreamReader read = null;
		BufferedReader bufferedReader =null;
		try {
			in = new FileInputStream(srcFile);
			read = new InputStreamReader(in,"utf-8");
			bufferedReader = new BufferedReader(read);
			String s = null;
			while( (s=bufferedReader.readLine())!=null ){
				sb.append(s);
			}
			content = sb.toString();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				in.close();
				read.close();
				bufferedReader.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return content;
	}
	
	
	@Override
	public String uploadImg(HttpServletRequest request, File imgFile,String ex) {
		String date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		String secondDate = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		String savePath = request.getServletContext().getRealPath(SystemContext.IMG)+"/"+date+"/";
		String url = request.getContextPath()+SystemContext.IMG+"/"+ date+"/";
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

	public void save(Content entity) {
		dao.save(entity);
	}

	@Override
	public Content findById(Serializable id) {
		return dao.get(Content.class,id);
	}

	@Override
	public void delete(Content entity) {
		dao.remove(entity);
	}

	@Override
	public void update(Content entity) {
		dao.update(entity);
	}

	@Override
	public Result<Content> coverNewsList(Content content, int page, int row) {
		return dao.coverNewsList(content,page,row);
	}
	
	@Override
	public List<Content> coverNewsList(Content content) {
		return dao.coverNewsList(content);
	}

	@Override
	public Result<Content> findByPage(Content content, int page, int row) {
		return dao.findByPage(content, page, row);
	}

	@Override
	public List<Object[]> pool() {
		return dao.pool();
	}

}
