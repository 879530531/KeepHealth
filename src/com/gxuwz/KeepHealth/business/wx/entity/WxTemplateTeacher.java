package com.gxuwz.KeepHealth.business.wx.entity;

import com.google.gson.Gson;

/**
 * 发送给老师消息的实体类
 * @author 叶城廷
 * @date 2019-05-09 11:58
 */
public class WxTemplateTeacher extends  WxTemplate {

    private WxTemplateTeacherData data;

    private  static String teacherTemplateId="dlfefAhFtA0f15LIwXqoGOOwkDS_uSlYHv-j4KRUg7g";

    public static  String getTeacherTemplate(String openId,String consumerName,String text) {
        WxTemplateTeacher wxTemplateTeacher=new WxTemplateTeacher();
        wxTemplateTeacher.setTouser(openId);
        wxTemplateTeacher.setTemplate_id(teacherTemplateId);

        WxTemplateTeacherData wxTemplateTeacherData=new WxTemplateTeacherData(consumerName,text);
        wxTemplateTeacher.setData(wxTemplateTeacherData);

        String json = new Gson().toJson(wxTemplateTeacher);
        return  json;
    }

    public WxTemplateTeacherData getData() {
        return data;
    }

    public void setData(WxTemplateTeacherData data) {
        this.data = data;
    }
}
