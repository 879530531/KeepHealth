package com.gxuwz.KeepHealth.business.action.web;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;


















import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;

import util.ImgUtil;

import com.gxuwz.KeepHealth.business.entity.Content;
import com.gxuwz.KeepHealth.business.entity.Healthdata;
import com.gxuwz.KeepHealth.business.entity.SysUser;
import com.gxuwz.KeepHealth.business.entity.TbPersonalData;
import com.gxuwz.KeepHealth.business.entity.Untreated;
import com.gxuwz.KeepHealth.business.entity.Vip;
import com.gxuwz.core.web.action.BaseAction;
import com.gxuwz.core.pagination.Result;
import com.gxuwz.KeepHealth.SystemContext;

import javax.servlet.http.HttpServletRequest;













import javax.servlet.http.HttpServletResponse;

import com.gxuwz.KeepHealth.business.service.ContentService;
//import com.gxuwz.KeepHealth.business.service.IOperateRecordService;
import com.gxuwz.KeepHealth.business.service.SysUserService;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

public class ContentAction extends BaseAction implements Preparable,ModelDriven{
	/**
	 * 
	 */
	private static final long serialVersionUID = -4104125263890869018L;
	protected final String LIST_JSP = "/WEB-INF/page/web/health_manage/Content_list.jsp";
	protected final String EDIT_JSP = "/WEB-INF/page/web/health_manage/Content_edit.jsp";
	protected final String SHOW_JSP="/template/news.jsp";
	protected final String MS_JSP="/WEB-INF/page/web/health_manage/Content_add.jsp";
	protected final String NEWS_LIST="/WEB-INF/page/web/health_manage/Content_list.jsp";
	protected final String DETAIL_JSP="/WEB-INF/page/web/health_manage/Content_detail.jsp";
	
	private Result<Content> pageResult;
	private Result<Content> videoResult;
	private Map<Integer,SysUser> map; //模拟数据库外键
	private String content;  //新闻编辑内容
	private Content con;
	private Integer status;// 0-失败，1-成功
	private File imgFile; //新闻内容图片
	private String imgFileFileName;
	private String imgFileContentType;
	private File coverImg; //新闻封面
	private String coverImgFileName;
	private String coverImgContentType;
	private String dir; //上传的文件类型。image表示图片，media表示视频
	protected HttpServletRequest request = ServletActionContext.getRequest(); //request
	
	@Autowired
	private ContentService contentService;
	@Autowired
	private ContentService orService;
	@Autowired
	private SysUserService userService;
	@Autowired
	//private IOperateRecordService operateRecordService;
	public void prepare() throws Exception {
		if(con==null){
			con = new Content();
		}
	}

