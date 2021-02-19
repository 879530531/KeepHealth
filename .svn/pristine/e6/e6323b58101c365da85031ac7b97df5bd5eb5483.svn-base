package com.gxuwz.KeepHealth.business.service;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.gxuwz.KeepHealth.business.wx.entity.WxNews;
import com.gxuwz.KeepHealth.wx.util.MessageUtils;
import com.gxuwz.KeepHealth.wx.util.WeixinUtil;


/**
 * 微信事件处理业务实现层
 * @author 叶城廷
 * @version 2019.2.18
 */
@Service("wxEventMessageService")
public class WxEventMessageServiceImpl implements WxEventMessageService{

	//微信回复消息
    private String message=null;	
    @Autowired
    private TbConsumerService tbConsumerService;
    /**
	 * 微信用户关注、取消关注事件回复处理
	 * @author 叶城廷
	 * @version	2019.1.31
	 */
	@Override
	public String wxEventReply(String toUserName, String fromUserName, String event,String eventKey) {
		 //判断为订阅事件消息类型（用户关注时）
        if (MessageUtils.MESSAGE_SUBSCRIBE.equals(event)) {

            //关注后消息回复
            message =MessageUtils.initText(toUserName, fromUserName,menuText());
        	    
         //判断为取消订阅事件消息类型（用户取消关注时）
       }else if(MessageUtils.MESSAGE_UNSUBSCRIBE.equals(event)) {
        
         //判断为菜单点击事件推送
        }else if(MessageUtils.MESSAGE_CLICK.equals(event)) {
        	//养生产品推介
        	if(eventKey.equals("11")) {
        	  //拼接单图文消息
          	  WxNews newsOne=MessageUtils.initWxNews("易道养生产品推介", "", WeixinUtil.initSystemUrl("wxImage/news-11.jpg"), "https://mp.weixin.qq.com/s/2MgYvUZefZ6CeCh1rkabBA");
          	  WxNews newsTwe=MessageUtils.initWxNews("易道养生产品推介", "","", "https://mp.weixin.qq.com/s/2MgYvUZefZ6CeCh1rkabBA");
          	  List<WxNews> listNews=new ArrayList<WxNews>();
          	  listNews.add(newsOne);
           	  listNews.add(newsTwe);
          	  //使用图文消息回复
                message = MessageUtils.initNewsMessage(toUserName, fromUserName,listNews);
        	//求学指南
        	}else if(eventKey.equals("12")) {
        		 //拼接单图文消息
            	  WxNews newsOne=MessageUtils.initWxNews("求学指南", "", WeixinUtil.initSystemUrl("wxImage/news-12.jpg"), "https://mp.weixin.qq.com/s/bufVcxSfntApYMQpMchK9Q");
            	//拼接单图文消息
            	  WxNews newsTwe=MessageUtils.initWxNews("求学指南（一）（二）（三）（四）", "","", "https://mp.weixin.qq.com/s/bufVcxSfntApYMQpMchK9Q");
            	  //组装所有单图文消息
            	  List<WxNews> listNews=new ArrayList<WxNews>();
            	  listNews.add(newsOne);
             	  listNews.add(newsTwe);
            	  //使用图文消息回复
                  message = MessageUtils.initNewsMessage(toUserName, fromUserName,listNews);
        	//会员答疑
        	}else if(eventKey.equals("13")) {
				//拼接单图文消息
				WxNews newsOne=MessageUtils.initWxNews("会员答疑", "", WeixinUtil.initSystemUrl("wxImage/news-13.jpg"), "https://mp.weixin.qq.com/s/AyqoahfZQ55UxZC2TAgKXA");
				//拼接单图文消息
				WxNews newsTwe=MessageUtils.initWxNews("会员答疑", "","", "https://mp.weixin.qq.com/s/AyqoahfZQ55UxZC2TAgKXA");
				//组装所有单图文消息
				List<WxNews> listNews=new ArrayList<WxNews>();
				listNews.add(newsOne);
				listNews.add(newsTwe);
				//使用图文消息回复
				message = MessageUtils.initNewsMessage(toUserName, fromUserName,listNews);
        	//官网权威发布
        	}else if(eventKey.equals("14")) {
				//拼接单图文消息
				WxNews newsOne=MessageUtils.initWxNews("青岛山玉自然疗法研究所 官方权威发布", "", WeixinUtil.initSystemUrl("wxImage/news-14.jpg"), "https://mp.weixin.qq.com/s/uccUGXiqJg66llwYpyFfNQ");
				//拼接单图文消息
				WxNews newsTwe=MessageUtils.initWxNews("青岛山玉自然疗法研究所官方权威发布", "","", "https://mp.weixin.qq.com/s/uccUGXiqJg66llwYpyFfNQ");
				//组装所有单图文消息
				List<WxNews> listNews=new ArrayList<WxNews>();
				listNews.add(newsOne);
				listNews.add(newsTwe);
				//使用图文消息回复
				message = MessageUtils.initNewsMessage(toUserName, fromUserName,listNews);
        	//函授学员咨询电话
        	}else if(eventKey.equals("15")) {
				//拼接单图文消息
				WxNews newsOne=MessageUtils.initWxNews("八卦象数疗法释疑", "", WeixinUtil.initSystemUrl("wxImage/news-16.jpg"), "https://mp.weixin.qq.com/s/He8DjIcKyxe2GXWMCVOnfQ");
				//拼接单图文消息
				WxNews newsTwe=MessageUtils.initWxNews("八卦象数疗法释疑", "","", "https://mp.weixin.qq.com/s/He8DjIcKyxe2GXWMCVOnfQ");
				//组装所有单图文消息
				List<WxNews> listNews=new ArrayList<WxNews>();
				listNews.add(newsOne);
				listNews.add(newsTwe);
				//使用图文消息回复
				message = MessageUtils.initNewsMessage(toUserName, fromUserName,listNews);
        	}
        	
        }
		return message;
	}
	
	 /**
   	 * @test
   	 * 测试 拼接主菜单（订阅事件回复）
   	 * @author 叶城廷
   	 * @version 2019.1.27
        **/
    public static String menuText() {
        StringBuffer buffer = new StringBuffer();
        buffer.append("欢迎关注易道养生平台\n");
      /*  buffer.append("测试请按如下回复\n");
        buffer.append("1:普通纯文本回复\n");
        buffer.append("2:图文回复\n");
        buffer.append("3:图片回复\n");
        buffer.append("4:MP3音频回复\n");
        buffer.append("5:语音回复\n");
        buffer.append("6.自助听读器功能\n");
        buffer.append("？:再来一遍\n");*/
        return buffer.toString();
    }
    
}
