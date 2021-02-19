package com.gxuwz.KeepHealth.business.action.web;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;
import com.gxuwz.KeepHealth.business.entity.TbAudio;
import com.gxuwz.KeepHealth.business.dao.TbAudioDao;
import com.gxuwz.KeepHealth.business.dao.TbSoundSourceDao;
import com.gxuwz.KeepHealth.business.entity.TbSoundSource;
import com.gxuwz.KeepHealth.business.service.TbAudioService;
import com.gxuwz.KeepHealth.business.service.TbSoundSourceService;
import com.gxuwz.KeepHealth.util.AudioConvertUtil;
import com.gxuwz.KeepHealth.util.PropertyUtil;
import com.gxuwz.core.pagination.Result;
import com.gxuwz.core.web.action.BaseAction;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
/**
 * 与念数机音源相关控制器Action
 * @author yechengting
 *@version 2019.2.16
 */
public class TbSoundSourceAction extends BaseAction implements Preparable, ModelDriven{

	private static final long serialVersionUID = -4104125263890869018L;
	protected static final String LIST_JSP = "/WEB-INF/page/web/health_sound_source/SoundSource_list.jsp";
	protected static final String ADD_JSP = "/WEB-INF/page/web/health_sound_source/SoundSource_add.jsp";
	protected static final String EDIT_JSP = "/WEB-INF/page/web/health_sound_source/SoundSource_edit.jsp";
	
	protected HttpServletRequest request = ServletActionContext.getRequest();
	//念数机荧屏数字和倍数
	private String display;
	private String playbackRate;
	@Autowired
	private TbSoundSourceService  tbSoundSourceService;
	@Autowired
	private TbAudioService  tbAudioService;
	@Autowired
	private TbSoundSourceDao tbSoundSourceDAO;
	@Autowired
	private TbAudioDao tbAudioDao;
	private TbSoundSource tbSoundSource;
	private TbAudio tbAudio;
	private List<TbAudio> tbAudio1;
	private List<TbSoundSource> tbSoundSource1;
	private Result<TbSoundSource> pageResult2;//分页
	//综合查询内容
	private String queryText;
    private String tib;
    private String actionState;
    private File[] audio;//音频
    private String audioFileName;//音频文件名
    private String dir; //上传的文件类型

	@Override
	public TbSoundSource getModel() {
		if (null == tbSoundSource) {  
			return tbSoundSource = new TbSoundSource();  
		}
		return tbSoundSource;
	}
	
	@Override
	public void prepare() throws Exception {
		if (null == tbSoundSource1) {  
			tbSoundSource1 = new ArrayList<TbSoundSource>();
		}
	}
	
	
	public String list() {
		pageResult2 = tbSoundSourceService.find(queryText, getPage(), getRow());
		setForwardView(LIST_JSP);
		return SUCCESS;
	}
	
	public String openList() {
		pageResult2 = tbSoundSourceService.find("", getPage(), getRow());
		setForwardView(LIST_JSP);
		return SUCCESS;
	}
	
	/**
	 * 打开添加音源页面
	 * @author 丁程强
	 * @date 2019.02.21
	 */
	public String openAdd() {
		setForwardView(ADD_JSP);
		return SUCCESS;
	}
	
	/**
	 * 添加音源及对应9个音频
	 * @author 丁程强
	 * @date 2019年3月6日
	 */
	public String add() {
		String forwardView = null;
		boolean result = tbSoundSourceService.checkSoundName(tbSoundSource.getSoundName());
		if(!result){
			String ex = audioFileName.substring(audioFileName.lastIndexOf(".")+1);//文件扩展名
			tbSoundSourceService.add(tbSoundSource);
			String audioSoundSource = tbSoundSource.getSoundName();
			String soundId = Integer.toString(tbSoundSource.getSoundId());
			//循环上传文件并添加信息到数据库
			for(Integer i=0; i<audio.length; i++) {
				String audioUrl = tbAudioService.uploadAudio(request, audio[i], ex, soundId, i);
				tbAudio = new TbAudio();
				tbAudio.setAudioFilePath(audioUrl);
				tbAudio.setAudioNumber(i);
				tbAudio.setAudioSoundSource(audioSoundSource);
				tbAudioService.add(tbAudio);
			}
			actionState = "1";
			forwardView = openList();
		}else {
			tib = "alreadyHave";
			setForwardView(ADD_JSP);
			return SUCCESS;
		}
		return forwardView;
	}
	
	
	/**
	 * 打开修改音源页面
	 * @author 丁程强
	 * @date 2019.02.21
	 */
	public String openEdit() {
		tbSoundSource = tbSoundSourceService.findById(tbSoundSource.getSoundId());
		getRequest().getSession().setAttribute("tbSoundSource", tbSoundSource);
		//System.out.println("1:"+getRequest().getSession().getAttribute("tbSoundSource"));
		setForwardView(EDIT_JSP);
		return SUCCESS;
	}
	
