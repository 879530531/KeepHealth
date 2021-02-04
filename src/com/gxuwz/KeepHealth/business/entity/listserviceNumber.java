package com.gxuwz.KeepHealth.business.entity;

public class listserviceNumber {
private Long serviceNumber;
private Integer personalId;

public listserviceNumber(Long serviceNumber, Integer personalId) {
	super();
	this.serviceNumber = serviceNumber;
	this.personalId = personalId;
}
public listserviceNumber() {
	super();
}
public Long getServiceNumber() {
	return serviceNumber;
}
public void setServiceNumber(Long serviceNumber) {
	this.serviceNumber = serviceNumber;
}
public Integer getPersonalId() {
	return personalId;
}
public void setPersonalId(Integer personalId) {
	this.personalId = personalId;
}



}
