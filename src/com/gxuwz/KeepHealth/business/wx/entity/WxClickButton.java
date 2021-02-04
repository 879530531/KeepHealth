package com.gxuwz.KeepHealth.business.wx.entity;
/**
 * 微信Click型菜单实体类
 * @author 叶城廷
 * @version 2019.1.31
 *
 */
public class WxClickButton extends WxButton{
	
	private String key;//Click类型菜单key

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}
}
