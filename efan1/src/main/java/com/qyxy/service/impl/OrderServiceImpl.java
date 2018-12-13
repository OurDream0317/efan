package com.qyxy.service.impl;

import com.mysql.fabric.xmlrpc.base.Data;
import com.qyxy.domain.OrderDatail;
import com.qyxy.domain.OrderMain;
import com.qyxy.mapper.OrderDatailMapper;
import com.qyxy.mapper.OrderMainMapper;
import com.qyxy.service.OrderService;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2018/9/5 0005.
 */
@Service(value = "orderService")
public class OrderServiceImpl implements OrderService{
    @Resource
    private OrderMainMapper orderMainMapper;

    @Resource
    private OrderDatailMapper orderDatailMapper;

    @Override
    public List<OrderMain> selectAll() {

        return orderMainMapper.selectAll();
    }

    @Override
    public List<OrderMain> selectOrdernoteAll(Map map) {
        return orderMainMapper.selectOrdernoteAll(map);
    }

    @Override
    public List<OrderMain> selsectOrderByNumber(int ordernumber) {
        return orderMainMapper.selsectOrderByNumber(ordernumber);
    }

    @Override
    public List<OrderMain> selectOrderProductroAll(Map map) {
        return orderMainMapper.selectOrderProductroAll(map);
    }

    @Override
    public List<OrderMain> selsectProductByOrdernumber(int ordernumber) {
        return orderMainMapper.selsectProductByOrdernumber(ordernumber);
    }

    @Override
    public void updateOrderStatus(Map map) {
        orderMainMapper.updateOrderStatus(map);

    }

    @Override
    public List<OrderMain> selectOrdernoteAll2(int demo, String input, int orderstatus, String manageacc, int managestatus, int currentpage, int count) {
        Map map=new HashMap();
        if (demo==0&&input!=null&&input!=""){
            map.put("ordernumber",input);
            map.put("username","");
            map.put("usernumber","");
            map.put("showtitle","");
        }else if(demo==1&&input!=null&&input!=""){
            map.put("username",input);
            map.put("ordernumber","");
            map.put("usernumber","");
            map.put("showtitle","");
        }else if(demo==2&&input!=null&&input!=""){
            map.put("usernumber",input);
            map.put("ordernumber","");
            map.put("username","");
            map.put("showtitle","");
        }else if(demo==3&&input!=null&&input!=""){
            map.put("showtitle",input);
            map.put("ordernumber","");
            map.put("username","");
            map.put("usernumber","");
        }else {
            map.put("ordernumber","");
            map.put("username","");
            map.put("usernumber","");
            map.put("showtitle","");

        }
        map.put("orderstatus",orderstatus);
        Integer startRow=(currentpage-1)*count+1;
        Integer endRow=currentpage*count;
        map.put("startRow",startRow);
        map.put("endRow",endRow);
        map.put("showperson",manageacc);


        return orderMainMapper.selectOrdernoteAll2(map);
    }

    @Override
    public List<OrderMain> selectDemo(int status) {
        return orderMainMapper.selectDemo(status);
    }

    @Override
    public void updateStatus(int ordernumber) {
        orderMainMapper.updateStatus(ordernumber);
    }


    //插入订单
    @Override
    public Integer insertOrder(String productid, String username, String userid, String userphone, String address) {
        //查询当前的序列返回service层作为订单编号
        Integer ordernumber=orderMainMapper.findmaxid();
        System.out.println(ordernumber);
        orderMainMapper.insertOrder(ordernumber,productid,username,userid,userphone,address);
        return ordernumber;
    }

    @Override
    public void insertMain(Integer ordernumber, String productid, Date currenttime, Integer buynumber, Integer price, Integer orderprice) {
        orderDatailMapper.insertMain(ordernumber,productid,currenttime,buynumber,price,orderprice);
    }

}
