package com.baitaplon.controller;

import com.baitaplon.model.AdminDAO;
import com.baitaplon.model.StudentsDAO;
import com.baitaplon.model.TeacherDAO;
import com.baitaplon.objects.Admin;
import com.baitaplon.objects.Student;
import com.baitaplon.objects.Teacher;
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
                                     @RequestParam(name = "password") String password, HttpServletRequest request) {
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
                    modelAndView.setViewName("redirect:/student/info");
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

    @RequestMapping(value = { "/logout" }, method = RequestMethod.GET)
    public ModelAndView logoutStudent(HttpServletRequest request) {
        request.getSession().setAttribute("student", null);
        request.getSession().setAttribute("teacher", null);
        request.getSession().setAttribute("admin", null);
        ModelAndView model = new ModelAndView();
        model.setViewName("redirect:/home");
        return model;
    }

    @RequestMapping(value = {"/teacher-login"})
    public String teacherLogin(@ModelAttribute(name = "error") String error) {
        return "login/loginTeacher";
    }

    @RequestMapping(value = {"/teacher-login"}, method = RequestMethod.POST)
    public ModelAndView teacherLogin(@RequestParam(name = "username") String username,
                                     @RequestParam(name = "password") String password, HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        if (username == "" || password == "") {
            String error = "Please complete username and password !";
            modelAndView.addObject("error", error);
            modelAndView.setViewName("redirect:/teacher-login");
        } else {
            TeacherDAO teacherDAO = new TeacherDAO();
            try {
                Teacher teacher = teacherDAO.checkLogin(username, password);
                if (teacher != null) {
                    request.getSession().setAttribute("teacher", teacher);
                    modelAndView.setViewName("redirect:/teacher/info");
                }
                else {
                    String error = "Username or password invalid !!!";
                    modelAndView.addObject("error", error);
                    modelAndView.setViewName("redirect:/teacher-login");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return  modelAndView;
    }

    @RequestMapping(value = {"/admin-login"})
    public String adminLogin(@ModelAttribute(name = "error") String error) {
        return "login/loginAdmin";
    }

    @RequestMapping(value = {"/admin-login"}, method = RequestMethod.POST)
    public ModelAndView adminLogin(@RequestParam(name = "username") String username,
                                     @RequestParam(name = "password") String password, HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        if (username == "" || password == "") {
            String error = "Please complete username and password !";
            modelAndView.addObject("error", error);
            modelAndView.setViewName("redirect:/admin-login");
        } else {
            AdminDAO adminDAO = new AdminDAO();
            try {
                Admin admin = adminDAO.checkLogin(username, password);
                if (admin != null) {
                    request.getSession().setAttribute("admin", admin);
                    modelAndView.setViewName("redirect:/admin/info");
                }
                else {
                    String error = "Username or password invalid !!!";
                    modelAndView.addObject("error", error);
                    modelAndView.setViewName("redirect:/admin-login");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return  modelAndView;
    }

}
