package com.baitaplon.controller;

import com.baitaplon.model.StudentsDAO;
import com.baitaplon.model.TeacherDAO;
import com.baitaplon.objects.Student;
import com.baitaplon.objects.Teacher;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.sql.SQLException;
import java.util.List;

@Controller
public class ManagerTeacherController {
    @RequestMapping(value = {"/manage-teacher"}, method = RequestMethod.GET)
    public ModelAndView manageStudent(HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        List<Teacher> teachers = null;
        String param = request.getParameter("page");
        int totalPage = 0;  // Số trang
        int recordPage = 10; // Số bản ghi trong một trang
        int currPage = 1;  // Trang hiện tại.
        if (param != null) {
            currPage = Integer.parseInt(param);   // Chuyển trang khi người dùng ấn vào số trang ở dưới.
        }
        if(request.getSession().getAttribute("admin") == null) {
            modelAndView.setViewName("redirect:/admin-login");
        }
        else {
            TeacherDAO teacherDAO = new TeacherDAO();
            try {
                int count = teacherDAO.countTeacher();
                teachers = teacherDAO.getListTeacher(recordPage, recordPage * (currPage - 1));
                totalPage = (int) Math.floor(count / recordPage) + 1;
            } catch (Exception e) {
                System.out.println("Can not get list teacher");
                e.printStackTrace();
            }
        }
        modelAndView.addObject("teachers", teachers);
        modelAndView.setViewName("teacher/manage-teacher");
        modelAndView.addObject("totalPage", totalPage);
        modelAndView.addObject("currPage", currPage);
        Teacher teacher = new Teacher();
        modelAndView.addObject(teacher);
        return  modelAndView;
    }

//    @RequestMapping(value = {"/manage-teacher/edit"}, method = RequestMethod.GET)
//    public ModelAndView editStudent(HttpServletRequest request) {
//        ModelAndView modelAndView = new ModelAndView();
//        String id = request.getParameter("id");
//        TeacherDAO teacherDAO = new TeacherDAO();
//        try {
//            Teacher teacher = (Teacher) teacherDAO.getInfo(id);
//            modelAndView.addObject("teacher", teacher);
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        modelAndView.setViewName("teacher/teacher-edit");
//        return  modelAndView;
//    }

    @RequestMapping(value = {"/manage-teacher/edit-db"}, method = RequestMethod.POST)
    public ModelAndView viewInfo(@ModelAttribute(name = "teacher") Teacher teacher, HttpServletRequest request) {
        String id = request.getParameter("id");
        teacher.setId(id);
        ModelAndView modelAndView = new ModelAndView();
        TeacherDAO teacherDAO = new TeacherDAO();
        try {
            teacherDAO.edit(teacher);
        } catch (SQLException e) {
            System.out.println("Can not edit");
            e.printStackTrace();
        }
        modelAndView.setViewName("redirect:/manage-teacher");
        return modelAndView;
    }

    @RequestMapping(value = {"/manage-teacher/edit-delete"}, method = RequestMethod.GET)
    public ModelAndView deleteStudent(HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        String id = request.getParameter("id");
        TeacherDAO teacherDAO = new TeacherDAO();
        try {
            teacherDAO.delete(id);
        } catch (SQLException e) {
            System.out.println("Can not delete");
            e.printStackTrace();
        }
        modelAndView.setViewName("redirect:/manage-teacher");
        return modelAndView;
    }

    @RequestMapping(value = {"/manage-teacher/add-teacher"}, method = RequestMethod.GET)
    public ModelAndView addStudent(HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        Teacher teacher = new Teacher();
        modelAndView.addObject("teacher", teacher);
        modelAndView.setViewName("teacher/add-teacher");
        return modelAndView;
    }

    @RequestMapping(value = {"/manage-teacher/add-teacher"}, method = RequestMethod.POST)
    public ModelAndView addStudent(@ModelAttribute(name = "teacher") Teacher teacher, HttpServletRequest request) {
//        Teacher temp = (Teacher) request.getSession().getAttribute("teacher");
        ModelAndView modelAndView = new ModelAndView();
        TeacherDAO teacherDAO = new TeacherDAO();
//        student.setMagv(temp.getId());
        try {
            teacherDAO.add(teacher);
        } catch (SQLException e) {
            System.out.println("Can not add");
            e.printStackTrace();
        }
        modelAndView.setViewName("redirect:/manage-teacher");
        return modelAndView;
    }

    @RequestMapping(value = {"/manage-teacher/search"}, method = RequestMethod.GET)
    public ModelAndView search(HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        String search = request.getParameter("search");
        if(search == "") {
            modelAndView.setViewName("redirect:/manage-teacher");
            return modelAndView;
        }

        List<Teacher> teachers = null;
        String param = request.getParameter("page");
        int totalPage = 0;  // Số trang
        int recordPage = 10; // Số bản ghi trong một trang
        int currPage = 1;  // Trang hiện tại.
        if (param != null) {
            currPage = Integer.parseInt(param);   // Chuyển trang khi người dùng ấn vào số trang ở dưới.
        }
        if(request.getSession().getAttribute("admin") == null) {
            modelAndView.setViewName("redirect:/admin-login");
        }
        else {
            TeacherDAO teacherDAO = new TeacherDAO();
            try {
                int count = teacherDAO.countTeacher();
                teachers = teacherDAO.find(search,recordPage, recordPage * (currPage - 1));
                totalPage = (int) Math.floor(count / recordPage) + 1;
            } catch (Exception e) {
                System.out.println("Can not get list teacher");
                e.printStackTrace();
            }
        }
        modelAndView.addObject("teachers", teachers);
        modelAndView.setViewName("teacher/manage-teacher");
        modelAndView.addObject("totalPage", totalPage);
        modelAndView.addObject("currPage", currPage);
        Teacher teacher = new Teacher();
        modelAndView.addObject("teacher", teacher);
        return  modelAndView;
    }
}
