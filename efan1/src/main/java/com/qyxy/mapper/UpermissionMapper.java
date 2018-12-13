package com.qyxy.mapper;

import com.qyxy.domain.Upermission;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;


@Repository(value = "upermissionMapper")
public interface UpermissionMapper {
  public List<Upermission> findShowAll(Map map);
    public void selectPerssion(String uroleid);
}