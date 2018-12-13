package com.qyxy.util;

import com.qyxy.domain.News;
import org.apache.commons.io.IOUtils;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by Administrator on 2018/9/10 0010.
 */
public class UpFile {
    public void addNewsDemo(MultipartFile file1) {
        HttpServletRequest request =   ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        HttpSession session=request.getSession();
        String path1=request.getServletContext().getRealPath("/image")+"/"+file1.getOriginalFilename();
        String MyFile1="";
        if(file1.getOriginalFilename()!=null&&file1.getOriginalFilename()!="") {
            MyFile1 = "image/" + file1.getOriginalFilename();
        }
        // shop.setShopPacking();
        File target1 = new File(path1);
        OutputStream out1=null;
        try {
            out1 = new FileOutputStream(target1);
            try {
                IOUtils.copy(file1.getInputStream(), out1);
            } catch (IOException e) {
                e.printStackTrace();
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }finally {
            try {
                out1.close();
            } catch (IOException e) {

            }

        }

    }
}
