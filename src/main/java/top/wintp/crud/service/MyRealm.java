package top.wintp.crud.service;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.realm.Realm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

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
public class MyRealm extends AuthorizingRealm {

    @Autowired
    private TUserMapper mTUserMapper;


    @Override
    protected AuthorizationInfo
    doGetAuthorizationInfo(PrincipalCollection principalCollection) {

        System.out.println("自定义realm授权方法");
        TUser user = (TUser) principalCollection.getPrimaryPrincipal();

        System.out.println(user.getUsername());
        System.out.println(user.getPassword());

        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();

        authorizationInfo.addStringPermission("admin");

        //授权
        return authorizationInfo;
    }




    @Override
    protected AuthenticationInfo
    doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        System.out.println("自定义realm认证方法");

        UsernamePasswordToken token = (UsernamePasswordToken) authenticationToken;

        TUserExample tUserExample = new TUserExample();
        tUserExample.createCriteria().andUsernameEqualTo(token.getUsername());
        List<TUser> tUsers = mTUserMapper.selectByExample(tUserExample);


        if (tUsers != null && tUsers.size() > 0) {

            TUser tUser = tUsers.get(0);


            //简单认证信息对象
            AuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(tUser, tUser.getPassword(), this.getName());


            //认证
            return authenticationInfo;
        } else {
            return null;
        }

    }
}