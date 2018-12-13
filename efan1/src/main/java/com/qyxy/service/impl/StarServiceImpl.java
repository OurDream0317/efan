package com.qyxy.service.impl;

import com.alibaba.fastjson.JSON;
import com.qyxy.domain.Star;
import com.qyxy.mapper.StarMapper;
import com.qyxy.service.StarService;
import org.apache.commons.io.IOUtils;
import org.springframework.http.server.PathContainer;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.*;

import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by Administrator on 2018/9/4 0004.
 */
@Service(value = "starService")
public class StarServiceImpl implements StarService{
    @Resource
    private StarMapper starMapper;
    @Override
    public void addStarDemo(String starname, String starintroduce, MultipartFile file1, MultipartFile file2) {
        System.out.println(file1);
        HttpServletRequest request =   ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        String path=request.getServletContext().getRealPath("/image")+"/"+file1.getOriginalFilename();
        String path1=request.getServletContext().getRealPath("/image")+"/"+file2.getOriginalFilename();
        String MyFile="";
        String MyFile1="";
        if(file1.getOriginalFilename()!=null&&file1.getOriginalFilename()!="") {
           MyFile = "image/" + file1.getOriginalFilename();

        }
        if(file2.getOriginalFilename()!=null&&file2.getOriginalFilename()!="") {
             MyFile1 = "image/" + file2.getOriginalFilename();
        }
        // shop.setShopPacking();

        File target = new File(path);
        File target1 = new File(path1);
        OutputStream out=null;
        OutputStream out1=null;
        try {
            out = new FileOutputStream(target);
            out1 = new FileOutputStream(target1);
            try {
                IOUtils.copy(file1.getInputStream(), out);
                IOUtils.copy(file2.getInputStream(), out1);

            } catch (IOException e) {
                e.printStackTrace();
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }finally {
            try {
                out.close();
                out1.close();
            } catch (IOException e) {

            }

        }
        Date currentTime = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String addTime= formatter.format(currentTime);
        System.out.println(addTime+"==============");
        starMapper.addStarDemo(starname, starintroduce,addTime, MyFile, MyFile1);
    }

    @Override
    public List<Star> viewStar(int currentPage, int count) {
       List<Star> list= starMapper.viewStar(currentPage,count);
        return list;
    }

    @Override
    public void updateUpStatus(int id) {
        starMapper.updateUpStatus(id);
    }

    @Override
    public void NoupdateUpStatus(int id) {
        starMapper.NoupdateUpStatus(id);
    }

    @Override
    public void updateDelStatus(int id) {
        starMapper.updateDelStatus(id);
    }

    @Override
    public Star viewStarDemo(int id) {
        Star star=starMapper.viewStarDemo(id);
        return star;
    }

    @Override
    public void editStarDemo(Star star, MultipartFile file1, MultipartFile file2) {
        HttpServletRequest request =   ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        String path=request.getServletContext().getRealPath("/image")+"/"+file1.getOriginalFilename();
        String path1=request.getServletContext().getRealPath("/image")+"/"+file2.getOriginalFilename();
        String MyFile="";
        String MyFile1="";
        if(file1.getOriginalFilename()!=null&&file1.getOriginalFilename()!="") {
            MyFile = "image/" + file1.getOriginalFilename();
            star.setStaricom(MyFile);
        }
        if(file2.getOriginalFilename()!=null&&file2.getOriginalFilename()!="") {
            MyFile1 = "image/" + file2.getOriginalFilename();
            star.setStarimg(MyFile1);
        }
        // shop.setShopPacking();

        File target = new File(path);
        File target1 = new File(path1);
        OutputStream out=null;
        OutputStream out1=null;
        try {
            out = new FileOutputStream(target);
            out1 = new FileOutputStream(target1);
            try {
                IOUtils.copy(file1.getInputStream(), out);
                IOUtils.copy(file2.getInputStream(), out1);
            } catch (IOException e) {
                e.printStackTrace();
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }finally {
            try {
                out.close();
                out1.close();
            } catch (IOException e) {

            }

        }
        Map map=new HashMap();
        map.put("star",star);
        starMapper.editStarDemo(map);
    }

    @Override
    public List<Star> selectStar(String starname, String content, int upStatus, int sort, int currentPage, int count) {
        System.out.println(content);
        Map map=new HashMap();
         if(content==null||content.equals("")){
             starname="";
             map.put("starname",starname);
         }
         if (content!=null){
            map.put("starname",starname);

            map.put("content","%"+content+"%");
        }

        map.put("upStatus",upStatus);
        map.put("sort",sort);

        map.put("currentPage",currentPage);
        map.put("count",count);
        System.out.println(JSON.toJSONString(map));
        List list=starMapper.selectStar(map);
        return list;
    }

    @Override
    public List<Star> fontselecthot() {
        return starMapper.fontselecthot();
    }

    @Override
    public void deleteAll(String ids) {
       String[] arr=ids.split(",");
        for(int i=0;i<arr.length;i++){
            int dept=Integer.parseInt(arr[i]);
            System.out.println(dept);
            starMapper.deleteAll(dept);
        }
    }
}
