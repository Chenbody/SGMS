package com.example.service;

import cn.hutool.core.util.ObjectUtil;
import cn.hutool.crypto.digest.BCrypt;
import com.example.common.RoleEnum;
import com.example.entity.Account;
import com.example.entity.Course;
import com.example.entity.Student;
import com.example.exception.CustomException;
import com.example.mapper.AdminMapper;
import com.example.mapper.StudentMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class StudentService {

    @Resource
    private StudentMapper studentMapper;

    /**
     * 登陆
     */
    public Account login(Account account) {
        Account dbStudent = studentMapper.selectByUsername(account.getUsername());
        if (dbStudent == null) {
            // 没查找到用户
            throw new CustomException("Username or password is incorrect");
        }
        // 比较密码 dbStudent.getPassword().equals(account.getPassword())
        if (!BCrypt.checkpw(account.getPassword(), dbStudent.getPassword())) {
            throw new CustomException("Username or password is incorrect");
        }
        return dbStudent;
    }

    /**
     * 学生注册
     */
    public void register(Account account) {
        Student student = new Student();
        student.setUsername(account.getUsername());
        // 使用BCrypt加密密码
        String hashedPassword = BCrypt.hashpw(account.getPassword(), BCrypt.gensalt());
        student.setPassword(hashedPassword);
        this.add(student);
    }

    /**
     * 新增
     */
    public void add(Student student) {
        // 先查找数据库里有没有相同账号名的存在
        Student dbstudent = studentMapper.selectByUsername(student.getUsername());
        if (dbstudent != null) { // 已有同名账号，不允许插入
            throw new CustomException("Username already exists");
        }
        if (ObjectUtil.isEmpty(student.getName())) { // 若是学生新增账号没有昵称，默认昵称为账号名
            student.setName(student.getUsername());
        }
        student.setRole(RoleEnum.STUDENT.name());
        studentMapper.insert(student);
    }

    public void deleteById(Integer id) {
        studentMapper.deleteById(id);
    }

    public void updateById(Student student) {
        // 要是改了密码，就需要对密码加密
        Student dbStudent = studentMapper.selectById(student);
        if (!dbStudent.getPassword().equals(student.getPassword())) {
            // 使用BCrypt加密密码
            String hashedPassword = BCrypt.hashpw(student.getPassword(), BCrypt.gensalt());
            student.setPassword(hashedPassword);
        }
        studentMapper.updateById(student);
    }

    // PageInfo包含 total 和 list 属性
    // total是查询的总数
    // list是查询列表
    // 输入参数 pageNum 是当前的页码， pageSize 是每页的个数
    public PageInfo<Student> selectPage(Integer pageNum, Integer pageSize, Student student) {
        PageHelper.startPage(pageNum, pageSize);
        List<Student> studentList = studentMapper.selectAll(student);
        return PageInfo.of(studentList);
    }

    public Student selectById(Student student) {
        Student dbStudent = studentMapper.selectById(student);
        return dbStudent;
    }
}
