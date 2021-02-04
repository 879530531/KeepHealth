package com.gxuwz.KeepHealth.business.wx.entity;

/**
 * 微信票据实体类
 * @author 叶城廷
 * @version 2019.1.31
 *
 */
public class WxAccessToken {
	private String token;//票据
	private int expiresIn;
	public String getToken() {
		return token;
	}
	public void setToken(String token) {
		this.token = token;
	}
	public int getExpiresIn() {
		return expiresIn;
	}
	public void setExpiresIn(int expiresIn) {
		this.expiresIn = expiresIn;
	}
}
