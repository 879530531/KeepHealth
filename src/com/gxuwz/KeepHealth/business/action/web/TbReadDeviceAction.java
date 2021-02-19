package com.gxuwz.KeepHealth.business.action.web;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import com.google.gson.Gson;
import com.gxuwz.KeepHealth.business.dao.TbReadDeviceDao;
import com.gxuwz.KeepHealth.business.entity.TbReadDevice;
import com.gxuwz.KeepHealth.business.service.TbReadDeviceService;
import com.gxuwz.KeepHealth.util.AudioUtil;
import com.gxuwz.KeepHealth.util.PropertyUtil;
import com.gxuwz.core.pagination.Result;
import com.gxuwz.core.web.action.BaseAction;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

/**
 * 与自助听读器PC端管理相关的控制器Action
 * @author yechengting	
 *@version 2019.1.21
 */
@SuppressWarnings("serial")
public class TbReadDeviceAction extends BaseAction implements Preparable, ModelDriven{
	
	private Logger logger = Logger.getLogger(TbReadDeviceAction.class);
	
	private static final long serialVersionUID = -4104125263890869018L;
	protected static final String LIST_JSP = "/WEB-INF/page/web/health_read_device/ReadDevice_list.jsp";
	protected static final String UPDATE_JSP = "/WEB-INF/page/web/health_read_device/ReadDevice_edit.jsp";
	protected static final String ADD_JSP = "/WEB-INF/page/web/health_read_device/ReadDevice_add.jsp";
	
	private File[] upload;
	private String[] uploadFileName;
	private String[] uploadContentType;

	@Autowired
    private TbReadDeviceService tbReadDeviceService;
	@Autowired
	private TbReadDeviceDao tbReadDeviceDao; //听读器数据接口
	private TbReadDevice tbReadDevice; //tbReadDevice对象
	
	private List<TbReadDevice> tbReadDevice1;
	private Result<TbReadDevice> pageResult;//分页
	
	/**
	 * 添加听写数据菜单数字最大个数
	 */
	public static final int MAX_MENU_NUMBER_SIZE = 10;
	
	/**
	 * 添加听写数据菜单数字起始位数
	 */
	public static final int MIN_MENU_NUMBER_SIZE = 0;
	
	/**
	 * 添加听写数据菜单对应数字
	 */
	private Set<Integer> menuNumber;
	
	@Override
	public void prepare() throws Exception{
		if(null == tbReadDevice){
			tbReadDevice = new TbReadDevice();
		}
//	
	}
	
	@Override
	public String execute() throws Exception {
		
		return SUCCESS;
	}
	/**
	 * 听读器列表
	 * @return
	 * @throws Exception
	 * @author 陈紫丽
	 * @date 2019.1.24
	 */
	public String list() throws Exception {
		//System.out.println(casPatient.getPatientName());
		pageResult = tbReadDeviceService.find(tbReadDevice, getPage(), getRow());
		setForwardView(LIST_JSP);
		return SUCCESS;
	}
	
	
	/**
	 * 初始化菜单
	 * @return
	 * @throws IOException 
	 */
	public String initMenu() throws IOException{
		pageResult = tbReadDeviceService.find(tbReadDevice, getPage(), getRow());
		menuNumber = new HashSet<Integer>();
		List<TbReadDevice> lists = pageResult.getData();
		for(int i=MIN_MENU_NUMBER_SIZE; i<MAX_MENU_NUMBER_SIZE; i++){
			menuNumber.add(i);
		}
		if(lists != null && lists.size()>0){		
			for(int i=MIN_MENU_NUMBER_SIZE; i<MAX_MENU_NUMBER_SIZE; i++){
				for(TbReadDevice tbReadDevice: lists){
					int readNumber = tbReadDevice.getReadNumber();
					int num = Integer.valueOf(readNumber);
					if(i == num){
						menuNumber.remove(i);
					}
				}
			}
		}
		
		Gson gson = new Gson();
		String json = gson.toJson(menuNumber);
		PrintWriter writer = ServletActionContext.getResponse().getWriter();
		writer.print(json);
		writer.flush();
		writer.close();
		return null;
	}
		
