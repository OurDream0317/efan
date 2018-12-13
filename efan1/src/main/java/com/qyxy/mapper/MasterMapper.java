package com.qyxy.mapper;

import com.qyxy.domain.Master;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface MasterMapper {

    //通过用户id查询站长对象，返回站长对象
    public Master selectMastserById(@Param("userid") int userid);

    //站长审核不通过，将备注添加到数据库
    public void updateMasterRemar(@Param("userid") int userid,@Param("masterremar") String masterremar);

}