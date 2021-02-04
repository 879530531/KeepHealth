package com.gxuwz.KeepHealth.business.wx.entity;
/**
 * 微信总菜单（一级菜单）实体类
 * @author 叶城廷
 * @version 2019.1.31
 *
 */
public class WxButton {
	
	private String type;//菜单类型
	
	private String name;//菜单名称
	
	private WxButton[] sub_button;//二级菜单
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public WxButton[] getSub_button() {
		return sub_button;
	}
	public void setSub_button(WxButton[] sub_button) {
		this.sub_button = sub_button;
	}
	
}
