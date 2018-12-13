package com.qyxy.service.impl;

import com.qyxy.domain.UserRole;
import com.qyxy.mapper.UserRoleMapper;
import com.qyxy.service.UserRoleService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by Administrator on 2018/9/4 0004.
 */
@Service(value = "userRoleServiceImpl")
public class UserRoleServiceImpl implements UserRoleService{
    @Resource
    private UserRoleMapper userRoleMapper;
    @Override
    public void addUrolRole(String useraccount, int uroleid) {
         userRoleMapper.addUserRole(useraccount,uroleid);
    }

    @Override
    public void updateUrole(String uroleid, String username1) {
        userRoleMapper.updateUrole(uroleid,username1);
    }
}
