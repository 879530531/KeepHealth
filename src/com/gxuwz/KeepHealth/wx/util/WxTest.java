package com.gxuwz.KeepHealth.wx.util;

import java.io.*;
import java.net.*;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionContext;

import com.google.gson.Gson;
import com.gxuwz.KeepHealth.business.entity.TbConsumer;
import com.gxuwz.KeepHealth.business.wx.entity.*;
import com.gxuwz.KeepHealth.util.MapUtil;
import org.apache.http.ParseException;

import com.gxuwz.KeepHealth.util.PropertyUtil;
import com.gxuwz.core.web.action.BaseAction;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

import net.sf.json.JSONObject;
import org.joda.time.DateTime;

/**
 * 微信公众号功能测试
 * @author 叶城廷
 * @version 2019.1.28
 *
 */
public class WxTest extends BaseAction implements Preparable,ModelDriven{

	public static void main(String[] args){
		WxAccessToken accessToken = WeixinUtil.getAccessToken();
		String TOKEN = accessToken.getToken();

		/*String TOKEN="21_Z3T-anh0wQf73pgdgF-wLc9_orv_3wJjDsV-" +
				"caCjILM6m5E6FdGYWhjOXorC5gGBO8HxR665PyZ4E1lG4wyFAdchU2QI1pkNppW91XALYk84SCCmQM-" +
				"HsFZ2zg2TwDqAwtkjBlG2eDZixiQbZZWaABAQQN";*/
        //设置行业信息
		/*JSONObject jsonObject = WeixinUtil.doPostStr("https://api.weixin.qq.com/cgi-bin/template/api_set_industry?access_token="+TOKEN,"{ \"industry_id1\":\"24\",\"industry_id2\":\"31\"");*/
		//获取设置行业信息
		/*JSONObject jsonObject = WeixinUtil.doGetStr("https://api.weixin.qq.com/cgi-bin/template/get_industry?access_token="+TOKEN);*/

		//获取模板ID
	/*	JSONObject jsonObject = WeixinUtil.doPostStr("https://api.weixin.qq.com/cgi-bin/template/api_add_template?access_token=" + TOKEN, "{\n" +
				"    \"template_id_short\":\"TM00015\"\n" +
				" }");*/

		//获取模板列表
		/*JSONObject jsonObject = WeixinUtil.doGetStr("https://api.weixin.qq.com/cgi-bin/template/get_all_private_template?access_token=" + TOKEN);*/

		/*JSONObject jsonObject = WeixinUtil.doPostStr("https://api.weixin.qq.com/cgi-bin/message/template/send?access_token=" + TOKEN, "  {\n" +
				"           \"touser\":\"o9rze5wNsSzSInOZbK6zLND9-D_8\",\n" +
				"           \"template_id\":\"27AwjgHsFEyj87RIxu9QLFxg8e-vJsD-gnmVtPMk8mo\",\n" +
				"           \"url\":\"http://weixin.qq.com/download\",  \n" +
				"           \"data\":{\"time\":{\"value\":\" 2019-05-07\",\" color\" :\"#173177\" }   } "+
				"       }");*/

		Gson gson =new Gson();
		WxTemplate wxTemplate =new WxTemplate();
		wxTemplate.setTemplate_id("2");
		wxTemplate.setTouser("1");
		String jsonStr = gson.toJson(wxTemplate);

		System.out.println(jsonStr);
		/*WxAccessToken accessToken = WeixinUtil.getAccessToken();
		String token = accessToken.getToken();
		int expiresIn = accessToken.getExpiresIn();
		System.out.println("票据："+token);
		System.out.println("有效时间："+expiresIn);
		JSONObject jsonObject = WeixinUtil.doGetStr("https://api.weixin.qq.com/cgi-bin/user/get?access_token=" + token + "&next_openid=");
		System.out.println(jsonObject);
		JSONObject openidJson = jsonObject.getJSONObject("data");
		String openid = openidJson.getString("openid");
		String[] split = openid.split("\",\"");
		//首先查询首尾信息
		System.out.println("首尾openid:"+split[0]+","+split[split.length-1]);
		*//*TbConsumer tbConsumer = WeixinUtil.queryConsumerSample(split[0].replace("\"",""),token);
		System.out.println("首位："+tbConsumer.getConsumerName()+","+tbConsumer.getOpenId());
		TbConsumer stbConsumer = WeixinUtil.queryConsumerSample(split[split.length].replace("\"",""),token);
		System.out.println("尾位："+stbConsumer.getConsumerName()+","+stbConsumer.getOpenId());*//*
		for (int i=1;i<split.length-1;i++){
			TbConsumer tbConsumer1 = WeixinUtil.queryConsumerSample(split[i],token);
			System.out.println("第"+i+"位："+tbConsumer1.getConsumerName()+","+tbConsumer1.getOpenId());
		}*/
	}


