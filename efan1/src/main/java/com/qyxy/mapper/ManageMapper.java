package com.qyxy.mapper;

import com.qyxy.domain.Cattle;
import com.qyxy.domain.Manage;
import com.qyxy.domain.Upermission;

import org.apache.ibatis.annotations.Param;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;


import java.util.Date;
import java.util.List;
import java.util.Map;
@Repository
public interface ManageMapper {
    //登录查询
    public Manage selectManageByAcc(String manageacc);

    //登录查询manage权限
    public List<Upermission> selectPermissionList(String manageacc);


   //新增管理员
    public void addMange(@Param("manageacc") String manageacc,@Param("mh1") String managepassword, @Param("nickname") String nickname,@Param("date")Date date,@Param("managename")String managename);

    //修改密码
    public void updatePassword(@Param("username")String username,@Param("password")String password);

    //删除人员
    public void deleteManger(String manageacc);

    //修改  编辑
    public void updateManger(@Param("username") String username,@Param("username1") String username1,@Param("nickname") String nickname);


    //根据姓名模糊查询
    public void selectName(String username);

    //查询界面，把所有人员显示在操作界面上，分页查询
    public List<Manage> findAll(@Param("startRow") int startRow,@Param("endRow") int endRow,@Param("managename") String managename);



    /*多条件分页查询黄牛*/
    public List<Manage> SelectCattleAll(Map map);
    //通过账号查询 返回一个cattle对象
    public Manage selectCattleByPhone(@Param("manageacc") String manageacc);

    //新增一个cattle数据
    public void insertCattle(@Param("manage")Manage manage);
    //更改黄牛的禁用状态
    public void updateCattleStatus(@Param("manageid") int manageid,@Param("disable") int disable);


}