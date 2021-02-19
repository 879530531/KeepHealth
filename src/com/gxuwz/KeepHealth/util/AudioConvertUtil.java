package com.gxuwz.KeepHealth.util;

import java.io.File;
import it.sauronsoftware.jave.AudioAttributes;
import it.sauronsoftware.jave.Encoder;
import it.sauronsoftware.jave.EncodingAttributes;

public class AudioConvertUtil {
	/**
	 * 将本地音频文件转换成mp3格式文件
	 *
	 * @param localFilePath 本地音频文件物理路径
	 * @param targetPath    转换后mp3文件的物理路径
	 */
	public static void changeLocalSourceToMp3(String localFilePath, String targetPath) throws Exception {

		File source = new File(localFilePath);
		File target = new File(targetPath);
		AudioAttributes audio = new AudioAttributes();
		Encoder encoder = new Encoder();
		audio.setCodec("libmp3lame");
		audio.setBitRate(64000);
	    audio.setChannels(2);
	    audio.setSamplingRate(22050);
		EncodingAttributes attrs = new EncodingAttributes();
		attrs.setFormat("mp3");
		attrs.setAudioAttributes(audio);
		encoder.encode(source, target, attrs);
	}
}