	/**
	 * 获取当前本机IPV4测试
	 * @test
	 * @author 叶城廷
	 * @version 2019.3.19
	 */
  public void test11(){
	  Enumeration allNetInterfaces = null;
	  try {
		  allNetInterfaces = NetworkInterface.getNetworkInterfaces();
	  } catch (java.net.SocketException e) {
		  e.printStackTrace();
	  }
	  InetAddress ip = null;
	  while (allNetInterfaces.hasMoreElements())
	  {
		  NetworkInterface netInterface = (NetworkInterface) allNetInterfaces
				  .nextElement();
		  Enumeration addresses = netInterface.getInetAddresses();
		  while (addresses.hasMoreElements())
		  {
			  ip = (InetAddress) addresses.nextElement();
			  if (ip != null && ip instanceof Inet4Address)
			  {
				  if(ip.getHostAddress().equals("127.0.0.1")){
					  continue;
				  }
				  return ;
			  }
		  }
	  }
	  System.out.println("网络无连接！");
  }

	
	/**
	 * 用户基本信息获取测试
	 * @test
	 * @author 叶城廷
	 * @version 2019.1.31
	 */
	public void test10() {
				WxAccessToken accessToken = WeixinUtil.getAccessToken();
				String token = accessToken.getToken();
				int expiresIn = accessToken.getExpiresIn();
				System.out.println("票据："+token);
				System.out.println("有效时间："+expiresIn);
				String url ="https://api.weixin.qq.com/cgi-bin/user/info?access_token="+token+"&openid=oUQis1SwMbX-kNlzgQgYD2gw1IZo&lang=zh_CN";
				JSONObject doGetStr = WeixinUtil.doGetStr(url);
				System.out.println("返回用户信息："+doGetStr);
	}
	
	/**
	 * 根路径获取测试
	 * @test
	 * @author 叶城廷
	 * @version 2019.1.31
	 */
	public   String  test9() {
		
		String realPath =getSession().getServletContext().getRealPath("/");
		System.out.println("项目根路径："+realPath);
		return "";
	}
	
	
	/**
	 * 字符串自定义规定查询
	 * @test
	 * @author 叶城廷
	 * @version 2019.1.31
	 */
	public void test8() {
		String str1="Zztd#123456";
		String upperCase = str1.toUpperCase();
		System.out.println(upperCase);
		String str2="ZZT#123456";
		String str3="1ZZTD#123456";
		int indexOf1 = upperCase.indexOf("ZZTD#");
		int indexOf2 = str2.indexOf("ZZTD#");
		int indexOf3 = str3.indexOf("ZZTD#");
		System.out.println(indexOf1);
		System.out.println(indexOf2);
		System.out.println(indexOf3);

		
	}
	
	/**
	 * 遍历取出字符串
	 * @test
	 * @author 叶城廷
	 * @version 2019.1.31
	 */
	public void test7() {
		String str="123456789";
		String [] strList =new String[str.length()];
	     for(int i=0;i<str.length();i++) {
	    	 strList[i]=str.substring(i,i+1);	    	 
	     }
	     for(int i=0;i<str.length();i++) {
	    	 System.out.println("第"+i+"个字符："+strList[i]);
	    	 
	     }
		
	}
	
	/**
	 * 字符串是否全为数字检测
	 * @test
	 * @author 叶城廷
	 * @version 2019.1.31
	 */
	public void test6() {
		
		Pattern pattern = Pattern.compile("[0-9]*"); 		  
		String str="1.+/*-我abcdefghijklnmopqrstuvwxyz";
		System.out.println("正在检测字符串是否包含中文：");
		for (int i = 0; i < str.length(); i++) {
		System.out.println("正在检测第"+i+"个字符");
	    Matcher matcher = pattern.matcher(str.substring(i,i+1));
        if(!matcher.matches()) {
        	System.out.println("第"+i+"个字符不为数字←");       	
        }
		}
		System.out.println("检测完成");		   
		  
	}
	
