package com.qyxy.controller;

import com.alibaba.fastjson.JSON;
import com.qyxy.domain.OrderDatail;
import com.qyxy.domain.OrderDemo;
import com.qyxy.domain.OrderMain;
import com.qyxy.service.OrderService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by Administrator on 2018/9/4 0004.
 */
@Controller
@RequestMapping("/order")
public class OrderController {
    @Resource
    private OrderService orderService;
    @RequestMapping("/my")
    public String my(){
        return "../../MySelf";
    }
    @RequestMapping("/first")
    public String first(){
        return "viewOrder";
    }
    @RequestMapping("/updatestatus")
    @ResponseBody
    public void  updatestatus(int ordernumber){
        //先修改物流信息，在修改，发货状态
        orderService.updateStatus(ordernumber);

    }

    @RequestMapping("/selectDemo")
  @ResponseBody
  public String select4(int status){
      List<OrderMain> list=orderService.selectDemo(status);
      List<OrderDemo> list1=new ArrayList<>();
      System.out.println(JSON.toJSONString(list));
      for(OrderMain ordermain:list){
          OrderDemo order=new OrderDemo();
          order.setOrdernumber(ordermain.getOrdernumber());
          order.setOrderstatus(ordermain.getOrderstatus());
          order.setBaynumber(ordermain.getOrderDatailList().get(0).getBuynumber());
          order.setOrderprice(ordermain.getOrderDatailList().get(0).getPrice());
          order.setShowtitle(ordermain.getOrderDatailList().get(0).getShowList().get(0).getShowtitle());
          order.setShowttime(ordermain.getOrderDatailList().get(0).getShowList().get(0).getShowtime());
          order.setShowadress(ordermain.getOrderDatailList().get(0).getShowList().get(0).getShowaddress());
          order.setShowicon(ordermain.getOrderDatailList().get(0).getShowList().get(0).getShowicon());
          order.setShowmoney(ordermain.getOrderDatailList().get(0).getOrderprice());
          list1.add(order);
      }
        return JSON.toJSONString(list1);
    }

    @RequestMapping("/selectAll")
@ResponseBody
    public String selectAll( HttpSession session){
       List<OrderMain> list=orderService.selectAll();
       List<OrderDemo> list1=new ArrayList<>();
       int i=0;
        System.out.println(JSON.toJSONString(list));
        for(OrderMain ordermain:list){
            OrderDemo order=new OrderDemo();
            order.setOrdernumber(ordermain.getOrdernumber());
            order.setOrderstatus(ordermain.getOrderstatus());
            order.setBaynumber(ordermain.getOrderDatailList().get(0).getBuynumber());
            order.setOrderprice(ordermain.getOrderDatailList().get(0).getPrice());
            order.setShowtitle(ordermain.getOrderDatailList().get(0).getShowList().get(0).getShowtitle());
            order.setShowttime(ordermain.getOrderDatailList().get(0).getShowList().get(0).getShowtime());
            order.setShowadress(ordermain.getOrderDatailList().get(0).getShowList().get(0).getShowaddress());
             order.setShowicon(ordermain.getOrderDatailList().get(0).getShowList().get(0).getShowicon());
            order.setShowmoney(ordermain.getOrderDatailList().get(0).getOrderprice());
            list1.add(order);
        }

        return  JSON.toJSONString(list1);
    }

    /*跳转到票务订单页面*/
    @RequestMapping("/ordernote")
    public String changordernote(){
        return "order/ordernote";
    }

    /*票务订单查询，从前端传过来demo,input,orderstatus,currentpage,count,managestatus,manageacc
    * 先通过管理员状态判断登录的人是管理员还是黄牛端，黄牛的status状态是2
    * 如果是黄牛，就只能查询这个黄牛发布的演出的票的订单，先通过演出的发布方即黄牛的账号查找演出id 通过演出id查找订单详情表，返回订单的信息
    * 如果是平台的话，查询所有的订单
    *
    * */

