package com.gxuwz.KeepHealth.util;

/**
 * 工具类测试
 * @author 叶城廷
 * @date 2019-06-16 17:22:31
 **/
public class UtilTest {

	public static void main(String[] args) {
	
		
	}
	/**
	 * 音频播放测试
	 */
	public static void test2() {	
		 AudioUtil.play("E:\\MyeclipseWork\\KeepHealth\\WebRoot\\readDeviceMusic\\0.mp3");
		
	}
	
/**
 * properties文件读取测试
 * @author 叶城廷
 * @version 2019.2.17
 */
	public static void test1() {		
		String str =PropertyUtil.getProperty("username","jdbc.properties");
        System.out.println(str);
	}
}
