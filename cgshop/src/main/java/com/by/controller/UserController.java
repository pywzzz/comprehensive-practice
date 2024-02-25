package com.by.controller;

import com.by.bean.LoginBean;
import com.by.bean.PageBean;
import com.by.bean.ResultBean;
import com.by.bean.User;
import com.by.mapper.UserMapper;
import com.by.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController //增加一个注解  说明当前类是控制类  且返回的结果是文本 将javabean或集合转换为json格式
@RequestMapping("/v1/user")  //父路径   拦截所有的请求，与方法中的请求组件成完整的相对路径 如/query  对应/v1/user/query
@CrossOrigin //允许跨域资源共享
public class UserController extends BaseController{

    /**
     * 控制层依赖于业务层的接口  依赖抽象 不依赖具体实现 耦合度低
     */
    @Autowired
    UserService userService;


    @PostMapping("/query")
    public ResultBean query(@RequestBody Map map){
        PageBean pageBean =userService.query(map);
        return success("查询用户列表",pageBean);
    }

    /**
     * 保存用户   注解 @RequestBody会将json格式参数 转换成map对象
     * @param map
     * @return
     */
    @PostMapping("/save")
    public ResultBean save(@RequestBody Map map){
        int rs=userService.save(map);
        return rs==1?success("保存成功"):fail("保存失败");
    }

    /**
     * 地址栏参数  直接定义接收 只要保证地址栏中的参数名与方法的参数名一致就可以
     * 如果硬要给delete方法中的参数加注解，那就使用 @RequestParam
     * @param id
     * @return
     */
    @GetMapping("/delete")
    public ResultBean delete( String id){
        int rs=userService.delete(id);
        return rs==1?success("删除成功"):fail("删除失败");
    }

    @PostMapping("/update")
    public ResultBean update(@RequestBody Map map){
        int rs=userService.update(map);
        return rs==1?success("更新成功"):fail("更新失败");
    }

    @PostMapping("/login")
    public ResultBean login(@RequestBody LoginBean loginBean){
        User user=userService.queryByUsername(loginBean.getUsername());
        if(null==user){
            return fail("该账号不存在");
        }
        //判断密码
        if(!loginBean.getPassword().equals(user.getPassword())){
            return fail("密码不正确！");
        }

        //判断状态
        if(user.getStatus()==2){
            return fail("账号被锁定，请联系管理员");
        }
        //移除密码
        user.setPassword(null);
        return success("登录成功",user);
    }
}
