package com.qyxy.service.impl;

import com.qyxy.domain.Urole;
import com.qyxy.mapper.UroleMapper;
import com.qyxy.mapper.UrolePermissionMapper;
import com.qyxy.service.UrolService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2018/9/2 0002.
 */
@Service(value = "urolServiceImpl")
public class UrolServiceImpl implements UrolService {
    @Resource
    private UroleMapper uroleMapper;
    @Resource
    private UrolePermissionMapper urolePermissionMapper;
    //增加
    @Override
    public void addUrole(String uroleName) {
        uroleMapper.addUrole(uroleName);
    }
    //删除
    @Override
    public void deleteUrole(String uroleName) {
        uroleMapper.deleteUrole(uroleName);
    }
    //展示
    @Override
    public List<Urole> findAll() {
       return uroleMapper.findAll();
    }

    @Override
    public Urole selectid(String nickname) {
        return uroleMapper.selectid(nickname);
    }
    //删除所有权限
    @Override
    public void deleteAP(String uroleid) {
        urolePermissionMapper.deleteAP(uroleid);
    }

    @Override
    public void insertUp(String upermissionid, String uroleid) {
        urolePermissionMapper.insertUp(upermissionid,uroleid);
    }
    //对权限进行管理




}
