package com.entity;

public class guanjianzi {
private Integer id;
private String text;
public Integer getId() {
	return id;
}
public void setId(Integer id) {
	this.id = id;
}
public String getText() {
	return text;
}
public void setText(String text) {
	this.text = text;
}
@Override
public String toString() {
	return "guanjianzi [id=" + id + ", text=" + text + "]";
}

}
