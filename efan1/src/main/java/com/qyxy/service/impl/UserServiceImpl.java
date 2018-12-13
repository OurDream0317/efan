package com.qyxy.service.impl;

import com.alibaba.fastjson.JSON;
import com.qyxy.domain.User1;
import com.qyxy.mapper.User1Mapper;
import com.qyxy.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2018/8/31 0031.
 */
@Service(value = "userService")
public class UserServiceImpl implements UserService {
    @Resource
    private User1Mapper user1Mapper;

    @Override
    public List<User1> selectAllUser(int startRow,int endRow,User1 user1) {
       List<User1> list= user1Mapper.selectAllUser(startRow, endRow,user1);
        return list ;
    }
    //修改user对象的禁用状态
    @Override
    public void updatedisable(User1 user1) {
        System.out.println(JSON.toJSONString(user1));
        user1Mapper.updatedisable(user1);

    }

    @Override
    public User1 selectUserById(int userid) {
        return user1Mapper.selectUserById(userid);
    }
    //站长审核通过，将status改为2
    @Override
    public void updateUserStatus(int userid) {
        user1Mapper.updateUserStatus(userid);
    }

    @Override
    public void updataUser(User1 user1) {
        user1Mapper.updatedisable(user1);
    }

    @Override
    public void updateUserDisable(List<String> list) {
        user1Mapper.updateUserDisable(list);
    }


}
