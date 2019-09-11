package com.baitaplon.controller;

import com.baitaplon.model.TeacherDAO;
import com.baitaplon.objects.Teacher;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.sql.SQLException;

@Controller
public class TeacherController {
    @RequestMapping(value = {"/teacher/info"}, method = RequestMethod.GET)
    public ModelAndView viewInfo(HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        if(request.getSession().getAttribute("teacher") == null){
            modelAndView.setViewName("redirect:/teacher-login");
        }
        else {
            Teacher teacher = (Teacher) request.getSession().getAttribute("teacher");
            TeacherDAO teacherDAO = new TeacherDAO();
            try {
                teacher = (Teacher) teacherDAO.getInfo(teacher.getId());
                // cập nhật lại session khi mà chỉnh sửa thông tin
                request.getSession().setAttribute("teacher", teacher);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            modelAndView.addObject("teacher", teacher);
            modelAndView.setViewName("teacher/teacher-info");
        }
        return modelAndView;
    }

    @RequestMapping(value = {"/teacher/info-edit"}, method = RequestMethod.POST)
    public ModelAndView viewInfo(@ModelAttribute(name = "teacher") Teacher teacher, HttpServletRequest request) {
        Teacher temp = (Teacher) request.getSession().getAttribute("teacher");
        teacher.setId(temp.getId());
        ModelAndView modelAndView = new ModelAndView();
        TeacherDAO teacherDAO = new TeacherDAO();
        try {
            teacherDAO.edit(teacher);
        } catch (SQLException e) {
            System.out.println("Can not edit");
            e.printStackTrace();
        }
        modelAndView.setViewName("redirect:/teacher/info");
        return modelAndView;
    }
}
