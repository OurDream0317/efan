package com.qyxy.service;

import com.qyxy.domain.OrderMain;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2018/9/4 0004.
 */
public interface OrderService {
        //多条件分页查询 返回页面需要的字段
        public List<OrderMain> selectAll();
        public List<OrderMain> selectOrdernoteAll(Map map);
        //票务订单详情查询
        public  List<OrderMain> selsectOrderByNumber(int ordernumber);

        //多条件分页查询 返回页面需要的字段商品订单
        public List<OrderMain> selectOrderProductroAll(Map map);
        //查看订单详情，通过订单编号，查询订单信息商品订单详情
        public  List<OrderMain> selsectProductByOrdernumber(int ordernumber);

        //通过订单编号修改订单状态，
        public void updateOrderStatus(Map map);
        //黄牛端多条件分页查询 返回页面需要的字段
        public List<OrderMain> selectOrdernoteAll2(int demo,String input,int orderstatus,String manageacc,int managestatus,int currentpage,int count);

        public List<OrderMain> selectDemo(int status);
        public void updateStatus(int ordernumber);

        //插入订单的订单
        public Integer insertOrder(String productid,String username,String userid,String userphone,String address);

        //插入订单的详情
        public void insertMain(Integer ordernumber, String productid, Date currenttime, Integer buynumber, Integer price, Integer orderprice);




}
