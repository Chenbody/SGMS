package com.example.service;

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
    public Admin login(Admin admin) {
        Admin dbAdmin = adminMapper.selectByUsername(admin.getUsername());
        if (dbAdmin == null) {
            // 没查找到用户
            throw new CustomException("账号或密码错误");
        }
        // 比较密码
        if (!dbAdmin.getPassword().equals(admin.getPassword())) {
            throw new CustomException("账号或密码错误");
        }
        return dbAdmin;
    }
}
