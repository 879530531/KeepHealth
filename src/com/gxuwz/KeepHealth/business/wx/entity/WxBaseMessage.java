package com.gxuwz.KeepHealth.business.wx.entity;

/**
 * 微信接口消息基础类
 * @author 叶城廷
 * @version 2019.1.28
 */
public class WxBaseMessage {
	
	private String ToUserName;//接收方账号
	private String FromUserName;//发送方账号
	private long CreateTime;//创建时间
	private String MsgType;//消息类型
	public String getToUserName() {
		return ToUserName;
	}
	public void setToUserName(String toUserName) {
		ToUserName = toUserName;
	}
	public String getFromUserName() {
		return FromUserName;
	}
	public void setFromUserName(String fromUserName) {
		FromUserName = fromUserName;
	}
	public long getCreateTime() {
		return CreateTime;
	}
	public void setCreateTime(long createTime) {
		CreateTime = createTime;
	}
	public String getMsgType() {
		return MsgType;
	}
	public void setMsgType(String msgType) {
		MsgType = msgType;
	}
}
