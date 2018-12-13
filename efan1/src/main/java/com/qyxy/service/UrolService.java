package com.qyxy.service;

import com.qyxy.domain.Urole;

import java.util.List;

/**
 * Created by Administrator on 2018/9/2 0002.
 */
public interface UrolService {
    public void addUrole(String uroleName);
    public void deleteUrole(String uroleName);
    public List<Urole> findAll();

    public Urole selectid(String nickname);


    //对权限进行管理
    public void insertUp(String upermissionid,String uroleid);


    public void deleteAP(String uroleid);
}
