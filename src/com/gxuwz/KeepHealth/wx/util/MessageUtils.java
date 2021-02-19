package com.gxuwz.KeepHealth.wx.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;

import com.gxuwz.KeepHealth.business.wx.entity.*;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import com.thoughtworks.xstream.XStream;
/**
 * 微信消息工具类（用于组件好发送请求前的数据整理）
 * @author 叶城廷
 * @version 2019.1.28
 */
public class MessageUtils {

    //规则更新于2019.1.27
    //来源于微信公众号开发者最新文档https://mp.weixin.qq.com/wiki?t=resource/res_main&id=mp1421140453	
	
	/**
	 *       1.文本text （用户回复消息）           				 
				参数	                           描述
				ToUserName	开发者微信号
				FromUserName发送方帐号（一个OpenID）
				CreateTime	消息创建时间 （整型）
				MsgType	    text
				Content	           文本消息内容
				MsgId	           消息id，64位整型
		     2.文本text（开发者方回复消息）     
				参数	                     是否必须	       描述
				ToUserName	是	接收方帐号（收到的OpenID）
				FromUserName是	开发者微信号
				CreateTime	是	消息创建时间 （整型）
				MsgType	            是	text
				Content	            是	回复的消息内容（换行：在content中能够换行，微信客户端就支持换行显示））
	 */
	public static final String MESSAGE_TEXT = "text";
	
	/**
	 * 3.图片image（用户回复消息）           		   
				参数	         描述
				ToUserName	开发者微信号
				FromUserName发送方帐号（一个OpenID）
				CreateTime	消息创建时间 （整型）
				MsgType	    image
				PicUrl	             图片链接（由系统生成）
				MediaId	             图片消息媒体id，可以调用多媒体文件下载接口拉取数据。
				MsgId	             消息id，64位整型
	    4..图片image（开发者方回复消息）  	    
				参数	                  是否必须	说明
				ToUserName	是	接收方帐号（收到的OpenID）
				FromUserName是	开发者微信号
				CreateTime	是	消息创建时间 （整型）
				MsgType	            是	image
				MediaId	            是	通过素材管理中的接口上传多媒体文件，得到的id。         	
	 */
    public static final String MESSAGE_IMAGE = "image";
    
    /**
     *  5.语音voice（用户回复消息）     
				参数   	                  描述
				ToUserName	开发者微信号
				FromUserName	发送方帐号（一个OpenID）
				CreateTime	消息创建时间 （整型）
				MsgType	语音为voice
				MediaID	语音消息媒体id，可以调用多媒体文件下载接口拉取该媒体
				Format	语音格式：amr
				Recognition	语音识别结果，UTF8编码
				MsgID	消息id，64位整型
		6.语音voice（开发者方回复消息）
				参数	                  是否必须	说明
				ToUserName	是	接收方帐号（收到的OpenID）
				FromUserName是	开发者微信号
				CreateTime	是	消息创建时间戳 （整型）
				MsgType	            是	语音，voice
				MediaId	            是	通过素材管理中的接口上传多媒体文件，得到的id     
     */
    public static final String MESSAGE_VOICE = "voice";
    
    /**
     *  7.小视频shortvideo（用户回复消息）  
				参数              	描述
				ToUserName	开发者微信号
				FromUserName	发送方帐号（一个OpenID）
				CreateTime	消息创建时间 （整型）
				MsgType	小视频为shortvideo
				MediaId	视频消息媒体id，可以调用多媒体文件下载接口拉取数据。
				ThumbMediaId	视频消息缩略图的媒体id，可以调用多媒体文件下载接口拉取数据。
				MsgId	消息id，64位整型
     */
    public static final String MESSAGE_SHORTVOICE = "shortvideo";
    
