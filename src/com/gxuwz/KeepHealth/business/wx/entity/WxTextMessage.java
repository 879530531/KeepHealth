package com.gxuwz.KeepHealth.business.wx.entity;

/**
 * 微信文本消息实体类
 * @author 叶城廷
 * @version 2019.1.27
 *
 */
public class WxTextMessage extends WxBaseMessage{
	    private String Content;//文本消息内容
	    private String MsgId;//消息id，64位整型
		public String getContent() {
			return Content;
		}
		public void setContent(String content) {
			Content = content;
		}
		public String getMsgId() {
			return MsgId;
		}
		public void setMsgId(String msgId) {
			MsgId = msgId;
		}
	    
	    
}
