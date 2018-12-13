package com.qyxy.service;


import com.qyxy.domain.Show;
import com.qyxy.domain.Upermission;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2018/9/1 0001.
 */
@Repository(value = "showService")
public interface ShowService {
    public List<Show> findShowAll(Map map);
    public List<Show> findAll(Map map);
    public void addshow(Show show, MultipartFile myFile);
    public Show viewShow(int id);
    public void updateShow(Show show, MultipartFile myFile);
    public void updateShowUpStatus(int id,int shelf);
    public void updateShowTStatus(int id,int recommend);
    public void updateShowDelStatus(int id,int status);
    public void updateShowAuditstatus(String userName,int id);
    public void NoupdateShowAuditstatus(String userName,int id);

    /*前台首页查询一个最新的演出*/
    public List<Show> fontSelectShow();
}
