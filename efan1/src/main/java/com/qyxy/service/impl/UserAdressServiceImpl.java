package com.qyxy.service.impl;

import com.qyxy.domain.UserAddress;
import com.qyxy.mapper.UserAddressMapper;
import com.qyxy.service.UserAdressService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2018/9/11 0011.
 */
@Service
public class UserAdressServiceImpl implements UserAdressService {
    @Resource
    private UserAddressMapper userAddressMapper;
    @Override
    public List<UserAddress> select(String usename) {
        return userAddressMapper.select(usename);
    }

    @Override
    public List<UserAddress> selectAll(String userid) {
        return userAddressMapper.selectAll(userid);
    }

    @Override
    public void add(String userid, String username, String userphone, String address) {
         userAddressMapper.add(userid,username,userphone,address);
    }

    @Override
    public void delete1(String addressid) {
        userAddressMapper.delete1(addressid);
    }

    @Override
    public void update1(String addressid, String username, String userphone, String address) {
        userAddressMapper.update1(addressid,username,userphone,address);
    }


    @Override
    public void set(String addressid) {
        userAddressMapper.set(addressid);
    }

    @Override
    public void set1(String userid) {
        userAddressMapper.set1(userid);
    }
}
