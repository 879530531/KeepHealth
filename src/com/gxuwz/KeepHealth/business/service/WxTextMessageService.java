package com.gxuwz.KeepHealth.business.service;


/**
 * 微信根据不同回复处理层
 * @author 叶城廷
 * @version 2019.1.31
 */
public interface WxTextMessageService {

	/**
	 * 对普通纯文件进行回复处理
	 * @param toUserName 接收方
	 * @param fromUserName 发送方
	 * @param content 内容
	 * @return 封装Message
	 * @author 叶城廷
     * @version 2019.1.31
	 */
	String wxTextReply(String toUserName, String fromUserName, String content);

	
}
