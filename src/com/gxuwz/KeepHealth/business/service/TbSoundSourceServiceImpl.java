package com.gxuwz.KeepHealth.business.service;

import java.io.*;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.gxuwz.KeepHealth.util.AudioConvertUtil;
import com.gxuwz.KeepHealth.util.PropertyUtil;
import com.gxuwz.core.util.UidUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gxuwz.KeepHealth.SystemContext;
import com.gxuwz.KeepHealth.business.dao.TbSoundSourceDao;
import com.gxuwz.KeepHealth.business.entity.TbSoundSource;
import com.gxuwz.core.pagination.Result;
import com.gxuwz.KeepHealth.util.FileUtil;

/**
 * 念数机音源Service实现类
 * @author yechengting
 *@version 2019.2.16
 */
@Service("tbSoundSourceService")
public class TbSoundSourceServiceImpl implements TbSoundSourceService {
	@Autowired
	TbSoundSourceDao tbSoundSourceDAO;
	
	/**
	 * 根据条件查找分页
	 * @param page 第几页
	 * @param row 长度
	 * @return
	 * @author 丁程强
	 * @date 2019.02.21
	 */
	@Override
	public Result<TbSoundSource> find(String queryText, int page, int row) {
		return tbSoundSourceDAO.find(queryText, page, row);
	}
	
	/**
	 * 添加音源
	 * @author 丁程强
	 * @date 2019.02.21
	 */
	@Override
	public void add(TbSoundSource tbSoundSource) {
		tbSoundSourceDAO.save(tbSoundSource);
	}
	
	/**
	 * 检验音源名字是否存在
	 * @author 丁程强
	 * @date 2019.3.4
	 */
	@Override
	public boolean checkSoundName(String soundName) {
		boolean result = false;
		//将结果存入模型中，如果不为空，则存在音源名字
		List<TbSoundSource> tbSoundSource = tbSoundSourceDAO.checkSoundName(soundName);
		if(null != tbSoundSource && 0 < tbSoundSource.size()){
			result = true;
		}
		return result;
	}
	
	@Override
	public TbSoundSource findById(int soundId) {
		return tbSoundSourceDAO.get(TbSoundSource.class, soundId);
	}
	
	@Override
	public TbSoundSource findByName(String soundName) {
		return tbSoundSourceDAO.get(TbSoundSource.class, soundName);
	}
	
	@Override
	public void edit(TbSoundSource tbSoundSource) {
		tbSoundSourceDAO.getHibernateTemplate().saveOrUpdate(tbSoundSource);
	}

	/**
	 *拼接念数机播放音频
	 * @author 叶城廷
	 */
	@Override
	public String playAudio(String display, Integer audioId, String playbackRate) {
		//检查当前本地是否已经有现成音频
		//获得本地文件路径-用于查询现有音频
		//String FILEAUDIO_ROOT = PropertyUtil.getProperty("WXAUDIO_ROOT_TEMPORARY","musicFilePath.properties");
		//String filePath=FILEAUDIO_ROOT+display+".mp3";
		String fileName=null;
		try{
			 fileName = jointAudio(display, audioId.toString(),playbackRate);
		}catch (Exception e){
			e.printStackTrace();
			fileName="error";
		}
		return fileName;
	}

	/**
	 * 音频拼接
	 * @param display
	 * @return
	 * @author 叶城廷
	 * @version 2019.1.31
	 */
	private String jointAudio(String display,String audioId,String playbackRate) {
		String random=UidUtils.UID();
		String FILEAUDIO_ROOT = PropertyUtil.getProperty("WXAUDIO_ROOT_TEMPORARY","musicFilePath.properties");
		display=display.replace("·","D");
		String fileName=display+"-"+audioId+"-"+random+".mp3";
		String outFileName=FILEAUDIO_ROOT+fileName;
		File outFile=new File(outFileName);
		String AUDIO_ROOT = PropertyUtil.getProperty("AUDIO_ROOT","musicFilePath.properties");

		//拆分数字串
		String[] strList = display.split("");
		try {
			System.out.println("开始拼接音频");
			FileOutputStream fileOutputStream = new FileOutputStream(outFile);
			ArrayList<FileInputStream> arrayList = new ArrayList<FileInputStream>();
			//循环取出音频并依次拼接
			for(int i=1;i<strList.length;i++) {
				System.out.println("正在拼接第"+i+"个音频:"+strList[i]);
				File inFile=null;
				if(strList[i].equals("D")){
					 //读取停顿倍数
					 if(playbackRate.equals("1")){
						 inFile=new File(AUDIO_ROOT+"/dian-1.mp3");
					 }else if(playbackRate.equals("1.5")){
						 inFile=new File(AUDIO_ROOT+"/dian-1-5.mp3");
					}else if(playbackRate.equals("2")){
						 inFile=new File(AUDIO_ROOT+"/dian-2.mp3");
					 }else if(playbackRate.equals("0.5")){
						 inFile=new File(AUDIO_ROOT+"/dian-0-5.mp3");
					 }
				}else {
					 inFile=new File(AUDIO_ROOT+audioId+"/"+strList[i]+".mp3");
				}

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

		} catch (FileNotFoundException e) {
			e.printStackTrace();
			fileName="error";
		} catch (IOException e) {
			e.printStackTrace();
			fileName="error";
		}
		return fileName;
	}
	
	/**
	 * 删除音源对应的文件夹及该目录下的所有文件
	 * @author 丁程强
	 * @date 2019年3月6日
	 */
	@Override
	public void delSoundSourceFolder(HttpServletRequest request, String soundId) throws IOException {
		String filePath = request.getServletContext().getRealPath(SystemContext.MP3)+"/"+ soundId +"/";
		FileUtil.delFilesAndParentFile(filePath);
		/*try{
			File directory = new File(delPath);
			FileUtils.deleteDirectory(directory);
		}catch(IOException e) {
			e.printStackTrace();
		}*/
	}
	/**
	 * 念数机异步初始化音源
	 * @return
	 * @author 叶城廷
	 * @version 2019.4.4
	 */
	@Override
	public String queryUpSoundSource() {
		List<TbSoundSource> tbSoundSourceList=tbSoundSourceDAO.queryUpSoundSourceList();
		String date="";
		for (int i=0;i<tbSoundSourceList.size();i++){
			if (i==0){
				date+=tbSoundSourceList.get(i).getSoundId();
			}else {
				date+=","+tbSoundSourceList.get(i).getSoundId();
			}
		}
		return date;
	}
}
