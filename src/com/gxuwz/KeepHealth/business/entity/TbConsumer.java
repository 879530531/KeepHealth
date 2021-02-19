package com.gxuwz.KeepHealth.business.entity;

import java.sql.Timestamp;

/**
 * 咨询用户实体类
 * @author 叶城廷
 * @version 2019.03.01
 *
 */
public class TbConsumer implements java.io.Serializable {

	// Fields

	private Integer consumerId;//用户编号
	private String openId;//微信唯一码
	private String consumerName;//用户名称（微信名）
	private Integer consumerSex;//用户性别（微信性别）1：男 2：女 0：未知
	private String consumerCountry;//用户所在国家
	private String consumerCity;//用户所在城市
	private Timestamp attentionTime;//关注时间

	private String consumerHeadImgUrl;//用户头像地址


	// Constructors

	/** default constructor */
	public TbConsumer() {
	}

	/** minimal constructor */
	public TbConsumer(String openId) {
		this.openId = openId;
	}

	/** full constructor */
	public TbConsumer(String openId, String consumerName, Integer consumerSex, String consumerCountry,
			String consumerCity, Timestamp attentionTime,String consumerHeadImgUrl) {
		this.openId = openId;
		this.consumerName = consumerName;
		this.consumerSex = consumerSex;
		this.consumerCountry = consumerCountry;
		this.consumerCity = consumerCity;
		this.attentionTime = attentionTime;
		this.consumerHeadImgUrl= consumerHeadImgUrl;
	}

	// Property accessors

	public Integer getConsumerId() {
		return this.consumerId;
	}

	public void setConsumerId(Integer consumerId) {
		this.consumerId = consumerId;
	}

	public String getOpenId() {
		return this.openId;
	}

	public void setOpenId(String openId) {
		this.openId = openId;
	}

	public String getConsumerName() {
		return this.consumerName;
	}

	public void setConsumerName(String consumerName) {
		this.consumerName = consumerName;
	}

	public Integer getConsumerSex() {
		return this.consumerSex;
	}

	public void setConsumerSex(Integer consumerSex) {
		this.consumerSex = consumerSex;
	}

	public String getConsumerCountry() {
		return this.consumerCountry;
	}

	public void setConsumerCountry(String consumerCountry) {
		this.consumerCountry = consumerCountry;
	}

	public String getConsumerCity() {
		return this.consumerCity;
	}

	public void setConsumerCity(String consumerCity) {
		this.consumerCity = consumerCity;
	}

	public Timestamp getAttentionTime() {
		return this.attentionTime;
	}

	public void setAttentionTime(Timestamp attentionTime) {
		this.attentionTime = attentionTime;
	}

	public String getConsumerHeadImgUrl() {
		return consumerHeadImgUrl;
	}

	public void setConsumerHeadImgUrl(String consumerHeadImgUrl) {
		this.consumerHeadImgUrl = consumerHeadImgUrl;
	}

	@Override
	public String toString() {
		return "TbConsumer [consumerId=" + consumerId + ", openId=" + openId
				+ ", consumerName=" + consumerName + ", consumerSex="
				+ consumerSex + ", consumerCountry=" + consumerCountry
				+ ", consumerCity=" + consumerCity + ", attentionTime="
				+ attentionTime + ", consumerHeadImgUrl=" + consumerHeadImgUrl
				+ "]";
	}
	
	
}