package com.qyxy.service.impl;

import com.qyxy.domain.Cattle;
import com.qyxy.domain.Manage;
import com.qyxy.domain.UserRole;
import com.qyxy.mapper.CattleMapper;
import com.qyxy.mapper.ManageMapper;
import com.qyxy.mapper.UserRoleMapper;
import com.qyxy.service.CattleService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2018/9/3 0003.
 */
@Service(value = "cattleService")
public class CattleServiceImpl  implements CattleService{
   /* @Resource
    private CattleMapper cattleMapper;

    @Override
    public List<Cattle> SelectCattleAll(Map map) {
        return cattleMapper.SelectCattleAll(map);
    }
    //通过账号查询 返回一个cattle对象
    @Override
    public Cattle selectByPhone(String cattlephone) {
        return cattleMapper.selectByPhone(cattlephone);
    }
    //新增一个cattle数据
    @Override
    public void insertCattle(Cattle cattle) {
          cattleMapper.insertCattle(cattle);
    }
*//*更改黄牛的禁用状态*//*
    @Override
    public void updateStatus(int cattleid, int cattlestatus) {
        System.out.println(cattleid+"黄牛service"+cattlestatus);
        cattleMapper.updateStatus(cattleid,cattlestatus);
    }*/

    @Resource
    private ManageMapper manageMapper;

    //加入用户角色表
    @Resource
    private UserRoleMapper userRoleMapper;


    @Override
    public List<Manage> SelectCattleAll(Map map) {
        return manageMapper.SelectCattleAll(map);
    }

    @Override
    public Manage selectCattleByPhone(String manageacc) {
        return manageMapper.selectCattleByPhone(manageacc);
    }

    @Override
    public void insertCattle(Manage manage) {
        //黄牛管理插入黄牛信息，同时插入黄牛的权限，使用黄牛的账号插入用户角色表
        manageMapper.insertCattle(manage);
        //将黄牛的角色ID和黄牛的账号插入用户角色表
        userRoleMapper.addUserRole(manage.getManageacc(),5);
    }

    @Override
    public void updateCattleStatus(int manageid, int disable) {
        manageMapper.updateCattleStatus(manageid, disable);

    }
}
