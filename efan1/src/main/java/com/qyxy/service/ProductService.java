package com.qyxy.service;

import com.qyxy.domain.Product;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2018/9/5 0005.
 */
public interface ProductService {
    //多条件，分页查询商品数据
    public List<Product> selectProductAll(Map map);
    //添加商品
    public void insertProduct(Product product);
    //修改商品的上下架状态
    public void updateProshelf(int proid,int proshelf);
    //删除商品，将商品的Prostatus修改为0；
    public void deleteProduct(int proid);

    //通过id,查询出来商品信息，在前端页面展示出来
    public Product selectProductByid(int proid);

    //修改商品，接收商品对象，判断属性是否有值，
    public void editproduct1(Product product);

    //前台站长用户查询发布的商品，通过账户phone
    public List<Product> selectMasterByphone( String userphone);



    //根据姓名模糊查询
    public List<Product> nameselect(String productname);

    //根据姓名模糊查询
    public List<Product> nameselect1(String productname);

    //根据姓名模糊查询
    public List<Product> nameselect2();

}
