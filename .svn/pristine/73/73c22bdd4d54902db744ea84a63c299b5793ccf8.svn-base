package com.gxuwz.KeepHealth.business.entity;


import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import org.apache.http.ParseException;

public class Untreated {
	
	private String personalNumber;
	private Integer personalId;//个人数据id
	private String realName;//真实姓名
	private Integer readmeId;
	private String readmeContent;//咨询内容
	private Timestamp readmeTime;//咨询时间
	
	private Timestamp usertime;//咨询时间
	private Timestamp usertime1;//咨询时间
	
	
	
	
	public Untreated() {
		super();
	}

	
	
	
	
	public Untreated(String personalNumber, Integer personalId, String realName, Integer readmeId,
			String readmeContent, Object readmeTime) throws java.text.ParseException {
		super();
		this.personalNumber = personalNumber;
		this.personalId = personalId;
		this.realName = realName;
		this.readmeId = readmeId;
		this.readmeContent = readmeContent;
		this.readmeTime = stringToTimestamp(readmeTime.toString());
		
	}

	
	

	public static Timestamp stringToTimestamp(String dateStr) throws java.text.ParseException{
	 
	   SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	   Calendar cal = Calendar.getInstance();
	   try {
	    Date date = (Date) sdf.parse(dateStr);
	    date.getTime();
	    cal.setTime(date);
	    return new Timestamp(cal.getTimeInMillis());
	   } catch (ParseException e) {
	    e.printStackTrace();
	   }
	 
	   cal.setTime(new Date());
	   return new Timestamp(cal.getTimeInMillis());
	}

	
	
	

	
	
	
	





	public Untreated(String personalNumber, Integer personalId,
			String realName, Integer readmeId, String readmeContent,
			Object readmeTime, Timestamp usertime, Timestamp usertime1) throws java.text.ParseException {
		super();
		this.personalNumber = personalNumber;
		this.personalId = personalId;
		this.realName = realName;
		this.readmeId = readmeId;
		this.readmeContent = readmeContent;
		this.readmeTime = stringToTimestamp(readmeTime.toString());
		this.usertime = usertime;
		this.usertime1 = usertime1;
	}





	public Timestamp getUsertime() {
		return usertime;
	}
	public void setUsertime(Timestamp usertime) {
		this.usertime = usertime;
	}
	public Timestamp getUsertime1() {
		return usertime1;
	}
	public void setUsertime1(Timestamp usertime1) {
		this.usertime1 = usertime1;
	}

	public Integer getPersonalId() {
		return personalId;
	}
	public void setPersonalId(Integer personalId) {
		this.personalId = personalId;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}

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





	public String getPersonalNumber() {
		return personalNumber;
	}





	public void setPersonalNumber(String personalNumber) {
		this.personalNumber = personalNumber;
	}
}
