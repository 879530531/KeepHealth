package com.gxuwz.KeepHealth.business.service;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.SequenceInputStream;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.http.ParseException;
import org.apache.poi.hssf.record.PageBreakRecord.Break;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.gxuwz.KeepHealth.business.dao.TbReadDeviceDao;
import com.gxuwz.KeepHealth.business.wx.entity.WxButton;
import com.gxuwz.KeepHealth.business.wx.entity.WxClickButton;
import com.gxuwz.KeepHealth.business.wx.entity.WxMenu;
import com.gxuwz.KeepHealth.business.wx.entity.WxMusic;
import com.gxuwz.KeepHealth.business.wx.entity.WxNews;
import com.gxuwz.KeepHealth.business.wx.entity.WxViewButton;
import com.gxuwz.KeepHealth.util.FileUtil;
import com.gxuwz.KeepHealth.wx.util.MessageUtils;
import com.gxuwz.KeepHealth.wx.util.WeixinUtil;
import com.gxuwz.core.util.UidUtils;

/**
 * 针对微信用户发送的文本类型消息进行回复的业务处理层
 * @author 叶城廷
 * @version 2019.1.28
 *
 */
@Service("wxMessageService")
public class WxTextMessageServiceImpl implements WxTextMessageService {

	//微信听读器回复功能调取音频需要
	@Autowired
	private TbReadDeviceDao tbReadDeviceDao;

	//微信回复消息
    private String message=null;

