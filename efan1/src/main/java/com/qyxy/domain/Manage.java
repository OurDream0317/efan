package com.qyxy.domain;

import java.util.Date;

public class Manage {

    private Integer manageid;
    private String manageacc;//管理员账号，黄牛的电话
    private String nickname;//昵称，黄牛的公司名
    private String managepassword;
    private String managesalt;//加盐，统一储存为账号
    private Integer managestatus;//删除状态，0代表删除，1代表平台管理员，2代表黄牛端的管理员
    private Date addtime;//新增时间
   private String managename;
    private Integer shownumber;//黄牛端用户发布的演出数
    private Integer disable;//黄牛的禁用状态

    public Integer getShownumber() {
        return shownumber;
    }

    public void setShownumber(Integer shownumber) {
        this.shownumber = shownumber;
    }

    public Integer getDisable() {
        return disable;
    }

    public void setDisable(Integer disable) {
        this.disable = disable;
    }

    public String getManagename() {
        return managename;
    }

    public void setManagename(String managename) {
        this.managename = managename;
    }

    public Date getAddtime() {
        return addtime;
    }

    public void setAddtime(Date addtime) {
        this.addtime = addtime;
    }

    public Integer getManageid() {
        return manageid;
    }


    public void setManageid(Integer manageid) {
        this.manageid = manageid;
    }


    public String getManageacc() {
        return manageacc;
    }


    public void setManageacc(String manageacc) {
        this.manageacc = manageacc == null ? null : manageacc.trim();
    }


    public String getNickname() {
        return nickname;
    }


    public void setNickname(String nickname) {
        this.nickname = nickname == null ? null : nickname.trim();
    }

    public String getManagepassword() {
        return managepassword;
    }


    public void setManagepassword(String managepassword) {
        this.managepassword = managepassword == null ? null : managepassword.trim();
    }


    public String getManagesalt() {
        return managesalt;
    }


    public void setManagesalt(String managesalt) {
        this.managesalt = managesalt == null ? null : managesalt.trim();
    }

    public Integer getManagestatus() {
        return managestatus;
    }

    public void setManagestatus(Integer managestatus) {
        this.managestatus = managestatus;
    }
}