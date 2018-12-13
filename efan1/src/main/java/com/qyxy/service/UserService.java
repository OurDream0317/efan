package com.qyxy.service;

import com.qyxy.domain.User1;

import java.util.List;

/**
 * Created by Administrator on 2018/8/31 0031.
 */
public interface UserService {
    public List<User1> selectAllUser(int startRow,int endRow,User1 user1);
    //修改user对象的禁用状态
    public void updatedisable(User1 user1);

    //通过用户id查询用户对象，将用户对象返回到controller
    public User1 selectUserById(int userid);
    //站长审核通过，将status改为2
    public void updateUserStatus(int userid);

    public void updataUser(User1 user1);
    //后台前端用户的批量禁用
    public void updateUserDisable( List<String> list);



}
