package com.qyxy.service;

import com.qyxy.domain.Slideshow;
import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2018/9/6 0006.
 */
public interface SlideService {
    public void addimg(int slidelocation, Date date, int identifier, String  file);

    public List<Slideshow> selectAll();


    //删除
    public void delete(int slideid);
    //更改上下架状态
    public void update(int slideshelf,int slideid,int slidelocation,Model mv);


    //前台首页查询轮播图，返回五张上架的轮播图,根据轮播图的位置查询
    public List<Slideshow> fontselectslideshow( int slidelocation);

}
