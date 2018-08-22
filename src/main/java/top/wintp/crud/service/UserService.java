package top.wintp.crud.service;

import com.sun.xml.internal.ws.util.Pool;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

import top.wintp.crud.dao.TUserMapper;
import top.wintp.crud.entity.TUser;
import top.wintp.crud.entity.TUserExample;

/**
 * 类描述：
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
@Service
public class UserService {

    public boolean loginUser(TUser user) {

        String username = user.getUsername();


        //shiro执行过程  获取当前用户--subject -->然后获取(login 登录)securityManager（安全管理器）
        // 然后调用realm

        //获取当前用户对象 -- 未认证
        Subject subject = SecurityUtils.getSubject();

        UsernamePasswordToken token
                = new UsernamePasswordToken(user.getUsername(), user.getPassword());

        try {
            subject.login(token);


            TUser resultUer = (TUser) subject.getPrincipal();

            System.out.println("登录成功");

            return true;


        } catch (Exception e) {
            e.printStackTrace();

            return false;
        }
    }
}