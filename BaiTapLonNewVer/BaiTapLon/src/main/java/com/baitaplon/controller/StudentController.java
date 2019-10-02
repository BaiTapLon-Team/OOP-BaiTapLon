package com.baitaplon.controller;

import com.baitaplon.model.AdminDAO;
import com.baitaplon.model.StudentsDAO;
import com.baitaplon.objects.Admin;
import com.baitaplon.objects.Student;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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

    @RequestMapping(value = {"/student/editPass"}, method = RequestMethod.GET)
    public ModelAndView editPassword(@ModelAttribute(name = "error") String error) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("error", error);
        modelAndView.setViewName("student/editPassword");
        return modelAndView;
    }

    @RequestMapping(value = {"/student/editPassPost"}, method = RequestMethod.POST)
    public ModelAndView editPassword(@RequestParam(name = "password") String password,
                                     @RequestParam(name = "newpass") String newpass, HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        Student user = (Student) request.getSession().getAttribute("student");
        StudentsDAO studentsDAO = new StudentsDAO();
        String error;
        try {
            if(studentsDAO.editPass(user.getUsername(), password, newpass)) {
                error = "Đổi mật khẩu thành công";
                modelAndView.addObject("error", error);
                modelAndView.setViewName("redirect:/student/editPass");
            }
            else {
                error = "Mật khẩu cũ không chính xác";
                modelAndView.addObject("error", error);
                modelAndView.setViewName("redirect:/student/editPass");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return modelAndView;
    }
}
