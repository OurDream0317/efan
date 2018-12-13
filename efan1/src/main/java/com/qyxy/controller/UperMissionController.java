package com.qyxy.controller;

import com.qyxy.domain.Upermission;
import com.qyxy.service.UperMissionService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

/**
 * Created by Administrator on 2018/9/2 0002.
 */
@Controller
@RequestMapping(value = "upermission")
public class UperMissionController {
    @Resource
    private UperMissionService uperMissionService;

    @RequestMapping
    public String selectPermission(String urolename){
        uperMissionService.selectPermission(urolename);
        return "";
    }

}
