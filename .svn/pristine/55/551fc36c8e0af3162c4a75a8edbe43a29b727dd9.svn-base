package com.gxuwz.KeepHealth.business.entity;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import org.apache.http.ParseException;

public class FatherHealth { 
	
	
	private Integer readmeId;//咨询id
	private String readmeContent;//咨询内容
	private String name;//会员名称
	private Timestamp readmeTime;//咨询时间
	private Integer mentorId;//导师id
	
	public Integer getReadmeId() {
		return readmeId;
	}
	public void setReadmeId(Integer readmeId) {
		this.readmeId = readmeId;
	}
	public Integer getMentorId() {
		return mentorId;
	}
	public void setMentorId(Integer mentorId) {
		this.mentorId = mentorId;
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
	
	/**
	 * 
	* @Title: FatherHealth
	* @author 软件开发中心   陈洁
	* @Description:构造函数
	* @date 2017年7月8日 上午3:08:35 
	* @throws
	 */
	public FatherHealth(Integer readmeId,String readmeContent,Object readmeTime,Integer mentorId) throws java.text.ParseException{
		   super();
		   this.readmeId=readmeId;
		   this.readmeContent=readmeContent;
		   this.readmeTime = stringToTimestamp(readmeTime.toString());
		   this.mentorId=mentorId;
		}
	
	public FatherHealth(Integer readmeId,String readmeContent,Object readmeTime,Integer mentorId,String name) throws java.text.ParseException{
		   super();
		   this.readmeId=readmeId;
		   this.readmeContent=readmeContent;
		   this.setName(name);
		   this.readmeTime = stringToTimestamp(readmeTime.toString());
		   this.mentorId=mentorId;
		}
	
	public FatherHealth() {
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

}
