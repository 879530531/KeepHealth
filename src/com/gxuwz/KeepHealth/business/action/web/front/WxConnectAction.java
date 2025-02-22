 package com.gxuwz.KeepHealth.business.action.web.front;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.gxuwz.KeepHealth.business.action.web.TbTeacherAction;
import com.gxuwz.KeepHealth.business.entity.TbConsultationRecord;
import com.gxuwz.KeepHealth.business.entity.TbConsumer;
import com.gxuwz.KeepHealth.business.entity.TbTeacher;
import com.gxuwz.KeepHealth.business.service.*;
import com.gxuwz.KeepHealth.wx.util.WeixinUtil;

import org.dom4j.DocumentException;
import org.springframework.beans.factory.annotation.Autowired;

import com.gxuwz.KeepHealth.wx.util.CheckUtil;
import com.gxuwz.KeepHealth.wx.util.MessageUtils;
import com.gxuwz.core.web.action.BaseAction;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

/**
 * 微信端自助听读器对接端口Action
 * @author 叶城廷
 *@version 2019.1.21
 */
public class WxConnectAction extends BaseAction implements Preparable, ModelDriven {


	protected static final String TEACHER_LOGIN_JSP = "/weixin/TeacherLogin.jsp";
	protected static final String REWARDFORMULA_JSP = "/weixin/ConsultationRecord_advice.jsp";
	protected static final String FREEFORMULA_JSP = "/weixin/Classification.jsp";
	protected static final String READNUMBER_JSP = "/weixin/Read_number.jsp";
	protected static final String WXTEACHERLIST_JSP ="/weixin/ConsultingTeacherList.jsp";
	
	 private static final long serialVersionUID = 1L;
	
	 private String signature ;//签名
	 private String timestamp ;//时间戳
	 private String nonce ;//随机数
	 private String echostr ;//随机字符串
	 //通过时间戳+随机数+随机字符串经过拼接后进行sha1加密与签名进行对比判断是否为微信客户端发来的请求
	 private List<TbConsultationRecord> list;

	//微信网页回调code
	private String code;
	private String state;
	private List<TbTeacher> teacherList;
	
  	 private HttpServletRequest req=getRequest();
  	 
  	 @Autowired
  	 private WxTextMessageService wxTextMessageService;
  	 
   	@Autowired
 	 private WxEventMessageService wxEventMessageService;

   	@Autowired
   	private TbConsumerService tbConsumerService;

	@Autowired
	private TbTeacherService tbTeacherService;
   	
   	@Autowired
   	private TbConsultationRecordService tbConsultationRecordService;
  	 
	@Override
	public Object getModel() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void prepare() throws Exception {
		// TODO Auto-generated method stub
		
	}

	/**
	 * 微信支付消息通知对接唯一方法
	 *@author 叶城廷
	 *@version 2019.03.19
	 */
    public  void wxPayCallBack(){

	}

	/**
	 * 微信回调唯一对接方法
	 *@author 叶城廷
	 *@version 2019.03.09
	 */
	public  String wxCallBack(){

		//使用code调取token和openId
		String openId= WeixinUtil.codeTakeOpenid(code);
		//根据openId查询相关用户并放置于session会话
		try{
			TbConsumer tbConsumer = tbConsumerService.queryConsumerByOpenid(openId);
			//会话缓存用户信息
			getSession().setAttribute("currentConsumer",tbConsumer);
			//	if (tbConsumer.getOpenId().equals("oM4Zwv3_xzU9NJwlZLd5Q0c3ZBzc")||tbConsumer.getOpenId().equals("oM4Zwv71XScrvm_qmNpBVNMpgd7Y")||tbConsumer.getOpenId().equals("oM4Zwv5-5neh8OLDZ3uPTiMUzT_Y")||tbConsumer.getOpenId().equals("oM4ZwvyF4-ZDkvvcq0ifrAq4vzOk")){

			//跳转相应页面
			if(state.equals("TEACHERLOGIN")){
				//老师登录
				setForwardView(TEACHER_LOGIN_JSP);
			}else if(state.equals("REWARDFORMULA")){
				//打赏求方
				teacherList = tbTeacherService.queryTeacher();
				setForwardView(WXTEACHERLIST_JSP);

			}else if(state.equals("FREEFORMULA")){
				//免费取方
				setForwardView(FREEFORMULA_JSP);
			}else if(state.equals("READNUMBER")){
				//自助助念器
				setForwardView(READNUMBER_JSP);
			}else {
				System.out.println("------------------------>警告：微信回调参数出错，请联系相关开发人员<------------------------");
			}
		/*}else {
			setForwardView("/weixin/wkfym.jsp");
		}*/
		}catch (Exception e){
			e.printStackTrace();
			System.out.println("用户信息读取失败，openID："+openId);
			setForwardView("/weixin/error.jsp");
			return  SUCCESS;
		}

		return  SUCCESS;
	}