	/**
	 * 音频拼接测试
	 * @throws IOException 
	 * @test
	 * @author 叶城廷
	 * @version 2019.1.31
	 */
	public void test5() throws IOException {

		File outFile=new File(WeixinUtil.initFilePath("wxMusic/sample.mp3"));
		
		File inFile1=new File(WeixinUtil.initFilePath("readDeviceMusic/3.mp3"));
		File inFile2=new File(WeixinUtil.initFilePath("readDeviceMusic/4.mp3"));
		File inFile3=new File(WeixinUtil.initFilePath("readDeviceMusic/5.mp3"));
		File inFile4=new File(WeixinUtil.initFilePath("readDeviceMusic/6.mp3"));
		
		try {
			FileOutputStream fileOutputStream = new FileOutputStream(outFile);
			
			FileInputStream fileInputStream1 = new FileInputStream(inFile1);
			FileInputStream fileInputStream2 = new FileInputStream(inFile2);
			FileInputStream fileInputStream3 = new FileInputStream(inFile3);
			FileInputStream fileInputStream4 = new FileInputStream(inFile4);
			
			ArrayList<FileInputStream> arrayList = new ArrayList<FileInputStream>();
			arrayList.add(fileInputStream1);
			arrayList.add(fileInputStream2);
			arrayList.add(fileInputStream3);
			arrayList.add(fileInputStream4);
			
			final Iterator<FileInputStream> iterator = arrayList.iterator();
			
			SequenceInputStream sequenceInputStream = new SequenceInputStream(new Enumeration<FileInputStream>() {

				@Override
				public boolean hasMoreElements() {
					// TODO Auto-generated method stub
					return iterator.hasNext();
				}

				@Override
				public FileInputStream nextElement() {
					// TODO Auto-generated method stub
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
			
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

	/**
	 * 系统路径和文件路径拼接测试
	 * @test
	 * @author 叶城廷
	 * @version 2019.1.31
	 */
	public void test4() {
		
		    String initSystemUrl = WeixinUtil.initSystemUrl("wxImages/1.jpg");
		    System.out.println(initSystemUrl);
		    String initFilePath = WeixinUtil.initFilePath("wxMusic/sample.mp3");
		    System.out.println(initFilePath);
		
	}
	
	/**
	 * 文件上传测试
	 * @test
	 * @author 叶城廷
	 * @version 2019.1.31
	 */
	public void test3() {
		try {
			String mediaId=WeixinUtil.upload(WeixinUtil.initFilePath("wxVideo/test.mp4"),"video",1);			
			System.out.println("视频文件上传成功！返回mediaId为："+mediaId);
			String mediaId1=WeixinUtil.upload(WeixinUtil.initFilePath("wxMusic/test.mp3"),"voice",1);
			System.out.println("音频文件上传成功！返回mediaId为："+mediaId1);
			String mediaId2=WeixinUtil.upload(WeixinUtil.initFilePath("wxImage/test.jpg"),"image",1);
			System.out.println("图片文件上传成功！返回mediaId为："+mediaId2);
			String mediaId3=WeixinUtil.upload(WeixinUtil.initFilePath("wxThumb/test.jpg"),"thumb",1);
			System.out.println("缩略图文件上传成功！返回mediaId为："+mediaId3);
		} catch (KeyManagementException e) {
			System.out.println("文件上传失败！");
			e.printStackTrace();
		} catch (NoSuchAlgorithmException e) {
			System.out.println("文件上传失败！");
			e.printStackTrace();
		} catch (NoSuchProviderException e) {
			System.out.println("文件上传失败！");
			e.printStackTrace();
		} catch (ParseException e) {
			System.out.println("文件上传失败！");
			e.printStackTrace();
		} catch (IOException e) {
			System.out.println("文件上传失败！");
			e.printStackTrace();
		}
	}
	
	/**
	 * 图文测试
	 * @test
	 * @author 叶城廷
	 * @version 2019.1.31
	 */
	public void test2() {
		
		
		 //拼接单图文消息
	  	  WxNews news=MessageUtils.initWxNews("百度介绍", "大型搜索网站", "http://63bady.natappfree.cc/wxImages/1.png", "https://www.baidu.com");
	  	  //组装所有单图文消息
	  	  List<WxNews> listNews=new ArrayList<WxNews>();
	  	  listNews.add(news);
	  	  //使用图文消息回复
	      String message = MessageUtils.initNewsMessage("", "",listNews);
	      System.out.println(message);
	}
	
	/**
	 * 票据获取测试
	 * @return
	 * @test
	 * @author 叶城廷
	 * @version 2019.1.31
	 */
	public void test1() {
		try {
			//获取票据测试
			WxAccessToken accessToken = WeixinUtil.getAccessToken();
			System.out.println("票据："+accessToken.getToken());
			System.out.println("有效时间："+accessToken.getExpiresIn());
			
			//创建菜单测试
			String result =WeixinUtil.createMenu();
			System.out.println(result);
			
			//查询菜单
			JSONObject queryMenu = WeixinUtil.queryMenu();
            System.out.println("查询菜单返回数据："+queryMenu);
            
            //删除菜单测试
            int result2 =WeixinUtil.deleteMenu();
            if(result2==0) {
            	System.out.println("微信deleteMenu请求成功");
            	
            }else {
            	
            	System.out.println("微信deleteMenu请求失败！");
            }
		} catch (ParseException e) {
			
			e.printStackTrace();
		}
	}



	@Override
	public Object getModel() {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public void prepare() throws Exception {
		// TODO Auto-generated method stub
		
	}
	

}
