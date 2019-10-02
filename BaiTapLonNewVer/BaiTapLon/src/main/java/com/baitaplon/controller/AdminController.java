package com.baitaplon.controller;

import com.baitaplon.model.AdminDAO;
import com.baitaplon.model.TeacherDAO;
import com.baitaplon.objects.Admin;
import com.baitaplon.objects.Teacher;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.sql.SQLException;

@Controller
public class AdminController {
    @RequestMapping(value = {"/admin/info"}, method = RequestMethod.GET)
    public ModelAndView viewInfo(HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        if(request.getSession().getAttribute("admin") == null){
            modelAndView.setViewName("redirect:/admin-login");
        }
        else {
            Admin admin = (Admin) request.getSession().getAttribute("admin");
            AdminDAO adminDAO = new AdminDAO();
            try {
                admin = (Admin) adminDAO.getInfo(admin.getId());
                // cập nhật lại session khi mà chỉnh sửa thông tin
                request.getSession().setAttribute("admin", admin);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            modelAndView.addObject("admin", admin);
            modelAndView.setViewName("admin/admin-info");
        }
        return modelAndView;
    }

    @RequestMapping(value = {"/admin/info-edit"}, method = RequestMethod.POST)
    public ModelAndView viewInfo(@ModelAttribute(name = "admin") Admin admin, HttpServletRequest request) {
        Admin temp = (Admin) request.getSession().getAttribute("admin");
        admin.setId(temp.getId());
        ModelAndView modelAndView = new ModelAndView();
        AdminDAO adminDAO = new AdminDAO();
        try {
            adminDAO.edit(admin);
        } catch (SQLException e) {
            System.out.println("Can not edit");
            e.printStackTrace();
        }
        modelAndView.setViewName("redirect:/admin/info");
        return modelAndView;
    }

    @RequestMapping(value = {"/admin/editPass"}, method = RequestMethod.GET)
    public ModelAndView editPassword(@ModelAttribute(name = "error") String error) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("error", error);
        modelAndView.setViewName("admin/editPassword");
        return modelAndView;
    }

    @RequestMapping(value = {"/admin/editPassPost"}, method = RequestMethod.POST)
    public ModelAndView editPassword(@RequestParam(name = "password") String password,
                                     @RequestParam(name = "newpass") String newpass, HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        Admin user = (Admin) request.getSession().getAttribute("admin");
        AdminDAO adminDAO = new AdminDAO();
        String error;
        try {
            if(adminDAO.editPass(user.getUsername(), password, newpass)) {
                error = "Đổi mật khẩu thành công";
                modelAndView.addObject("error", error);
                modelAndView.setViewName("redirect:/admin/editPass");
            }
            else {
                error = "Mật khẩu cũ không chính xác";
                modelAndView.addObject("error", error);
                modelAndView.setViewName("redirect:/admin/editPass");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return modelAndView;
    }
}
