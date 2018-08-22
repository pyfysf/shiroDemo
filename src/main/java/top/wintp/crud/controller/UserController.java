package top.wintp.crud.controller;

import com.github.pagehelper.util.StringUtil;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.UUID;

import top.wintp.crud.entity.TUser;
import top.wintp.crud.service.UserService;

/**
 * 类描述：用户相关的控制器
 * <p>
 * 作者：  pyfysf
 * <p>
 * qq:  337081267
 * <p>
 * CSDN:    http://blog.csdn.net/pyfysf
 * <p>
 * 个人博客：    http://wintp.top
 * <p>
 * 邮箱：  pyfysf@163.com
 * <p>
 * 时间：2018/8/22
 */
@Controller
@RequestMapping("user")
public class UserController {
    @Autowired
    private UserService mUserService;

    @GetMapping("login")
    public String login() {

        return "login";
    }


    @PostMapping("loginUser")
    public String loginUser(TUser user) {

        boolean flag = mUserService.loginUser(user);


        if (flag) {
            return "index";
        } else {
            return "login";
        }


    }

    @RequestMapping("unAuth")
    public String unAuth() {
        return "unAuth";
    }


}