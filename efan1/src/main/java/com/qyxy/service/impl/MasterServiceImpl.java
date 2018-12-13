package com.qyxy.service.impl;

import com.qyxy.domain.Master;
import com.qyxy.mapper.MasterMapper;
import com.qyxy.service.MasterService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by Administrator on 2018/9/2 0002.
 */@Service(value = "masterService")
public class MasterServiceImpl implements MasterService{
    @Resource
    private MasterMapper masterMapper;
    @Override
    public Master selectMasterById(int userid) {
        return masterMapper.selectMastserById(userid);
    }

    @Override
    public void updateMasterRemar(int userid, String masterremar) {
        masterMapper.updateMasterRemar(userid, masterremar);
    }
}
