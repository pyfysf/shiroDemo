package top.wintp.crud.test;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.UUID;

import top.wintp.crud.dao.DepartmentMapper;
import top.wintp.crud.dao.EmployeeMapper;
import top.wintp.crud.entity.Department;
import top.wintp.crud.entity.Employee;

/**
 * 类描述：Mapper测试类
 * Created by shaofei on 2017/12/14.
 * email: apk2sf@163.com
 * QQ：337081267
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MapperTest {
    @Autowired
    private EmployeeMapper mEmployeeMapper;

    @Autowired
    private DepartmentMapper mDepartmentMapper;

    /*批量插入数据*/
    @Autowired
    private SqlSession mSqlSession;

    @Test
    public void testMapperInsert() {

        //Department department = new Department();
        //department.setDeptName("开发部");
        //mDepartmentMapper.insertSelective(department);
        EmployeeMapper mapper = mSqlSession.getMapper(EmployeeMapper.class);

        for (int i = 0; i < 1000; i++) {
            String uuid = UUID.randomUUID().toString().trim().substring(0, 5);
            Employee employee = new Employee();
            employee.setEmpName(uuid + i);
            employee.setEmpEmail(uuid + i + "@qq.com");
            employee.setdId(1);
            mapper.insertSelective(employee);
        }
    }

}