package com.baitaplon.controller;

import com.baitaplon.model.StudentsDAO;
import com.baitaplon.objects.Student;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class LoginController {
    @RequestMapping(value = {"/student-login"}, method = RequestMethod.GET)
    public String studentLogin(@ModelAttribute(name = "error") String error) {
        return "login/loginStudent";
    }

    // Nhận dữ liệu bằng phương thức POST
    @RequestMapping(value = {"/student-login"}, method = RequestMethod.POST)
    public ModelAndView studentLogin(@RequestParam(name = "username") String username,
                                     @RequestParam(name = "password") String password, RedirectAttributes redirectAttributes, HttpSession httpSession, HttpServletRequest request, Model model) {
        ModelAndView modelAndView = new ModelAndView();
        if (username == "" || password == "") {
            String error = "Please complete username and password !";
            modelAndView.addObject("error", error);
            modelAndView.setViewName("redirect:/student-login");

        } else {
            StudentsDAO studentsDAO = new StudentsDAO();
            try {
                Student student = studentsDAO.checkLogin(username, password);
                if (student != null) {
                    request.getSession().setAttribute("student", student);
                    modelAndView.setViewName("redirect:/sutudent/info");
                }
                else {
                    String error = "Username or password invalid !!!";
                    modelAndView.addObject("error", error);
                    modelAndView.setViewName("redirect:/student-login");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return  modelAndView;
    }

    @RequestMapping(value = {"/teacher-login"})
    public String teacherLogin() {
        return "login/loginTeacher";
    }
}
