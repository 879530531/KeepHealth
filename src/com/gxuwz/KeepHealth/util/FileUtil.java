package com.gxuwz.KeepHealth.util;

import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;
import org.jaudiotagger.audio.AudioFileIO;
import org.jaudiotagger.audio.mp3.MP3AudioHeader;
import org.jaudiotagger.audio.mp3.MP3File;


/**
 * 文件操作工具类
 * @author 叶城廷
 * @version 2019.1.31
 *
 */
public class FileUtil {

	/**
	 * 删除指定目录下的文件
	 * @param filePath 要删除的文件路径
	 * @return 是否删除成功
	 * @author 叶城廷
	 * @version 2019.1.31
	 */
	public static boolean delectFile(String filePath){
		boolean flag=false;
		try {
			File file =new File(filePath);
			file.delete();	
			System.out.println("文件删除成功："+filePath);
			flag=true;
		} catch (Exception e) {
			System.out.println("文件删除失败，请及时联系相关程序开发人员，否则将逐渐影响服务器运行速度");
			flag=false;
			e.printStackTrace();
		}
	
		return flag;
		
	}
	
	/**
	 * 删除指定目录下的文件及该文件夹
	 * @param filePath 删除文件夹路径
	 * @throws IOException
	 * @author 丁程强
	 * @version 2019年3月8日
	 */
	public static void delFilesAndParentFile(String filePath) throws IOException{
		File directory = new File(filePath);
		try {
			FileUtils.deleteDirectory(directory);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 根据文件路径获取MP3音频文件后读取播放时长
	 * @param filePath 音频文件路径
	 * @return 时长
	 * @author 叶城廷
	 * @version 2019.1.31
	 */
	public static int Mp3Time(String filePath) {

        int length = 0;
        try {
            MP3File mp3File = (MP3File) AudioFileIO.read(new File(filePath));
            MP3AudioHeader audioHeader = (MP3AudioHeader) mp3File.getAudioHeader();

            // 单位为秒
            length = audioHeader.getTrackLength();

            return length;
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("读取文件时长："+length);
        return length;

	}

	/**
	 * 递归查找文件
	 * @param baseDirName  查找的文件夹路径
	 * @param targetFileName  需要查找的文件名
	 * @author 叶城廷
	 * @version 2019.4.4
	 */
	public static File findFiles(String baseDirName, String targetFileName) {

		File baseDir = new File(baseDirName);		// 创建一个File对象
		if (!baseDir.exists() || !baseDir.isDirectory()) {	// 判断目录是否存在
		}
		String tempName = null;
		//判断目录是否存在
		File tempFile;
		File[] files = baseDir.listFiles();
		for (int i = 0; i < files.length; i++) {
			tempFile = files[i];
			if(tempFile.isDirectory()){
				findFiles(tempFile.getAbsolutePath(), targetFileName);
			}else if(tempFile.isFile()){
				tempName = tempFile.getName();
				if(tempName.equals("copy.jpg")){
					System.out.println(tempFile.getAbsoluteFile().toString());
					return tempFile.getAbsoluteFile();
				}
			}
		}
		return null;
	}

}
