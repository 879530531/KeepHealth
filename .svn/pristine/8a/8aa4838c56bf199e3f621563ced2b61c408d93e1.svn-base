package com.gxuwz.KeepHealth.business.wx.entity;

/**
 * 微信票据实体类
 * @Tip 主要用于单机保存token票据
 * @author 叶城廷
 * @date 2019-06-16 17:15:11
 **/
public class WxToken {
    private  String token;
    private static WxToken instance  = new WxToken();


    public WxToken() {}

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public static WxToken getInstance() {
        return instance;
    }

    public static void setInstance(WxToken instance) {
        WxToken.instance = instance;
    }
}
