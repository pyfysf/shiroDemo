package top.wintp.crud.test;

import com.github.pagehelper.PageInfo;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.util.List;

import top.wintp.crud.entity.Employee;


/**
 * 类描述：测试员工控制器
 * Created by shaofei on 2017/12/14.
 * email: apk2sf@163.com
 * QQ：337081267
 */
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath:applicationContext.xml", "classpath:spring-mvc.xml"})
public class EmployeeControllerTest {

    private MockMvc mMockMvc;
    @Autowired
    private WebApplicationContext webAppContext;

    @Before
    public void initMockMvc() {
        mMockMvc = MockMvcBuilders.webAppContextSetup(webAppContext).build();
    }

    //测试页面
    @Test
    public void testPage() throws Exception {
        //mMockMvc.perform(MockMvc.requestBUilder)
        MvcResult mvcResult = mMockMvc.perform(MockMvcRequestBuilders.get("/emp/findAll.do")).andReturn();

        MockHttpServletRequest request = mvcResult.getRequest();

        PageInfo employeePageInfo = (PageInfo) request.getAttribute("employeePageInfo");

        List<Employee> list = employeePageInfo.getList();

        for (Employee employee : list) {
            System.out.println(employee.getEmpName());
            System.out.println(employee.getDepartment().getDeptName());
        }
    }

}