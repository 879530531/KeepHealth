package com.gxuwz.KeepHealth.wx.util;

import com.gxuwz.KeepHealth.business.wx.entity.WxOrder;
import com.gxuwz.KeepHealth.util.MapUtil;
import com.gxuwz.KeepHealth.wx.util.WXPayXmlUtil;
import com.gxuwz.KeepHealth.wx.util.WeixinUtil;
import com.thoughtworks.xstream.XStream;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.StringWriter;
import java.security.MessageDigest;
import java.security.SecureRandom;
import java.util.*;
import org.apache.commons.beanutils.DynaBean;

/**
 * 微信支付相关使用的工具类
 * @author 叶城廷
 * @version  2019.03.21
 */
public class WxPayUtil {
    //随机字符串抽取
    private static final String SYMBOLS = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    //随机数出抽取
    private static final Random RANDOM = new SecureRandom();
    //微信支付类型-JSAPI支付
    public static final String TRADETYPE_JSAPI="JSAPI";
    //微信支付类型-H5支付
    public static final String TRADETYPE_MWEB="MWEB";
    //用于易道微信打赏求方的微信支付时的商品描述
    private static final String REWARDBODY="易道求方";
    //用于易道微信打赏求方的微信支付时的商品标价
    private static final Integer REWARDPRICE=9900;  //单位为分

    //易道微信支付密钥key
    protected static final String KEY="GXUWZYDYS0774123GXUWZYDYS0774123";

    /**
     * 微信下单发送请求前的xml包装
     * @author 叶城廷
     * @date 2019-06-16 16:54:49
     **/
    private static String wxOrderToXml(WxOrder wxOrder) {
        XStream xstream = new XStream();
        xstream.alias("xml", wxOrder.getClass());
        return xstream.toXML(wxOrder);
}

    /**
     * 打包签名（微信支付查单，关闭订单）
     * @author 叶城廷
     * @version 2019.04.15
     * @return
     */
    public static String packageSign(WxOrder wxOrder) {
        wxOrder.setNonce_str(generateNonceStr());
        wxOrder.setSign_type("MD5");
        Map<String, String> stringStringMap = MapUtil.transBean2Map(wxOrder);
        String message=null;
        try {
            wxOrder.setSign(generateSignature(stringStringMap));
            //转map生成xml
            Map<String, String> stringStringMap1 = MapUtil.transBean2Map(wxOrder);
            message= mapToXml(stringStringMap1);

        } catch (Exception e) {
            e.printStackTrace();
        }
         return message;
    }

