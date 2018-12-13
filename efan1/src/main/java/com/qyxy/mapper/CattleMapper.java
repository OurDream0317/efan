package com.qyxy.mapper;

import com.qyxy.domain.Cattle;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;
@Repository
public interface CattleMapper {
    /*多条件分页查询*/
    public List<Cattle> SelectCattleAll(Map map);
    //通过账号查询 返回一个cattle对象
    public Cattle selectByPhone(@Param("cattlephone") String cattlephone);

    //新增一个cattle数据
    public void insertCattle(@Param("cattle")Cattle cattle);
    //更改黄牛的禁用状态
    public void updateStatus(@Param("cattleid") int cattleid,@Param("cattlestatus") int cattlestatus);

}