    /**
     * 
     *   8.视频video（用户回复消息）
     *   9.视频video（开发者方回复消息）
				参数	是否必须	说明
				ToUserName	是	接收方帐号（收到的OpenID）
				FromUserName是	开发者微信号
				CreateTime	是	消息创建时间 （整型）
				MsgType	            是	video
				MediaId	            是	通过素材管理中的接口上传多媒体文件，得到的id
				Title	            否	视频消息的标题
				Description	否	视频消息的描述
     */
    public static final String MESSAGE_VIDEO = "video";
    
    /**
     *     10.连接link
                                                        参数	           描述
				ToUserName	接收方微信号
				FromUserName发送方微信号，若为普通用户，则是一个OpenID
				CreateTime	消息创建时间
				MsgType	            消息类型，link
				Title	            消息标题
				Description	消息描述
				Url	                        消息链接
				MsgId	            消息id，64位整型
     */
    public static final String MESSAGE_LINK = "link";
    
    /**
     *     11.地理经纬 location（用户回复消息） 
     *                                                参数	      描述
				ToUserName	开发者微信号
				FromUserName发送方帐号（一个OpenID）
				CreateTime	消息创建时间 （整型）
				MsgType    	location
				Location_X	地理位置维度
				Location_Y	地理位置经度
				Scale	            地图缩放大小
				Label	           地理位置信息
				MsgId	          消息id，64位整型
     */
    public static final String MESSAGE_LOCATION = "location";
   
    /**
       * 12.图文消息news（开发者方回复消息） 
			参数	是否必须	说明
			ToUserName	是	接收方帐号（收到的OpenID）
			FromUserName是	开发者微信号
			CreateTime	是	消息创建时间 （整型）
			MsgType	            是	news
			ArticleCount是	图文消息个数；当用户发送文本、图片、视频、图文、地理位置这五种消息时，开发者只能回复1条图文消息；其余场景最多可回复8条图文消息
			Articles	是	图文消息信息，注意，如果图文数超过限制，则将只发限制内的条数
			Title	            是	图文消息标题
			Description	是	图文消息描述
			PicUrl	            是	图片链接，支持JPG、PNG格式，较好的效果为大图360*200，小图200*200
			Url	                        是	点击图文消息跳转链接
       *  
     */
    public static final String MESSAGE_NEWS = "news";
    
    /**
     * 13.音乐消息music（开发者方回复消息）
			参数	是否必须	说明
			ToUserName	是	接收方帐号（收到的OpenID）
			FromUserName是	开发者微信号
			CreateTime	是	消息创建时间 （整型）
			MsgType	            是	music
			Title	            否	音乐标题
			Description	否	音乐描述
			MusicURL	否	音乐链接
			HQMusicUrl	否	高质量音乐链接，WIFI环境优先使用该链接播放音乐
			ThumbMediaId是	缩略图的媒体id，通过素材管理中的接口上传多媒体文件，得到的id
     */
    public static final String MESSAGE_MUSIC = "music";
    /**
     * Event事件推送类型：（开发者方回复消息）
     *       1.subscribe(订阅)
     *       2.unsubscribe(取消订阅)
     *            
				参数	描述
				ToUserName	开发者微信号
				FromUserName	发送方帐号（一个OpenID）
				CreateTime	消息创建时间 （整型）
				MsgType	消息类型，event
				Event	事件类型，subscribe(订阅)、unsubscribe(取消订阅)
     */
    public static final String MESSAGE_EVENT = "event";
    public static final String MESSAGE_SUBSCRIBE = "subscribe";
    public static final String MESSAGE_UNSUBSCRIBE = "unsubscribe";
    
