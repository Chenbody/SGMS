package com.example.service;

import com.example.entity.Account;
import com.example.exception.CustomException;
import com.example.mapper.AdminMapper;
import com.example.mapper.StudentMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

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
            throw new CustomException("账号或密码错误");
        }
        // 比较密码
        if (!dbStudent.getPassword().equals(account.getPassword())) {
            throw new CustomException("账号或密码错误");
        }
        return dbStudent;
    }
}
