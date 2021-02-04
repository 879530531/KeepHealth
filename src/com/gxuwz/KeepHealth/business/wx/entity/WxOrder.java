package com.gxuwz.KeepHealth.business.wx.entity;

/**
 * 微信订单实体类
 * @author 叶城廷
 * @version 2019.03.19
 */
public class WxOrder {
    private String appid;//公众账号ID
    private String mch_id;//商户号
    private String device_info;//设备号
    private String nonce_str;//随机字符串
    private String sign;//签名
    private String sign_type;//签名类型
    private String body;//商品描述
    //private String detail;//商品详情
    //private String attach;//附加数据
    private String out_trade_no;//商户订单号
    //private String fee_type;//标价币种
    private Integer total_fee;//标价金额
    private String spbill_create_ip;//终端IP	s
    //private String time_start;//交易起始时间
    //private String time_expire;//交易结束时间
    //private String goods_tag;//订单优惠标记
    private String notify_url;//通知地址
    private String trade_type;//交易类型
    //private String product_id;//商品ID	p
    //private String limit_pay;//指定支付方式
    private String openid;//用户标识
    //private String receipt;//电子发票入口开放标识
    //private String scene_info;//scene_info

    private String transaction_id;//微信查单时的微信订单号

    public String getAppid() {
        return appid;
    }

    public void setAppid(String appid) {
        this.appid = appid;
    }

    public String getMch_id() {
        return mch_id;
    }

    public void setMch_id(String mch_id) {
        this.mch_id = mch_id;
    }

    public String getDevice_info() {
        return device_info;
    }

    public void setDevice_info(String device_info) {
        this.device_info = device_info;
    }

    public String getNonce_str() {
        return nonce_str;
    }

    public void setNonce_str(String nonce_str) {
        this.nonce_str = nonce_str;
    }

    public String getSign() {
        return sign;
    }

    public void setSign(String sign) {
        this.sign = sign;
    }

    public String getSign_type() {
        return sign_type;
    }

    public void setSign_type(String sign_type) {
        this.sign_type = sign_type;
    }

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }

    public String getOut_trade_no() {
        return out_trade_no;
    }

    public void setOut_trade_no(String out_trade_no) {
        this.out_trade_no = out_trade_no;
    }

    public Integer getTotal_fee() {
        return total_fee;
    }

    public void setTotal_fee(Integer total_fee) {
        this.total_fee = total_fee;
    }

    public String getSpbill_create_ip() {
        return spbill_create_ip;
    }

    public void setSpbill_create_ip(String spbill_create_ip) {
        this.spbill_create_ip = spbill_create_ip;
    }

    public String getNotify_url() {
        return notify_url;
    }

    public void setNotify_url(String notify_url) {
        this.notify_url = notify_url;
    }

    public String getTrade_type() {
        return trade_type;
    }

    public void setTrade_type(String trade_type) {
        this.trade_type = trade_type;
    }

    public String getOpenid() {
        return openid;
    }

    public void setOpenid(String openid) {
        this.openid = openid;
    }

    public String getTransaction_id() {
        return transaction_id;
    }

    public void setTransaction_id(String transaction_id) {
        this.transaction_id = transaction_id;
    }
}
