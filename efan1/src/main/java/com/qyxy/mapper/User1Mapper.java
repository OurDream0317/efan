package com.qyxy.mapper;

import com.qyxy.domain.User1;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface User1Mapper {
    public List<User1> selectAllUser(@Param("startRow")int startRow, @Param("endRow")int pageSize,@Param("user1") User1 user1);

    //修改用户的禁用状态
    public void updatedisable(@Param("user1") User1 user1);

    //通过用户id查询用户对象，将用户对象返回到controller
    public User1 selectUserById(@Param("userid") int userid);

    //站长审核通过，将status改为2
    public void updateUserStatus(@Param("userid") int userid);

    //后台前端用户的批量禁用
    public void updateUserDisable( List<String> list);

    public void updataUser(Map map);

    //用户登录模块
    public void saveUser(@Param("username") String username,@Param("password") String password,@Param("phone") String phone);

    //查看用户是否存在
    public List<User1> userList(@Param("username") String username
    );
    public List<User1> userList1(@Param("userphone")String userphone
    );

    /* //给用户添加昵称
     public void saveNickName();*/
    //判断用户名和密码是否一致
    public List<User1> findUserName(@Param("userphone") String userphone);

    //前端用户通过用户名查询用户数据，返回list对象
    public List<User1> findUserByName(String userphone);

    //修改用户的个人信息
    public void updateUser(String username, String password, String nickname, String userIcon, String phone);
    //查询用户的zhua状态，判断是否能够登录
    public User1 findStatus(String userphone);
}