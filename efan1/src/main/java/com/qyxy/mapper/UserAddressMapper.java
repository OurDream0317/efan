package com.qyxy.mapper;

import com.qyxy.domain.UserAddress;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserAddressMapper {
    public List<UserAddress> select(String username);
    public List<UserAddress> selectAll(String userid);

    public void add(@Param("userid") String userid,@Param("username") String username,@Param("userphone") String userphone, @Param("address") String address);


    //删除地址
    public void delete1(String addressid);

    //修改地址
    public void update1(@Param("username") String username,@Param("addressid") String addressid,@Param("userphone")String userphone,@Param("address")String address);


    //设置默认地址
    public void set(String addressid);
    public void set1(String userid);
}