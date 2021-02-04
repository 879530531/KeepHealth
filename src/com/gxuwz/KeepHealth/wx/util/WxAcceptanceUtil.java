package com.gxuwz.KeepHealth.wx.util;


import com.gxuwz.KeepHealth.business.wx.entity.WxAcceptance;
import com.gxuwz.KeepHealth.util.MapUtil;
import com.gxuwz.KeepHealth.util.PropertyUtil;
import com.thoughtworks.xstream.XStream;
import net.sf.json.JSONObject;

import java.util.Map;

/**
 * 微微信JSAPI沙箱验收用例（测试使用）
 * @author 叶城廷
 * @version 2019.3.22
 */
public class WxAcceptanceUtil {
    //微信商户请求dpmain
    private static final String DOMAIN_API = "https://api.mch.weixin.qq.com";
    //微信公众号APPID
    protected static final String APPID = PropertyUtil.getProperty("APPID", "wxRequestPath.properties");
    // sandbox
    public static final String SANDBOX_MICROPAY_URL_SUFFIX     = "/sandboxnew/pay/micropay";
    //统一下单
    public static final String SANDBOX_UNIFIEDORDER_URL_SUFFIX = "/sandboxnew/pay/unifiedorder";
    public static final String SANDBOX_ORDERQUERY_URL_SUFFIX   = "/sandboxnew/pay/orderquery";
    public static final String SANDBOX_REVERSE_URL_SUFFIX      = "/sandboxnew/secapi/pay/reverse";
    public static final String SANDBOX_CLOSEORDER_URL_SUFFIX   = "/sandboxnew/pay/closeorder";
    public static final String SANDBOX_REFUND_URL_SUFFIX       = "/sandboxnew/secapi/pay/refund";
    public static final String SANDBOX_REFUNDQUERY_URL_SUFFIX  = "/sandboxnew/pay/refundquery";
    public static final String SANDBOX_DOWNLOADBILL_URL_SUFFIX = "/sandboxnew/pay/downloadbill";
    public static final String SANDBOX_REPORT_URL_SUFFIX       = "/sandboxnew/payitil/report";
    public static final String SANDBOX_SHORTURL_URL_SUFFIX     = "/sandboxnew/tools/shorturl";
    public static final String SANDBOX_AUTHCODETOOPENID_URL_SUFFIX = "/sandboxnew/tools/authcodetoopenid";

    //验签秘钥API
    public static final String GETSIGNKEY=DOMAIN_API+"/sandboxnew/pay/getsignkey";

    //商户号
    private static final String MCH_ID = "1527035711";

    //获取沙箱验签秘钥
    public  static String getSignKey(){
        String xmlStr = wxAcceptanceToXml();
        JSONObject jsonObject = WeixinUtil.doPostStr(GETSIGNKEY, xmlStr);
        return jsonObject.toString();
    }

    /**
     * 获取沙箱密钥
     * @author 叶城廷
     * @date 2019-06-16 16:58:36
     **/
    public static String wxAcceptanceToXml(){
        WxAcceptance wxAcceptance=new WxAcceptance();
        wxAcceptance.setMch_id(MCH_ID);
        wxAcceptance.setNonce_str(WxPayUtil.generateNonceStr());
        //计算签名
        Map<String, String> wxAcceptanceMap = MapUtil.transBean2Map(wxAcceptance);

        try {
            String sign = WxPayUtil.generateSignature(wxAcceptanceMap);
            wxAcceptance.setSign(WxPayUtil.generateNonceStr());
        } catch (Exception e) {
            e.printStackTrace();
        }
        //打包xml
        XStream xstream = new XStream();
        xstream.alias("xml", wxAcceptance.getClass());
        String xmlStr = xstream.toXML(wxAcceptance);
        String replace = xmlStr.replace("__", "_");
        return replace;
    }


    public static void main(String[] args) {
        String signKey = getSignKey();
        System.out.println(signKey);
    }
}
