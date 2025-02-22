package com.gxuwz.KeepHealth.wx.util;

import com.google.gson.Gson;
import com.gxuwz.KeepHealth.business.entity.TbConsultationRecord;
import com.gxuwz.KeepHealth.business.entity.TbConsumer;
import com.gxuwz.KeepHealth.business.entity.TbExceptional;
import com.gxuwz.KeepHealth.business.service.TbConsultationRecordService;
import com.gxuwz.KeepHealth.business.service.TbConsultationRecordServiceImpl;
import com.gxuwz.KeepHealth.business.service.TbExceptionalService;
import com.gxuwz.KeepHealth.business.wx.entity.*;
import com.gxuwz.KeepHealth.util.MapUtil;
import com.gxuwz.KeepHealth.util.PropertyUtil;
import com.gxuwz.core.util.DateUtils;
import com.sun.org.apache.bcel.internal.generic.NEW;

import net.sf.json.JSONObject;
import sun.util.logging.resources.logging;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.impl.Log4JLogger;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.ParseException;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.beans.BeanInfo;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.io.*;
import java.lang.reflect.Method;
import java.net.*;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import java.sql.Timestamp;
import java.util.Enumeration;
import java.util.Map;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


/**
 * 微信工具及账号资料管理类
 * @Tip 沙箱地址测试使用
 * @author 叶城廷
 * @version 2019.1.29
 *
 */
@Repository
public class WeixinUtil {
	//微信商户号
	protected static final String MCH_ID = "1527035711";
	//微信公众号APPID
	protected static final String APPID = PropertyUtil.getProperty("APPID", "wxRequestPath.properties");

	//微信公众号APPSECRET
	protected static final String APPSECRET = PropertyUtil.getProperty("APPSECRET", "wxRequestPath.properties");

	//票据请求URL
	private static final String ACCESS_TOKEN_URL = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=APPID&secret=APPSECRET";

	//临时素材上传URL
	protected static final String TEMPORARY_UPLOAD_URL = "https://api.weixin.qq.com/cgi-bin/media/upload?access_token=ACCESS_TOKEN&type=TYPE";

	//永久素材上传URL	
	private static final String UPLOAD_URL = "https://api.weixin.qq.com/cgi-bin/material/add_news?access_token=ACCESS_TOKEN";

	//创建菜单请求URL
	protected static final String CREATE_MENU_URL = "https://api.weixin.qq.com/cgi-bin/menu/create?access_token=ACCESS_TOKEN";

	//查询菜单请求URL
	protected static final String QUERY_MENU_URL = "https://api.weixin.qq.com/cgi-bin/menu/get?access_token=ACCESS_TOKEN";

	//删除菜单请求URL
	protected static final String DELETE_MENU_URL = "https://api.weixin.qq.com/cgi-bin/menu/delete?access_token=ACCESS_TOKEN";

	//文件上传路径前半段
	private static final String FILE_PATH = Thread.currentThread().getContextClassLoader().getResource("").getPath().replace("WEB-INF/classes/", "").substring(1);

	//URL识别路径前前半段
	private static final String SYSTEM_URL = PropertyUtil.getProperty("SYSTEM_URL", "wxRequestPath.properties");

	//用户基本信息获取请求URL
	protected static final String QUERY_CONSUMER_URL = "https://api.weixin.qq.com/cgi-bin/user/info?access_token=ACCESS_TOKEN&openid=OPENID&lang=zh_CN";

	//微信网页回调地址
	protected static final String CALLBACKURL = SYSTEM_URL + "front/WxConnect_wxCallBack.action";

	//scope为snsapi_userinfo的网页回调请求
	protected static final String CALLBACK = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=" + APPID + "&redirect_uri=" + URLEncoder(CALLBACKURL) + "&response_type=code&scope=snsapi_userinfo&state=STATE#wechat_redirect";

	//微信code兑换toke地址
	protected static final String CODETAKETOKEN = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=" + APPID + "&secret=" + APPSECRET + "&code=CODE&grant_type=authorization_code";

	//微信商户请求dpmain
	private static final String DOMAIN_API = "https://api.mch.weixin.qq.com";

	//微信支付消息通知回调地址
	private static final String WXPAY_NOTIFY_URL = SYSTEM_URL + "front/WxConnect_wxPayCallBack.action";

	//微信支付统一下单所需的本机IPV4地址
	protected static final String IPV4 = PropertyUtil.getProperty("IPV4", "wxRequestPath.properties");

	//微信支付返回结果-成功
	public static final String RESULT_CODE_SUCCESS="SUCCESS";

	//微信支付返回结果-失败
	public static final String RESULT_CODE_FAIL="FAIL";

	//微信支付返回结果-转入退款
	public static final String RESULT_CODE_REFUND="REFUND";

	//微信支付返回结果-未支付
	public static final String RESULT_CODE_NOTPAY="NOTPAY";

	//微信支付返回结果-已关闭
	public static final String RESULT_CODE_CLOSED="CLOSED";