    public static final String MESSAGE_CLICK = "CLICK";
    public static final String MESSAGE_VIEW = "VIEW";
    public static final String MESSAGE_SCANCODE= "scancode_push";

    
    /**
	 * 用于组装开发者即将回复的普通文本消息或event事件消息为XML
     * @param toUserName 接收方账号
	 * @param fromUserName 发送方账号
	 * @param content 回复内容
	 * @author 叶城廷
	 * @version 2019.1.27
	 */
    public static String initText(String toUserName, String fromUserName, String content) {

    	WxTextMessage messageText = new WxTextMessage();
		messageText.setFromUserName(toUserName);
		messageText.setToUserName(fromUserName);
		messageText.setMsgType(MessageUtils.MESSAGE_TEXT);
		messageText.setCreateTime(new Date().getTime());
		messageText.setContent(content);
		//拼接完成转官方xml格式
		return textToXml(messageText);
    }
    

	/**
	 * 图文消息的组装
	 * @param toUserName 接收方账号
	 * @param fromUserName 发送方账号
	 * @author 叶城廷
	 * @version 2019.1.27
	 */
	public static String initNewsMessage(String toUserName,String fromUserName,List<WxNews> newsList){
		String message = null;
		WxNewsMessage wxNewsMessage = new WxNewsMessage();
		WxNews wxNews = new WxNews();
		newsList.add(wxNews);
		wxNewsMessage.setToUserName(fromUserName);
		wxNewsMessage.setFromUserName(toUserName);
		wxNewsMessage.setCreateTime(new Date().getTime());
		wxNewsMessage.setMsgType(MESSAGE_NEWS);
		wxNewsMessage.setArticles(newsList);
		wxNewsMessage.setArticleCount(newsList.size()-1);
		message = newsMessageToXml(wxNewsMessage);
		return message;
	}

		/**
		 * 组装多图文中的单图文
		 * @param Title 标题
		 * @param Description 详文
		 * @param PicUrl 图片路径
		 * @param Url url链接路径
		 * @return 组装完成的单图文实体类对象
		 * @author 叶城廷
		 * @version 2019.1.27
		 */
	    public static WxNews initWxNews(String Title,String Description,String PicUrl,String Url) {
		WxNews wxNews = new WxNews();
		wxNews.setTitle(Title);
		wxNews.setDescription(Description);
		wxNews.setPicUrl(PicUrl);
		wxNews.setUrl(Url);
		return wxNews;
	    }

	    /**
		 * 组装图片消息
		 * @param toUserName 接收方账号
		 * @param fromUserName 发送方账号
		 * @param mediaId 已上传至微信端的媒体ID
		 * @author 叶城廷
		 * @version 2019.1.27
		 */
		public static String initImageMessage(String toUserName,String fromUserName,String mediaId){
			String message = null;
			WxImage wxImage = new WxImage();
			wxImage.setMediaId(mediaId);
			WxImageMessage wxImageMessage = new WxImageMessage();
			wxImageMessage.setFromUserName(toUserName);
			wxImageMessage.setToUserName(fromUserName);
			wxImageMessage.setMsgType(MESSAGE_IMAGE);
			wxImageMessage.setCreateTime(new Date().getTime());
			wxImageMessage.setWxImage(wxImage);
			message = imageMessageToXml(wxImageMessage);
			return message;
		}
		
		/**
		 * 组装音乐消息
		 * @param toUserName 接收方账号
		 * @param fromUserName 发送方账号
		 * @param wxMusic 包含ThumbMediaId的微信音频回复实体类对象
		 * @return
		 * @author 叶城廷
	     * @version 2019.1.28
		 */
		public static String initMusicMessage(String toUserName,String fromUserName, WxMusic wxMusic){
			String message = null;
	
		
			WxMusicMessage wxMusicMessage = new WxMusicMessage();
			wxMusicMessage.setFromUserName(toUserName);
			wxMusicMessage.setToUserName(fromUserName);
			wxMusicMessage.setMsgType(MESSAGE_MUSIC);
			wxMusicMessage.setCreateTime(new Date().getTime());
			wxMusicMessage.setWxMusic(wxMusic);
			message = musicMessageToXml(wxMusicMessage);
			System.out.println("音频回复:"+message);
			return message;
		}
    
