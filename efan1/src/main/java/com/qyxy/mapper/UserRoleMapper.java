package com.qyxy.mapper;

import com.qyxy.domain.UserRole;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRoleMapper {
    public void addUserRole(@Param("useraccount") String useraccount,@Param("uroleid") int uroleid);
    public void updateUrole(@Param("uroleid") String uroleid,@Param("username1")String username1);

}