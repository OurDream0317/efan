package com.qyxy.controller;

import com.alibaba.fastjson.JSON;
import com.qyxy.domain.ActiveManage;
import com.qyxy.domain.Manage;
import com.qyxy.domain.Urole;
import com.qyxy.domain.User1;
import com.qyxy.mapper.UroleMapper;
import com.qyxy.service.ManageService;
import com.qyxy.service.UrolService;
import com.qyxy.service.UserRoleService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2018/8/30 0030.
 */

@Controller
public class ManageController {
    @Resource
    private ManageService manageService;
    @Resource
    private UserRoleService userRoleService;
    @Resource
    private UrolService urolService;

    @RequestMapping("/first")
    public String first(HttpSession session){
        //判断用户是否登录，
        // 如果登录，请求后台返回数据到指定页面
        Subject subject= SecurityUtils.getSubject();
        ActiveManage user=(ActiveManage) subject.getPrincipal();
        session.setAttribute("activeUser",user);
        //如果没有登录调整到登录页面
        return "first";
    }
    @RequestMapping("/loginsubmit")
    public String toLogin(Model model, HttpServletRequest request) throws Exception{
        //从request中取出异常信息（shiroLoginFailure）
        String exceptionClassName = (String)request.getAttribute("shiroLoginFailure");
        //如果认证成功，不需要任何处理

        //如果认证失败，调整到登录页面
        if(exceptionClassName != null){
            if (UnknownAccountException.class.getName().equals(exceptionClassName)) {
                throw new Exception("账号不存在");
            } else if (IncorrectCredentialsException.class.getName().equals(
                    exceptionClassName)) {
                throw new Exception("用户名/密码错误");
            }else if("randomCodeError".equalsIgnoreCase(exceptionClassName)){
                throw new Exception("验证码错误");
            } else{
                throw new Exception();//最终在异常处理器生成未知错误
            }
        }

        return "login";
    }


   //新增人员
    @RequestMapping("/addManage1")
    public String addMange(String manageacc, String managerpassword, String rmanagerpassword, String managename ,String nickname, HttpSession httpSession){
       // System.out.println(uroleid+"======================================");
        if(!(managerpassword.equals(rmanagerpassword))){
            httpSession.setAttribute("msg","两次输入密码不一致，请重新输入");
            return "addMannager";
        }
        Md5Hash mh = new Md5Hash(managerpassword, manageacc, 1);
        String mh1= String.valueOf(mh);
        Date date =new Date(System.currentTimeMillis());
        System.out.print(date);
      /* if(uroleid.equals("1")){
           nickname="管理员";
       }else{
           nickname="运营人员";
       }*/
       manageService.addMange(manageacc,mh1,nickname,date,managename);
        Urole a=urolService.selectid(nickname);
        System.out.print(a+"1234");
        //String a= String.valueOf(list.get(0));
        System.out.print("1234"+a.getUroleid());
        userRoleService.addUrolRole(manageacc,a.getUroleid());
        return "findAll";
    }
    //新增人员
    @RequestMapping("/addManage")
    public String addMange(){
        return "addManager";
    }



    //修改密码
    @RequestMapping("/updatePassword")
    public String updatePassword(String username ,String password,String rpassword,Model model){
        if(password==null&&password==""){
            model.addAttribute("msg","密码不能为空");
            return "findAll";
        }

        if(!(password.equals(rpassword))){
            model.addAttribute("msg","两次输入密码不一致，请重新输入");
            return "findAll";
        }
        Md5Hash mh = new Md5Hash(password, username, 1);
        String mh1= String.valueOf(mh);
        manageService.updatePassword(username,mh1);
        return "findAll";
    }

    //删除人员
    @RequestMapping("/deleteManage")
    public String deleteManger(String manageacc){

        if(manageacc.equals("admin")){
            return "findAll";
        }
        manageService.deleteManger(manageacc);
        return "findAll";
    }

    //修改  编辑
    @RequestMapping("/updateManage")
    public String updateManger(String username,String uroleid,HttpSession
                                httpSession){

       String username1= (String) httpSession.getAttribute("msg1");
        System.out.println(username1+"啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊");
        if(username1.equals("admin")){
            return "findAll";
        }
        System.out.print(httpSession.getAttribute("msg1"));
        System.out.print(uroleid+"=====================");
        String nickname;
        if(uroleid.equals("1")){
            nickname="管理员";
        }else {
            nickname="运营人员";
        }
        if(username!=null) {
            manageService.updateManger(username, username1,nickname);
        }
        if(uroleid!=null) {
            userRoleService.updateUrole(uroleid,username1);
        }
        return "findAll";
    }
    @RequestMapping("/updateManage1")
    public String updateManger(String manageacc,HttpSession httpSession){
        httpSession.setAttribute("msg1",manageacc);
        System.out.print(manageacc);
        return "updateManage";
    }


  /*  //根据姓名模糊查询
    @RequestMapping("/selectName")
    public String selectName(String username){
        manageService.selectName(username);
        return "";
    }*/

    //查询界面，把所有人员显示在操作界面上，分页查询
    @RequestMapping("/findAll")
    public String findAll(){

        return "findAll";
    }

    @RequestMapping("/findAllList")
    @ResponseBody
    public String findAll(int startRow, int endRow,String managename){
        List<Manage> manageList=manageService.findAll(startRow,endRow,managename);
        System.out.print("asfdddddddddddddd"+JSON.toJSONString(manageList));
        return JSON.toJSONString(manageList);
    }



}