	/**
	 * 根据微信用户发送的消息内容进行判断后做出相应回复（测试使用，因上线后无需任何的关键字回复，这里不做处理）
	 * @param toUserName 开发者微信号
	 * @param fromUserName 发送方帐号（一个OpenID）
	 * @param content 文本消息内容
	 * @author 叶城廷
	 * @version 2019.1.27
	 */
	@Override
	public String wxTextReply(String toUserName, String fromUserName, String content) {
		 //定义回复内容字段
				
				//内容判断做相应消息回复内容并拼接成为微信开发者文档需求格式
				/*2019.1.27测试
		        messageText.setFromUserName(toUserName);
		        messageText.setToUserName(fromUserName);
		        messageText.setMsgType("text");
		        messageText.setCreateTime(new Date().getTime() + "");
		        messageText.setContent("你好，你发送的消息是" + content);
		        message = MessageUtils.textToXml(messageText);
		        */
			
		   //将内容进行所有字母字符串转大写，方便检测
		 /*  String str =switchUpper(content);
		   //将加工字符串进行ZZTD#规则检测,返回0：正常，-1：非自助听读器业务，其他：可能想要使用自助听读功能
		   int flag=customDetection(str,"ZZTD#");
		   //进行规则检测判断
		   if(flag==0){
			 //自助听读器业务流程	
			   
			   //将用户回复内容总的前缀代码拆除
	           str=strSplit(str);
			   //进行字符串单个拆分
			   String strList[] =numberSplit(str);
			   //解析字符串数组，进行听读数字规则检测
			   boolean bool=numberDetection(strList);
			   if(bool) {
				   //数字规则检测通过
				   	
				     //业务采样，经数据库查询是否有相同听读数字串且在有效时间内
				     String mediaId= tbReadDeviceDao.queryReadDeviceBystr(str);
				     if(mediaId==null) {
				    	//未查询到相同听读数字串且在有效时间内的数据
				    	 
					    	 //读取系统文件进行音频拼接,返回合并后音频路径
						     String filePath=jointVoice(strList);
						     //读取音频播放时长
						     int time=FileUtil.Mp3Time(filePath);
						     if(time>60) {
						    	 //音频时间过长，无法上传微信平台，回复用户时间过长
						    	 message = MessageUtils.initText(toUserName, fromUserName,ReadDeviceLongTime());						    	 
						     }else {
						    	  //将音频文件以voice类型上传微信平台并取得媒体ID-临时素材（三天有效）
							     mediaId = upload(filePath, MessageUtils.MESSAGE_VOICE,2);
							     //数据记录
							     tbReadDeviceDao.addReadDeviceVoice();
							     message=MessageUtils.initVoiceMessage(toUserName, fromUserName,mediaId);		
						     }						    						   
						     //删除音频源节省服务器空间
							 FileUtil.delectFile(filePath);						  
				     }else {
				    	 message=MessageUtils.initVoiceMessage(toUserName, fromUserName,mediaId);		
				     }
			    		   
			   }else {
				   //听读数字规则检测失败，包含中文、英文、符号、空格等
				   message = MessageUtils.initText(toUserName, fromUserName,readDeviceFalseRemind());
			   }		   
		   }else if(flag!=0&&flag!=-1){
			 //规则判定失败，但规则相似
			 //使用纯文本消息回复
	         message = MessageUtils.initText(toUserName, fromUserName,readDeviceRemindAgain());		   
		   }else if(flag==-1) {
		  if ("1".equals(content)) {
			  //使用纯文本消息回复
              message = MessageUtils.initText(toUserName, fromUserName,firstText());
          } else if ("2".equals(content)) {		     	  
        	  //拼接单图文消息
        	  WxNews news=MessageUtils.initWxNews("百度介绍", "大型搜索网站", WeixinUtil.initSystemUrl("wxImage/test.jpg"), "https://www.baidu.com");
        	  //组装所有单图文消息
        	  List<WxNews> listNews=new ArrayList<WxNews>();
        	  listNews.add(news);
        	  //使用图文消息回复
              message = MessageUtils.initNewsMessage(toUserName, fromUserName,listNews);
          } else if ("?".equals(content) || "？".equals(content)) {
              message = MessageUtils.initText(toUserName, fromUserName,menuText());
          }	else if("3".equals(content)) {
        	  //上传图片
				//String mediaId=upload("C:/SoftWare/MyeclipseWork/KeepHealth/WebRoot/wxImages/1.jpg","image",2);
        	  //使用图像消息回复
				message=MessageUtils.initImageMessage(toUserName, fromUserName, "XwfE1_7lE3bcIJ1vreEG5Rmb5Icvsd5zWjIzdgNIQar9o1c1V_zzf0hK1OtaqSOz");
          }	else if("4".equals(content)) {
        	    //String ThumbMediaId=upload("C:/SoftWare/MyeclipseWork/KeepHealth/WebRoot/wxMusic/sample.mp3", "voice",2);
        	    
        	    WxMusic wxMusic=new WxMusic();
        	    wxMusic.setThumbMediaId("R7Ujm6ixpFG3CQZ2aVlL74dmSeVRx36muBjKsglb0CCvj40q1HykWTfr75xXuo4Q");
	  		    wxMusic.setTitle("Music");
	  			wxMusic.setDescription("测试专用音频");
	  			wxMusic.setMusicUrl(WeixinUtil.initSystemUrl("wxMusic/test.mp3"));
	  			wxMusic.setHQMusicUrl(WeixinUtil.initSystemUrl("wxMusic/test.mp3"));
        	    //使用MP3音频回复
	  			message=MessageUtils.initMusicMessage(toUserName, fromUserName, wxMusic);
          }else if("5".equals(content)){
        	    //使用语音回复
        	    message=MessageUtils.initVoiceMessage(toUserName, fromUserName, "R7Ujm6ixpFG3CQZ2aVlL74dmSeVRx36muBjKsglb0CCvj40q1HykWTfr75xXuo4Q");
          }else if("6".equals(content)){
        	    //使用自助听读器功能
            	//使用纯文本消息回复
                message = MessageUtils.initText(toUserName, fromUserName,readDeviceRemind());
          }else {
        	    message = MessageUtils.initText(toUserName, fromUserName,elseText());  
          }
	 }	
		  return message;*/
		 return "";
	}
	
	
	/**
	 * 将字符串中的ZZTD#拆除
	 * @param str 将被拆除的字符串
	 * @return
	 * @author 叶城廷
	 * @version	2019.1.31
	 */
	private String strSplit(String str) {
          String[] split = str.split("ZZTD#");
		return split[1];
	}


