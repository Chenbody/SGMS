package com.example.mapper;

import com.example.entity.Student;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface StudentMapper {

    @Select("select * from student where username = #{username}")
    Student selectByUsername(String username);

    @Select("select * from student where username like concat('%', #{username}, '%') and name like concat('%', #{name}, '%') order by id desc")
    List<Student> selectAll(Student student);

    @Insert("insert into student (username, password, name, phone, email, sex, birth, avatar, role) values (#{username}, #{password}, #{name}, #{phone}, #{email}, #{sex}, #{birth}, #{avatar}, #{role})")
    void insert(Student student);

    @Delete("delete from student where id = #{id}")
    void deleteById(Integer id);

    @Update("update student set username = #{username}, password = #{password}, name = #{name}, phone = #{phone}, email = #{email}, sex = #{sex}, birth = #{birth}, avatar = #{avatar} where id = #{id}")
    void updateById(Student student);

    @Select("select * from student where id = #{id}")
    Student selectById(Student student);
}
