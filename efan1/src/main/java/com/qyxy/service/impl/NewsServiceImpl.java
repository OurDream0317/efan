package com.qyxy.service.impl;

import com.alibaba.fastjson.JSON;
import com.qyxy.domain.News;
import com.qyxy.domain.User1;
import com.qyxy.mapper.CommentMapper;
import com.qyxy.mapper.NewsMapper;
import com.qyxy.service.NewsService;
import com.qyxy.util.UpFile;
import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2018/9/6 0006.
 */
@Service(value = "newsService")
public class NewsServiceImpl implements NewsService{
    @Resource
    private NewsMapper newsMapper;
    @Resource
    private  CommentMapper commentMapper;

    @Override
    public void addNews(News news, MultipartFile file,MultipartFile[] file1) {
        HttpServletRequest request =   ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        HttpSession session=request.getSession();
        String path=request.getServletContext().getRealPath("/image")+"/"+file.getOriginalFilename();
        String MyFile="";
        if(file.getOriginalFilename()!=null&&file.getOriginalFilename()!="") {
            MyFile = "image/" + file.getOriginalFilename();
            news.setNewsimg(MyFile);
        }
        // shop.setShopPacking();

        File target = new File(path);
        OutputStream out=null;
        try {
            out = new FileOutputStream(target);
            try {
                IOUtils.copy(file.getInputStream(), out);
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
        Date currentTime = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String addTime= formatter.format(currentTime);
        news.setNewstime(addTime);
        Map map=new HashMap();
        UpFile upFile=new UpFile();
        String string=",";
        String str="";
        for(int i=0;i<file1.length;i++){
            upFile.addNewsDemo(file1[i]);
            str=str+file1[i].getOriginalFilename()+string;
            System.out.println(file1[i].getOriginalFilename());
        }
        str=str.substring(0,str.length()-1);
        System.out.println(str);
        map.put("news",news);
        map.put("string",str);
    newsMapper.addNews(map);
    }

    @Override
    public void addNews1(News news, MultipartFile file) {
        HttpServletRequest request =   ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        String path=request.getServletContext().getRealPath("/image")+"/"+file.getOriginalFilename();

        String MyFile="";

        if(file.getOriginalFilename()!=null&&file.getOriginalFilename()!="") {
            MyFile = "image/" + file.getOriginalFilename();
            news.setNewsimg(MyFile);
        }

        // shop.setShopPacking();

        File target = new File(path);

        OutputStream out=null;

        try {
            out = new FileOutputStream(target);

            try {
                IOUtils.copy(file.getInputStream(), out);

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
        Date currentTime = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String addTime= formatter.format(currentTime);
        news.setNewstime(addTime);
        Map map=new HashMap();
        map.put("news",news);
        newsMapper.addNewsdemo(map);
    }

    @Override
    public List<News> findNewsAll(String demo, String content, int upStatus, int tStatus, int currentPage, int count) {
        int starRow=(currentPage-1)*count+1;
        int endRow=currentPage*count;
        Map map=new HashMap();
        if(content.length()>0&&content!=null){
            map.put("content","%"+content+"%");
            if(demo.equals("新闻编号")){
            map.put("newsid",demo);}
            if(demo.equals("新闻标题")){
                map.put("newstitle",demo);}
        }else{
            map.put("newsid","");
            map.put("newstitle","");
        }
        map.put("tStatus",tStatus);
        map.put("upStatus",upStatus);
        map.put("starRow",starRow);
        map.put("endRow",endRow);
        List<News> list=newsMapper.findNewsAll(map);
        return list;
    }

    @Override
    public List<News> findNewsAllDemo(int currentPage, int count) {
        int starRow=(currentPage-1)*count+1;
        int endRow=currentPage*count;
        List<News> list=newsMapper.findNewsAllDemo(starRow,endRow);
        return list;
    }

    @Override
    public News findNews(int newsid) {
      return   newsMapper.findNews(newsid);
    }

    @Override
    public void updateUpstatus(int newsid, int newsshelf) {
        newsMapper.updateUpStatus(newsid,newsshelf);
    }

    @Override
    public void updateDelStatus(int newsid) {
        newsMapper.updateDelStatus(newsid);
    }

    @Override
    public void updateTStatus(int newsid,int newsrecomment) {
        newsMapper.updateTStatus(newsid,newsrecomment);
    }

    @Override
    public List see(int id) {
        System.out.println(id+"===================");
        List list=commentMapper.see(id);

        return list;
    }
    //前台首页页面请求新闻数据，以最新时间查找
    @Override
    public List<News> fontSelectNews() {
        return newsMapper.fontSelectNews();
    }
    //前台新闻页面请求新闻数据，以最新时间查找
    @Override
    public List<News> fontSelectNews1() {
        return newsMapper.fontSelectNews1();
    }

    @Override
    public void fontaddclicknumber(Integer newsid,Integer a) {// Integer clicknumber
        //先判断下需要增加或减少的是哪个，阅读量 （1代表阅读量加1,），
        // 还是点赞量（2代表点赞量加1，-2代表点赞量减1），还是评论量(3代表评论量加1)
        int readnumber=0;
        int clicknumber=0;
        int commentnumber = 0;

        //1.先查询点击量有多少
        News news=newsMapper.findNews(newsid);
        if(a==1){
            //代表阅读量加一
             readnumber=news.getReadnumber();
            readnumber=readnumber+1;
            //保存到数据库
            newsMapper.fontaddclicknumber(newsid,clicknumber,readnumber,commentnumber);

        }else if(a==2){
            //2.将点赞量取出来，
             clicknumber= news.getClicknumber();

            //将点赞量加1，保存
            clicknumber =clicknumber+1;
            //保存到数据库
           newsMapper.fontaddclicknumber(newsid,clicknumber,readnumber,commentnumber);
        }else if(a==-2){
            //2.将点赞量取出来，
           clicknumber= news.getClicknumber();

            //将点赞量加1，保存
            clicknumber =clicknumber-1;
            //保存到数据库
            newsMapper.fontaddclicknumber(newsid, clicknumber,readnumber,commentnumber);
        }else if(a==3){
            //1.代表评论量加1
            commentnumber=news.getCommentnumber();
            commentnumber+=1;
            //保存到数据库
            newsMapper.fontaddclicknumber(newsid, clicknumber,readnumber,commentnumber);
        }




    }


}
