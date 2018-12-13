package com.qyxy.service.impl;

import com.qyxy.domain.Slideshow;
import com.qyxy.mapper.SlideshowMapper;
import com.qyxy.service.SlideService;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2018/9/6 0006.
 */
@Service(value = "slideservice")
public class SlideServiceImpl implements SlideService{
    @Resource
    private SlideshowMapper slideshowMapper;
    @Override
    public void addimg(int slidelocation, Date date, int identifier, String file) {
          slideshowMapper.addimg(slidelocation,date,identifier,file);
    }

    @Override
    public List<Slideshow> selectAll() {

        return slideshowMapper.selectAll();
    }

    @Override
    public void delete(int slideid) {
        slideshowMapper.delete(slideid);
    }

    @Override
    public void update(int slideshelf, int slideid, int slidelocation, Model mv) {
        List<Slideshow> list=slideshowMapper.shelfnumber(slidelocation,slideshelf);
        System.out.println(list.size()+"11111111111");
        if (slideshelf == 0) {
            if(list.size()<5){
                slideshelf = 1;
            }else{
                mv.addAttribute("shelf","轮播图最大上限五个，已超出范围");
                System.out.println(list.size()+"11111111111");
                return;
            }
        } else if (slideshelf == 1) {
            slideshelf = 0;
        }

        slideshowMapper.update(slideshelf,slideid);
    }

    @Override
    public List<Slideshow> fontselectslideshow(int slidelocation) {
        return slideshowMapper.fontselectslideshow(slidelocation);
    }
}
