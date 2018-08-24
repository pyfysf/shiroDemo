package top.wintp.crud.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import top.wintp.crud.entity.Employee;
import top.wintp.crud.entity.Msg;
import top.wintp.crud.service.EmployeeService;

/**
 * 类描述：员工的请求处理类
 * Created by shaofei on 2017/12/14.
 * email: apk2sf@163.com
 * QQ：337081267
 */
@Controller
@RequestMapping("/emp")
public class EmployeeController {

    //打印logger使用
    private static Logger logger = LoggerFactory.getLogger(EmployeeController.class);


    @RequestMapping(value = "/checkEmpName", method = RequestMethod.GET)
    @ResponseBody
    @RequiresPermissions("emp-check")
    public Msg checkEmpByName(@RequestParam("empName") String empName) {
        boolean isUse = mEmployeeService.checkEmpByName(empName);
        if (isUse) {
            return Msg.resultSuccess();
        } else {
            return Msg.resultFail();
        }
    }


    @RequestMapping(value = "/emps", method = RequestMethod.POST)
    @ResponseBody
    public Msg saveEmp(@Valid Employee employee, BindingResult result) {

        if (result.hasErrors()) {
            Map<String, Object> errorMap = new HashMap<>();

            List<FieldError> fieldErrors = result.getFieldErrors();

            for (FieldError fieldError : fieldErrors) {
                errorMap.put(fieldError.getField(), fieldError.getDefaultMessage());
            }

            //校验失败
            return Msg.resultFail().addResultBody("fieldErrors", errorMap);
        }

        mEmployeeService.saveEmp(employee);

        return Msg.resultSuccess();
    }

    @Autowired
    EmployeeService mEmployeeService;

    /*
     * 在SpringMVC后台控制层获取参数的方式主要有两种，
     * 一种是request.getParameter("name")，
     * 另外一种是用注解@RequestParam直接获取。这里主要讲这个注解
     *
     *
     * 可以通过required=false或者true来要求@RequestParam配置的前端参数是否一定要传
     *
     * 建议使用包装类型代替基本类型
     *
     * defaultValue:默认值
     * */
    @RequestMapping("/findAll")
    @RequiresPermissions("emp-check")
    public String findAll(Model model, @RequestParam(value = "pageNum", defaultValue = "1")
            Integer pageNum) {

        logger.info("请求开始>>>>>");

        //书写分页逻辑--在这里进行分页声明之后，后面紧跟的查询就是一个分页目标
        //第二个参数是指定每次查询几条数据
        PageHelper.startPage(pageNum, 5);

        //调用Service里面的方法进行使用
        List<Employee> allEmployees = mEmployeeService.findAll();
        //使用PageInfo来包装返回的数据--可以更好的管理分页逻辑

        //第二个参数是页面上最多显示几个页数，比如限制只显示5个那么就为1,2,3,4,5
        //2,3,4,5,6||||3,4,5,6,7
        PageInfo<Employee> employeePageInfo = new PageInfo<Employee>(allEmployees, 5);

        logger.info("数据为：" + employeePageInfo);

        logger.info("请求结束>>>>>");

        //存储数据，跳转界面
        model.addAttribute("employeePageInfo", employeePageInfo);
        return "list";
    }

    @RequestMapping("/findAllWithJson")
    @ResponseBody
    public Msg findAllWithJson(Model model, @RequestParam(value = "pageNum", defaultValue = "1")
            Integer pageNum) {

        logger.info("请求开始>>>>>");

        //书写分页逻辑--在这里进行分页声明之后，后面紧跟的查询就是一个分页目标
        //第二个参数是指定每次查询几条数据
        PageHelper.startPage(pageNum, 5);

        //调用Service里面的方法进行使用
        List<Employee> allEmployees = mEmployeeService.findAll();
        //使用PageInfo来包装返回的数据--可以更好的管理分页逻辑

        //第二个参数是页面上最多显示几个页数，比如限制只显示5个那么就为1,2,3,4,5
        //2,3,4,5,6||||3,4,5,6,7
        PageInfo<Employee> employeePageInfo = new PageInfo<Employee>(allEmployees, 5);

        logger.info("数据为：" + allEmployees);

        logger.info("请求结束>>>>>");

        return new Msg().resultSuccess().addResultBody("employeePageInfo", employeePageInfo);
    }


    /**
     * 根据id查询员工
     *
     * @param id
     * @return
     */
    @GetMapping("/empById/{id}")
    @ResponseBody
    public Msg getEmpById(@PathVariable("id") Integer id) {
        Employee empById = mEmployeeService.getEmpById(id);

        return Msg.resultSuccess().addResultBody("emp", empById);
    }

    /**
     * 更新用户
     *
     * @param employee
     * @return
     */
    @PostMapping("/updateEmp")
    @ResponseBody
    public Msg updateEmp(Employee employee) {

        logger.info("updateEmp请求开始");
        logger.info("id:" + employee.getEmpId());

        mEmployeeService.updateEmp(employee);

        logger.info("updateEmp请求结束");


        return Msg.resultSuccess();
    }

    /**
     * 删除用户
     *
     * @return
     */
    @GetMapping("/delEmp/{id}")
    @ResponseBody
    public Msg deleteEmpById(@PathVariable("id") Integer id) {

        logger.info("deleteEmpById 请求开始");

        mEmployeeService.deleteEmpById(id);

        logger.info("deleteEmpById 请求结束");


        return Msg.resultSuccess();
    }
    /**
     * 批量删除用户
     *
     * @return
     */
    @PostMapping("/delBanch")
    @ResponseBody
    public Msg delBanch(String ids) {

        logger.info("deleteEmpById 请求开始");

        mEmployeeService.delBanch(ids);

        logger.info("deleteEmpById 请求结束");


        return Msg.resultSuccess();
    }
}