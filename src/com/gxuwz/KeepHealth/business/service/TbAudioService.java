package com.gxuwz.KeepHealth.business.service;


import com.gxuwz.KeepHealth.business.entity.TbAudio;
import com.gxuwz.KeepHealth.business.entity.TbSoundSource;
import com.gxuwz.core.pagination.Result;









import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.gxuwz.KeepHealth.business.entity.TbAudio;


/**
 * 念数机音频Service接口类
 * @author 齐美琳
 *@version 2019.3.21
 */
public interface TbAudioService {
	Result<TbAudio> queryAudioList(String string, int page, int row);
	Result<TbAudio> queryList(String string, int page, int row);
	/**
	 * 添加音频
	 * @author 丁程强
	 * @date 2019.03.03
	 */
	public void add(TbAudio tbAudio);
	
	/**
	 * 将音频保存到服务器/readDeviceMusic/目录对应的音源编号文件夹下，返回音频的url地址
	 * @param request
	 * @param audioFile 上传的源文件
	 * @param ex 文件扩展名
	 * @param soundId 音源编号
	 * @param i 第i个文件
	 * @return 音频的url
	 * @author  丁程强
	 * @date 2019年3月6日
	 */
	public String uploadAudio(HttpServletRequest request, File audioFile, String ex, String soundId, Integer i);

	public TbAudio findById(int AudioId);
	
	public TbAudio findByName(String audioNmuber);
	
	public void edit(TbAudio tbAudio);

	TbAudio findById1(Integer audioId);
	
	List<TbAudio> findByAudioSoundSource(String audioSoundSource);
	
	TbSoundSource getSoundBySoundName(String soundName);
}