	/**
	 * 修改音源
	 * @author 丁程强
	 * @date 2019.02.21
	 */
	public String edit() {
		String forwardView = null;
		TbSoundSource tbSoundSource3 = (TbSoundSource)getRequest().getSession().getAttribute("tbSoundSource");
		String oldSoundName = tbSoundSource3.getSoundName();//原音源名字
		String newSoundName = tbSoundSource.getSoundName();//修改后的音源名字
		//不相等则判断是否存在并修改，相等则直接跳转回列表
		if(!oldSoundName.equals(newSoundName)){
			boolean result = tbSoundSourceService.checkSoundName(tbSoundSource.getSoundName());
			if(!result){
				tbSoundSourceService.edit(tbSoundSource);
				actionState = "2";
				forwardView = openList();
			}else {
				tib = "alreadyHave";
				forwardView = openEdit();
			}
		}else{
			actionState = "2";
			forwardView = openList();
		}
		getRequest().getSession().removeAttribute("tbSoundSource");
		return forwardView;
	}
	
	/**
	 * 删除音源及对应文件夹
	 * @author 丁程强
	 * @throws IOException 
	 * @date 2019年3月6日
	 */
	public String delete() throws IOException {
		tbSoundSource = tbSoundSourceService.findById(tbSoundSource.getSoundId());
		//查询对应音源的所有音频封装到数组
		tbAudio1 = tbAudioService.findByAudioSoundSource(tbSoundSource.getSoundName());
		String soundId = Integer.toString(tbSoundSource.getSoundId());
		//删除文件夹
		try{
			tbSoundSourceService.delSoundSourceFolder(request, soundId);
		}catch(IOException e){
			e.printStackTrace();
		}
		tbSoundSourceDAO.getHibernateTemplate().delete(tbSoundSource);
		//循环遍历删除查询出来的音频
		for(int i=0;i<tbAudio1.size();i++){
			TbAudio tbAudio2 = (TbAudio)tbAudio1.get(i);
			tbAudioDao.getHibernateTemplate().delete(tbAudio2);
		}
		actionState = "5";
		return openList();
	}
	
	/**
	 * 修改音源上下线状态
	 * @author 丁程强
	 * @date 2019.02.21
	 */
	public String updateState() {
		tbSoundSource = tbSoundSourceService.findById(tbSoundSource.getSoundId());
		if(tbSoundSource.getSoundState() == 0){
			tbSoundSource.setSoundState(1);
			actionState = "3";
		}else{
			tbSoundSource.setSoundState(0);
			actionState = "4";
		}
		tbSoundSourceDAO.getHibernateTemplate().update(tbSoundSource);
		return openList();
	}
	

	/**
	 * 念数机播放音频
	 * @return
	 * @author 叶城廷
	 * @version 2019.2.28
	 */
	public String playAudio() {
		//拼接文件并返回播放文件的名称
		String AudioFileName=tbSoundSourceService.playAudio(display,tbAudio.getAudioId(),playbackRate);
		
		String date=null;
		try {
			//获取微信音频播放网络根路径
			String PLAYAUDIO_ROOT = PropertyUtil.getProperty("WX_PLAYAUDIO_ROOT_TEMPORARY","musicFilePath.properties");
			date=PLAYAUDIO_ROOT+AudioFileName;
		} catch (Exception e) {
			date="error";
			e.printStackTrace();
		}
		PrintWriter writer = getPrintWriter();
		try{
		writer.print(date);
		writer.flush();
		}finally{
		writer.close();
		}
		return null;
	}
	
