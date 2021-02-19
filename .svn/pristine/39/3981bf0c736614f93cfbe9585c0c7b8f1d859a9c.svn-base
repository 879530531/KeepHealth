package com.gxuwz.KeepHealth.util;

import java.io.*;
import java.net.URLDecoder;
import java.util.Properties;

import com.gxuwz.core.web.action.BaseAction;

/**
 * Desc:properties文件获取工具类
 * @author 叶城廷
 * @version 2019.2.17
 */
public class PropertyUtil{
    private static Properties props;
    
    
    /**
     * 插入线程加载文件
     * @param propertiesName 文件名
     * @author 叶城廷
     * @version 2019.2.17
     */
    synchronized static private void loadProps(String propertiesName){
        props = new Properties();
        InputStream in = null;
        try {
            in = PropertyUtil.class.getClassLoader().getResourceAsStream("conf/"+propertiesName);
            props.load(in);
        } catch (FileNotFoundException e) {
        	System.out.println("jdbc.properties文件未找到");
        } catch (IOException e) {
        	System.out.println("出现IOException");
        } finally {
            try {
                if(null != in) {
                    in.close();
                }
            } catch (IOException e) {
            	System.out.println("jdbc.properties文件流关闭出现异常");
            }
        }
    }

    /**
     * 读取指定properties文件的属性值
     * @param key 需要读取的属性名称
     * @param propertiesName 需要读取的properties文件名字
     * @return 属性值
     * @author 叶城廷
     * @version 2019.2.17
     */
    public static String getProperty(String key,String propertiesName){
        props=null;
        if(null == props) {
            loadProps(propertiesName);
        }
        return props.getProperty(key);
    }
    /**
     * 读取指定properties文件的属性值(带默认值)
     * @param key 需要读取的属性名称
     * @param defaultValue 默认值
     * @param propertiesName 需要读取的properties文件名字
     * @return 属性值
     * @author 叶城廷
     * @version 2019.2.17
     */
    public static String getProperty(String key, String defaultValue,String propertiesName) {
        if(null == props) {
            loadProps(propertiesName);
        }
        return props.getProperty(key, defaultValue);
    }
    /**
     * 修改指定properties文件属性值
     * @param key 需要读取的属性名称
     * @param value 替换值
     * @param propertiesName  需要修改的properties文件名字
     * @author 叶城廷
     * @version 2019.2.17
     * @return flag
     */
    public static boolean editProperty(String key,String value,String propertiesName) {
    	boolean flag =false;
            loadProps(propertiesName);
        try {
        	    props.setProperty(key, value);
        	    // 文件输出流 
        	    String path = URLDecoder.decode(Thread.currentThread().getContextClassLoader().getResource("").getPath());
        	    path=path+"conf/"+propertiesName;
	            FileOutputStream fos =  new FileOutputStream(path);
	            // 将Properties集合保存到流中 
	            props.store(fos, "Copyright (c) Boxcode Studio");
	            fos.close();// 关闭流 
        	  flag=true;
		} catch (Exception e) {
			e.printStackTrace();
			flag=false;
		}  
        return flag;
    }
    
}