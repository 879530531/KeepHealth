package com.gxuwz.KeepHealth.business.service;

import java.io.File;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gxuwz.KeepHealth.SystemContext;
import com.gxuwz.KeepHealth.business.dao.TbAudioDao;
import com.gxuwz.KeepHealth.business.entity.TbAudio;
import com.gxuwz.KeepHealth.business.entity.TbFormula;
import com.gxuwz.core.pagination.Result;
import com.gxuwz.KeepHealth.business.dao.TbSoundSourceDao;
import com.gxuwz.KeepHealth.business.entity.TbAudio;
import com.gxuwz.KeepHealth.business.entity.TbSoundSource;
import com.gxuwz.KeepHealth.util.AudioConvertUtil;

/**
 * 念数机音频Service实现类
 * @author 齐美琳
 *@version 2019.2.21
 */
@Service("TbAudioService")
public class TbAudioServiceImpl implements TbAudioService {

	@Autowired
	TbAudioDao tbAudioDao;


	@Override
	public Result<TbAudio> queryAudioList(String string, int page, int row) {
		 return tbAudioDao.queryAudioList(string,page,row);
	}
	
	public Result<TbAudio> queryList(String string, int page, int row){
		return tbAudioDao.queryList(string,page,row);
	}

	@Autowired
	TbAudioDao tbAudioDao1;
	
	/**
	 * 添加音频
	 * @author 丁程强
	 * @date 2019.03.03
	 */
	public void add(TbAudio tbAudio) {
		tbAudioDao.save(tbAudio);
	}
	


	@Override
	public TbAudio findById1(Integer audioId) {
		return tbAudioDao.get(TbAudio.class, audioId);
	}

	@Override
	public TbAudio findById(int AudioId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public TbAudio findByName(String audioNmuber) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void edit(TbAudio tbAudio) {
		// TODO Auto-generated method stub
		
	}



	@Override
	public String uploadAudio(HttpServletRequest request, File audioFile, String ex, String soundId, Integer i) {
		String savePath = request.getServletContext().getRealPath(SystemContext.MP3)+"/"+soundId+"/";
		String url = request.getContextPath()+SystemContext.MP3 + soundId +"/";
		String newFileName= i +"."+ ex;  //文件名
		String mp3File = i +".mp3";
		//创建目录和文件
		File uploadFile = new File(savePath+newFileName);
		if(!uploadFile.getParentFile().exists()){
			uploadFile.getParentFile().mkdirs();
		}
		try {
			uploadFile.createNewFile();
			FileUtils.copyFile(audioFile, uploadFile);
			if(!ex.equals("mp3")){
				AudioConvertUtil.changeLocalSourceToMp3(savePath+newFileName, savePath+mp3File);
				uploadFile.delete();
			}else {
				AudioConvertUtil.changeLocalSourceToMp3(savePath+newFileName, savePath+mp3File);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		//返回文件url
		return url + mp3File;
	}
	
	public List<TbAudio> findByAudioSoundSource(String audioSoundSource){
		return tbAudioDao.getBySoundName(audioSoundSource);
	}
	
	public TbSoundSource getSoundBySoundName(String soundName){
		return tbAudioDao.getSoundBySoundName(soundName);
	}

}

