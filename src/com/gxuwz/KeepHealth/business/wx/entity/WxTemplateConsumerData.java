package com.gxuwz.KeepHealth.business.wx.entity;

/**
 * 发送给用户的消息模板数据实体类
 * @author 叶城廷
 * @date 2019-05-09 11:36
 */
public class WxTemplateConsumerData {

    private  WxTemplateDataValues first=new WxTemplateDataValues();
    private  WxTemplateDataValues keyword1=new WxTemplateDataValues();
    private  WxTemplateDataValues keyword2=new WxTemplateDataValues();
    private  WxTemplateDataValues keyword3=new WxTemplateDataValues();
    private  WxTemplateDataValues remark=new WxTemplateDataValues();

    public WxTemplateConsumerData(String text ,String time ){
        this.first.setValue("您的咨询已处理成功");
        this.keyword1.setValue("配方咨询");
        this.keyword2.setValue(text);
        this.keyword3.setValue(time);
        this.remark.setValue("老师已答复！请前往“公益窗口”-“打赏求方”-“我的咨询”中查看");
    }

    public WxTemplateDataValues getFirst() {
        return first;
    }

    public void setFirst(WxTemplateDataValues first) {
        this.first = first;
    }

    public WxTemplateDataValues getKeyword1() {
        return keyword1;
    }

    public void setKeyword1(WxTemplateDataValues keyword1) {
        this.keyword1 = keyword1;
    }

    public WxTemplateDataValues getKeyword2() {
        return keyword2;
    }

    public void setKeyword2(WxTemplateDataValues keyword2) {
        this.keyword2 = keyword2;
    }

    public WxTemplateDataValues getKeyword3() {
        return keyword3;
    }

    public void setKeyword3(WxTemplateDataValues keyword3) {
        this.keyword3 = keyword3;
    }

    public WxTemplateDataValues getRemark() {
        return remark;
    }

    public void setRemark(WxTemplateDataValues remark) {
        this.remark = remark;
    }
}
