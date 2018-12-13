package com.qyxy.service.impl;
import com.qyxy.domain.User1;
import com.qyxy.mapper.User1Mapper;
import com.qyxy.service.FontRegisterService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2018/8/7 0007.
 */
@Service(value = "fontRegisterServiceImpl")
public class FontRegisterServiceImpl implements FontRegisterService {
    @Resource
    private User1Mapper user1Mapper;
    @Override
    public void saveUser(String username,String password,String phone) {
          user1Mapper.saveUser(username,password,phone);
    }

    @Override
    public String userList(String username,String userphone) {
        List<User1> username1=user1Mapper.userList(username);
        List<User1> username4=user1Mapper.userList1(userphone);
        if(username4.size()>0){
            User1 username2=username4.get(0);
            System.out.print(username2);
            if(username2!=null){
                return "手机号已经注册过";
            }
        }
        if(username1.size()>0){
            User1 username2=username1.get(0);
            System.out.print(username2);
            if(username2!=null){
                return "用户已经存在";
            }
        }
        return "true";
    }

    @Override
    public String userList1(String userphone) {
        List<User1> username1=user1Mapper.userList1(userphone);
        if(username1.size()>0){
            User1 username2=username1.get(0);
            System.out.print(username2);
            if(username2!=null){
                return "手机号已经注册过";
            }
        }
        return "true";
    }


    @Override
    public List<User1> findUserName(String username) {

        return user1Mapper.findUserName(username);
    }
//前端用户通过用户名查询数据，返回用户的list对象


    @Override
    public List<User1> findUserByName(String username) {
        return user1Mapper.findUserByName(username);
    }
    //修改用户的个人信息
    @Override
    public void updateUser(String username, String password, String nickname,String userIcon, String phone) {
       user1Mapper.updateUser(username,password,nickname,userIcon,phone);
    }

    @Override
    public User1 findStatus(String username) {
        return user1Mapper.findStatus(username);
    }
}
