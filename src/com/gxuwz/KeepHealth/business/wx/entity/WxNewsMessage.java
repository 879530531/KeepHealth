package com.gxuwz.KeepHealth.business.wx.entity;
import java.util.List;
/**
 * 微信单图文消息实体类（多个对象成为多图文）
 * @author 叶城廷
 * @version 2019.1.28
 *
 */
public class WxNewsMessage extends WxBaseMessage{
	private int ArticleCount;//图文数量
	private List<WxNews> Articles;//单图文消息列表
	public int getArticleCount() {
		return ArticleCount;
	}
	public void setArticleCount(int articleCount) {
		ArticleCount = articleCount;
	}
	public List<WxNews> getArticles() {
		return Articles;
	}
	public void setArticles(List<WxNews> articles) {
		Articles = articles;
	}
}
