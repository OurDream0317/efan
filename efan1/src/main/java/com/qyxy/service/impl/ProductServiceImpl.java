package com.qyxy.service.impl;

import com.qyxy.domain.Product;

import com.qyxy.mapper.ProductMapper;
import com.qyxy.service.ProductService;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2018/9/5 0005.
 */
@Service(value = "productService")
public class ProductServiceImpl implements ProductService{
    @Resource
    private ProductMapper productMapper;
    @Override
    public List<Product> selectProductAll(Map map) {
        return productMapper.selectProductAll(map);
    }

    @Override
    public void insertProduct(Product product) {
        productMapper.insertProduct(product);
    }

    @Override
    public void updateProshelf(int proid, int proshelf) {
        productMapper.updateProshelf(proid,proshelf);
    }

    @Override
    public void deleteProduct(int proid) {
        productMapper.deleteProduct(proid);
    }

    @Override
    public Product selectProductByid(int proid) {
        return productMapper.selectProductByid(proid);
    }

    @Override
    public void editproduct1(Product product) {
        //接收商品对象，判断商品的属性是否有值
        /*Product product1=new Product();
        product1.setProid(product.getProid());
        if(product.getProname()!=null&&product.getProname()!=""){
            product1.setProname(product.getProname());
        }
        if(product.getProprice()!=null){
            product1.setProprice(product.getProprice());
        }
        if(product.getProstock()!=null){
            product1.setProstock(product.getProstock());
        }
        if (product.getProstar()!=null&&product.getProstar()!=""){
            product1.setProstar(product.getProstar());
        }
        if (product.getProdetail()!=null&&product.getProdetail()!=""){
            product1.setProdetail(product.getProdetail());
        }
        if(product.getProicon()!=null&&product.getProicon()!=""){
            product1.setProicon(product.getProicon());
        }*/

        //调用mapper更新对象
        productMapper.editproduct1(product);




    }

    @Override
    public List<Product> nameselect(String productname) {
        return productMapper.nameselect(productname);
    }

    @Override
    public List<Product> nameselect1(String productname) {
        return productMapper.nameselect1(productname);
    }

    @Override
    public List<Product> nameselect2() {
        return productMapper.nameselect2();
    }

    @Override
    public List<Product> selectMasterByphone(String userphone) {
        return productMapper.selectMasterByphone(userphone);
    }
}