	//微信支付返回结果-已撤销
	public static final String RESULT_CODE_REVOKED="REVOKED";

	//微信支付返回结果-用户支付中
	public static final String RESULT_CODE_USERPAYING="USERPAYING";

	//微信支付返回结果-支付失败
	public static final String RESULT_CODE_PAYERROR="PAYERROR";

	//微信支付返回结果-支付失败
	public static final String RESULT_CODE_UNIFIEDORDER="UNIFIEDORDER";

	//微信非沙箱统一下单地址
	private static final String UNIFIEDORDER_URL_SUFFIX = DOMAIN_API + "/pay/unifiedorder";

	//微信非沙箱查单地址
	private static final String ORDERQUERY_URL_SUFFIX = DOMAIN_API + "/pay/orderquery";

	//微信非沙箱关闭订单地址
	private static final String CLOSEORDER_URL_SUFFIX = DOMAIN_API + "/pay/closeorder";

	//微信沙箱统一下单地址
	public static final String SANDBOX_UNIFIEDORDER_URL_SUFFIX = DOMAIN_API+"/sandboxnew/pay/unifiedorder";

	//微信公众号发送模板消息请求地址
    public static final String TEMPLATE_MESSAGE_URL="https://api.weixin.qq.com/cgi-bin/message/template/send?access_token=ACCESS_TOKEN";

	@Autowired
	private TbConsultationRecordService tbConsultationRecordService;

	@Autowired
	private TbExceptionalService tbExceptionalService;
	
	/*private static Logger log = Logger.getLogger(WeixinUtil.class);  */
	
	private static Logger log = Logger.getLogger(WeixinUtil.class);

	/**
	 * 当用户咨询时，发送给对应老师模板消息通知
	 * @author 叶城廷
	 * @date 2019-05-07 21:25:15
	 **/
	public static void sendTeacherTemplateMessage(String teacherOpenId,String consumerName,String text){
		JSONObject jsonObject = doPostStr(TEMPLATE_MESSAGE_URL.replace("ACCESS_TOKEN", WxToken.getInstance().getToken()), WxTemplateTeacher.getTeacherTemplate(teacherOpenId,consumerName,text));
		System.out.println("发送一条至老师的消息通知："+jsonObject);
	}

    /**
     * 当老师回复调理建议时，发送给对应用户模板消息通知
     * @author 叶城廷
     * @date 2019-05-07 21:25:35
     **/
    public static void sendConsumerTemplateMessage(String consumerOpenId,String text,String time){
		JSONObject jsonObject = doPostStr(TEMPLATE_MESSAGE_URL.replace("ACCESS_TOKEN", WxToken.getInstance().getToken()), WxTemplateConsumer.getConsumerTemplate(consumerOpenId,text, time));
		System.out.println("发送一条至用户的消息通知："+jsonObject);
    }


