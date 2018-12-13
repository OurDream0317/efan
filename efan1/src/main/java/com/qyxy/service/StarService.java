package com.qyxy.service;

import com.qyxy.domain.Star;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * Created by Administrator on 2018/9/4 0004.
 */
public interface StarService {
    public void addStarDemo(String starname, String starintroduce, MultipartFile file1, MultipartFile file2);
    public List<Star> viewStar(int currentPage, int count);
    public void updateUpStatus(int id);
    public void NoupdateUpStatus(int id);
    public void updateDelStatus(int id);
    public Star viewStarDemo(int id);
    public void editStarDemo(Star star, MultipartFile file1, MultipartFile file2);
    public List<Star> selectStar(String starname,String content,int upStatus,int sort,int currentPage, int count);
    /*前台首页查询4位人气最高的明星，*/
    public List<Star> fontselecthot();
    public void deleteAll(String ids);
}
