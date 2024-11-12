package com.example.controller;

import com.example.common.Result;
import com.example.entity.Student;
import com.example.service.StudentService;
import com.github.pagehelper.PageInfo;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@RestController
@RequestMapping("/student")
public class StudentController {

    @Resource
    StudentService studentService;

    @PostMapping("/add")
    public Result add(@RequestBody Student student) {
        studentService.add(student);
        return Result.success();
    }

    @DeleteMapping("/delete/{id}")
    public Result delete(@PathVariable Integer id) {
        studentService.deleteById(id);
        return Result.success();
    }

    @PutMapping("/update")
    public Result update(@RequestBody Student student) {
        Student dbStudent = studentService.selectById(student);

        if (dbStudent.getAvatar() != null) {
            try {
                // 解析文件名
                String baseUrl = "http://localhost:9090/files/download?fileName=";
                String fileName = dbStudent.getAvatar().substring(baseUrl.length());
                Path path = Paths.get(System.getProperty("user.dir") + "/files/avatars/" + fileName);

                // 删除文件
                if (Files.exists(path)) {
                    Files.delete(path);
                }
            } catch (Exception e) {
                e.printStackTrace();
                return Result.error("Failed to delete avatar file");
            }
        }

        studentService.updateById(student);
        return Result.success();
    }

    @GetMapping("/selectPage")
    public Result selectPage(@RequestParam(defaultValue = "1") Integer pageNum,
                             @RequestParam(defaultValue = "5") Integer pageSize,
                             Student student) {
        PageInfo<Student> pageInfo = studentService.selectPage(pageNum, pageSize, student);
        return Result.success(pageInfo);
    }
}
