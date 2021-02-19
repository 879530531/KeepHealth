package com.gxuwz.KeepHealth.business.entity;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import org.apache.http.ParseException;
/**
 * 
* @ClassName: MyAppointment 
* @Description: 封装我的预约+其他预约界面数据（会员名称+会员头像+咨询时间+咨询内容+咨询编号+会员编号）
* @author 软件开发中心  陈洁 
* @date 2017年7月14日 下午4:21:10
 */
public class MyAppointment {
	
	private Integer personalId;//会员id
	private Integer readmeId;//咨询id
	private String readmeContent;//咨询内容
	private Timestamp readmeTime;//咨询时间
	private String memberName;//会员名称
	private String image; //会员头像保存路径
	
	/**
	 * 
	* @Title: MyAppointment 
	* @author 软件开发中心   陈洁
	* @Description: 构造函数
	* @return 
	* @date 2017年7月14日 下午4:21:10
	* @throws
	 */
	public MyAppointment(Integer personalId,Integer readmeId,String readmeContent,Object readmeTime,String memberName, String image) throws java.text.ParseException{
		   super();
		   this.personalId=personalId;
		   this.readmeId=readmeId;
		   this.readmeContent=readmeContent;
		   this.readmeTime = stringToTimestamp(readmeTime.toString());
		   this.memberName=memberName;
		   this.image=image;
		}
	
	/**
	 * 
	* @Title: stringToTimestamp
	* @author 软件开发中心   陈洁
	* @Description:Timestamp
	* @date 2017年7月14日 下午4:21:10
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
	public Integer getPersonalId() {
		return personalId;
	}
	public void setPersonalId(Integer personalId) {
		this.personalId = personalId;
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
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public Timestamp getReadmeTime() {
		return readmeTime;
	}
	public void setReadmeTime(Timestamp readmeTime) {
		this.readmeTime = readmeTime;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}

}
