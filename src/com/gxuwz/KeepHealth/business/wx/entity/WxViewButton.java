package com.gxuwz.KeepHealth.business.wx.entity;
/**
 * 微信View型菜单按钮实体类
 * @author 叶城廷
 * @version 2019.1.31
 *
 */
public class WxViewButton extends WxButton{
	private String url;//跳转链接

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
}