		/**
		 * 删除听读器
		 * 
		 * @author 陈紫丽
		 * @Date 2019.01.27
		 */
		public String delete() throws Exception {
			
			tbReadDeviceService.delete(tbReadDevice.getReadId());
			setForwardView(LIST_JSP);
			return SUCCESS;
		}

		/**
		 * 添加听读器
		 * 
		 * @return
		 * @throws Exception
		 * @author 陈紫丽
		 * @date 2019.01.31
		 */
		public String addWeb() throws Exception {
//			tbReadDeviceService.checkReadNumber(tbReadDevice
//					.getReadNumber());
		//	logger.info("请求路径："+getRequest().getContextPath());
				tbReadDeviceService.addWeb(tbReadDevice, upload,uploadFileName, uploadContentType);
				
				tbReadDevice.setReadNumber(null);
			       return list();
		}
		
		
		/**
		 * 保存修改的听读器信息
		 * 
		 * @return
		 * @throws Exception
		 * @author 陈紫丽
		 * @Date 2019.01.27
		 */
		public String updateWeb() throws Exception {

			tbReadDeviceService.updateWeb(tbReadDevice, upload, uploadFileName,
					uploadContentType);
			tbReadDevice.setReadNumber(null);
			
			       return list();

		}
		
			/**
			 * 打开听读器修改信息页面
		     * @return
		     * @author 陈紫丽
		     * @Date 2019.01.27
			 */
			public String openEdit() {
				// 根据听读器readId查询听读器信息
				tbReadDevice = tbReadDeviceService.findByReadIdWeb(tbReadDevice.getReadId());
				setForwardView(UPDATE_JSP);
				return SUCCESS;
				
		    }
			/**
			 * 打开添加听读器信息页面
		     * @return
		     * @author 陈紫丽
		     * @Date 2019.01.27
			 */
			public String openAdd() {
				forwardView = ADD_JSP;
				return SUCCESS;
			}
			
			public String playAudio() {		
				String date=null;
				try {
					//获取音频播放网络根路径
					String PLAYAUDIO_ROOT = PropertyUtil.getProperty("PLAYAUDIO_ROOT","musicFilePath.properties");
					date=PLAYAUDIO_ROOT+tbReadDevice.getReadNumber()+".mp3";
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
			
	@Override
	public Object getModel() {
	
		return tbReadDevice;
	}

	
	public TbReadDeviceService getTbReadDeviceService() {
		return tbReadDeviceService;
	}

	public void setTbReadDeviceService(TbReadDeviceService tbReadDeviceService) {
		this.tbReadDeviceService = tbReadDeviceService;
	}

	public TbReadDevice getTbReadDevice() {
		return tbReadDevice;
	}

	public void setTbReadDevice(TbReadDevice tbReadDevice) {
		this.tbReadDevice = tbReadDevice;
	}

	public List<TbReadDevice> getTbReadDevice1() {
		return tbReadDevice1;
	}

	public void setTbReadDevice1(List<TbReadDevice> tbReadDevice1) {
		this.tbReadDevice1 = tbReadDevice1;
	}

	public Result<TbReadDevice> getPageResult() {
		return pageResult;
	}

	public void setPageResult(Result<TbReadDevice> pageResult) {
		this.pageResult = pageResult;
	}

	public File[] getUpload() {
		return upload;
	}

	public void setUpload(File[] upload) {
		this.upload = upload;
	}

	public String[] getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String[] uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public String[] getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(String[] uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public Set<Integer> getMenuNumber() {
		return menuNumber;
	}

	public void setMenuNumber(Set<Integer> menuNumber) {
		this.menuNumber = menuNumber;
	}
   
}
