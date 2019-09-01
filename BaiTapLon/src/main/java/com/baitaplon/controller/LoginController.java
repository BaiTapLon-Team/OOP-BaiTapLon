package com.baitaplon.controller;

import com.baitaplon.model.StudentsDAO;
import com.baitaplon.objects.Student;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.SQLException;

@Controller
public class LoginController {
    @RequestMapping(value = {"/student-login"}, method = RequestMethod.GET)
    public String studentLogin(Model model, @ModelAttribute(name = "error") String error, HttpServletRequest request) {
        request.setAttribute("error", error);
        return "loginStudent";
    }

    // Nhận dữ liệu bằng phương thức POST
    @RequestMapping(value = {"/student-login"}, method = RequestMethod.POST)
    public String studentLogin(@RequestParam(name = "username") String username,
                               @RequestParam(name = "password") String password, RedirectAttributes redirectAttributes) {
        if (username == "" || password == "") {
            String error = "Please complete username and password !";
            redirectAttributes.addFlashAttribute("error", error);
            return "redirect:/student-login";
        } else {
            StudentsDAO studentsDAO = new StudentsDAO();
            try {
                Student student = studentsDAO.checkLogin(username, password);
                if (student != null) {
                    redirectAttributes.addFlashAttribute("sinhvien", student);
                    return "redirect:/ok";
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        String error = "Username or password invalid !!!";
        redirectAttributes.addFlashAttribute("error", error);
        return "redirect:/student-login";
    }

    @RequestMapping(value = {"/teacher-login"})
    public String teacherLogin() {
        return "loginTeacher";
    }

    @RequestMapping("/ok")
    public String loginOk(@ModelAttribute(name = "sinhvien") Student student, Model model, HttpServletRequest request) {
//        model.addAttribute("sutudent", student);
        HttpSession httpSession = request.getSession();
        httpSession.setAttribute("sutudent", student);
        return "admin";
    }

    //Thử xem nào.
}