	/**
	 * 音频拼接
	 * @param strList 音频名称列表
	 * @return
	 * @author 叶城廷
	 * @version 2019.1.31
	 */
	private String jointVoice(String[] strList) {
        //生成随机音频名称
		String randomName=UidUtils.UID();
		String filePath=WeixinUtil.initFilePath("wxMusic/"+randomName+".mp3");	
		File outFile=new File(filePath);
	
		try {
			//System.out.println("开始拼接音频");
			FileOutputStream fileOutputStream = new FileOutputStream(outFile);
			ArrayList<FileInputStream> arrayList = new ArrayList<FileInputStream>();
			//循环取出音频并依次拼接
			for(int i=0;i<strList.length;i++) {
				//System.out.println("正在拼接第"+i+"个音频");
				File inFile=new File(WeixinUtil.initFilePath("readDeviceMusic/"+strList[i]+".mp3"));
				FileInputStream fileInputStream = new FileInputStream(inFile);
				arrayList.add(fileInputStream);
			}			
			final Iterator<FileInputStream> iterator = arrayList.iterator();
			
			SequenceInputStream sequenceInputStream = new SequenceInputStream(new Enumeration<FileInputStream>() {
				@Override
				public boolean hasMoreElements() {				
					return iterator.hasNext();
				}
				@Override
				public FileInputStream nextElement() {
					return iterator.next();
				}			
			});		
			byte[] buf=new byte[1024];
			int length=0;
			while ((length=sequenceInputStream.read(buf))!=-1) {
				fileOutputStream.write(buf, 0, length);				
			}
			fileOutputStream.close();
			sequenceInputStream.close();
			//System.out.println("音频生成成功，本次自助音频生成名称为："+randomName);
			//System.out.println("音频存放路径"+filePath);
			
		} catch (FileNotFoundException e) {			
			e.printStackTrace();
		} catch (IOException e) {		
			e.printStackTrace();
		}
		
		return filePath;
	}


	/**
	 * 检查字符串数组中的每个字符是否全为数字
	 * @param strList 被检查的字符串数组
	 * @return 全为数字返回true，否则返回false;
	 * @author 叶城廷
	 * @version	2019.1.31
	 */
	private boolean numberDetection(String[] strList) {
		boolean flag=true;
		Pattern pattern = Pattern.compile("[0-9]*"); 		  
		for (int i = 0; i < strList.length; i++) {
		//System.out.println("正在检测第"+i+"个字符");
	    Matcher matcher = pattern.matcher(strList[i]);
        if(!matcher.matches()) {
        	//System.out.println("第"+i+"个字符不为数字←");
        	flag=false;
        }
		}
		//System.out.println("检测完成");
		return flag;
	}


	/**
	 * 将字符串遍历拆分
	 * @param str 字符串
	 * @return String[] 拆分并遍历存入字符串数组
	 * @author 叶城廷
	 * @version	2019.1.31
	 */
	private String[] numberSplit(String str) {
		String [] strList =new String[str.length()];
	     for(int i=0;i<str.length();i++) {
	    	 strList[i]=str.substring(i,i+1);	    	 
	     }
	     return strList;
	}


	/**
	 * 自定规则检查
	 * @param str 被检查字符串
	 * @param rule 规则
	 * @return -1：未检测到相应规则字符串 其他：数值代表规则字符在该字符串中的位置，如：0代表该字符在首位
	 * @author 叶城廷
	 * @version	2019.1.31
	 */
	private int customDetection(String str, String rule) {			
		return  str.indexOf(rule);
	}

	/**
	 * 所有英文字母转大写
	 * @param content
	 * @return
	 * @author 叶城廷
	 * @version	2019.1.31
	 */
	private String switchUpper(String content) {		
		return content.toUpperCase();
	}


	
	/**
	 * 自助听读器提醒内容
	 * @return
	 * @author 叶城廷
	 * @version	2019.1.31
	 */
	 public static String readDeviceRemind(){
	        StringBuffer buffer = new StringBuffer();
	        buffer.append("想要使用自助听读器功能？按以下形式进行回复就可以使用哦\n");
	        buffer.append("回复zztd#任意数字串，如zztd#123456");
	        return buffer.toString();
	    }
	 

	 /**
	  * 听读回复前缀错误且相似重新提示的内容
	  * @return
	  * @author 叶城廷
	  * @version 2019.1.31
	  */
	private String readDeviceRemindAgain() {
		    StringBuffer buffer = new StringBuffer();
	        buffer.append("回复错误，您是想要使用自助听读器功能？请严格按照下列格式回复哦\n");
	        buffer.append("回复zztd#任意数字串，如zztd#123456");
	        return buffer.toString();
	   }
	