    /**
     * 微信咨询打赏创建明文订单（打包好的xml信息，可直接请求）
     * @author 叶城廷
     * @version 2019.03.21
     * @param openId
     * @return
     */
    public static String initWxRewardOrder(String openId,String cordId){
        String message = null;
        WxOrder wxOrder=new WxOrder();
        //设备号
        wxOrder.setDevice_info("WEB");
        //随机字符串
        wxOrder.setNonce_str(generateNonceStr());
        //商品描述
        wxOrder.setBody(REWARDBODY);
        //商户订单号
        wxOrder.setOut_trade_no(cordId);
        //标价-固定31元
        wxOrder.setTotal_fee(REWARDPRICE);
        //交易类型JSAPI
        wxOrder.setTrade_type(TRADETYPE_JSAPI);
        //默认MD5加密
        wxOrder.setSign_type("MD5");
        //付款用户
        wxOrder.setOpenid(openId);
        //交接WeixinUtil补全商户隐私数据
        wxOrder=WeixinUtil.setWxPayDate(wxOrder);
        //将bean转map用于生成签名
        Map<String, String> wxOrderMap = MapUtil.transBean2Map(wxOrder);

        //初次生成签名
        try {
            wxOrder.setSign(generateSignature(wxOrderMap));//待填商家key
        } catch (Exception e) {
            System.out.println("签名生成失败");
            e.printStackTrace();
        }
        //二次转map校验签名
        Map<String, String> wxOrderMap2 = MapUtil.transBean2Map(wxOrder);
        boolean flag=false;
        //打包map转xml
        try {
            message=mapToXml(wxOrderMap2);
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("微信下单组装信息："+message);
        return message;
    }

    /**
     * @version 2019.12.31
     *  @author 林才楗
     *  下线修改金额
     */
 /*   public static String initWxRewardOrder(String openId,String cordId){
        String message = null;
        WxOrder wxOrder=new WxOrder();
        tbFee = tbFeeService.findById(1);
		tbFee.setFeeNum(res.jiemi(tbFee.getFeeNum()));
		int money = Integer.parseInt(tbFee.getFeeNum());

        
        //设备号
        wxOrder.setDevice_info("WEB");
        //随机字符串
        wxOrder.setNonce_str(generateNonceStr());
        //商品描述
        wxOrder.setBody(REWARDBODY);
        //商户订单号
        wxOrder.setOut_trade_no(cordId);
        //标价-固定31元
        wxOrder.setTotal_fee(money);
        //交易类型JSAPI
        wxOrder.setTrade_type(TRADETYPE_JSAPI);
        //默认MD5加密
        wxOrder.setSign_type("MD5");
        //付款用户
        wxOrder.setOpenid(openId);
        //交接WeixinUtil补全商户隐私数据
        wxOrder=WeixinUtil.setWxPayDate(wxOrder);
        //将bean转map用于生成签名
        Map<String, String> wxOrderMap = MapUtil.transBean2Map(wxOrder);

        //初次生成签名
        try {
            wxOrder.setSign(generateSignature(wxOrderMap));//待填商家key
        } catch (Exception e) {
            System.out.println("签名生成失败");
            e.printStackTrace();
        }
        //二次转map校验签名
        Map<String, String> wxOrderMap2 = MapUtil.transBean2Map(wxOrder);
        boolean flag=false;
        //打包map转xml
        try {
            message=mapToXml(wxOrderMap2);
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("微信下单组装信息："+message);
        return message;
    }*/
    
    

    /**
     * 生成随机字符串
     * @author 叶城廷
     * @date 2019-06-16 16:56:23
     **/
    public static String generateNonceStr() {
        char[] nonceChars = new char[32];
        for (int index = 0; index < nonceChars.length; ++index) {
            nonceChars[index] = SYMBOLS.charAt(RANDOM.nextInt(SYMBOLS.length()));
        }
        return new String(nonceChars);
    }

    /**
     * XML格式字符串转换为Map
     *
     * @param strXML XML字符串
     * @return XML数据转换后的Map
     * @throws Exception
     * @author 叶城廷
     */
    public static Map<String, String> xmlToMap(String strXML) throws Exception {
        try {
            Map<String, String> data = new HashMap<String, String>();
            DocumentBuilder documentBuilder = WXPayXmlUtil.newDocumentBuilder();
            InputStream stream = new ByteArrayInputStream(strXML.getBytes("UTF-8"));
            org.w3c.dom.Document doc = documentBuilder.parse(stream);
            doc.getDocumentElement().normalize();
            NodeList nodeList = doc.getDocumentElement().getChildNodes();
            for (int idx = 0; idx < nodeList.getLength(); ++idx) {
                Node node = nodeList.item(idx);
                if (node.getNodeType() == Node.ELEMENT_NODE) {
                    org.w3c.dom.Element element = (org.w3c.dom.Element) node;
                    data.put(element.getNodeName(), element.getTextContent());
                }
            }
            try {
                stream.close();
            } catch (Exception ex) {
                // do nothing
            }
            return data;
        } catch (Exception ex) {
            throw ex;
        }

    }

    /**
     * 将Map转换为XML格式的字符串
     *
     * @param data Map类型数据
     * @return XML格式的字符串
     * @throws Exception
     * @author 叶城廷
     */
    public static String mapToXml(Map<String, String> data) throws Exception {
        org.w3c.dom.Document document = WXPayXmlUtil.newDocument();
        org.w3c.dom.Element root = document.createElement("xml");
        document.appendChild(root);
        for (String key: data.keySet()) {
            String value = data.get(key);
            if (value == null) {
                value = "";
            }
            value = value.trim();
            org.w3c.dom.Element filed = document.createElement(key);
            filed.appendChild(document.createTextNode(value));
            root.appendChild(filed);
        }
        TransformerFactory tf = TransformerFactory.newInstance();
        Transformer transformer = tf.newTransformer();
        DOMSource source = new DOMSource(document);
        transformer.setOutputProperty(OutputKeys.ENCODING, "UTF-8");
        transformer.setOutputProperty(OutputKeys.INDENT, "yes");
        StringWriter writer = new StringWriter();
        StreamResult result = new StreamResult(writer);
        transformer.transform(source, result);
        String output = writer.getBuffer().toString(); //.replaceAll("\n|\r", "");
        try {
            writer.close();
        }
        catch (Exception ex) {
        }
        return output;
    }


    /**
     * 判断签名是否正确
     *
     * @param xmlStr XML格式数据
     * @return 签名是否正确
     * @throws Exception
     * @author 叶城廷
     */
    public static boolean isSignatureValid(String xmlStr) throws Exception {
        Map<String, String> data = xmlToMap(xmlStr);
        if (!data.containsKey("sign") ) {
            return false;
        }
        String sign = data.get("sign");
        return generateSignature(data).equals(sign);
    }

    /**
     * 判断签名是否正确，必须包含sign字段，否则返回false。使用MD5签名。
     *
     * @param data Map类型数据
     * @return 签名是否正确
     * @throws Exception
     * @author 叶城廷
     */
    public static boolean isSignatureValid(Map<String, String> data) throws Exception {

        if (generateSignature(data).equals(data.get("sign"))){
            return true;
        }else {
            return  false;
        }
    }


    /**
     * 生成签名. 注意，若含有sign_type字段，必须和signType参数保持一致。
     * @param data 待签名数据
     * @return 签名
     * @author 叶城廷
     */
    public static String generateSignature(final Map<String, String> data) throws Exception {
        Set<String> keySet = data.keySet();
        String[] keyArray = keySet.toArray(new String[keySet.size()]);
        Arrays.sort(keyArray);
        StringBuilder sb = new StringBuilder();
        for (String k : keyArray) {
            if (k.equals("sign")) {
                //若该字段为签名字段不参与签名计算
                continue;
            }
            if (data.get(k).trim().length() > 0&&k.equals("packages")){
                //因关键字冲突，遇packages转为package
                sb.append("package=prepay_id").append("=").append(data.get(k).trim()).append("&");
            }
            else  if (data.get(k).trim().length() > 0) // 参数值为空，则不参与签名
                sb.append(k).append("=").append(data.get(k).trim()).append("&");
        }
        StringBuilder append = sb.append("key=").append(KEY);
        return MD5(append.toString()).toUpperCase(); //MD5加密算法
            //return HMACSHA256(sb.toString(), key); HMACSHA256加密算法
    }

    /**
     * 生成 MD5
     *
     * @param data 待处理数据
     * @return MD5结果
     * @author 叶城廷
     */
    public static String MD5(String data) throws Exception {
        java.security.MessageDigest md = MessageDigest.getInstance("MD5");
        byte[] array = md.digest(data.getBytes("UTF-8"));
        StringBuilder sb = new StringBuilder();
        for (byte item : array) {
            sb.append(Integer.toHexString((item & 0xFF) | 0x100).substring(1, 3));
        }
        return sb.toString().toUpperCase();
    }

    /**
     * 生成 HMACSHA256
     * @param data 待处理数据
     * @param key 密钥
     * @return 加密结果
     * @throws Exception
     * @author 叶城廷
     */
    public static String HMACSHA256(String data, String key) throws Exception {
        Mac sha256_HMAC = Mac.getInstance("HmacSHA256");
        SecretKeySpec secret_key = new SecretKeySpec(key.getBytes("UTF-8"), "HmacSHA256");
        sha256_HMAC.init(secret_key);
        byte[] array = sha256_HMAC.doFinal(data.getBytes("UTF-8"));
        StringBuilder sb = new StringBuilder();
        for (byte item : array) {
            sb.append(Integer.toHexString((item & 0xFF) | 0x100).substring(1, 3));
        }
        return sb.toString().toUpperCase();
    }

    /**
     * 处理 HTTPS API返回数据，转换成Map对象。return_code为SUCCESS时，验证签名。
     * @param xmlStr API返回的XML格式数据
     * @return Map类型数据
     * @throws Exception
     * @author 叶城廷
     */
    public static Map<String, String> processResponseXml(String xmlStr) throws Exception {
        String RETURN_CODE = "return_code";
        String return_code;
        Map<String, String> respData = xmlToMap(xmlStr);
        if (respData.containsKey(RETURN_CODE)) {
            return_code = respData.get(RETURN_CODE);
        }
        else {
            throw new Exception(String.format("No `return_code` in XML: %s", xmlStr));
        }

        if (return_code.equals("FAIL")) {
            return respData;
        }
        else if (return_code.equals("SUCCESS")) {
            if (isSignatureValid(respData)) {
                return respData;
            }else {
                throw new Exception(String.format("Invalid sign value in XML: %s", xmlStr));
            }
        }
        else {
            throw new Exception(String.format("return_code value %s is invalid in XML: %s", return_code, xmlStr));
        }
    }

    /**
     * 获取当前时间戳，单位秒
     * @return
     * @author 叶城廷
     */
    public static long getCurrentTimestamp() {
        return System.currentTimeMillis()/1000;
    }

    /**
     * 获取当前时间戳，单位毫秒
     * @return
     * @author 叶城廷
     */
    public static long getCurrentTimestampMs() {
        return System.currentTimeMillis();
    }



}
