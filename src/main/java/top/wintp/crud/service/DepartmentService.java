package top.wintp.crud.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

import top.wintp.crud.dao.DepartmentMapper;
import top.wintp.crud.entity.Department;

/**
 * 类描述：
 * Created by shaofei on 2017/12/19.
 * email: apk2sf@163.com
 * QQ：337081267
 */
@Service
public class DepartmentService {


    @Autowired
    private DepartmentMapper mDepartmentMapper;

    public List<Department> findAllEmp() {

        return mDepartmentMapper.selectByExample(null);
    }
}