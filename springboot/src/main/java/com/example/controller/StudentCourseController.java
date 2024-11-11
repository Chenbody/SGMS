package com.example.controller;

import com.example.common.Result;
import com.example.entity.Course;
import com.example.entity.StudentCourse;
import com.example.service.StudentCourseService;
import com.github.pagehelper.PageInfo;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

@RestController
@RequestMapping("/studentCourse")
public class StudentCourseController {

    @Resource
    StudentCourseService studentCourseService;

    /**
     * 添加选课，学生选课
     */
    @PostMapping("/add")
    public Result add(@RequestBody StudentCourse studentCourse) {
        studentCourseService.add(studentCourse);
        return Result.success();
    }

    /**
     * 展示学生的选课列表
     */
    @GetMapping("/studentSelect")
    public Result studentSelect(@RequestParam(defaultValue = "1") Integer pageNum,
                             @RequestParam(defaultValue = "5") Integer pageSize,
                             Course course) {
        PageInfo<Course> pageInfo = studentCourseService.studentSelect(pageNum, pageSize, course);
        return Result.success(pageInfo);
    }

    /**
     * 展示选课记录
     */
    @GetMapping("/selectPage")
    public Result selectPage(@RequestParam(defaultValue = "1") Integer pageNum,
                             @RequestParam(defaultValue = "5") Integer pageSize,
                             StudentCourse studentCourse) {
        PageInfo<StudentCourse> pageInfo = studentCourseService.selectPage(pageNum, pageSize, studentCourse);
        return Result.success(pageInfo);
    }

    /**
     * 删除选课
     */
    @DeleteMapping("/delete/{id}")
    public Result delete(@PathVariable Integer id) {
        studentCourseService.deleteById(id);
        return Result.success();
    }

}
