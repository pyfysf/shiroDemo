package top.wintp.crud.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

import top.wintp.crud.entity.Department;
import top.wintp.crud.entity.Msg;
import top.wintp.crud.service.DepartmentService;

/**
 * 类描述：处理所有关于部门的请求
 * Created by shaofei on 2017/12/19.
 * email: apk2sf@163.com
 * QQ：337081267
 */
@Controller
public class DepartmentController {
    @Autowired
    private DepartmentService mDeptmentService;

    @RequestMapping(value = "/depts", method = RequestMethod.GET)
    @ResponseBody
    public Msg getDepts() {
        List<Department> depts = mDeptmentService.findAllEmp();

        return Msg.resultSuccess().addResultBody("depts", depts);
    }


}