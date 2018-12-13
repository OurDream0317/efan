package com.qyxy.controller;

import com.alibaba.fastjson.JSON;
import com.qyxy.domain.Master;
import com.qyxy.domain.Product;
import com.qyxy.domain.User1;
import com.qyxy.service.MasterService;
import com.qyxy.service.ProductService;
import com.qyxy.service.UserService;
import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.*;

/**
 * Created by Administrator on 2018/9/2 0002.
 */
 /*用户点击站长特权，跳转到controller处理，先查询用户的删除状态，0代删除，1代表普通用户2代表站长3代表审核状态,4审核失败，
    如果是2代表是站长，跳转到站长的主页面，如果是1跳转到站长的申请页面，如果是3则查询master表，将申请填写的数据返回给页面，如果是4审核失败，返回master数据并显示从新提交
    返回站长主页*/
@Controller
@RequestMapping("/master")
public class MasterController {
    @Resource
    private MasterService masterService;

    @Resource
    private ProductService productService;

    @Resource
    private UserService userService;

    @RequestMapping("/findmaster")
    public String  findmaster(Integer userid, HttpSession session){
        //通过userid判断该用户是否是站长
        User1 user1=userService.selectUserById(userid);
        Integer userstatus=user1.getUserstatus();


        if(userstatus==1){
            //是普通用户返回到站长申请页面

            return "../../Applymaster";
        }else if(userstatus==3){
            //代表普通用户申请站长处于审核状态，将master信息查询出来返回到Applymaster
            Master master=masterService.selectMasterById(userid);
            session.setAttribute("master",master);
            return "../../Applymaster";
        }else if(userstatus==4){
            //代表普通用户申请站长处于审核失败状态，将master信息查询出来返回到Applymaster
            Master master=masterService.selectMasterById(userid);
            session.setAttribute("master",master);
            return "../../Applymaster";
        }else {
            //站长审核通过状态，跳转到站长主页面,查询站长信息，返回到站长主页面
            Master master=masterService.selectMasterById(userid);
            session.setAttribute("master",master);
            session.setAttribute("user1",user1);
            return "../../marst";

        }
    }
//站长商品页面点商品图片，跳转到商品详情页
    @RequestMapping("/masterProductdetail")
    public String masterProductdetail(Integer proid,Model model){
        System.out.println(proid+"====");
        //根据产品id查询产品
        Product product=productService.selectProductByid(proid);
        //将查询出来的商品对象转化成json 字符串传给页面
        String p= JSON.toJSONString(product);
        System.out.println("Masterproductcontroller"+p);
        model.addAttribute("product",p);
        return "../../masterProductdetail";
    }

    //站长商品详情页面跳转到商品修改页面，
    @RequestMapping("/updatemasterProduct")
    public  String updatemasterProduct(Integer proid,Model model){
        model.addAttribute("proid",proid);
        return "../../masterupdateProduct";
    }

    //站长的商品修改
    @RequestMapping("/masterupdateproduct")
    public  String masterupdateproduct(Product product, MultipartFile myFile, HttpServletRequest request,Model model){
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
        model.addAttribute("msg","商品修改成功！");
        return "../../masterupdateProduct";
    }

    //站长商品的删除
    @RequestMapping("/deletemasterProduct")
    public void deletemasterProduct(Integer proid){
        productService.deleteProduct(proid);
    }


}
