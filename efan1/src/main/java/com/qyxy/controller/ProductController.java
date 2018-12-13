package com.qyxy.controller;

import com.alibaba.fastjson.JSON;
import com.qyxy.domain.Product;
import com.qyxy.domain.UserAddress;
import com.qyxy.service.ProductService;
import com.qyxy.service.UserAdressService;
import org.apache.commons.io.IOUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2018/9/5 0005.
 */
@Controller
@RequestMapping("/product")
public class ProductController {
    @Resource
    private ProductService productService;
    @Resource
    private UserAdressService userAdressService;

    //跳转到商品列表
    @RequestMapping("productList")
    public String ProductList(){
        return "product/productList";
    }
    //跳转到商品添加页面
    @RequestMapping("addproduct")
    public String addProduct(){
        return "product/addProduct";
    }
    //商品的多条件，分页查询
    @RequestMapping("selectproductAll")
    @ResponseBody
    public String selectProductAll(String demo,String input,int proshelf,int currentpage,int count){
        System.out.println(demo+" === "+input+"=== "+proshelf+"---"+currentpage+"=="+count);
        //判断页面传过来的值是否为null
        Map map=new HashMap();
        if(demo.equals("商品名称")&&input!=null&&input!=""){

            map.put("proname",input);
            map.put("proid", 0);
            map.put("properson", "");
        }else if(demo.equals("商品编号")&&input!=null&&input!=""){
            int a = Integer.parseInt(input);
            map.put("proid", input);
            map.put("proname","");
            map.put("properson", "");
        } else if(demo.equals("发布方")&&input!=null&&input!=""){

            map.put("properson", input);
            map.put("proid", 0);
            map.put("proname","");
        }else {
            map.put("proid", 0);
            map.put("proname","");
            map.put("properson", "");
        }

        map.put("proshelf",proshelf);
        Integer startRow=(currentpage-1)*count+1;
        Integer endRow=currentpage*count;
        map.put("startRow",startRow);
        map.put("endRow",endRow);

        List<Product> productList=productService.selectProductAll(map);
        String v= JSON.toJSONString(productList);
        System.out.println(v);
        return v;
    }

    //新增商品
    @RequestMapping("/saveproduct")
    public String addProduct1(Product product,MultipartFile myFile,HttpServletRequest request){
        //获取图片路径
        String path=request.getServletContext().getRealPath("/images")+"/"+myFile.getOriginalFilename();
        System.out.println(path);
        String myfile="images/"+myFile.getOriginalFilename();
        product.setProicon(myfile);
        File target=new File(path);
        try {
            OutputStream output=new FileOutputStream(target);
            try{
                IOUtils.copy(myFile.getInputStream(),output);
            }catch (IOException e){
                e.printStackTrace();
            }

        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }


        //添加当前时间 默认状态为1 ，上架状态为0，销量默认为0 properson 赋值为 平台

        product.setProtime(new Date());//商品添加时间
        product.setProstatus(1);//商品的删除状态为1
        product.setProshelf(0);//商品的上架状态为0
        product.setProsale(0);//商品的销量为0
        product.setProperson("官方平台");


        //调用service层添加商品
        productService.insertProduct(product);
            return "redirect:productList";




    }

    //修改产品上架状态
    @RequestMapping("/updateproshelf")
    public String updateProshelf(int proid,int proshelf){
        System.out.println(proid+"-------"+proshelf);
        if(proshelf==0){//商品处于下架状态，修改为1
            productService.updateProshelf(proid,1);
        }else {//处于上架状态，修改为下架
            productService.updateProshelf(proid,0);
        }
        return "redirect:productList";
    }
    //查看商品详情，通过商品id查询
    @RequestMapping("/selectproductByid")
    public String selectProductByid(int proid,Model model){
        //通过id,查询出来商品信息，在前端页面展示出来
        Product product=productService.selectProductByid(proid);
        String p=JSON.toJSONString(product);
        System.out.println("productcontroller"+p);
        model.addAttribute("product",p);
        return "product/productdetail";
    }
    //删除商品，将商品的Prostatus修改为0；
    @RequestMapping("/deleteproduct")
    public String deleteProduct(int proid){
        productService.deleteProduct(proid);

        return "product/productList";
    }

