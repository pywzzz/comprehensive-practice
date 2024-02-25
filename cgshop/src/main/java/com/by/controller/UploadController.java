package com.by.controller;

import com.by.bean.ResultBean;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;

@RestController
@CrossOrigin
public class UploadController extends BaseController{

    final String DIR="/attachment/";//图片在服务器存储目录

    @PostMapping("/upload")
    public ResultBean upload(MultipartFile file, HttpServletRequest request){
        //获取上传的文件名
        String fileName=file.getOriginalFilename();
        //获取文件的后缀
        String ext=fileName.substring(fileName.lastIndexOf(".")); //  .jpg
        //生成新的文件 名
        String newFileName=System.currentTimeMillis()+ext;

        //获取服务器根目录地址
        String root=request.getServletContext().getRealPath("/");
        //创建文件
        File dir=new File(root+DIR);
        //判断目录是否存在
        if(!dir.exists()){
            //创建目录
            dir.mkdir();
        }

        //拷贝文件
        try {
            file.transferTo(new File(dir,newFileName));
        } catch (IOException e) {
            e.printStackTrace();
        }

        return success("上传成功",DIR+newFileName);

    }

}
