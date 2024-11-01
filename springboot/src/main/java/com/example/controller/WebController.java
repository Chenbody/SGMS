package com.example.controller;

import com.example.common.Result;
import com.example.common.RoleEnum;
import com.example.entity.Account;
import com.example.entity.Admin;
import com.example.service.AdminService;
import com.example.service.StudentService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

@RestController
public class WebController {

    @Resource
    private AdminService adminService;

    @Resource
    private StudentService studentService;

    /**
     * 默认请求接口
     */
    @GetMapping("/")
    public Result hello() {
        return Result.success();
    }

    /**
     * 登陆接口
     */
    @PostMapping("/login")
    public Result login(@RequestBody Account account) {

        Account dbAccount;
        if (RoleEnum.ADMIN.name().equals(account.getRole())) { // 管理员登陆
            dbAccount = adminService.login(account);
        } else if (RoleEnum.STUDENT.name().equals(account.getRole())) { // 学生登陆
            dbAccount = studentService.login(account);
        } else {
            return Result.error("角色错误");
        }

        return Result.success(dbAccount);
    }

}
