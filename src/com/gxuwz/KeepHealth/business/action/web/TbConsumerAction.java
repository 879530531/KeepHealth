package com.gxuwz.KeepHealth.business.action.web;

import java.util.ArrayList;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.gxuwz.KeepHealth.business.dao.TbConsumerDao;
import com.gxuwz.KeepHealth.business.entity.SysUnit;
import com.gxuwz.KeepHealth.business.entity.TbConsumer;
import com.gxuwz.KeepHealth.business.entity.TbPersonalData;
import com.gxuwz.KeepHealth.business.entity.TbSettlement;
import com.gxuwz.KeepHealth.business.service.TbConsumerService;
import com.gxuwz.core.dao.impl.BaseDaoImpl;
import com.gxuwz.core.pagination.Result;
import com.gxuwz.core.web.action.BaseAction;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;







/**
 * 与咨询用户相关的控制器
 *  @author 叶城廷
 * @version 2019.03.01
 */

public class TbConsumerAction extends BaseAction implements Preparable, ModelDriven<TbConsumer>{
	protected static final String LIST_JSP = "/WEB-INF/page/web/health_consult_consumer/consumer_list.jsp";
	private Result<TbConsumer> pageResult;//分页
	private static final long serialVersionUID = 1L;
	private static final String ConsumerList = null;
	private String consumerList;
	


	private TbConsumer tbConsumer;
    public String openList(){
		
		return SUCCESS;
	}
	
	@Autowired
	private TbConsumerService  tbConsumerService;
	
	private TbConsumerDao tbConsumerdao;
	
	public static String getConsumerlist() {
		return ConsumerList;
	}
	
	
	
	@Override
	public TbConsumer getModel() {
		
		return tbConsumer;
	}
	@Override
	public void prepare() throws Exception {
		if(ConsumerList==null){
			@SuppressWarnings("unused")
			List<TbConsumer> ConsumerList = new ArrayList<TbConsumer>();
		}
	}
	
	/*
	 * 列表条件查询
	 * 2019.5.13
	 * 董冰雪
	 */
	public String list()throws Exception{
		//logger.info("##ysRole列表读取...");
		 
			System.out.println(tbConsumer);
			if(tbConsumer != null){
				if("".equals(tbConsumer.getConsumerName())){
					 tbConsumer.setConsumerName(null);
					}
					if("".equals(tbConsumer.getConsumerCity())){
						tbConsumer.setConsumerCity(null);
					}
					if("".equals(tbConsumer.getOpenId())){
						tbConsumer.setOpenId(null);
					}
				pageResult = tbConsumerService.find(tbConsumer, getPage(), getRow());
			}
			else{
				pageResult = tbConsumerService.queryConsumerList("", getPage(), getRow());
			}
		
		setForwardView(LIST_JSP);
		return SUCCESS;
	}
	
	//列表
		/*public String list() {
			
			pageResult = tbConsumerService.queryConsumerList("", getPage(), getRow());
			
			setForwardView(LIST_JSP);
			return SUCCESS;
		}	*/	
		public String getConsumerList() {
			return consumerList;
		}
		public void setConsumerList(String consumerList) {
			this.consumerList = consumerList;
		}
		public TbConsumer getTbConsumer() {
			return tbConsumer;
		}
		public void setTbConsumer(TbConsumer tbConsumer) {
			this.tbConsumer = tbConsumer;
		}
		public static String getListJsp() {
			return LIST_JSP;
		}
		public Result<TbConsumer> getPageResult() {
			return pageResult;
		}
		public void setPageResult(Result<TbConsumer> pageResult) {
			this.pageResult = pageResult;
		}
	
		
		public static long getSerialversionuid() {
			return serialVersionUID;
		}
		public TbConsumerService getTbConsumerService() {
			return tbConsumerService;
		}

		public void setTbConsumerService(TbConsumerService tbConsumerService) {
			this.tbConsumerService = tbConsumerService;
		}

}
