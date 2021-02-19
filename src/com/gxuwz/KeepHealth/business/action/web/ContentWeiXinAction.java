package com.gxuwz.KeepHealth.business.action.web;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;

import com.gxuwz.core.web.action.BaseAction;
import com.gxuwz.core.pagination.Result;
import com.gxuwz.KeepHealth.SystemContext;
import com.gxuwz.KeepHealth.business.entity.Content;
import com.gxuwz.KeepHealth.business.entity.SysUser;
import com.gxuwz.KeepHealth.business.service.ContentService;
import com.gxuwz.KeepHealth.business.service.SysUserService;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

@SuppressWarnings({ "rawtypes", "serial" })
public class ContentWeiXinAction extends BaseAction implements ModelDriven, Preparable {
	
	protected final String NEWS_JSP = "/wap/page/news.jsp";
	protected final String SHOW_JSP = "/weixin/Learning_garden.jsp";
	protected final String SHOWWeb_JSP = "/WEB-INF/page/web/health_manage/Content_detail.jsp";

	private Content con;
	private String content;  //新闻编辑内容
	private Result<Content> pageResult;
	@Autowired
	private SysUserService userService;
	
	@Autowired
	private ContentService contentService;
	@Autowired
	private ContentService orService;	
	protected HttpServletRequest request = ServletActionContext.getRequest(); //request
	// 新闻列表
	public String content() {
		System.out.println("-------houtai");
		pageResult = orService.coverNewsList(con, getPage(), getRow());
		forwardView = NEWS_JSP;
		return SUCCESS;
	}
	/**
	 * 加载下一页
	 * @author  涛
	 * @date 2017年5月9日
	 */
	@SuppressWarnings("unchecked")
	public void loadMore(){
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setContentType("text/html; charset=UTF-8");
		//System.out.println("-------houtai");
		pageResult = orService.coverNewsList(con, getPage(), getRow());
		//System.out.println("asfasfas"+getPage()+getRow()+pageResult);
		JSONObject json = new JSONObject();
		JSONArray result = new JSONArray();
		for(Content c:pageResult.getData()){
			JSONObject obj = new JSONObject();
			obj.put("id", c.getId());
			obj.put("cover", c.getCover());
			obj.put("title", c.getTitle());
			obj.put("operateTime", c.getOperateTime());
			result.add(obj);
		}
		json.put("result", result);
		json.put("hasNext", pageResult.gethasNext());
		response.setContentType("text/json");
		try {
			response.getWriter().write(json.toJSONString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 跳转至新闻页面模板，显示新闻，记录浏览记录
	 * @return
	 * @author  涛 
	 * @date 2017年4月9日
	 */
	public String show(){
		con = orService.findById(con.getId());
		/*if(request.getSession().getAttribute("user")!=null){
			SysUser user = (SysUser)request.getSession().getAttribute("user");
			Integer uId = user.getUserId();
			if( operateRecordService.findRecord(uId, con.getId())==null ){
				OperateRecord operateRecord = new OperateRecord();
				operateRecord.setUserId(uId);
				operateRecord.setConId(con.getId());
			    if(con.getType()==1){
			        operateRecord.setDetail("浏览新闻");
			        operateRecord.setType(1);
			    }else if(con.getType()==2){
				    operateRecord.setDetail("浏览视频");
				    operateRecord.setType(2);
			    }
			    operateRecord.setTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
				operateRecordService.save(operateRecord);
			}else{
				OperateRecord operateRecord = operateRecordService.findRecord(uId, con.getId());
				operateRecord.setTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
				operateRecordService.merge(operateRecord);
			}
		}*/
		String src = request.getServletContext().getRealPath(SystemContext.RES) + con.getUpload().substring( (request.getContextPath()+SystemContext.RES).length()  );
		File srcFile = new File(src);
		content = contentService.loadContent(srcFile);
		forwardView = SHOW_JSP; 
		return SUCCESS;
	}
	
	/**
	 * 跳转至新闻页面模板，显示新闻，记录浏览记录(web页面用)
	 * @return
	 * @author  涛 
	 * @date 2017年4月9日
	 */
	public String showWeb(){
		con = orService.findById(con.getId());
		/*if(request.getSession().getAttribute("user")!=null){
			SysUser user = (SysUser)request.getSession().getAttribute("user");
			Integer uId = user.getUserId();
			if( operateRecordService.findRecord(uId, con.getId())==null ){
				OperateRecord operateRecord = new OperateRecord();
				operateRecord.setUserId(uId);
				operateRecord.setConId(con.getId());
			    if(con.getType()==1){
			        operateRecord.setDetail("浏览新闻");
			        operateRecord.setType(1);
			    }else if(con.getType()==2){
				    operateRecord.setDetail("浏览视频");
				    operateRecord.setType(2);
			    }
			    operateRecord.setTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
				operateRecordService.save(operateRecord);
			}else{
				OperateRecord operateRecord = operateRecordService.findRecord(uId, con.getId());
				operateRecord.setTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
				operateRecordService.merge(operateRecord);
			}
		}*/
		String src = request.getServletContext().getRealPath(SystemContext.RES) + con.getUpload().substring( (request.getContextPath()+SystemContext.RES).length()  );
		File srcFile = new File(src);
		content = contentService.loadContent(srcFile);
		request.setAttribute("id",con.getId());
		forwardView = SHOWWeb_JSP; 
		return SUCCESS;
	}

	public void prepare() throws Exception {
		if (con == null) {
			con = new Content();
		}
	}

	public Object getModel() {
		return con;
	}

	public Content getCon() {
		return con;
	}

	public void setCon(Content con) {
		this.con = con;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Result<Content> getPageResult() {
		return pageResult;
	}

	public void setPageResult(Result<Content> pageResult) {
		this.pageResult = pageResult;
	}

}
