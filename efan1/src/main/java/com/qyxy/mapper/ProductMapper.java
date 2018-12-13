package com.qyxy.mapper;

import com.qyxy.domain.Product;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;
@Repository
public interface ProductMapper {
    //多条件，分页查询商品数据
    public List<Product> selectProductAll(Map map);

    //添加商品
    public void insertProduct(Product product);
    //修改商品的上下架状态
    public void updateProshelf(@Param("proid") int proid,@Param("proshelf") int proshelf);
    //删除商品，将商品的Prostatus修改为0；
    public void deleteProduct(@Param("proid")int proid);

        //通过id,查询出来商品信息，在前端页面展示出来
        public Product selectProductByid(@Param("proid")int proid);
    //修改商品，接收商品对象，判断属性是否有值，
    public void editproduct1(Product product);

    //前台站长用户查询发布的商品，通过账户phone
    public List<Product> selectMasterByphone(@Param("userphone") String userphone);


    //根据姓名模糊查询
    public List<Product> nameselect(@Param("productname") String productname);
    //根据姓名模糊查询
    public List<Product> nameselect1(@Param("productname") String productname);

    public List<Product> nameselect2();


}