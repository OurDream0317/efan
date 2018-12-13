package com.qyxy.mapper;

import com.qyxy.domain.UrolePermission;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UrolePermissionMapper {
      public void insertUp(@Param("upermissionid") String upermissionid,@Param("uroleid") String uroleid);

      public void deleteAP(String uroleid);
}