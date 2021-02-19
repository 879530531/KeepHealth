package com.gxuwz.KeepHealth.business.wx.entity;

import com.google.gson.Gson;

import java.sql.Timestamp;

/**
 * 发送给用户的模板实体类
 * @author 叶城廷
 * @date 2019-05-09 11:57
 */
public class WxTemplateConsumer extends WxTemplate {

    private WxTemplateConsumerData data;

    private  static String consumeTemplateId="4-VIA-k3a7_xN9NSebn_DPDexLvIvdNCM3foaKdUrwY";

    public static  String getConsumerTemplate(String openId,String text ,String time) {
        WxTemplateConsumer wxTemplateConsumer=new WxTemplateConsumer();
        wxTemplateConsumer.setTouser(openId);
        wxTemplateConsumer.setTemplate_id(consumeTemplateId);

        WxTemplateConsumerData wxTemplateConsumerData = new WxTemplateConsumerData(text,time);
        wxTemplateConsumer.setData(wxTemplateConsumerData);

        String json = new Gson().toJson(wxTemplateConsumer);

        return  json;
    }

    public WxTemplateConsumerData getData() {
        return data;
    }

    public void setData(WxTemplateConsumerData data) {
        this.data = data;
    }
}