    //跳转到商品编辑页面
    @RequestMapping("/editproduct")
    public String editproduct(int proid,Model model){
        //跳转到修改商品页面，将商品id传到页面
        model.addAttribute("proid",proid);
        return "product/updateproduct";
    }

    //由商品修改页面跳转过来，修改商品
    @RequestMapping("/editproduct1")
    public String editproduct1(Product product,MultipartFile myFile,HttpServletRequest request){
        //判断myFile是否有值

            //获取图片路径
            String path=request.getServletContext().getRealPath("/images")+"/"+myFile.getOriginalFilename();
            System.out.println(path);
        if (!myFile.getOriginalFilename().isEmpty()) {
            String myfile="images/"+myFile.getOriginalFilename();
            product.setProicon(myfile);
        }

            File target=new File(path);
            try {
                OutputStream output=new FileOutputStream(target);
                try{
                    IOUtils.copy(myFile.getInputStream(),output);
                }catch (IOException e){
                    e.printStackTrace();
                }

            } catch (FileNotFoundException e) {
                e.printStackTrace();
            }

        //跳转service层进行修改
        System.out.println(JSON.toJSONString(product));
        productService.editproduct1(product);
        return "redirect:productList";
    }


    /*前台站长页面请求该用户发布的商品,返回json数据*/
    @RequestMapping("selectMasterByphone")
    @ResponseBody
    public String selectMasterByphone(String userphone){

         List<Product> productList=productService.selectMasterByphone(userphone);
       String product=JSON.toJSONString(productList);
        return product;
    }
    //新增商品
    @RequestMapping("/saveproductmaster")
    public String addProduct2(Product product,MultipartFile myFile,HttpServletRequest request,Integer userid){
        //获取图片路径
        String path=request.getServletContext().getRealPath("/images")+"/"+myFile.getOriginalFilename();
        System.out.println(path);
        String myfile="images/"+myFile.getOriginalFilename();
        product.setProicon(myfile);
        File target=new File(path);
        try {
            OutputStream output=new FileOutputStream(target);
            try{
                IOUtils.copy(myFile.getInputStream(),output);
            }catch (IOException e){
                e.printStackTrace();
            }

        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }


        //添加当前时间 默认状态为1 ，上架状态为0，销量默认为0 properson 赋值为 平台

        product.setProtime(new Date());//商品添加时间
        product.setProstatus(1);//商品的删除状态为1
        product.setProshelf(0);//商品的上架状态为0
        product.setProsale(0);//商品的销量为0



        //调用service层添加商品
        productService.insertProduct(product);
        return "redirect:../master/findmaster?userid="+userid;
    }
    //以下是前端代码   中强大神操作  如有疑问，自己好好想想
    //根据商品名称进行模糊查询

    @RequestMapping("/nameselect")
    public ModelAndView nameselect(String productname){
        /*String productname=*/
       /* URLDecoder.decode(productname, "UTF-8");*/
        List<Product> list= productService.nameselect(productname);
        System.out.println(list.size()+" dsafsafdf"+productname);
        ModelAndView mv=new ModelAndView("../../perimeter");
        mv.addObject("product",list);
        return mv;
    }
    //精确查询
    @RequestMapping("/return")
    public ModelAndView selectALL(String proname){
        List<Product> list= productService.nameselect1(proname);

        ModelAndView mv=new ModelAndView("../../productDetail");
        mv.addObject("product1",list);

        System.out.println(list.size()+" dsafsafdf"+proname);
        return mv;
    }
    //查询全部商品s
    @RequestMapping("/return1")
    public ModelAndView selectALL1(){
        List<Product> list= productService.nameselect2();
        ModelAndView mv=new ModelAndView("../../gallery");
        mv.addObject("product2",list);
        System.out.println(list.size()+" dsafsafdf");
        return mv;
    }

    //根据商品名返回Jason数据的查询
    @RequestMapping("/return2")
    @ResponseBody
    public ModelAndView selectALL2(String a, String b,String d ){
        List<Product> list= productService.nameselect1(b);
        ModelAndView mv=new ModelAndView("../../order");
        List<UserAddress> list1=userAdressService.selectAll(d);
        if(list1.size()>0){
            mv.addObject("address",list1);
        }
        mv.addObject("test",list);
        mv.addObject("test1",a);
        System.out.println(list.size()+" dsafsafdf"+list1.size());
       /* return JSON.toJSONString(list);*/
        return mv;
    }

}
