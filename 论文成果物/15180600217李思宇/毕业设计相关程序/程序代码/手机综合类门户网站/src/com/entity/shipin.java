package com.entity;

public class shipin {
private int id;
private String des;
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getDes() {
	return des;
}
@Override
public String toString() {
	return "shipin [id=" + id + ", des=" + des + ", url=" + url + "]";
}
public void setDes(String des) {
	this.des = des;
}
public String getUrl() {
	return url;
}
public shipin(int id, String des, String url) {
	super();
	this.id = id;
	this.des = des;
	this.url = url;
}
public void setUrl(String url) {
	this.url = url;
}
private String url;
}