	public String list(){
		
		pageResult = orService.findByPage(con,getPage(),getRow());
		forwardView = LIST_JSP;
		return SUCCESS;
	}
	public String delete(){
		
		con = orService.findById(con.getId());
		String src = request.getServletContext().getRealPath(SystemContext.RES) + con.getUpload().substring( (request.getContextPath()+SystemContext.RES).length()  ); //源文件地址
		File file = new File(src);
		file.delete();
		if(!StringUtils.isBlank(con.getCover())){
			new File(request.getServletContext().getRealPath(SystemContext.IMG)+con.getCover().substring( (request.getContextPath()+SystemContext.IMG).length()  )).delete();
		}
		orService.delete(con);
		con = new Content();
		return list();
	}
	//更新
	public String update(){
		FileOutputStream fos = null;
		con.setOperateTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		String src = request.getServletContext().getRealPath(SystemContext.RES) + con.getUpload().substring( (request.getContextPath()+SystemContext.RES).length()  );
		File srcFile = new File(src);
		try {
			if(!srcFile.getParentFile().exists()){
				//System.out.println("文件不存在！");
				return null;
			}
			fos = new FileOutputStream(srcFile);
			fos.write(content.getBytes("utf-8"));
			orService.update(con);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				fos.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		con=new Content();
		return list();
	}
	//编辑页面
	public String openEdit(){
		con = orService.findById(con.getId());
		String src = request.getServletContext().getRealPath(SystemContext.RES) + con.getUpload().substring( (request.getContextPath()+SystemContext.RES).length()  );
		File srcFile = new File(src);
		String message = contentService.loadContent(srcFile);
		content = convert(message);
		//System.out.println(content);
		forwardView = EDIT_JSP;
		return SUCCESS;
	}
	//打开新闻添加页面
	public String openAdd(){
		forwardView = MS_JSP;
		return SUCCESS;
	}
	private String convert(String str) {
		str = str.replaceAll("&", "&amp;");
		str = str.replaceAll("<", "&lt;");
		str = str.replaceAll(">", "&gt;");
		str = str.replaceAll("\"", "&quot;");
		return str;
	}
	/**
	 *  发布（保存）新闻
	 * @return
	 * @author  涛 
	 * @date:2017年4月7日
	 */
	public String add(){
		if(StringUtils.isBlank(content)){
			forwardView = MS_JSP;
			return SUCCESS;
		}
		if(coverImg!=null){ //封面处理，先上传到服务器，然后截取大小
			String ex = coverImgFileName.substring(coverImgFileName.lastIndexOf(".")+1); //文件扩展名
			String imgUrl = contentService.uploadImg(request, coverImg, ex);
			con.setCover(imgUrl);
			String desImgAddress = request.getServletContext().getRealPath(SystemContext.IMG)+imgUrl.substring( (request.getContextPath()+SystemContext.IMG).length()  );
			File desImg = new File(desImgAddress);
			ImgUtil.cutImage(coverImg, desImg,ex, 320, 240);//截取图片，使其符合前台显示标准
		}
		
		//保存新闻
		String url = contentService.saveMessage(request, con.getTitle(), content ); 
		SysUser user= ((SysUser) request.getSession().getAttribute("user"));
		con.setUpload(url);
		con.setUserId(user.getId());
		con.setOperate(user.getUserRealName()+"发布了内容："+con.getTitle());
		con.setOperateTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		orService.save(con);
		status = 1; 
		con = new Content();
		return list();
	}
	// 插入的视频或图片上传
		@SuppressWarnings("unchecked")
		public void imgUpload(){
			HttpServletResponse response1=ServletActionContext.getResponse();
			response1.setContentType("text/html; charset=UTF-8");
			PrintWriter out=null;
			try {
				out = response1.getWriter();
			} catch (IOException e) {
				e.printStackTrace();
				return;
			}
			String ex = imgFileFileName.substring(imgFileFileName.lastIndexOf(".")+1); //文件扩展名
			if(imgFile==null){
				return;
			}else if(dir.equals("image")&&!"gif,jpg,jpeg,png,bmp".contains(ex) ){
				out.println(getError("不支持的图片格式"));
				return;
			}else if(dir.equals("media")&&!"mp4,swf,flv,rmvb".contains(ex) ){
				out.println(getError("视频格式只能是mp4,swf,flv,rmvb"));
				return;
			}
			else if(imgFile.length()>20971520){
				out.println(getError("文件不能超过20M"));
				return;
			}
			String imgUrl = contentService.uploadImg(request, imgFile, ex); //保存图片
			JSONObject obj = new JSONObject();
			obj.put("error", 0);
			obj.put("url", imgUrl);
			out.println(obj.toJSONString());
			out.close();
		}
	
	@SuppressWarnings("unchecked")
	private String getError(String message) {
		//System.out.println("fasfasfsafsafas");
		JSONObject obj = new JSONObject();
		obj.put("error", 1);
		obj.put("message", message);
		return obj.toString();
	}
	
	//编辑页面
	public String openDetail(){
		con = orService.findById(con.getId());
		String src = request.getServletContext().getRealPath(SystemContext.RES) + con.getUpload().substring( (request.getContextPath()+SystemContext.RES).length()  );
		File srcFile = new File(src);
		String message = contentService.loadContent(srcFile);
		content = convert(message);
		//System.out.println(content);
		forwardView = DETAIL_JSP;
		return SUCCESS;
	}
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public File getImgFile() {
		return imgFile;
	}
	public void setImgFile(File imgFile) {
		this.imgFile = imgFile;
	}
	public String getImgFileFileName() {
		return imgFileFileName;
	}
	public void setImgFileFileName(String imgFileFileName) {
		this.imgFileFileName = imgFileFileName;
	}
	public String getImgFileContentType() {
		return imgFileContentType;
	}
	public void setImgFileContentType(String imgFileContentType) {
		this.imgFileContentType = imgFileContentType;
	}
	public Object getModel() {
		return con;
	}

	public File getCoverImg() {
		return coverImg;
	}
	public void setCoverImg(File coverImg) {
		this.coverImg = coverImg;
	}
	public String getCoverImgFileName() {
		return coverImgFileName;
	}
	public void setCoverImgFileName(String coverImgFileName) {
		this.coverImgFileName = coverImgFileName;
	}
	public String getCoverImgContentType() {
		return coverImgContentType;
	}
	public void setCoverImgContentType(String coverImgContentType) {
		this.coverImgContentType = coverImgContentType;
	}
	public Map<Integer, SysUser> getMap() {
		return map;
	}
	public void setMap(Map<Integer, SysUser> map) {
		this.map = map;
	}

	public String getDir() {
		return dir;
	}

	public void setDir(String dir) {
		this.dir = dir;
	}
	public Content getCon() {
		return con;
	}
	public void setCon(Content con) {
		this.con = con;
	}
	public Result<Content> getPageResult() {
		return pageResult;
	}
	public void setPageResult(Result<Content> pageResult) {
		this.pageResult = pageResult;
	}
	public Result<Content> getVideoResult() {
		return videoResult;
	}
	public void setVideoResult(Result<Content> videoResult) {
		this.videoResult = videoResult;
	}
	
}