    /*票务订单多条件查询*/
    @RequestMapping("/selectordernotAll")
    @ResponseBody
    public String selectOrdernoteAll(int demo,String input,int orderstatus,String manageacc,int managestatus,int currentpage,int count){
        //1先判断managestatus是否是黄牛端
        System.out.println(manageacc+"==========="+managestatus);
        if(managestatus==2){//黄牛端需要通过账号查询
            List<OrderMain> obj=orderService.selectOrdernoteAll2(demo,input,orderstatus,manageacc,managestatus,currentpage,count);
            System.out.println(JSON.toJSONString(obj));
            return JSON.toJSONString(obj);
        }

//多条件分页查询，1.判断传过来的demo是什么类型
        //创建一个map
       Map map=new HashMap();

        if (demo==0&&input!=null&&input!=""){
            map.put("ordernumber",input);
            map.put("username","");
            map.put("usernumber","");
            map.put("showtitle","");
            map.put("showperson","");
        }else if(demo==1&&input!=null&&input!=""){
            map.put("username",input);
            map.put("ordernumber","");
            map.put("usernumber","");
            map.put("showtitle","");
            map.put("showperson","");
        }else if(demo==2&&input!=null&&input!=""){
            map.put("usernumber",input);
            map.put("ordernumber","");
            map.put("username","");
            map.put("showtitle","");
            map.put("showperson","");
        }else if(demo==3&&input!=null&&input!=""){
            map.put("showtitle",input);
            map.put("ordernumber","");
            map.put("username","");
            map.put("usernumber","");
            map.put("showperson","");
        }else if(demo==4&&input!=null&&input!=""){
            map.put("showperson",input);
            map.put("ordernumber","");
            map.put("username","");
            map.put("usernumber","");
            map.put("showtitle","");
        }else {
            map.put("ordernumber","");
            map.put("username","");
            map.put("usernumber","");
            map.put("showtitle","");
            map.put("showperson","");
        }
        map.put("orderstatus",orderstatus);
        Integer startRow=(currentpage-1)*count+1;
        Integer endRow=currentpage*count;
        map.put("startRow",startRow);
        map.put("endRow",endRow);
        //将多条件保存到map中，传给service查询
       List<OrderMain> obj=orderService.selectOrdernoteAll(map);

        System.out.println(JSON.toJSONString(obj));
        return JSON.toJSONString(obj);
    }


    /*跳转到票务订单详情页面*/
    @RequestMapping("/orderdetail")
    public ModelAndView selectorderdetail(int ordernumber){
        //查看订单详情页面，通过订单编号获取订单信息
        List<OrderMain> orderMainList=orderService.selsectOrderByNumber(ordernumber);
       OrderDatail order=  orderMainList.get(0).getOrderDatailList().get(0);
        String time1="";
        String time2="";
        SimpleDateFormat sdf1=new SimpleDateFormat("EEE MMM dd HH:mm:ss z yyyy", Locale.ENGLISH);
        SimpleDateFormat sdf2=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.ENGLISH);
        try{
            time1=sdf2.format(sdf1.parse(order.getCommittime().toString()));
            time2=sdf2.format(sdf1.parse(order.getBuytime().toString()));
        }catch (ParseException e){
            e.printStackTrace();
        }

