package com.gxuwz.KeepHealth.business.service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import com.gxuwz.KeepHealth.business.entity.TbSoundSource;
import com.gxuwz.core.pagination.Result;

/**
 * 念数机音源Service接口类
 * @author yechengting
 *@version 2019.2.16
 */
public interface TbSoundSourceService {
	
	/**
	 * 根据条件查找分页
	 * @param page 第几页
	 * @param row 长度
	 * @return
	 * @author 丁程强
	 * @date 2019.02.21
	 */
	public Result<TbSoundSource> find(String queryText, int page, int row);

	String playAudio(String display, Integer audioId, String playbackRate);

	public void add(TbSoundSource tbSoundSource);
	
	public TbSoundSource findById(int soundId);
	
	public TbSoundSource findByName(String soundName);
	
	public void edit(TbSoundSource tbSoundSource);

	public boolean checkSoundName(String soundName);
	
	public void delSoundSourceFolder(HttpServletRequest request, String soundId) throws IOException;

	public String queryUpSoundSource();
}
