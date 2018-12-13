package com.qyxy.service;

import com.qyxy.domain.News;
import com.qyxy.domain.User1;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * Created by Administrator on 2018/9/6 0006.
 */
public interface NewsService {
    public void addNews(News news, MultipartFile file,MultipartFile[] file1);
    public void addNews1(News news, MultipartFile file);
    public List<News> findNewsAll(String demo,String content,int upStatus,int tStatus,int currentPage,int count);
    public List<News> findNewsAllDemo(int currentPage, int count);
    public News findNews( int newsid);
    public void updateUpstatus(int newsid,int newsshelf);
    public void updateDelStatus(int newsid);
    public void updateTStatus(int newsid,int newsrecomment);
    public List see(int id);
//前台页面请求新闻数据，以最新时间查找
    public List<News> fontSelectNews();
    //前台页面查询所有新闻数据
    public List<News> fontSelectNews1();
    //前端页面点赞量加1
    public void fontaddclicknumber( Integer newsid,Integer a);
}
