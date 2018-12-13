package com.qyxy.service.impl;
import com.alibaba.fastjson.JSON;
import com.qyxy.domain.ActiveManage;
import com.qyxy.domain.Show;
import com.qyxy.domain.Upermission;
import com.qyxy.mapper.ShowMapper;
import com.qyxy.mapper.UpermissionMapper;
import com.qyxy.service.ShowService;
import org.apache.commons.io.IOUtils;
import org.apache.ibatis.reflection.SystemMetaObject;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2018/9/1 0001.
 */
@Service(value = "showService")
public class ShowServiceImpl implements ShowService {
    @Resource
    private ShowMapper showMapper;

    @Override
    public List<Show> findShowAll(Map map) {
        System.out.println(JSON.toJSONString(map)+"=========");
        return  showMapper.findShowAll(map);
    }

    @Override
    public List<Show> findAll(Map map) {
        return  showMapper.findAll(map);
    }

    @Override
    public void addshow(Show show, MultipartFile myFile) {
        HttpServletRequest request =   ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
        HttpSession session=request.getSession();
        ActiveManage activeManage= (ActiveManage) session.getAttribute("activeUser");
        show.setShowperson(activeManage.getManageacc());
        show.setStatus(activeManage.getManagestatus());

        String path=request.getServletContext().getRealPath("/image")+"/"+myFile.getOriginalFilename();
        if(myFile.getOriginalFilename()!=null&&myFile.getOriginalFilename()!="") {
            String MyFile = "image/" + myFile.getOriginalFilename();
           show.setShowicon(MyFile);
        }

        File target = new File(path);
        OutputStream out=null;

        try {
            out = new FileOutputStream(target);

            try {
                IOUtils.copy(myFile.getInputStream(), out);

            } catch (IOException e) {
                e.printStackTrace();
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }finally {
            try {
                out.close();

            } catch (IOException e) {

            }

        }

        Map map=new HashMap();
        map.put("show",show);
       showMapper.addshow(map);
    }

    @Override
    public Show viewShow(int id) {
        return showMapper.viewShow(id);
    }

    @Override
    public void updateShow(Show show, MultipartFile myFile) {
        HttpServletRequest request =   ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
        HttpSession session=request.getSession();
        ActiveManage activeManage= (ActiveManage) session.getAttribute("activeUser");
        show.setShowperson(activeManage.getManageacc());

        String path=request.getServletContext().getRealPath("/image")+"/"+myFile.getOriginalFilename();
        System.out.println(path);
        if(myFile.getOriginalFilename()!=null&&myFile.getOriginalFilename()!="") {
            String MyFile = "image/" + myFile.getOriginalFilename();
            show.setShowicon(MyFile);
        }

        File target = new File(path);
        OutputStream out=null;

        try {
            out = new FileOutputStream(target);

            try {
                IOUtils.copy(myFile.getInputStream(), out);

            } catch (IOException e) {
                e.printStackTrace();
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }finally {
            try {
                out.close();

            } catch (IOException e) {

            }

        }

        Map map=new HashMap();
        map.put("show",show);;
        showMapper.updateShow(map);
    }

    @Override
    public void updateShowUpStatus(int id, int shelf) {
        Map map=new HashMap();
        map.put("id",id);
        System.out.println(shelf+"====+++++++++=");
        if(shelf==1){
            map.put("shelf",0);
            map.put("recommend",0);
        }else if(shelf==0){
            map.put("shelf",1);
        }
        showMapper.updateShowUpStatus(map);
    }

    @Override
    public void updateShowTStatus(int id, int recommend) {
        System.out.println(recommend+"===========");
        Map map=new HashMap();
        map.put("id",id);
        if(recommend==1){
            map.put("recommend",0);
        }else{
            map.put("recommend",1);
        }
        showMapper.updateShowTStatus(map);
    }

    @Override
    public void updateShowDelStatus(int id, int status) {
        Map map=new HashMap();
        map.put("id",id);
            map.put("status",1);
        showMapper.updateShowDelStatus(map);
    }

    @Override
    public void updateShowAuditstatus(String userName,int id) {
        Map map=new HashMap();
        map.put("userName",userName);
        map.put("id",id);
        showMapper.updateShowAuditstatus(map);
    }

    @Override
    public void NoupdateShowAuditstatus(String userName, int id) {
        Map map=new HashMap();
        map.put("userName",userName);
        map.put("id",id);
        showMapper.NoupdateShowAuditstatus(map);
    }
    /*前台首页查询一个最新的演出*/

    @Override
    public List<Show> fontSelectShow() {
        return showMapper.fontSelectShow();
    }

}

