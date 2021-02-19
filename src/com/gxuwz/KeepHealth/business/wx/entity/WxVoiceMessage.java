package com.gxuwz.KeepHealth.business.wx.entity;
/**
 * 微信语音消息实体类
 * @author 叶城廷
 * @version 2019.1.31
 *
 */
public class WxVoiceMessage extends WxBaseMessage{

	private WxVoice Voice;//语音实体类

	public WxVoice getVoice() {
		return Voice;
	}

	public void setVoice(WxVoice voice) {
		Voice = voice;
	}
}
