package com.qyxy.domain;

public class UserAddress {

    private Integer addressid;
    private Integer userid;
    private String address;
    private String username;
    private String userphone;
    private Integer defstatus;

    public String getAddress() {
        return address;
    }
    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }
    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }
    public String getUserphone() {
        return userphone;
    }
    public void setUserphone(String userphone) {
        this.userphone = userphone == null ? null : userphone.trim();
    }

    public Integer getAddressid() {
        return addressid;
    }

    public void setAddressid(Integer addressid) {
        this.addressid = addressid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getDefstatus() {
        return defstatus;
    }

    public void setDefstatus(Integer defstatus) {
        this.defstatus = defstatus;
    }
}