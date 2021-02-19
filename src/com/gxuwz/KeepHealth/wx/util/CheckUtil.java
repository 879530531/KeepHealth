package com.gxuwz.KeepHealth.wx.util;

import java.security.MessageDigest;
import java.util.Arrays;
/**
 * 微信接口-签名检查
 * @author 叶城廷
 * @version 2019.1.19
 */
public class CheckUtil {

	   //定制本项目token码为“gxuwz” -2019.1.19叶城廷
       private static final String token = "gxuwz";

       /**
        * 签名检查
        * @param signature 签名
        * @param timestamp 时间戳
        * @param nonce 随机数
        * @return 签名检查结果
        * @author yechengting
        */
       public static boolean checkSignature(String signature,String timestamp,String nonce){

       String[] arr = new String[]{token,timestamp,nonce};

       Arrays.sort(arr);

       StringBuffer content = new StringBuffer();
       
       for(int i=0;i<arr.length;i++){

        content.append(arr[i]);
        
       }
       
       //sha1加密调用
       String temp=getSha1(content.toString());
       
       return temp.equals(signature);
    }   


       /**
        * sha1加密
        * @param str 被加密字符串
        * @return 加密后的字符串
        * @author yechengting
        */
       public static String getSha1(String str){

           	 if (str==null || str.length() == 0) {

       			return null;

       		}

           	 char hexDigits[]={'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};          	 

           	 try {

       			MessageDigest mdTemp =MessageDigest.getInstance("SHA1");

       			mdTemp.update(str.getBytes("UTF-8"));

       			byte[] md = mdTemp.digest();

       			int j =md.length;

       			char buf[]=new char[j*2];

       			int k=0;

       			for(int i=0;i<j;i++){

       				byte byte0=md[i];

       				buf[k++]=hexDigits[byte0>>>4&0xf];

       				buf[k++]=hexDigits[byte0 & 0xf];

       			}

       			return new String(buf);

       		} catch (Exception e) {

       			return null;

       		}

            }

}
     