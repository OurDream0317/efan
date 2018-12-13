package com.qyxy.service;

import com.qyxy.domain.User1;
import java.util.List;

/**
 * Created by Administrator on 2018/8/7 0007.
 */
public interface FontRegisterService {
    public void saveUser(String username,String password,String phone);

    //查看用户是否存在
    public String userList(String username,String userphone
    );
    public String userList1(String userphone
    );

    /* //给用户添加昵称
     public void saveNickName();*/
    //判断用户名和密码是否一致
    public List<User1> findUserName(String username);

    //前端用户通过用户名查询用户数据，返回list对象
    public List<User1> findUserByName(String username);

    //修改用户的个人信息
    public void updateUser(String username, String password, String nickname, String userIcon, String phone);
    //查询用户的zhua状态，判断是否能够登录
    public User1 findStatus(String username);

}
