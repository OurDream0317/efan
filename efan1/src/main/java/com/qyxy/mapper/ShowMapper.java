package com.qyxy.mapper;

import com.qyxy.domain.Show;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;
@Repository(value = "showMapper")
public interface ShowMapper {
  public List<Show> findShowAll(Map map);
  public List<Show> findAll(Map map);
  public void addshow(Map map);
  public Show viewShow(int id);
  public void updateShow(Map map);
  public void updateShowUpStatus(Map map);
  public void updateShowTStatus(Map map);
  public void updateShowDelStatus(Map map);
  public void updateShowAuditstatus(Map map);
  public void NoupdateShowAuditstatus(Map map);


   /*前台首页查询一个最新的演出*/
   public List<Show> fontSelectShow();

}