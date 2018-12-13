package com.qyxy.service;

import com.qyxy.domain.UserAddress;

import java.util.List;

/**
 * Created by Administrator on 2018/9/11 0011.
 */
public interface UserAdressService {
    //查询
    public List<UserAddress> select(String usename);
    public List<UserAddress> selectAll(String userid);
    //新增地址
    public void add(String userid,String username,String userphone,String address);

    //删除地址
    public void delete1(String addressid);

    //修改地址
    public void update1(String addressid,String username,String userphone,String address);


    //设置默认地址
    public void set(String addressid);
    public void set1(String userid);



}
