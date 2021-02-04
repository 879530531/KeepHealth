package com.gxuwz.KeepHealth.business.wx.entity;
/**
 * 微信音频实体类
 * @author 叶城廷
 * @version 2019.1.31
 *
 */
public class WxMusic {
	private String Title;//标题
	private String Description;//描述
	private String MusicUrl;//音频链接
	private String HQMusicUrl;//高品质音频链接
	private String ThumbMediaId;//缩略图媒体ID
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
	public String getMusicUrl() {
		return MusicUrl;
	}
	public void setMusicUrl(String musicUrl) {
		MusicUrl = musicUrl;
	}
	public String getHQMusicUrl() {
		return HQMusicUrl;
	}
	public void setHQMusicUrl(String hQMusicUrl) {
		HQMusicUrl = hQMusicUrl;
	}
	public String getThumbMediaId() {
		return ThumbMediaId;
	}
	public void setThumbMediaId(String thumbMediaId) {
		ThumbMediaId = thumbMediaId;
	}
}
