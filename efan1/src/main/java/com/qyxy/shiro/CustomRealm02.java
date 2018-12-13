package com.qyxy.shiro;


import com.qyxy.domain.ActiveManage;
import com.qyxy.domain.Manage;
import com.qyxy.domain.Upermission;
import com.qyxy.service.ManageService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2018/8/25 0025.
 * doGetAuthorizationInfo 授权
 * doGetAuthenticationInfo 认证
 */
public class CustomRealm02 extends AuthorizingRealm {
    @Resource
    private ManageService manageService;

    @Override
    public String getName() {
        return "customReam02";
    }
    //支持UsernamePasswordToken


    @Override
    public boolean supports(AuthenticationToken token) {
        return token instanceof UsernamePasswordToken;
    }

    //自定义授权
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        //获取用户主身份
        ActiveManage user = (ActiveManage) principalCollection.getPrimaryPrincipal();

        //通过主身份（用户名）到数据库中查询当前用户拥有的资源权限列表
        SimpleAuthorizationInfo info=new SimpleAuthorizationInfo();
        for (Upermission permission:user.getMenuList()) {
            if (permission.getPercode()!=null&&!permission.getPercode().equalsIgnoreCase("")){
                //添加资源列表
                info.addStringPermission(permission.getPercode());
                //可以添加角色列表  info.addRoles;
            }

        }

        //

        return info;

    }

    //自定义认证
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
       //从token 中获取用户身份（用户名）
       String username= (String) authenticationToken.getPrincipal();
        //拿用户名和数据库表中的用户对比，看能否找到
       Manage manage = manageService.selectManageByAcc(username);
        System.out.println("customrealm02"+manage);
        //假设数据表中找到的用户名张三  密码123456
        //如果没找到，返回null
        if(manage==null||manage.getDisable()==0){
            return null;
        }
        ActiveManage manage1=new ActiveManage();
        manage1.setManageid(manage.getManageid());
        manage1.setManageacc(manage.getManageacc());
        manage1.setNickname(manage.getNickname());
        manage1.setManagesalt(manage.getManagesalt());
        manage1.setManagestatus(manage.getManagestatus());

       /* user.setId(sysUser.getId());
        user.setUsername(sysUser.getUsername());
        user.setUsercode(sysUser.getUsercode());
        user.setSalt(sysUser.getSalt());*/

        List<Upermission> upermissionList = manageService.selectPermissionList(manage.getManageacc());
        manage1.setMenuList(upermissionList);



        //如果能找到，拿两个密码对比
       // SimpleAuthenticationInfo simpleAuthenticationInfo = new SimpleAuthenticationInfo(username,"123456","customReam02");
        SimpleAuthenticationInfo simpleAuthenticationInfo = new SimpleAuthenticationInfo(manage1,manage.getManagepassword(), ByteSource.Util.bytes(manage1.getManagesalt()),"customReam02");
        return simpleAuthenticationInfo;

    }
}
