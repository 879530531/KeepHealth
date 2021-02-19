package com.gxuwz.KeepHealth.business.entity;

/**
 * 音频实体类
 * @author 叶城廷
 * @version 2019.03.01
 *
 */
public class TbAudio implements java.io.Serializable {

	// Fields

	private Integer audioId;//音频编号
	private Integer audioNumber;//音频数字0-8
	private String audioFilePath;//音频文件路径（相对路径）
	private String audioSoundSource;//音频所属音源

	// Constructors

	/** default constructor */
	public TbAudio() {
	}

	/** full constructor */
	public TbAudio(Integer audioNumber, String audioFilePath, String audioSoundSource) {
		this.audioNumber = audioNumber;
		this.audioFilePath = audioFilePath;
		this.audioSoundSource = audioSoundSource;
	}

	// Property accessors

	public Integer getAudioId() {
		return this.audioId;
	}

	public void setAudioId(Integer audioId) {
		this.audioId = audioId;
	}

	public Integer getAudioNumber() {
		return this.audioNumber;
	}

	public void setAudioNumber(Integer audioNumber) {
		this.audioNumber = audioNumber;
	}

	public String getAudioFilePath() {
		return this.audioFilePath;
	}

	public void setAudioFilePath(String audioFilePath) {
		this.audioFilePath = audioFilePath;
	}

	public String getAudioSoundSource() {
		return this.audioSoundSource;
	}

	public void setAudioSoundSource(String audioSoundSource) {
		this.audioSoundSource = audioSoundSource;
	}

}