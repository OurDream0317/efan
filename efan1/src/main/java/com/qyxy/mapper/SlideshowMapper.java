package com.qyxy.mapper;

import com.qyxy.domain.Slideshow;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;
@Repository
public interface SlideshowMapper {
    public void addimg(@Param("slidelocation") int slidelocation,@Param("date") Date date,@Param("identifier") int identifier, @Param("file") String  file);
    public List<Slideshow> selectAll();

    //删除
    public void delete(int slideid);
    //更改上下架状态
    public void update(@Param("slideshelf") int slideshelf,@Param("slideid") int slideid);

    public List<Slideshow> shelfnumber(@Param("slidelocation") int slidelocation,@Param("slideshelf") int slideshelf);

    //前台首页查询轮播图，返回五张上架的轮播图,根据轮播图的位置查询
    public List<Slideshow> fontselectslideshow(@Param("slidelocation") int slidelocation);



}