	/**
	 * 检验音源名字是否存在
	 * @return
	 * @author 丁程强
	 * @date 2019.3.4
	 */
	public String checkSoundName() throws IOException{
		boolean result = tbSoundSourceService.checkSoundName(tbSoundSource.getSoundName());
		Gson gson = new Gson();
		String json = gson.toJson("" + result);
		PrintWriter writer = getPrintWriter();
		writer.write(json);
		writer.flush();
		writer.close();
		return null;
	}

	/**
	 * 念数机异步初始化音源
	 * @return
	 * @author 叶城廷
	 * @version 2019.4.4
	 */
	public String queryUpSoundSource() {
		String date =tbSoundSourceService.queryUpSoundSource();
		PrintWriter writer = getPrintWriter();
		try{
			writer.print(date);
			writer.flush();
		}finally{
			writer.close();
		}
		return null;
	}

	public String requestSystemUrl(){
		String date=PropertyUtil.getProperty("PLAYAUDIO_ROOT","musicFilePath.properties");
		PrintWriter writer = getPrintWriter();
		try{
			writer.print(date);
			writer.flush();
		}finally{
			writer.close();
		}
		return null;
	}
	
	
	public Result<TbSoundSource> getPageResult2() {
		return pageResult2;
	}

	public void setPageResult2(Result<TbSoundSource> pageResult2) {
		this.pageResult2 = pageResult2;
	}

	public TbSoundSource getTbSoundSource() {
		return tbSoundSource;
	}


	public void setTbSoundSource(TbSoundSource tbSoundSource) {
		this.tbSoundSource = tbSoundSource;
	}
	
	public TbSoundSourceService getTbSoundSourceService() {
		return tbSoundSourceService;
	}

	public void setTbSoundSourceService(TbSoundSourceService tbSoundSourceService) {
		this.tbSoundSourceService = tbSoundSourceService;
	}

	public String getDisplay() {
		return display;
	}

	public void setDisplay(String display) {
		this.display = display;
	}

	public TbSoundSourceDao getTbSoundSourceDAO() {
		return tbSoundSourceDAO;
	}

	public void setTbSoundSourceDAO(TbSoundSourceDao tbSoundSourceDAO) {
		this.tbSoundSourceDAO = tbSoundSourceDAO;
	}

	public List<TbSoundSource> getTbSoundSource1() {
		return tbSoundSource1;
	}

	public void setTbSoundSource1(List<TbSoundSource> tbSoundSource1) {
		this.tbSoundSource1 = tbSoundSource1;
	}

	public String getQueryText() {
		return queryText;
	}

	public void setQueryText(String queryText) {
		this.queryText = queryText;
	}

	public TbAudio getTbAudio() {
		return tbAudio;
	}

	public void setTbAudio(TbAudio tbAudio) {
		this.tbAudio = tbAudio;
	}

	public TbAudioService getTbAudioService() {
		return tbAudioService;
	}

	public void setTbAudioService(TbAudioService tbAudioService) {
		this.tbAudioService = tbAudioService;
	}

	public String getTib() {
		return tib;
	}

	public void setTib(String tib) {
		this.tib = tib;
	}

	public String getActionState() {
		return actionState;
	}

	public void setActionState(String actionState) {
		this.actionState = actionState;
	}

	public File[] getAudio() {
		return audio;
	}

	public void setAudio(File[] audio) {
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

	public TbAudioDao getTbAudioDao() {
		return tbAudioDao;
	}

	public void setTbAudioDao(TbAudioDao tbAudioDao) {
		this.tbAudioDao = tbAudioDao;
	}

	public List<TbAudio> getTbAudio1() {
		return tbAudio1;
	}

	public void setTbAudio1(List<TbAudio> tbAudio1) {
		this.tbAudio1 = tbAudio1;
	}


	public String getPlaybackRate() {
		return playbackRate;
	}

	public void setPlaybackRate(String playbackRate) {
		this.playbackRate = playbackRate;
	}
}
