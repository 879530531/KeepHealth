package com.gxuwz.KeepHealth.business.entity;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import org.apache.http.ParseException;
/**
 * 
* @ClassName: PersonalDataDetail 
* @Description: 个人健康咨询记录详情实体类     封装多表查询得到的结果
* @author 软件开发中心  陈洁 
* @date 2017年7月8日 上午3:04:17
 */
public class PersonalDataDetail {
	
	
	private String qq;//QQ号码
	private String name;//个人昵称
	private String realName;//真实姓名
	private Integer sex;//性别
	private String placeDomicile;//户籍所在地
	private String mobilePhone;//手机号码
	private String image;//头像路径
	private String email;//电子邮箱
	private Timestamp birthday;//生日   存年月日时分
	private String idCard;//身份证
	private Integer maritalStatus;//婚姻状况
	private String professional;//职业
	private String address;//现居地址
	private String adviceContent;//调理建议内容
	private Timestamp adviceTime;//建议回复时间
	private String mentorName;//导师昵称
	private String readmeContent;//咨询内容
	private Timestamp readmeTime;//咨询时间
	private String feedbackContent;//反馈内容
	private Integer starEvaluation;//星级评价 
	
	/**
	 * 
	* @Title: PersonalDataDetail 
	* @author 软件开发中心   陈洁
	* @Description: 构造函数
	* @date 2017年7月8日 上午3:08:35 
	* @throws
	 */
	public PersonalDataDetail(String qq,String name,String realName,Integer sex,String placeDomicile,String mobilePhone,String image,String email,Object birthday, String idCard,Integer maritalStatus,String professional,String address) throws java.text.ParseException{
		   super();
		   this.qq=qq;
		   this.name=name;
		   this.realName=realName;
		   this.sex=sex;
		   this.placeDomicile=placeDomicile;
		   this.mobilePhone=mobilePhone;
		   this.image=image;
		   this.email=email;
		   this.idCard=idCard;
		   this.maritalStatus=maritalStatus;
		   this.professional=professional;
		   this.address=address;
		   this.birthday = stringToTimestamp(birthday.toString());
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
	

	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	public Integer getSex() {
		return sex;
	}
	public void setSex(Integer sex) {
		this.sex = sex;
	}
	public String getPlaceDomicile() {
		return placeDomicile;
	}
	public void setPlaceDomicile(String placeDomicile) {
		this.placeDomicile = placeDomicile;
	}
	public String getMobilePhone() {
		return mobilePhone;
	}
	public void setMobilePhone(String mobilePhone) {
		this.mobilePhone = mobilePhone;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Timestamp getBirthday() {
		return birthday;
	}
	public void setBirthday(Timestamp birthday) {
		this.birthday = birthday;
	}
	public String getIdCard() {
		return idCard;
	}
	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}
	public String getProfessional() {
		return professional;
	}
	public void setProfessional(String professional) {
		this.professional = professional;
	}
	public Integer getMaritalStatus() {
		return maritalStatus;
	}
	public void setMaritalStatus(Integer maritalStatus) {
		this.maritalStatus = maritalStatus;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAdviceContent() {
		return adviceContent;
	}
	public void setAdviceContent(String adviceContent) {
		this.adviceContent = adviceContent;
	}
	public String getFeedbackContent() {
		return feedbackContent;
	}
	public void setFeedbackContent(String feedbackContent) {
		this.feedbackContent = feedbackContent;
	}
	public String getReadmeContent() {
		return readmeContent;
	}
	public void setReadmeContent(String readmeContent) {
		this.readmeContent = readmeContent;
	}
	public String getMentorName() {
		return mentorName;
	}
	public void setMentorName(String mentorName) {
		this.mentorName = mentorName;
	}
	public Timestamp getAdviceTime() {
		return adviceTime;
	}
	public void setAdviceTime(Timestamp adviceTime) {
		this.adviceTime = adviceTime;
	}
	public Timestamp getReadmeTime() {
		return readmeTime;
	}
	public void setReadmeTime(Timestamp readmeTime) {
		this.readmeTime = readmeTime;
	}
	public Integer getStarEvaluation() {
		return starEvaluation;
	}
	public void setStarEvaluation(Integer starEvaluation) {
		this.starEvaluation = starEvaluation;
	}

}
