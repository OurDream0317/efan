package com.qyxy.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.util.IdentityHashMap;
import com.qyxy.domain.*;
import com.qyxy.mapper.StarMapper;
import com.qyxy.service.CommentService;
import com.qyxy.service.NewsService;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * Created by Administrator on 2018/9/5 0005.
 */
@Controller
@RequestMapping("/news")
public class NewsController {
    @Resource
    private StarMapper starMapper;
    @Resource
    private NewsService newsService;
    @Resource
    private CommentService commentService;

    @RequestMapping("/first")
    public String first(){
        return "News";
    }
    @RequestMapping("/addNews")
    public String addNews(HttpSession session){
        List<Star> list=starMapper.selectAll();
        session.setAttribute("AllStarlist",list);
        return "addNews";
    }
    @RequestMapping("/addNewsDemo")
    public String addNewsDemo(News news, MultipartFile file,MultipartFile[] file1){
               if(file1.length>0){
                   newsService.addNews(news, file,file1);
                   return "News";
               }
            newsService.addNews1(news, file);
        return "News";
    }

    @RequestMapping("/findNewsAll")
    @ResponseBody
    public String  findNewsAll(int currentPage,int count){
        System.out.println("----------------"+"findNewsAll");
          List list= newsService.findNewsAllDemo(currentPage,count);
        return JSON.toJSONString(list);
    }
    @RequestMapping("/findNewsAllDemo")
    @ResponseBody
    public String  findNewsAllDemo(String demo,String content,int  upStatus,int tStatus,int currentPage,int count){
        System.out.println(currentPage+"============="+count);
        List list= newsService.findNewsAll(demo,content,upStatus,tStatus,currentPage,count);
        return JSON.toJSONString(list);
    }
    @RequestMapping("/viewNews")
    public String viewNews(int newsid,HttpSession session){
        System.out.println(newsid+"================");
       News news= newsService.findNews(newsid);
        session.setAttribute("news",news);
        return "viewNews";
    }
    @RequestMapping("/updateUpStatus")
    public String updateUpStatus(int newsid,int newsshelf){
        newsService.updateUpstatus(newsid,newsshelf);
        return "News";
    }
    @RequestMapping("/updateDelStatus")
    public String updateDelStatus(int newsid){
        newsService.updateDelStatus(newsid);
        return "News";
    }
    @RequestMapping("/updateTStatus")
    public String updateTStatus(int newsid,int newsrecomment){
        newsService.updateTStatus(newsid,newsrecomment);
        return "News";
    }


    @RequestMapping("/see")
    @ResponseBody
    public String  see(int id){
        List<Comment> list=newsService.see(id);
       List<NewComment> list1=new ArrayList<>();
        for(Comment comment:list){
            NewComment newComment=new NewComment();
            newComment.setCommentid(comment.getCommentid());
            newComment.setCommentimg(comment.getUser1().getUsericon());
            newComment.setPhone(comment.getUser1().getUserphone());
            newComment.setNikename(comment.getUser1().getNickname());
            newComment.setCommentcontent(comment.getCommentcontent());
            newComment.setReplys(comment.getReplys());
            newComment.setCommenttime(comment.getCommenttime());
            list1.add(newComment);
        }
/*        System.out.println(JSON.toJSONString(list));
System.out.println(JSON.toJSONString(list1));*/
        return JSON.toJSONString(list1);
    }

    /*前端页面展示新闻，从数据库中查询最新的3条数据*/
    @RequestMapping("/fontselectnews")
    @ResponseBody
    public String fontSelectNews(String newsnumber){
        //如果是前台首页，返回4条新闻
        if(newsnumber.equals("1")){
            List<News> newsList=newsService.fontSelectNews();
        String news=JSON.toJSONString(newsList);
        return news;
        }else {
            //如果不是前台首页，就是新闻页的请求，返回说有上架的请求
            List<News> newsList=newsService.fontSelectNews1();
            String news=JSON.toJSONString(newsList);
            return news;
        }

    }

    //前台查询新闻详情，通过新闻id查询，包括这条新闻的评论
    @RequestMapping("/fontselectnewsbyid")
    public String fontSelectNewsbyid(Integer newsid,HttpSession session){
        //多表关联查询，返回一个对象
        News news= newsService.findNews(newsid);
        session.setAttribute("news",news);
        //调用阅读量加1的方法增加阅读量
        newsService.fontaddclicknumber(newsid,1);
        return "../../Newsdetails";
    }

    //一个方法增加点击量
    @RequestMapping("/fontaddclicknumber")
    public void fontaddclicknumber(Integer newsid,Integer a){
        //先判断下需要增加或减少的是哪个，阅读量 （1代表阅读量加1,），
        // 还是点赞量（2代表点赞量加1，-2代表点赞量减1），还是评论量(3代表评论量加1)
        newsService.fontaddclicknumber(newsid,a);
    }
    //新闻新增评论，方法中调用新闻评论量加一
    //接收的数据有，评论的内容，评论人id,关联商品的id(新闻)
    @RequestMapping("/fontaddcomment")
    public void fontaddComment(String commentcontent, Integer newsid, Integer commentuserid){
        //调用函数，是评论量加1
        newsService.fontaddclicknumber(newsid,3);

        //将评论数据发送给评论的service；
        System.out.println(commentcontent+"-----"+newsid+"----"+commentuserid);
        //新增评论的方法 评论内容，评论人id 评论关联的上商品或新闻id  评论的类型，商品订单0， 话题1，新闻2
        commentService.addComment(commentcontent,commentuserid,newsid,2);


    }


}
