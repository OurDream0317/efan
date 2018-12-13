package com.qyxy.mapper;

import com.qyxy.domain.Urole;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface UroleMapper {
     //增加角色
     public void addUrole(@Param("uroleName") String uroleName);
     //删除角色
     public void deleteUrole(String uroleName);
     //展示角色
     public List<Urole> findAll();

     //查找id
     public Urole selectid(String nickname);

     //批量删除拥有的权限
     public void deleteAP(String uroleid);
 }