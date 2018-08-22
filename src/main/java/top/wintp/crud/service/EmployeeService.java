package top.wintp.crud.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

import top.wintp.crud.dao.EmployeeMapper;
import top.wintp.crud.entity.Employee;
import top.wintp.crud.entity.EmployeeExample;

/**
 * 类描述：员工业务逻辑层
 * Created by shaofei on 2017/12/14.
 * email: apk2sf@163.com
 * QQ：337081267
 */
@Service
public class EmployeeService {

    @Autowired
    EmployeeMapper mEmployeeMapper;

    /**
     * 查询所有的员工
     *
     * @return
     */
    public List<Employee> findAll() {

        return mEmployeeMapper.selectByExampleWithDept(null);
    }

    public void saveEmp(Employee employee) {
        mEmployeeMapper.insert(employee);
    }

    /**
     * @param empName
     * @return true  可用  false 不可用
     */
    public boolean checkEmpByName(String empName) {
        EmployeeExample example = new EmployeeExample();
        example.createCriteria().andEmpNameEqualTo(empName);

        return mEmployeeMapper.countByExample(example) == 0;
    }

    /**
     * 根据id查询员工数据
     *
     * @param id
     */
    public Employee getEmpById(Integer id) {
        return mEmployeeMapper.selectByPrimaryKey(id);
    }

    public void updateEmp(Employee employee) {
        mEmployeeMapper.updateByPrimaryKeySelective(employee);
    }

    /**
     * 删除用户
     *
     * @param id
     */
    public void deleteEmpById(Integer id) {
        mEmployeeMapper.deleteByPrimaryKey(id);
    }

    /**
     * 批量删除数据
     *
     * @param ids
     */
    public void delBanch(String ids) {
        EmployeeExample exam = new EmployeeExample();
        EmployeeExample.Criteria criteria = exam.createCriteria();
        List<Integer> idsList = new ArrayList<>();

        String[] split = ids.split(",");

        for (String id : split) {
            idsList.add(Integer.parseInt(id));
        }
        criteria.andEmpIdIn(idsList);

        mEmployeeMapper.deleteByExample(exam);
    }
}