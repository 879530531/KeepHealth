package com.gxuwz.KeepHealth.business.wx.entity;

/**
 * 微信消息模板1.老师模板2.用户模板
 * @author 叶城廷
 * @date 2019-05-07 20:58
 */
public class WxTemplate {

  private String touser;

  private String template_id;

  private String topcolor="#FF0000";

  private String url="";

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getTopcolor() {
        return topcolor;
    }

    public void setTopcolor(String topcolor) {
        this.topcolor = topcolor;
    }

    public String getTouser() {
        return touser;
    }

    public void setTouser(String touser) {
        this.touser = touser;
    }

    public String getTemplate_id() {
        return template_id;
    }

    public void setTemplate_id(String template_id) {
        this.template_id = template_id;
    }
}
