package com.qyxy.mapper;

import com.qyxy.domain.OrderMain;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;
@Repository
public interface OrderMainMapper {
    //多条件分页查询 返回页面需要的字段
    public List<OrderMain> selectAll( );
    public List<OrderMain> selectOrdernoteAll(Map map);
    //查看订单详情，通过订单编号，查询订单信息
    public  List<OrderMain> selsectOrderByNumber(@Param("ordernumber")int ordernumber);

    //多条件分页查询 返回页面需要的字段商品订单
    public List<OrderMain> selectOrderProductroAll(Map map);
    //查看订单详情，通过订单编号，查询订单信息商品订单详情
    public  List<OrderMain> selsectProductByOrdernumber(@Param("ordernumber")int ordernumber);

    //通过订单编号修改订单状态，
    public void updateOrderStatus(Map map);
    //多条件分页查询 返回页面需要的字段
    public List<OrderMain> selectOrdernoteAll2(Map map);

    public List<OrderMain> selectDemo(@Param("status") int status);
    public void updateStatus(@Param("ordernumber") int ordernumber);

    //查询当前的序列返回service层作为订单编号
    public Integer findmaxid();

    //插入订单的订单
    public void insertOrder(@Param("ordernumber") Integer ordernumber,@Param("text") String text, @Param("username") String username, @Param("userid") String userid, @Param("userphone") String userphone, @Param("address") String address);
}