        String orderMain1=JSON.toJSONString(orderMainList);
        System.out.println(orderMain1);
        ModelAndView mv=new ModelAndView("order/orderdetail");
        mv.addObject("orderMain",orderMainList);
        mv.addObject("committime",time1);
        mv.addObject("buytime",time2);
        return mv;
    }

    /*跳转到商品订单页面*/
    @RequestMapping("/orderproduct")
    public String changorderproduct(){
        return "order/orderproduct";
    }

    /*商品订单多条件查询*/
    @RequestMapping("/selectorderproductAll")
    @ResponseBody
    public String selectOrderProductroAll(int demo,String input,int orderstatus,int currentpage,int count){
//多条件分页查询，1.判断传过来的demo是什么类型
        //创建一个map
        Map map=new HashMap();

        if (demo==0&&input!=null&&input!=""){
            map.put("ordernumber",input);
            map.put("username","");
            map.put("usernumber","");
            map.put("showtitle","");
            map.put("showperson","");
        }else if(demo==1&&input!=null&&input!=""){
            map.put("username",input);
            map.put("ordernumber","");
            map.put("usernumber","");
            map.put("showtitle","");
            map.put("showperson","");
        }else if(demo==2&&input!=null&&input!=""){
            map.put("usernumber",input);
            map.put("ordernumber","");
            map.put("username","");
            map.put("showtitle","");
            map.put("showperson","");
        }else if(demo==3&&input!=null&&input!=""){
            map.put("showtitle",input);
            map.put("ordernumber","");
            map.put("username","");
            map.put("usernumber","");
            map.put("showperson","");
        }else if(demo==4&&input!=null&&input!=""){
            map.put("showperson",input);
            map.put("ordernumber","");
            map.put("username","");
            map.put("usernumber","");
            map.put("showtitle","");
        }else {
            map.put("ordernumber","");
            map.put("username","");
            map.put("usernumber","");
            map.put("showtitle","");
            map.put("showperson","");
        }
        map.put("orderstatus",orderstatus);
        Integer startRow=(currentpage-1)*count+1;
        Integer endRow=currentpage*count;
        map.put("startRow",startRow);
        map.put("endRow",endRow);
        //将多条件保存到map中，传给service查询
        List<OrderMain> obj=orderService.selectOrderProductroAll(map);

        System.out.println(JSON.toJSONString(obj));
        return JSON.toJSONString(obj);
    }


    /*跳转到商品订单详情页面*/
    @RequestMapping("/productorderdetail")
    public ModelAndView selsectProductByOrdernumber(int ordernumber){
        //查看订单详情页面，通过订单编号获取订单信息
        List<OrderMain> orderMainList=orderService.selsectProductByOrdernumber(ordernumber);

        OrderDatail order=  orderMainList.get(0).getOrderDatailList().get(0);
        String time1="";
        String time2="";
        SimpleDateFormat sdf1=new SimpleDateFormat("EEE MMM dd HH:mm:ss z yyyy", Locale.ENGLISH);
        SimpleDateFormat sdf2=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.ENGLISH);
        try{
            time1=sdf2.format(sdf1.parse(order.getCommittime().toString()));
            time2=sdf2.format(sdf1.parse(order.getBuytime().toString()));
        }catch (ParseException e){
            e.printStackTrace();
        }


        String orderMain1=JSON.toJSONString(orderMainList);
        System.out.println(orderMain1);
        ModelAndView mv=new ModelAndView("order/orderproductdetail");
        mv.addObject("orderMain",orderMainList);
        mv.addObject("committime",time1);
        mv.addObject("buytime",time2);
        return mv;
    }

    /*票务订单修改发货状态的方法,将物流信息保存到数据库*/
    @RequestMapping("/updatenotestatus")
    public String updateorderstatus(int ordernumber,String express,String expressnumber){
        //先修改物流信息，在修改，发货状态
        Map map=new HashMap();
        map.put("ordernumber",ordernumber);
        map.put("express",express);
        map.put("expressnumber",expressnumber);
        map.put("orderstatus",3);
       orderService.updateOrderStatus(map);

        return "redirect:ordernote";
    }

    /*商品订单修改发货状态的方法*/
    @RequestMapping("/updateproductstatus")
    public String updateproductorderstatus(int ordernumber,String express,String expressnumber){
        //先修改物流信息，在修改，发货状态
        Map map=new HashMap();
        map.put("ordernumber",ordernumber);
        map.put("express",express);
        map.put("expressnumber",expressnumber);
        map.put("orderstatus",3);
        orderService.updateOrderStatus(map);
        return "redirect:orderproduct";
    }



 /*   *//*中强大神操作，请勿改动，具体电联15239925930*//*
    订单的增加，新增订单*/
    @RequestMapping("/neworder")
    public String addorder(String proname,Integer price,Integer buynumber,String userid,String username,String userphone,String address,String text,String productid){

        System.out.println(proname+price+buynumber+userid+username+userphone+address+text+"===============");
        Integer ordernumber=orderService.insertOrder(text,username,userid,userphone,address);
        Date currenttime=new Date(System.currentTimeMillis());
      /*  Date date =new Date(System.currentTimeMillis());
        String currenttime= String.valueOf(time);*/
        Integer orderprice=price*buynumber;
        orderService.insertMain(ordernumber,productid,currenttime,buynumber,price,orderprice);

        return "redirect:../BUY.jsp";
    }

    //修改订单的状态



}