	/**
	 * URL转码
	 * @author 叶城廷
	 * @date 2019-06-16 16:59:59
	 **/
	public static String URLEncoder(String str) {

		try {
			str = java.net.URLEncoder.encode(str, "GBK");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return str;
	}

	/**
	 * get请求封装
	 * @param url 任意微信请求URL
	 * @return 请求返回值
	 * @throws ParseException
	 * @throws IOException
	 * @author 叶城廷
	 * @version 2019.1.29
	 */
	public static JSONObject doGetStr(String url) {
		DefaultHttpClient client = new DefaultHttpClient();
		HttpGet httpGet = new HttpGet(url);
		JSONObject jsonObject = null;
		HttpResponse httpResponse;
		try {
			httpResponse = client.execute(httpGet);
			HttpEntity entity = httpResponse.getEntity();
			if (entity != null) {
				String result;
				result = EntityUtils.toString(entity, "UTF-8");
				jsonObject = JSONObject.fromObject(result);
			}
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return jsonObject;
	}

	/**
	 * POST请求封装（返回Str）
	 * @param url    任意微信请求URL
	 * @param outStr 携带参数字符串
	 * @return 请求返回值
	 * @throws ParseException
	 * @throws IOException
	 * @author 叶城廷
	 * @version 2019.1.29
	 */
	public static JSONObject doPostStr(String url, String outStr) {
		DefaultHttpClient client = new DefaultHttpClient();
		HttpPost httpost = new HttpPost(url);
		JSONObject jsonObject = null;
		try {
			httpost.setEntity(new StringEntity(outStr, "UTF-8"));
			HttpResponse response = client.execute(httpost);
			String result = EntityUtils.toString(response.getEntity(), "UTF-8");
			jsonObject = JSONObject.fromObject(result);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return jsonObject;
	}

	/**
	 * POST请求封装（返回XML）待写完
	 * @Tip 主要用于微信支付请求
	 * @param url    任意微信请求URL
	 * @param outStr 携带参数字符串
	 * @return 请求返回值
	 * @throws ParseException
	 * @throws IOException
	 * @author 叶城廷
	 * @version 2019.1.29
	 */
	public static JSONObject doPostStrReturnXml(String url, String outStr) {
		DefaultHttpClient client = new DefaultHttpClient();
		HttpPost httpost = new HttpPost(url);
		JSONObject jsonObject = null;
		try {
			httpost.setEntity(new StringEntity(outStr, "UTF-8"));
			HttpResponse response = client.execute(httpost);
			String result = EntityUtils.toString(response.getEntity(), "UTF-8");
			System.out.println("微信支付请求返回" + result);
			Map<String, String> stringStringMap = WxPayUtil.processResponseXml(result);
			jsonObject = JSONObject.fromObject(stringStringMap);
			System.out.println(jsonObject);
		} catch (Exception e) {
			/*StringWriter sw = new StringWriter();  
			PrintWriter pw = new PrintWriter(sw);  
			e.printStackTrace(pw);  
			sw.toString();*/
			
			log.error("支付请求返回异常:",e);
			/*log.error("系统异常:",sw.toString());*/
		
		}
		return jsonObject;
	}



	/**
	 * 文件上传
	 * @Tip 主要用于前期对公众号的测试，如回复图片，音频，缩略图等文件
	 * @param filePath 文件路径
	 * @param type     类型
	 * @param option   类型 选择上传为永久素材:1还是临时素材:2（3天有效）
	 * @return mediaId媒体ID
	 * @throws IOException
	 * @throws NoSuchAlgorithmException
	 * @throws NoSuchProviderException
	 * @throws KeyManagementException
	 * @author 叶城廷
	 * @version 2019.1.29
	 */
	public static String upload(String filePath, String type, int option) throws IOException, NoSuchAlgorithmException, NoSuchProviderException, KeyManagementException {
		File file = new File(filePath);
		if (!file.exists() || !file.isFile()) {
			throw new IOException("文件不存在");
		}
		//上传地址选择
		String uploadUrl = null;

		//选择上传为永久素材还是临时素材（3天有效）
		if (option == 1) {
			uploadUrl = UPLOAD_URL;
		} else if (option == 2) {
			uploadUrl = TEMPORARY_UPLOAD_URL;
		}

		//对链接使用查找替换数值拼接成准确的token请求URL
		String url = uploadUrl.replace("ACCESS_TOKEN", WxToken.getInstance().getToken()).replace("TYPE", type);

		URL urlObj = new URL(url);
		//连接
		HttpURLConnection con = (HttpURLConnection) urlObj.openConnection();

		con.setRequestMethod("POST");
		con.setDoInput(true);
		con.setDoOutput(true);
		con.setUseCaches(false);

		//设置请求头信息
		con.setRequestProperty("Connection", "Keep-Alive");
		con.setRequestProperty("Charset", "UTF-8");

		//设置边界
		String BOUNDARY = "----------" + System.currentTimeMillis();
		con.setRequestProperty("Content-Type", "multipart/form-data; boundary=" + BOUNDARY);

		StringBuilder sb = new StringBuilder();
		sb.append("--");
		sb.append(BOUNDARY);
		sb.append("\r\n");
		sb.append("Content-Disposition: form-data;name=\"file\";filename=\"" + file.getName() + "\"\r\n");
		sb.append("Content-Type:application/octet-stream\r\n\r\n");

		byte[] head = sb.toString().getBytes("utf-8");

		//获得输出流
		OutputStream out = new DataOutputStream(con.getOutputStream());
		//输出表头
		out.write(head);

		//文件正文部分
		//把文件已流文件的方式 推入到url中
		DataInputStream in = new DataInputStream(new FileInputStream(file));
		int bytes = 0;
		byte[] bufferOut = new byte[1024];
		while ((bytes = in.read(bufferOut)) != -1) {
			out.write(bufferOut, 0, bytes);
		}
		in.close();

		//结尾部分
		byte[] foot = ("\r\n--" + BOUNDARY + "--\r\n").getBytes("utf-8");//定义最后数据分隔线

		out.write(foot);

		out.flush();
		out.close();

		StringBuffer buffer = new StringBuffer();
		BufferedReader reader = null;
		String result = null;
		try {
			//定义BufferedReader输入流来读取URL的响应
			reader = new BufferedReader(new InputStreamReader(con.getInputStream()));
			String line = null;
			while ((line = reader.readLine()) != null) {
				buffer.append(line);
			}
			if (result == null) {
				result = buffer.toString();
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (reader != null) {
				reader.close();
			}
		}

		JSONObject jsonObj = JSONObject.fromObject(result);
		System.out.println(jsonObj);
		String typeName = "media_id";
		if ("thumb".equals(type)) {
			typeName = "thumb_media_id";
		}
		String mediaId = jsonObj.getString(typeName);
		//输出媒体ID
		return mediaId;
	}

	/**
	 * 获取accessToken（票据）
	 * @Tip 票据已使用TokenListener定时器自动获取并自动更新到WxToken单机实体类中
	 * @return 票据
	 * @throws ParseException
	 * @throws IOException
	 * @author 叶城廷
	 * @version 2019.1.29
	 */
	public static WxAccessToken getAccessToken() {
		WxAccessToken token = new WxAccessToken();
		//对链接使用查找替换数值拼接成准确的票据请求URL
		String url = ACCESS_TOKEN_URL.replace("APPID", APPID).replace("APPSECRET", APPSECRET);
		JSONObject jsonObject = null;
		try {
			jsonObject = doGetStr(url);
			System.out.println(jsonObject);
			if (jsonObject != null) {
				token.setToken(jsonObject.getString("access_token"));
				token.setExpiresIn(jsonObject.getInt("expires_in"));
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return token;
	}

	/**
	 * 组装菜单
	 * @Tip 组装微信菜单，需更改微信菜单在此处更改，具体详情参考微信开发文档
	 * @return 组装好的菜单字符串
	 * @author 叶城廷
	 * @version 2019.1.29
	 */
	public static String initMenu() {
		/*WxMenu menu = new WxMenu();
		WxClickButton button11 = new WxClickButton();
		button11.setName("国学养生");
		button11.setType("click");
		button11.setKey("11");

		WxViewButton button21 = new WxViewButton();
		button21.setName("view菜单");
		button21.setType("view");
		button21.setUrl("http://www.imooc.com");

		WxClickButton button31 = new WxClickButton();
		button31.setName("扫码事件");
		button31.setType("scancode_push");
		button31.setKey("31");

		WxClickButton button32 = new WxClickButton();
		button32.setName("地理位置");
		button32.setType("location_select");
		button32.setKey("32");

		WxButton button = new WxButton();
		button.setName("关于我们");
		button.setSub_button(new WxButton[]{button31,button32});

		menu.setButton(new WxButton[]{button11,button21,button});*/
		WxMenu menu = new WxMenu();

		WxClickButton button11 = new WxClickButton();
		button11.setName("养生产品推介");
		button11.setType("click");
		button11.setKey("11");

		WxClickButton button12 = new WxClickButton();
		button12.setName("求学指南");
		button12.setType("click");
		button12.setKey("12");

		WxClickButton button13 = new WxClickButton();
		button13.setName("会员答疑");
		button13.setType("click");
		button13.setKey("13");

		WxClickButton button14 = new WxClickButton();
		button14.setName("官网权威发布");
		button14.setType("click");
		button14.setKey("14");

		WxClickButton button15 = new WxClickButton();
		button15.setName("八卦象数疗法释疑");
		button15.setType("click");
		button15.setKey("15");

		WxButton button1 = new WxButton();
		button1.setName("国学养生");
		button1.setSub_button(new WxButton[]{button11, button12, button13, button14, button15});

		WxViewButton button2 = new WxViewButton();
		//获取会员中心网址
		button2.setName("会员中心");
		button2.setType("view");
        button2.setUrl("http://wx.ydxsys.com/" + "weixin/MemberLogin.jsp");
		//button2.setUrl(SYSTEM_URL + "weixin/MemberLogin.jsp");

		WxViewButton button31 = new WxViewButton();
		button31.setName("老师登录");
		button31.setType("view");
		button31.setUrl(CALLBACK.replace("STATE", "TEACHERLOGIN"));

		WxViewButton button32 = new WxViewButton();
		button32.setName("打赏求方");
		button32.setType("view");
		button32.setUrl(CALLBACK.replace("STATE", "REWARDFORMULA"));

		WxViewButton button33 = new WxViewButton();
		button33.setName("免费取方");
		button33.setType("view");
		button33.setUrl(CALLBACK.replace("STATE", "FREEFORMULA"));

		WxViewButton button34 = new WxViewButton();
		button34.setName("自助助念器");
		button34.setType("view");
		button34.setUrl(CALLBACK.replace("STATE", "READNUMBER"));

		WxViewButton button35 = new WxViewButton();
		button35.setName("简介与使用说明");
		button35.setType("view");
        //button35.setUrl(SYSTEM_URL + "/weixin/wkfym.jsp");
		button35.setUrl("https://mp.weixin.qq.com/s/EVwHf16UpvV0Y-9Azqf8QA");  //测试需要展示更换


		WxButton button3 = new WxButton();
		button3.setName("公益窗口");
		button3.setSub_button(new WxButton[]{button31, button32, button33, button34, button35});
		menu.setButton(new WxButton[]{button1, button2, button3});
		String jsonString = JSONObject.fromObject(menu).toString();
		return jsonString;
	}


	/**
	 * 微信公众号创建菜单（再次执行将覆盖原菜单所有信息）→用于项目启动器
	 * @return 请求返回结果
	 * @throws ParseException
	 * @throws IOException
	 * @author 叶城廷
	 * @version 2019.1.29
	 */
	public static String createMenu() {
		String resultStr = null;
		int result = 0;
		//对链接使用查找替换数值拼接成准确的菜单创建请求URL
		String url = CREATE_MENU_URL.replace("ACCESS_TOKEN",WxToken.getInstance().getToken());
		JSONObject jsonObject = doPostStr(url, initMenu());
		if (jsonObject != null) {
			result = jsonObject.getInt("errcode");
		}
		if (result == 0) {
			resultStr = "success";
		} else if (result == -1) {
			resultStr = "系统繁忙，此时请开发者稍候再试";
		} else if (result == 40001) {
			resultStr = "AppSecret错误或者AppSecret不属于这个公众号，请开发者确认AppSecret的正确性";
		} else if (result == 40002) {
			resultStr = "请确保grant_type字段值为client_credential";
		} else if (result == 40164) {
			resultStr = "调用接口的IP地址不在白名单中，请在接口IP白名单中进行设置。（小程序及小游戏调用不要求IP地址在白名单内。";
		} else {
			resultStr = "创建易道公众号菜单失败，错误代码" + result;
		}
		return resultStr;
	}

	/**
	 * 微信公众号当前菜单信息查询
	 * @Tip 用于项目启动时创建菜单后查询菜单并打印至控制台确认无误
	 * @return 请求返回结果
	 * @throws ParseException
	 * @throws IOException
	 * @author 叶城廷
	 * @version 2019.1.29
	 */
	public static JSONObject queryMenu() {
		//对链接使用查找替换数值拼接成准确的菜单查询请求URL
		String url = QUERY_MENU_URL.replace("ACCESS_TOKEN", WxToken.getInstance().getToken());
		JSONObject jsonObject = doGetStr(url);
		return jsonObject;
	}

	/**
	 * 微信公众号菜单删除
	 * @Tip 菜单删除，请勿在项目上线时随意执行本方法
	 * @return 请求返回结果
	 * @throws ParseException
	 * @throws IOException
	 * @author 叶城廷
	 * @version 2019.1.29
	 */
	public static int deleteMenu() {
		//对链接使用查找替换数值拼接成准确的菜单删除URL
		String url = DELETE_MENU_URL.replace("ACCESS_TOKEN", WxToken.getInstance().getToken());
		JSONObject jsonObject = doGetStr(url);
		int result = 0;
		if (jsonObject != null) {
			result = jsonObject.getInt("errcode");
		}
		return result;
	}


	/**
	 * URL拼接
	 * @Tip 用于拼接出完整的系统URL路径，部分代码需用到该地址
	 * @param secondUrl 第二段拼接字符串
	 * @return 完整URL字符串
	 * @author 叶城廷
	 * @version 2019.1.29
	 */
	public static String initSystemUrl(String secondUrl) {

		return SYSTEM_URL + secondUrl;
	}

	/**
	 * 文件路径拼接
	 * @Tip FILE_PATH为项目启动时自动读取项目所在路径，之后拼接出相应代码所需的文件夹路径，形成完整的绝对路径
	 * @param secondPath 第二段拼接字符串
	 * @return 完整路径字符串
	 * @author 叶城廷
	 * @version 2019.1.29
	 */
	public static String initFilePath(String secondPath) {

		return FILE_PATH + secondPath;
	}

	/**
	 * 获取用户基本信息
	 * @Tip 用于获取该公众平台上的所有用户的基础信息，不含隐私信息
	 * @return
	 * @throws ParseException
	 * @throws IOException
	 * @author 叶城廷
	 * @version 2019.2.17
	 */
	public static TbConsumer queryConsumer(String openId) {
		//对链接替换token
		String url = QUERY_CONSUMER_URL.replace("ACCESS_TOKEN", WxToken.getInstance().getToken());
		//对链接替换openId
		url = url.replace("OPENID", openId);
		//使用GET查询信息
		JSONObject jsonStr = doGetStr(url);
	
		TbConsumer tbConsumer = new TbConsumer();
		tbConsumer.setOpenId(openId);

	
		try{
			//未知异常处理  -2019.06.21
			tbConsumer.setConsumerName(deWXName(jsonStr.getString("nickname")));
			tbConsumer.setConsumerCountry(jsonStr.getString("country"));
			tbConsumer.setConsumerCity(jsonStr.getString("city"));
			tbConsumer.setConsumerHeadImgUrl(jsonStr.getString("headimgurl"));
			tbConsumer.setConsumerSex(Integer.valueOf(jsonStr.getString("sex")));
		}catch (Exception e){
			// e.printStackTrace();
			 String str="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
		     Random random=new Random();
		     StringBuffer sb=new StringBuffer();
		     for(int i = 0; i < 11; i++){
		       int number=random.nextInt(62);
		       sb.append(str.charAt(number));
		     }
			
			tbConsumer.setConsumerName(sb.toString());
			tbConsumer.setConsumerCountry("中国");
			tbConsumer.setConsumerHeadImgUrl("http://wx.ydxsys.com/images/i07.png");
			
			tbConsumer.setConsumerSex(0);
			
		}
		new DateUtils();
		tbConsumer.setAttentionTime(Timestamp.valueOf(DateUtils.formatTimeNow()));
		//System.out.println("+++++"+new Gson().toJson(tbConsumer));
		return tbConsumer;
	}
	
	

	/**
	 * 处理微信名称带特殊符号
	 * @Tip 因获取用户信息时，部分用户使用表情等作为用户名导致用户名有部分问题
	 * @author 叶城廷
	 * @version	2019.04.05
	 * @param showName 微信名
	 */
	public static String deWXName(String showName){
		if(showName.isEmpty()){
			return null;
		}
		try{
			Pattern emoji = Pattern.compile ("[\ud83c\udc00-\ud83c\udfff]|[\ud83d\udc00-\ud83d\udfff]|[\u2600-\u27ff]",Pattern.UNICODE_CASE | Pattern . CASE_INSENSITIVE ) ;
			Matcher emojiMatcher = emoji.matcher(showName);
			if ( emojiMatcher.find())
			{
				showName = emojiMatcher.replaceAll("*");
			}
		}catch (Exception e) {

		}
		return showName;
	}

	/**
	 * 使用code请求openid和token（主要取openId）
	 * @Tip 用户点击菜单时接收的code码在本方法将code通过get方法请求得到用户的openId
	 * @author 叶城廷
	 * @date 2019-06-16 17:11:28
	 **/
	public static String codeTakeOpenid(String code) {
		String url = CODETAKETOKEN.replace("CODE", code);
		JSONObject jsonObject = doGetStr(url);
		String openid = jsonObject.getString("openid");
		return openid;
	}

	/**
	 * 微信支付统一下单请求
	 * @Tip 发送微信支付下单请求
	 * @author 叶城廷
	 * @date 2019-06-16 17:11:45
	 **/
	public  String unifiedRewardOrder(String openId,String cordId) {
		//返回json字符串
		String jsonStr="";
		//预支付标识
		String prepay_id=null;
		//非沙箱测试
		String url = UNIFIEDORDER_URL_SUFFIX;

		String xmlStr = WxPayUtil.initWxRewardOrder(openId, cordId);

		JSONObject jsonObject =doPostStrReturnXml(url,xmlStr);
		String return_code = jsonObject.getString("return_code");
		if(return_code.equals(RESULT_CODE_SUCCESS)){
			//测试
			System.out.println("下单请求返回信息："+jsonObject.getString("return_msg"));
			//获取业务结果
			String result_code = jsonObject.getString("result_code");
			//判断业务处理结果
			if(result_code.equals(RESULT_CODE_SUCCESS)){
				//专程查询微信订单号
				//String waterNumber=queryOrder(cordId,"transaction_id");

                //拉取预支付标识
				prepay_id=jsonObject.getString("prepay_id");
                //打包数据
				jsonStr = packageJson(prepay_id);
				//jsonStr=APPID+","+WxPayUtil.getCurrentTimestamp()+WxPayUtil.generateNonceStr()+"prepay_id="+prepay_id+"MD5";
				//咨询记录业务层保存流水记录
				try{
					tbConsultationRecordService.saveWaterNumber(cordId,prepay_id);
				}catch (Exception e){
					System.out.println("保存记录失败，cordId："+cordId+",prepayId:"+prepay_id);
				}
		   }else {

				System.out.println("统一下单业务处理失败");
			}
		}else {
			System.out.println("统一下单失败");
		}
		return jsonStr;
	}


	/**
	 * 打包拉起微信支付数据
	 * @Tip 请求微信支付下单后得到下单码后打包数据至jsp页面拉起js方法调起微信支付
	 * @author 叶城廷
	 * @date 2019-06-16 17:12:33
	 **/
	public  static  String packageJson(String prepay_id){
		String jsonStr="";
		//打包数据
		WxJSBridge wxJSBridge=new WxJSBridge(APPID,String.valueOf(WxPayUtil.getCurrentTimestamp()),WxPayUtil.generateNonceStr(),prepay_id,"MD5");
		//bean转Map
		Map<String, String> wxJSBridgeMap = MapUtil.transBean2Map(wxJSBridge);
		//生成签名
		try {
			String sign = WxPayUtil.generateSignature(wxJSBridgeMap);
			wxJSBridge.setPaySign(sign);
			//拼接前台拉起微信所需数据
			/*  BeanInfo beanInfo = Introspector.getBeanInfo(wxJSBridge.getClass());
			PropertyDescriptor[] propertyDescriptors = beanInfo.getPropertyDescriptors();
			for (PropertyDescriptor property : propertyDescriptors) {
				String key = property.getName();     // 过滤class属性
				if (!key.equals("class")) {      // 得到property对应的getter方法
					Method getter = property.getReadMethod();
					String value = (String) getter.invoke(wxJSBridge);
					jsonStr+=value+",";
				}
			}*/
			jsonStr = new Gson().toJson(wxJSBridge);
			System.out.println(jsonStr);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jsonStr;
	}

	/**
	 * 核对微信支付订单完成情况
	 * @Tip 微信支付完成后调用本方法二次进行核查支付完成情况
	 * @author 叶城廷
	 * @version 2019.03.21
	 * @param recordId 商户订单号
	 */
	public  static  String queryOrder(String recordId,String param){
		String flag="false";
      WxOrder wxOrder=new WxOrder();
      wxOrder.setAppid(APPID);
      wxOrder.setMch_id(MCH_ID);
      wxOrder.setOut_trade_no(recordId);
      //转微信支付补充数据
		String message = WxPayUtil.packageSign(wxOrder);
		System.out.println("message:"+message);
		JSONObject jsonObject = doPostStrReturnXml(ORDERQUERY_URL_SUFFIX,message);
		System.out.println("jsonObject:"+jsonObject);
		if (jsonObject.getString("return_code").equals(RESULT_CODE_SUCCESS)){
			if(jsonObject.getString("result_code").equals(RESULT_CODE_SUCCESS)){
				String trade_state = jsonObject.getString(param);
				flag=trade_state;
			}else {
				flag=RESULT_CODE_FAIL;
				System.out.println("微信查单出现异常："+jsonObject.getString("err_code_des"));
			}
		}else {
			flag=RESULT_CODE_FAIL;
			System.out.println("微信查单出现异常："+jsonObject.getString("return_msg"));
		}
		return flag;
	}

	/**
	 * 查询本机IPV4地址
	 * @author 叶城廷
	 * @version 2019.03.21
	 */
	public static String queryIpv4() {
		Enumeration allNetInterfaces = null;
		try {
			allNetInterfaces = NetworkInterface.getNetworkInterfaces();
		} catch (java.net.SocketException e) {
			e.printStackTrace();
		}
		InetAddress ip = null;
		while (allNetInterfaces.hasMoreElements()) {
			NetworkInterface netInterface = (NetworkInterface) allNetInterfaces
					.nextElement();
			Enumeration addresses = netInterface.getInetAddresses();
			while (addresses.hasMoreElements()) {
				ip = (InetAddress) addresses.nextElement();
				if (ip != null && ip instanceof Inet4Address) {
					if (ip.getHostAddress().equals("127.0.0.1")) {
						continue;
					}
					return ip.getHostAddress();
				}
			}
		}
		return null;
	}

	/**
	 * 补全微信支付统一下单所需的商户隐私数据
	 * @param wxOrder
	 * @return
	 * @author 叶城廷
	 * @version 2019.03.21
	 */
	public static WxOrder setWxPayDate(WxOrder wxOrder) {
		wxOrder.setAppid(APPID);
		wxOrder.setMch_id(MCH_ID);
		wxOrder.setSpbill_create_ip(IPV4);
		wxOrder.setNotify_url(WXPAY_NOTIFY_URL);
		return wxOrder;
	}

	/*
	 * 翻译方法测试2019.1.29叶城廷
	 * @test
	 * public static String translate(String source) throws ParseException, IOException{
		String url = "http://openapi.baidu.com/public/2.0/translate/dict/simple?client_id=jNg0LPSBe691Il0CG5MwDupw&q=KEYWORD&from=auto&to=auto";
		url = url.replace("KEYWORD", URLEncoder.encode(source, "UTF-8"));
		JSONObject jsonObject = doGetStr(url);
		String errno = jsonObject.getString("errno");
		Object obj = jsonObject.get("data");
		StringBuffer dst = new StringBuffer();
		if("0".equals(errno) && !"[]".equals(obj.toString())){
			TransResult transResult = (TransResult) JSONObject.toBean(jsonObject, TransResult.class);
			Data data = transResult.getData();
			Symbols symbols = data.getSymbols()[0];
			String phzh = symbols.getPh_zh()==null ? "" : "中文拼音："+symbols.getPh_zh()+"\n";
			String phen = symbols.getPh_en()==null ? "" : "英式英标："+symbols.getPh_en()+"\n";
			String pham = symbols.getPh_am()==null ? "" : "美式英标："+symbols.getPh_am()+"\n";
			dst.append(phzh+phen+pham);
			
			Parts[] parts = symbols.getParts();
			String pat = null;
			for(Parts part : parts){
				pat = (part.getPart()!=null && !"".equals(part.getPart())) ? "["+part.getPart()+"]" : "";
				String[] means = part.getMeans();
				dst.append(pat);
				for(String mean : means){
					dst.append(mean+";");
				}
			}
		}else{
			dst.append(translateFull(source));
		}
		return dst.toString();
	}
	
	public static String translateFull(String source) throws ParseException, IOException{
		String url = "http://openapi.baidu.com/public/2.0/bmt/translate?client_id=jNg0LPSBe691Il0CG5MwDupw&q=KEYWORD&from=auto&to=auto";
		url = url.replace("KEYWORD", URLEncoder.encode(source, "UTF-8"));
		JSONObject jsonObject = doGetStr(url);
		StringBuffer dst = new StringBuffer();
		List<Map> list = (List<Map>) jsonObject.get("trans_result");
		for(Map map : list){
			dst.append(map.get("dst"));
		}
		return dst.toString();
	}*/

	/**
	 * 用于手动放置token批量获取用户信息（测试使用，其余人禁止只用本方法批量获取个人基础信息）
	 * @return
	 * @author 叶城廷
	 * @version 2019.04.17
	 */
	public static TbConsumer queryConsumerSample(String openId,String token) {
		//对链接替换token
		String url = QUERY_CONSUMER_URL.replace("ACCESS_TOKEN", token);
		//对链接替换openId
		url = url.replace("OPENID", openId);
		//使用GET查询信息
		JSONObject jsonStr = doGetStr(url);
		TbConsumer tbConsumer = new TbConsumer();
		tbConsumer.setOpenId(openId);
		tbConsumer.setConsumerSex(Integer.valueOf(jsonStr.getString("sex")));
		tbConsumer.setConsumerName(deWXName(jsonStr.getString("nickname")));
		tbConsumer.setConsumerCountry(jsonStr.getString("country"));
		tbConsumer.setConsumerCity(jsonStr.getString("city"));
		tbConsumer.setConsumerHeadImgUrl(jsonStr.getString("headimgurl"));
		new DateUtils();
		tbConsumer.setAttentionTime(Timestamp.valueOf(DateUtils.formatTimeNow()));
		return tbConsumer;
	}

	/**
	 * 用于查询订单交易状态
	 * @return
	 * @author 叶城廷
	 * @version 2019.04.17
	 */
	public  String unifiedOrder(String openId, String recordId, String prepayId) {
		String data=null;
		if (prepayId==null||prepayId==""||prepayId.hashCode()==0){
			//未下过单，直接下单
			data = unifiedRewardOrder(openId, recordId);
		}else {
			//查询当前订单状态，是否需要关闭订单
			String queryOrder = queryOrder(recordId,"trade_state");
			if (queryOrder.equals(WeixinUtil.RESULT_CODE_CLOSED)){
				//订单已关闭，重新下单,标记订单关闭
				tbConsultationRecordService.closeOrder(prepayId);
				data = unifiedRewardOrder(openId, recordId);
			}else if (queryOrder.equals(WeixinUtil.RESULT_CODE_NOTPAY)){
				//调取数据库二次检查距离最新的下单时间是否超过2小时
				boolean flag=tbExceptionalService.queryPrepayTime(prepayId);
				if (flag){
					//支付超时，重新下单
					tbConsultationRecordService.closeOrder(prepayId);
					data = unifiedRewardOrder(openId, recordId);
				}else {
					//未支付，拉取当前流水重新支付
					data=packageJson(prepayId);
					//二次检查是否存在流水
					tbConsultationRecordService.queryWater(recordId,prepayId);
				}

			}else if (queryOrder.equals(WeixinUtil.RESULT_CODE_PAYERROR)||queryOrder.equals(WeixinUtil.RESULT_CODE_USERPAYING)){
				//1.用户正在支付，卡bug状态，关闭订单，重新下单支付2.支付失败，关闭订单重新拉起支付
				closeOrder(recordId);
                data=unifiedRewardOrder(openId, recordId);
			}else if (queryOrder.equals(WeixinUtil.RESULT_CODE_SUCCESS)){
				//用户支付成功，变更交易状态
				tbConsultationRecordService.successOrder(recordId);
			}
		}

		return data;
	}

	/**
	 * 用于关闭微信支付订单
	 * @return
	 * @author 叶城廷
	 * @version 2019.04.17
	 */
	private static void closeOrder(String recordId) {
		boolean flag=false;
           WxOrder wxOrder=new WxOrder();
           wxOrder.setAppid(APPID);
           wxOrder.setMch_id(MCH_ID);
           wxOrder.setOut_trade_no(recordId);
           wxOrder.setSign_type("MD5");
           //交支付工具层打包签名
		   String message = WxPayUtil.packageSign(wxOrder);
		   JSONObject jsonObject = doPostStrReturnXml(CLOSEORDER_URL_SUFFIX, message);
		   if (jsonObject.getString("return_code").equals(WeixinUtil.RESULT_CODE_SUCCESS)){
		   	   if (jsonObject.getString("result_code").equals(WeixinUtil.RESULT_CODE_SUCCESS)){
				   System.out.println("支付订单关闭成功："+recordId);
			   }else {
				   System.out.println("关闭订单失败:"+jsonObject);
			   }
		   }else {
			   System.out.println("关闭订单失败:"+jsonObject);
		   }
	}

	public TbConsultationRecordService getTbConsultationRecordService() {
		return tbConsultationRecordService;
	}

	public void setTbConsultationRecordService(TbConsultationRecordService tbConsultationRecordService) {
		this.tbConsultationRecordService = tbConsultationRecordService;
	}
}