	/**
	 * 听读回复后缀错误重新提示的内容
	 * @return
	 * @author 叶城廷
	 * @version	2019.1.31
	 */
	private String readDeviceFalseRemind() {
		    StringBuffer buffer = new StringBuffer();
	        buffer.append("回复内容有误，听读内容包含了中文、英文、符号或空格等其中一项，请按规则回复\n");
	        buffer.append("回复zztd#任意数字串，如zztd#123456");
	        return buffer.toString();
	   }
	
    /**
     * 听读数字串过长导致合成的音频过时长过长回复的内容
     * @return
     * @author 叶城廷
	 * @version	2019.1.31
     */
	private String ReadDeviceLongTime() {
		    StringBuffer buffer = new StringBuffer();
	        buffer.append("因音频过长，请删减数字串，重新按规则回复\n");
	        buffer.append("回复zztd#任意数字串，如zztd#123456");
	        return buffer.toString();
	}

	
	/**
	 * @test
	  * 测试 1 的回复（文本消息回复）
	 * @author 叶城廷
	 * @version 2019.1.27
     **/
    public static String firstText(){
        StringBuffer buffer = new StringBuffer();
        buffer.append("北冥有鱼");
        return buffer.toString();
    }
    /**
	 * @test
	 * 测试 2 的回复（文本消息回复）
	 * @author 叶城廷
	 * @version 2019.1.27
     **/
    public static String secondText(){
        StringBuffer buffer = new StringBuffer();
        buffer.append("其名为鲲");
        return buffer.toString();
    }

    /**
   	 * @test
   	 * 测试 拼接主菜单（订阅事件回复）
   	 * @author 叶城廷
   	 * @version 2019.1.27
	 * @version 2019.4.30真实环境测试，不再需要该方法
        **/
    public static String menuText() {
     /*   StringBuffer buffer = new StringBuffer();
        buffer.append("欢迎关注易道养生测试微信功能测试平台\n");
        buffer.append("测试请按如下回复\n");
        buffer.append("1:普通纯文本回复\n");
        buffer.append("2:图文回复\n");
        buffer.append("3:图片回复\n");
        buffer.append("4:MP3音频回复\n");
        buffer.append("5:语音回复\n");
        buffer.append("6.自助听读器功能\n");
        buffer.append("？:再来一遍\n");
        return buffer.toString();*/
     return "";
    }

    /**
     * @test
     * 回复其他
     * @return
     * @author 叶城廷
	 * @version 2019.1.31
	 * @version 2019.4.30真实环境测试，不再需要该方法
     */
	private String elseText() {
		/* StringBuffer buffer = new StringBuffer();
	        buffer.append("小秘书没听懂您想要表达什么呢\n");
	        buffer.append("测试请按如下回复\n");
	        buffer.append("1:普通纯文本回复\n");
	        buffer.append("2:图文回复\n");
	        buffer.append("3:图片回复\n");
	        buffer.append("4:MP3音频回复\n");
	        buffer.append("5:语音回复\n");
	        buffer.append("6.自助听读器功能\n");
	        buffer.append("？:再来一遍\n");
	        return buffer.toString();*/
		return "";
	}
	
    /**
     * 转发至微信上传文件请求
     * @param filePath 文件路径
     * @param type 素材类型
     * @param option 上传期限类型选择，永久：1，临时：2
     * @return
     * @author 叶城廷
	 * @version 2019.1.31
     */
    public String upload(String filePath,String type, int option) {
    	String mediaId=null;
    	try {
    		  mediaId=WeixinUtil.upload(filePath, type,option);
			
		} catch (KeyManagementException e) {
		
			e.printStackTrace();
		} catch (NoSuchAlgorithmException e) {
				
			e.printStackTrace();
		} catch (NoSuchProviderException e) {
		
			e.printStackTrace();
		} catch (IOException e) {
		
			e.printStackTrace();
		}
    	return mediaId;
    }
	
	public TbReadDeviceDao getTbReadDeviceDao() {
		return tbReadDeviceDao;
	}

	public void setTbReadDeviceDao(TbReadDeviceDao tbReadDeviceDao) {
		this.tbReadDeviceDao = tbReadDeviceDao;
	}	
	
	
}