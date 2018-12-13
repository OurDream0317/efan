package com.qyxy.service.impl;

import com.qyxy.mapper.UpermissionMapper;
import com.qyxy.service.UperMissionService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by Administrator on 2018/9/2 0002.
 */
@Service(value = "uperMissionServiceImpl")
public class UperMissionServiceImpl implements UperMissionService{
    @Resource
    private UpermissionMapper upermissionMapper;
    public void selectPermission(String urolename){
         upermissionMapper.selectPerssion(urolename);
    }

}
