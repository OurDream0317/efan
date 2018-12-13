package com.qyxy.mapper;

import com.qyxy.domain.OrderDatail;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;

@Repository
public interface OrderDatailMapper {
    //插入订单的详情
    public void insertMain(@Param("ordernumber") Integer ordernumber, @Param("productid") String productid, @Param("currenttime") Date currenttime, @Param("buynumber") Integer buynumber, @Param("price") Integer price, @Param("orderprice") Integer orderprice);


}