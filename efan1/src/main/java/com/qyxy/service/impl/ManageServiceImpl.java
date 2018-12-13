package com.qyxy.service.impl;

import com.qyxy.domain.Manage;
import com.qyxy.domain.Upermission;
import com.qyxy.mapper.ManageMapper;
import com.qyxy.service.ManageService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2018/8/30 0030.
 */
@Service(value = "manageService")
public class ManageServiceImpl implements ManageService{
    @Resource
    private ManageMapper manageMapper;



    //通过管理员账号查询管理员
    @Override
    public Manage selectManageByAcc(String manageacc) {
        //通过管理员账号查询账号是否存在，存在就返回manage管理员对象
        return manageMapper.selectManageByAcc(manageacc);
    }

    @Override
    public List<Upermission> selectPermissionList(String manageacc) {
        return manageMapper.selectPermissionList(manageacc);
    }

    @Override
    public void addMange(String manageacc, String mh1, String nickname, Date date,String managename) {
        manageMapper.addMange(manageacc,mh1,nickname,date,managename);
    }



    //修改密码
    @Override
    public void updatePassword(String username,String password){
        manageMapper.updatePassword(username,password);
    }

    @Override
    //删除人员
    public void deleteManger(String manageacc){
        manageMapper.deleteManger(manageacc);
    }

    @Override
    //修改  编辑
    public void updateManger(String username,String username1,String nickname){
        manageMapper.updateManger(username,username1,nickname);
    }

    //根据姓名模糊查询
    @Override
    public void selectName(String username){
        manageMapper.selectName(username);
    }


    //查询界面，把所有人员显示在操作界面上，分页查询
    @Override
    public List<Manage> findAll(int startRow, int endRow,String managename) {
        return manageMapper.findAll(startRow, endRow,managename);
    }
}
