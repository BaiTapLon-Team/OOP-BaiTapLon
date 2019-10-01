package com.baitaplon.controller;

import com.baitaplon.model.StudentsDAO;
import com.baitaplon.objects.Student;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.sql.SQLException;

@Controller
public class StudentController {
    @RequestMapping(value = {"/student/info"}, method = RequestMethod.GET)
    public ModelAndView viewInfo(HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        if(request.getSession().getAttribute("student") == null){
            modelAndView.setViewName("redirect:/student-login");
        }
        else {
            Student student = (Student) request.getSession().getAttribute("student");
            StudentsDAO studentsDAO = new StudentsDAO();
            try {
                student = (Student) studentsDAO.getInfo(student.getId());
                // cập nhật lại session khi mà chỉnh sửa thông tin
                request.getSession().setAttribute("student", student);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            modelAndView.addObject("student", student);
            modelAndView.setViewName("student/student-info");
        }
        return modelAndView;
    }

    @RequestMapping(value = {"/student/info-edit"}, method = RequestMethod.POST)
    public ModelAndView viewInfo(@ModelAttribute(name = "student") Student student, HttpServletRequest request) {
        Student temp = (Student) request.getSession().getAttribute("student");
        student.setId(temp.getId());
        ModelAndView modelAndView = new ModelAndView();
        StudentsDAO studentsDAO = new StudentsDAO();
        try {
            studentsDAO.edit(student);
        } catch (SQLException e) {
            System.out.println("Can not edit");
            e.printStackTrace();
        }
        modelAndView.setViewName("redirect:/student/info");
        return modelAndView;
    }
}
