package com.qyxy.mapper;

import com.qyxy.domain.News;
import com.qyxy.domain.User1;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;
@Repository(value = "newsMapper")
public interface NewsMapper {
    public void addNews(Map map);
    public void addNewsdemo(Map map);
    public List<News> findNewsAll(Map map);
    public List<News> findNewsAllDemo(@Param("starRow") int starRow,@Param("endRow") int endRow);
    public News findNews(@Param("newsid") int newsid);
    public void updateUpStatus(@Param("newsid") int newsid,@Param("newsshelf") int newsshelf);
    public void updateDelStatus(@Param("newsid") int newsid);
    public void updateTStatus(@Param("newsid") int newsid,@Param("newsrecomment") int newsrecomment);

//前台首页查询4条数据
    public List<News> fontSelectNews();
    //前台页面查询所有新闻数据
    public List<News> fontSelectNews1();
    //前端页面点赞量加1
    public void fontaddclicknumber(@Param("newsid") int newsid,@Param("clicknumber") int clicknumber,@Param("readnumber") int readnumber,@Param("commentnumber") int commentnumber);



}