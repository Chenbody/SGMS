package com.example.mapper;

import com.example.entity.Course;
import com.example.entity.StudentCourse;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface StudentCourseMapper {

    @Insert("insert into student_course (name, no, student_id, course_id) values (#{name}, #{no}, #{studentId}, #{courseId})")
    void insert(StudentCourse studentCourse);

    @Select("select * from student_course where student_id = #{studentId} and course_id = #{courseId}")
    StudentCourse selectByCondition(StudentCourse studentCourse);

//    @Select("select * from student_course where name like concat('%', #{name}, '%') and no like concat('%', #{no}, '%') and student_id = #{studentId}")
    List<StudentCourse> selectAll(StudentCourse studentCourse);

    @Delete("delete from student_course where id=#{id}")
    void deleteById(Integer id);

    @Select("select c.id, c.name, c.no, c.description, c.times, c.teacher, case when sc.id is not null then 'Yes' else 'No' end as isSelected from course c left join student_course sc on c.id = sc.course_id and sc.student_id = #{studentId} where c.name like concat('%', #{name}, '%') and c.no like concat('%', #{no}, '%') and c.teacher like concat('%', #{teacher}, '%') order by c.id desc")
    List<Course> studentSelect(Course course);
}
