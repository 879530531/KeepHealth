package com.gxuwz.KeepHealth.business.action.web;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.gxuwz.KeepHealth.SystemContext;
import com.gxuwz.KeepHealth.business.entity.TbAudio;
import com.gxuwz.KeepHealth.business.entity.TbFormula;
import com.gxuwz.KeepHealth.business.entity.TbReadDevice;
import com.gxuwz.KeepHealth.business.entity.TbSoundSource;
import com.gxuwz.KeepHealth.business.service.TbAudioService;
import com.gxuwz.KeepHealth.business.service.TbFormulaService;
import com.gxuwz.KeepHealth.util.FileUtil;
import com.gxuwz.core.pagination.Result;
import com.gxuwz.core.web.action.BaseAction;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
/**
 * 与念数机音频相关控制器Action
 * @author 齐美琳
 *@version 2019.3.21
 */
public class TbAudioAction extends BaseAction implements Preparable, ModelDriven{
	private Logger logger = Logger.getLogger(TbReadDeviceAction.class);
	

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	protected static final String LIST_JSP = "/WEB-INF/page/web/health_audio/Audio_list.jsp";
	protected static final String EDIT_JSP = "/WEB-INF/page/web/health_audio/Audio_edit.jsp";
	protected HttpServletRequest request = ServletActionContext.getRequest();

	
	private Result<TbAudio> pageResult;//分页
	private File audio;//音频
    private String audioFileName;//音频文件名
    private String dir; //上传的文件类型
	private TbAudio tbAudio;
	//修改进程标志
	private String actionState;
	//综合查询内容
	private String queryText;
	@Autowired
	private TbAudioService  tbAudioService;

	@Override
	public Object getModel() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void prepare() throws Exception {
		if(null == tbAudio){
			tbAudio = new TbAudio();
		}
		
	}
	
	
	public String openList() {
		pageResult=tbAudioService.queryAudioList("",getPage(),getRow());
		setForwardView(LIST_JSP);
		return SUCCESS;
	}
	
	//音频页面输入查询
	public String queryList() {


		pageResult=tbAudioService.queryAudioList(queryText,getPage(),getRow());
		setForwardView(LIST_JSP);
/*		HttpServletResponse response = getResponse();
		response.setHeader("Pragma","No-cache");
		response.setHeader("Cache-Control","no-cache");
		response.setDateHeader("Expires", 0);
		response.flushBuffer();*/
		return SUCCESS;
	}
	
	//音源页面查看
	public String query() {
		/*try {
			queryText = new String(queryText.getBytes("iso8859-1"),"UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}*/
		HttpServletResponse response = ServletActionContext.getResponse(); 
		response.setContentType("text/xml;charset=UTF-8");
		pageResult=tbAudioService.queryList(queryText,getPage(),getRow());
		setForwardView(LIST_JSP);
		return SUCCESS;
	}
	public String openEdit() {
		tbAudio = tbAudioService.findById1(tbAudio.getAudioId());
		//System.out.println(tbAudio);
		getRequest().getSession().setAttribute("tbAudio", tbAudio);
		//System.out.println("1:"+getRequest().getSession().getAttribute("tbSoundSource"));
		
		setForwardView(EDIT_JSP);
		return SUCCESS;
	}
	
	public String editAudio(){
		TbAudio tbAudio = (TbAudio) getRequest().getSession().getAttribute("tbAudio");
		String soundName = tbAudio.getAudioSoundSource();
		int audioNumber = tbAudio.getAudioNumber();
		System.out.println("soundName:"+soundName+"--audioNumber:"+audioNumber);
		int audioId = tbAudio.getAudioId();
		TbSoundSource tbSoundSource = tbAudioService.getSoundBySoundName(soundName);
		String soundId = Integer.toString(tbSoundSource.getSoundId());
		String ex = audioFileName.substring(audioFileName.lastIndexOf(".")+1);//文件扩展名
		System.out.println("file:"+audio+"---filename:"+audioFileName);
		String path = request.getServletContext().getRealPath(SystemContext.MP3)+"/"+soundId+"/"+audioNumber +".mp3";
		FileUtil.delectFile(path);
		String url = tbAudioService.uploadAudio(request, audio, ex, soundId, audioNumber);
		tbAudio = new TbAudio();
		tbAudio.setAudioId(audioId);
		tbAudio.setAudioNumber(audioNumber);
		tbAudio.setAudioSoundSource(soundName);
		tbAudio.setAudioFilePath(url);
		tbAudioService.add(tbAudio);
		String forwardView = openList();
		return forwardView;
	}

	public TbAudioService getTbAudioService() {
		return tbAudioService;
	}

	public void setTbAudioService(TbAudioService tbAudioService) {
		this.tbAudioService = tbAudioService;
	}

	public Result<TbAudio> getPageResult() {
		return pageResult;
	}

	public void setPageResult(Result<TbAudio> pageResult) {
		this.pageResult = pageResult;
	}

	public TbAudio getTbAudio() {
		return tbAudio;
	}

	public void setTbAudio(TbAudio tbAudio) {
		this.tbAudio = tbAudio;
	}

	public String getActionState() {
		return actionState;
	}

	public void setActionState(String actionState) {
		this.actionState = actionState;
	}

	public String getQueryText() {
		return queryText;
	}

	public void setQueryText(String queryText) {
		this.queryText = queryText;
	}

	public File getAudio() {
		return audio;
	}

	public void setAudio(File audio) {
		this.audio = audio;
	}

	public String getAudioFileName() {
		return audioFileName;
	}

	public void setAudioFileName(String audioFileName) {
		this.audioFileName = audioFileName;
	}

	public String getDir() {
		return dir;
	}

	public void setDir(String dir) {
		this.dir = dir;
	}

}
