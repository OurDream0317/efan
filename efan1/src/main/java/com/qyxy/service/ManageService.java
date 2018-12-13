package com.qyxy.service;

import com.qyxy.domain.Manage;
import com.qyxy.domain.Upermission;

import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2018/8/30 0030.
 */
public interface ManageService {
    public Manage selectManageByAcc(String manageacc);

    public List<Upermission> selectPermissionList(String manageacc);

    //新增管理员
    public void addMange(String manageacc, String mh1, String nickname, Date date,String managename);


    //修改密码
    public void updatePassword(String username,String password);


    //删除人员
    public void deleteManger(String manageacc);

    //修改  编辑
    public void updateManger(String username,String username1,String nickname);


    //根据姓名模糊查询
    public void selectName(String username);
    //查询界面，把所有人员显示在操作界面上，分页查询
    public List<Manage> findAll(int startRow, int endRow,String managename);
}
