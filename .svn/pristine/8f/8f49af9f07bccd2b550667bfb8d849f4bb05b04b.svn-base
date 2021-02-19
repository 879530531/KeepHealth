package com.gxuwz.KeepHealth.business.entity;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import org.apache.http.ParseException;

public class ThroughFeedback {
	
	private Integer readmeId;//咨询时间
	private String feedbackContent;//反馈内容
	private Timestamp feedbackTime;//反馈时间
	private Integer starEvaluation;//评价为非常满意的服务数量
	
	public ThroughFeedback(Integer readmeId, String feedbackContent,Object feedbackTime,Integer starEvaluation) throws java.text.ParseException{
		   super();
		   this.setReadmeId(readmeId);
		   this.setFeedbackContent(feedbackContent);
		   this.starEvaluation = starEvaluation;
		   this.setFeedbackTime(stringToTimestamp(feedbackTime.toString()));
		}
	
	public ThroughFeedback() {
		// TODO Auto-generated constructor stub
	}

	public static Timestamp stringToTimestamp(String dateStr) throws java.text.ParseException{
		 
		   SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		   Calendar cal = Calendar.getInstance();
		   try {
		    Date date = (Date)sdf.parse(dateStr);
		    date.getTime();
		    cal.setTime(date);
		    return new Timestamp(cal.getTimeInMillis());
		   } catch (ParseException e) {
		    e.printStackTrace();
		   }
		   cal.setTime(new Date());
		   return new Timestamp(cal.getTimeInMillis());
		}

	public Integer getReadmeId() {
		return readmeId;
	}

	public void setReadmeId(Integer readmeId) {
		this.readmeId = readmeId;
	}

	public String getFeedbackContent() {
		return feedbackContent;
	}

	public void setFeedbackContent(String feedbackContent) {
		this.feedbackContent = feedbackContent;
	}

	public Timestamp getFeedbackTime() {
		return feedbackTime;
	}

	public void setFeedbackTime(Timestamp feedbackTime) {
		this.feedbackTime = feedbackTime;
	}


	public Integer getStarEvaluation() {
		return starEvaluation;
	}

	public void setStarEvaluation(Integer starEvaluation) {
		this.starEvaluation = starEvaluation;
	}

}
