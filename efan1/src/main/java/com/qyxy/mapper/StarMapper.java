package com.qyxy.mapper;

import com.qyxy.domain.Star;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository(value = "starMapper")
public interface StarMapper {
    public void addStarDemo(@Param("starname") String starname,@Param("starintroduce")  String starintroduce,@Param("addTime")  String addTime, @Param("MyFile") String MyFile,@Param("MyFile1")  String MyFile1);
    public List<Star> viewStar(@Param("currentPage") int currentPage,@Param("count") int count);
    public void updateUpStatus(int id);
    public void NoupdateUpStatus(int id);
    public void updateDelStatus(int id);
    public Star viewStarDemo(int id);
    public void editStarDemo(Map map);
    public List<Star> selectStar(Map map);
    public List<Star> selectAll();

    /*前台首页查询4位人气最高的明星，*/
    public List<Star> fontselecthot();
    public void deleteAll(int ids);
}