		/**
		 * 
		 * @param toUserName 接收方账号
		 * @param fromUserName 发送方账号
		 * @param mediaId 已经上传至微信平台的语音文件媒体ID
		 * @return
		 * @author 叶城廷
	     * @version 2019.1.28
		 */
		public static String initVoiceMessage(String toUserName,String fromUserName,String mediaId){
			String message = null;
			WxVoice wxVoice = new WxVoice();
			wxVoice.setMediaId(mediaId);
			WxVoiceMessage wxVoiceMessage = new WxVoiceMessage();
			wxVoiceMessage.setFromUserName(toUserName);
			wxVoiceMessage.setToUserName(fromUserName);
			wxVoiceMessage.setMsgType(MESSAGE_VOICE);
			wxVoiceMessage.setCreateTime(new Date().getTime());
			wxVoiceMessage.setVoice(wxVoice);
			message = voiceMessageToXml(wxVoiceMessage);
			System.out.println("语音回复："+message);
			return message;
		}



	/**
     * XML转成map集合(将微信用户请求由xml格式转为文档后映射为map方便获取参数)
     * @author 叶城廷
     * @version 2019.1.28
     */
    @SuppressWarnings("unchecked")
	public static Map<String, String> xmlToMapText(HttpServletRequest request) throws IOException, DocumentException {
        SAXReader saxReader = new SAXReader();
        InputStream inputStream = request.getInputStream();
        Document doc = saxReader.read(inputStream);
        Element root = doc.getRootElement();
        List<Element> document = root.elements();
        Map<String, String> map = new HashMap<String, String>();
        for (Element ele : document) {
            map.put(ele.getName(), ele.getText());
        }
        inputStream.close();//关流
        return map;
    }

    /**
     * 将系统拼接好的开发者回复消息由text转成xml方便转发至微信公众平台用于回复消息
     * @author 叶城廷
     * @version  2019.1.28
     */
    public static String textToXml(WxTextMessage WxTextMessage) {
        XStream xStream = new XStream();
        xStream.alias("xml", WxTextMessage.getClass());
        return xStream.toXML(WxTextMessage);
    }


    /**
	 *用于组装开发者即将回复的图文消息为XML
	 * @param wxNewsMessage
	 * @return xml文本
	 * @author 叶城廷
     * @version 2019.1.28
	 */
	public static String newsMessageToXml(WxNewsMessage wxNewsMessage){
		XStream xstream = new XStream();
		xstream.alias("xml", wxNewsMessage.getClass());
		xstream.alias("item", new WxNews().getClass());
		System.out.println(xstream.toXML(wxNewsMessage));
		return xstream.toXML(wxNewsMessage);
	}

	/**
	 * 用于组装开发者即将回复的图片消息为XML
	 * @param wxImageMessage 图片消息
	 * @return
	 * @author 叶城廷
     * @version 2019.1.28
	 */
	public static String imageMessageToXml(WxImageMessage wxImageMessage){
		XStream xstream = new XStream();
		xstream.alias("xml", wxImageMessage.getClass());
		return xstream.toXML(wxImageMessage);
	}
	
	/**
	 * 用于组装开发者即将回复的音频消息为XML
	 * @param wxMusicMessage 音频消息
	 * @return
	 */
	public static String musicMessageToXml(WxMusicMessage wxMusicMessage){
		XStream xstream = new XStream();
		xstream.alias("xml", wxMusicMessage.getClass());
		return xstream.toXML(wxMusicMessage);
	}

    /**
     * 用于组装开发者即将回复的语音消息为XML
     * @param wxVoiceMessage 语音消息
     * @return
     * @author 叶城廷
	 * @version 2019.1.28
     */
    private static String voiceMessageToXml(WxVoiceMessage wxVoiceMessage) {
    	XStream xstream = new XStream();
		xstream.alias("xml", wxVoiceMessage.getClass());
		return xstream.toXML(wxVoiceMessage);
		}

}

