package com.qyxy.service;

import com.qyxy.domain.Cattle;
import com.qyxy.domain.Manage;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2018/9/3 0003.
 */
public interface CattleService {
    /*多条件分页查询*//*
    public List<Cattle> SelectCattleAll(Map map);

    //通过账号查询 返回一个cattle对象
    public Cattle selectByPhone(String cattlephone);

    //新增一个cattle数据
    public void insertCattle(Cattle cattle);
    //更改黄牛的禁用状态
    public void updateStatus(int cattleid,int cattlestatus);*/



     /*多条件分页查询黄牛*/
    public List<Manage> SelectCattleAll(Map map);
    //通过账号查询 返回一个cattle对象
    public Manage selectCattleByPhone( String manageacc);

    //新增一个cattle数据
    public void insertCattle(Manage manage);
    //更改黄牛的禁用状态
    public void updateCattleStatus(int manageid, int disable);

}
