package com.qyxy.domain;

import java.util.List;

/**
 * Created by Administrator on 2018/8/24 0024.
 * 与数据库不关联，只保存用户常用的信息（在session中保存）
 */
public class ActiveManage {
    private Integer manageid;
    private String manageacc;
    private String nickname;
    private String managesalt;
    private Integer managestatus;

    //菜单列表
    private List<Upermission> menuList;
    //权限菜单
   /* private List<SysPermission> permissionList;*/

    public Integer getManagestatus() {
        return managestatus;
    }

    public void setManagestatus(Integer managestatus) {
        this.managestatus = managestatus;
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
        this.manageacc = manageacc;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getManagesalt() {
        return managesalt;
    }

    public void setManagesalt(String managesalt) {
        this.managesalt = managesalt;
    }

    public List<Upermission> getMenuList() {
        return menuList;
    }

    public void setMenuList(List<Upermission> menuList) {
        this.menuList = menuList;
    }





}
