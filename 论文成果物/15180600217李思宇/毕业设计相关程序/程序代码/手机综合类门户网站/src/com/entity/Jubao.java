package com.entity;

public class Jubao {
    private Integer id;
	private String pinglunneirong;	private String pinglunren;	private String jubaoneirong;	private String jubaoren;	
    private String addtime;

    

    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }
	
	public String getPinglunneirong() {
        return pinglunneirong;
    }
    public void setPinglunneirong(String pinglunneirong) {
        this.pinglunneirong = pinglunneirong == null ? null : pinglunneirong.trim();
    }	public String getPinglunren() {
        return pinglunren;
    }
    public void setPinglunren(String pinglunren) {
        this.pinglunren = pinglunren == null ? null : pinglunren.trim();
    }	public String getJubaoneirong() {
        return jubaoneirong;
    }
    public void setJubaoneirong(String jubaoneirong) {
        this.jubaoneirong = jubaoneirong == null ? null : jubaoneirong.trim();
    }	public String getJubaoren() {
        return jubaoren;
    }
    public void setJubaoren(String jubaoren) {
        this.jubaoren = jubaoren == null ? null : jubaoren.trim();
    }	
	
	
    public String getAddtime() {
        return addtime;
    }
    public void setAddtime(String addtime) {
        this.addtime = addtime == null ? null : addtime.trim();
    }
}
//   设置字段信息
