package com.gxuwz.KeepHealth.business.wx.entity;
/**
 * 微信单图文消息实体类
 * @author 叶城廷
 * @version 2019.1.31
 *
 */
public class WxNews {
	private String Title;//标题
	private String Description;//描述
	private String PicUrl;//图文链接
	private String Url;//图文跳转链接
	public String getTitle() {
		return Title;
	}
	public void setTitle(String title) {
		Title = title;
	}
	public String getDescription() {
		return Description;
	}
	public void setDescription(String description) {
		Description = description;
	}
	public String getPicUrl() {
		return PicUrl;
	}
	public void setPicUrl(String picUrl) {
		PicUrl = picUrl;
	}
	public String getUrl() {
		return Url;
	}
	public void setUrl(String url) {
		Url = url;
	}
}
