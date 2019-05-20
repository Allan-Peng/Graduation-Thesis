package com.entity;

public class Test {
 private int id;
 private String name;
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
@Override
public String toString() {
	return "Test [id=" + id + ", name=" + name + "]";
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
}
