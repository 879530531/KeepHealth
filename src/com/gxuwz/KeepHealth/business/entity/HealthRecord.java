package com.gxuwz.KeepHealth.business.entity;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import org.apache.http.ParseException;
/**
 * 
* @ClassName: HealthRecord 
* @Description: 健康记录实体类   封装多表查询得到的结果
* @author 软件开发中心  陈洁 
* @date 2017年7月8日 上午3:07:20
 */
public class HealthRecord {
	
	private String adviceContent;//调理建议内容
	private Timestamp adviceTime;//建议回复时间
	private String mentorName;//导师昵称
	private Integer readmeId;//咨询编号
	private String readmeContent;//咨询内容
	private String memberName;//咨询内容
	private Timestamp readmeTime;//咨询时间
	private String feedbackContent;//反馈内容
	private Timestamp feedbackTime;//反馈时间
	
	public Integer getReadmeId() {
		return readmeId;
	}
	public void setReadmeId(Integer readmeId) {
		this.readmeId = readmeId;
	}
	public String getReadmeContent() {
		return readmeContent;
	}
	public void setReadmeContent(String readmeContent) {
		this.readmeContent = readmeContent;
	}
	public Timestamp getReadmeTime() {
		return readmeTime;
	}
	public void setReadmeTime(Timestamp readmeTime) {
		this.readmeTime = readmeTime;
	}
	public Timestamp getAdviceTime() {
		return adviceTime;
	}
	public void setAdviceTime(Timestamp adviceTime) {
		this.adviceTime = adviceTime;
	}
	public String getAdviceContent() {
		return adviceContent;
	}
	public void setAdviceContent(String adviceContent) {
		this.adviceContent = adviceContent;
	}
	public String getMentorName() {
		return mentorName;
	}
	public void setMentorName(String mentorName) {
		this.mentorName = mentorName;
	}
	public Timestamp getFeedbackTime() {
		return feedbackTime;
	}
	public void setFeedbackTime(Timestamp feedbackTime) {
		this.feedbackTime = feedbackTime;
	}
	public String getFeedbackContent() {
		return feedbackContent;
	}
	public void setFeedbackContent(String feedbackContent) {
		this.feedbackContent = feedbackContent;
	}
	/**
	 * 
	* @Title: HealthRecord 
	* @author 软件开发中心   陈洁
	* @Description: 构造函数
	* @return 
	* @date 2017年7月8日 上午3:08:35 
	* @throws
	 */
	public HealthRecord(String adviceContent, Object adviceTime,String mentorName,Integer readmeId,String readmeContent,Object readmeTime,String memberName, String feedbackContent,Object feedbackTime) throws java.text.ParseException{
		   super();
		   this.readmeId=readmeId;
		   this.readmeContent=readmeContent;
		   this.readmeTime = stringToTimestamp(readmeTime.toString());
		   this.adviceContent=adviceContent;
		   this.adviceTime = stringToTimestamp1(adviceTime.toString());
		   this.mentorName=mentorName;
		   this.memberName=memberName;
		   this.feedbackContent=feedbackContent;
		   this.feedbackTime = stringToTimestamp2(feedbackTime.toString());
		}
	/**
	 * 
	* @Title: stringToTimestamp
	* @author 软件开发中心   陈洁
	* @Description:Timestamp
	* @date 2017年7月8日 上午3:08:35 
	* @throws
	 */
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
	public static Timestamp stringToTimestamp1(String dateStr) throws java.text.ParseException{
		 
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
	public static Timestamp stringToTimestamp2(String dateStr) throws java.text.ParseException{
		 
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
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	

}
