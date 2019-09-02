package com.baitaplon.controller;

import com.baitaplon.objects.Student;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
public class StudentController {
    @RequestMapping("/sutudent/info")
    public ModelAndView viewInfo(HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        if(request.getSession().getAttribute("student") == null){
            modelAndView.setViewName("redirect:/student-login");
        }
        else {
            modelAndView.setViewName("student/student-info");
        }
        return modelAndView;
    }
}
