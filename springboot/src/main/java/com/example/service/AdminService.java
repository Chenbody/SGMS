package com.example.service;

import com.example.entity.Account;
import com.example.entity.Admin;
import com.example.exception.CustomException;
import com.example.mapper.AdminMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class AdminService {

    @Resource
    private AdminMapper adminMapper;

    /**
     * 登陆
     */
    public Account login(Account account) {
        Account dbAdmin = adminMapper.selectByUsername(account.getUsername());
        if (dbAdmin == null) {
            // 没查找到用户
            throw new CustomException("Username or password is incorrect");
        }
        // 比较密码
        if (!dbAdmin.getPassword().equals(account.getPassword())) {
            throw new CustomException("Username or password is incorrect");
        }
        return dbAdmin;
    }
}
