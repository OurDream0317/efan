package com.qyxy.domain;

import java.util.Date;
import java.util.List;

public class OrderDatail {

    private Integer orderid;
    private Integer ordernumber;
    private Integer productid;
    private Date committime;
    private Date buytime;
    private Integer buynumber;
    private Integer price;
    private Integer ordertype;
    private Integer orderprice;//商品的总价

    private List<Show> showList;

    private List<Product> productList;

    public List<Product> getProductList() {
        return productList;
    }

    public void setProductList(List<Product> productList) {
        this.productList = productList;
    }

    public Integer getOrderprice() {
        return orderprice;
    }

    public void setOrderprice(Integer orderprice) {
        this.orderprice = orderprice;
    }

    public List<Show> getShowList() {
        return showList;
    }

    public void setShowList(List<Show> showList) {
        this.showList = showList;
    }

    public Integer getOrderid() {
        return orderid;
    }

    public void setOrderid(Integer orderid) {
        this.orderid = orderid;
    }

    public Integer getOrdernumber() {
        return ordernumber;
    }

    public void setOrdernumber(Integer ordernumber) {
        this.ordernumber = ordernumber;
    }

    public Integer getProductid() {
        return productid;
    }

    public void setProductid(Integer productid) {
        this.productid = productid;
    }

    public Date getCommittime() {
        return committime;
    }

    public void setCommittime(Date committime) {
        this.committime = committime;
    }

    public Date getBuytime() {
        return buytime;
    }

    public void setBuytime(Date buytime) {
        this.buytime = buytime;
    }

    public Integer getBuynumber() {
        return buynumber;
    }

    public void setBuynumber(Integer buynumber) {
        this.buynumber = buynumber;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public Integer getOrdertype() {
        return ordertype;
    }

    public void setOrdertype(Integer ordertype) {
        this.ordertype = ordertype;
    }
}