	/**
	 * 系统与微信接口唯一对接方法
	 * @return none
	 * @author 叶城廷
	 *@version 2019.1.28
	 */
	public String wxConnection() {
	
		
		PrintWriter writer =getPrintWriter();
		
		//获取当前请求为POST还是GET，如为GET则为微信平台验证token流程业务，如为post则为相应功能业务
		String method=req.getMethod();
		
		//GET

		if(method.equals("GET")) {	

			  //签名检查
			  if(CheckUtil.checkSignature(signature, timestamp, nonce)){	  
				  writer.print(echostr);
			    }
			  return NONE;
		//POST
		}else{
	        try {
	        	//获取本次消息请求参数
	            Map<String, String> map = MessageUtils.xmlToMapText(req);
	            String toUserName = map.get("ToUserName");
	            String fromUserName = map.get("FromUserName");
	            String msgType = map.get("MsgType");
	            String content = map.get("Content");	            
	            String message = null;	  
	            
	            //判断为文本消息类型
	            if (MessageUtils.MESSAGE_TEXT.equals(msgType)) {	            	
	            	//将本次消息内容及对方微信账号转交微信文本消息回复型业务层处理
	            	message = wxTextMessageService.wxTextReply(toUserName,fromUserName,content);	            
	            //判断为事件消息类型
	            } else if (MessageUtils.MESSAGE_EVENT.equals(msgType)) {
	                //获取本次事件消息详细类型
	                String event = map.get("Event");
	                String eventKey = map.get("EventKey");
	                //将本次事件消息类型及对方微信账号转交微信事件消息回复型业务层处理
	                message = wxEventMessageService.wxEventReply(toUserName,fromUserName,event,eventKey);               
	            }        
	            writer.write(message);
	        } catch (DocumentException e) {
	            e.printStackTrace();
	        } catch (IOException e) {
				e.printStackTrace();
			} finally {
	            writer.close();
	        }
	    }
			return NONE;
		}
	
	
	public String  numberToReadDevice() {
		return NONE;
	}

	public String getSignature() {
		return signature;
	}

	public void setSignature(String signature) {
		this.signature = signature;
	}

	public String getTimestamp() {
		return timestamp;
	}

	public void setTimestamp(String timestamp) {
		this.timestamp = timestamp;
	}

	public String getNonce() {
		return nonce;
	}

	public void setNonce(String nonce) {
		this.nonce = nonce;
	}

	public String getEchostr() {
		return echostr;
	}

	public void setEchostr(String echostr) {
		this.echostr = echostr;
	}


	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public TbConsumerService getTbConsumerService() {
		return tbConsumerService;
	}

	public void setTbConsumerService(TbConsumerService tbConsumerService) {
		this.tbConsumerService = tbConsumerService;
	}

	public List<TbConsultationRecord> getList() {
		return list;
	}

	public void setList(List<TbConsultationRecord> list) {
		this.list = list;
	}

	public TbConsultationRecordService getTbConsultationRecordService() {
		return tbConsultationRecordService;
	}

	public void setTbConsultationRecordService(
			TbConsultationRecordService tbConsultationRecordService) {
		this.tbConsultationRecordService = tbConsultationRecordService;
	}

	public List<TbTeacher> getTeacherList() {
		return teacherList;
	}

	public void setTeacherList(List<TbTeacher> teacherList) {
		this.teacherList = teacherList;
	}
}
