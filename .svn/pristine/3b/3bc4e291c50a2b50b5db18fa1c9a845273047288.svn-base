package com.gxuwz.KeepHealth.util;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;

import javazoom.jl.decoder.JavaLayerException;
import javazoom.jl.player.*;

 
/**
 * 音频工具类-未使用 
 * @author 叶城廷
 *
 */
public class AudioUtil {
	    static Player player;
	    //构造方法  参数是一个.mp3音频文件

	    //播放音频
	    public static void play(String filePath) {
	    	    File file =new File(filePath);
	    	    try {
	    	    	BufferedInputStream buffer = new BufferedInputStream(new FileInputStream(file));
	  	            player = new Player(buffer);
	  	            player.play();
	    		} catch (FileNotFoundException e) {
	    			// TODO Auto-generated catch block
	    			e.printStackTrace();
	    		} catch (JavaLayerException e) {
	    			// TODO Auto-generated catch block
	    			e.printStackTrace();
	    		}
	          
	    }

	}
