package com.qyxy.service;

import com.qyxy.domain.Master;

/**
 * Created by Administrator on 2018/9/2 0002.
 */
public interface MasterService {
    //通过userid 查询站长对象 返回站长对象
    public Master selectMasterById(int userid);

    //站长审核不通过，将备注添加到数据库
    public void updateMasterRemar( int userid,String masterremar);
}
