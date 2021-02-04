package com.gxuwz.KeepHealth.business.entity;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.apache.http.ParseException;


public class Vip {
	
	private Integer surplusDay;//剩余有效天数
	private String personalNumber;//会员编号
	/*private String name;//昵称
*/	private String realName;//真实姓名
	private String mobilePhone;//手机号
	private Timestamp startTime;//开始时间
	private Timestamp endTime;//结束时间
	
	
	public Vip(String personalNumber, String realName,String mobilePhone, Object startTime,Object endTime,Integer surplusDay) throws java.text.ParseException {
		super();
		this.personalNumber = personalNumber;
		this.startTime = stringToTimestamp(startTime.toString());
		this.realName = realName;
		this.endTime = stringToTimestamp1(endTime.toString());
		this.mobilePhone=mobilePhone;
		this.surplusDay=surplusDay;
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
	
	public static Timestamp stringToTimestamp1(String dateStr) throws java.text.ParseException{
		 
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

	public Vip() {
		super();
	}
	
	public Integer getSurplusDay() {
		return surplusDay;
	}
	public void setSurplusDay(Integer surplusDay) {
		this.surplusDay = surplusDay;
	}
	public String getPersonalNumber() {
		return personalNumber;
	}
	public void setPersonalNumber(String personalNumber) {
		this.personalNumber = personalNumber;
	}
	public String getMobilePhone() {
		return mobilePhone;
	}
	public void setMobilePhone(String mobilePhone) {
		this.mobilePhone = mobilePhone;
	}
	public Timestamp getStartTime() {
		return startTime;
	}
	public void setStartTime(Timestamp startTime) {
		this.startTime = startTime;
	}
	public Timestamp getEndTime() {
		return endTime;
	}
	public void setEndTime(Timestamp endTime) {
		this.endTime = endTime;
	}
	public String getRealName() {
		return realName;
	}
    public void setRealName(String realName) {
		this.realName = realName;
	}

}
