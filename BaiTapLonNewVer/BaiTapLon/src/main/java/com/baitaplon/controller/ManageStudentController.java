package com.baitaplon.controller;

import com.baitaplon.model.StudentsDAO;
import com.baitaplon.objects.Admin;
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
public class ManageStudentController {
    @RequestMapping(value = {"/manage-student"}, method = RequestMethod.GET)
    public ModelAndView manageStudent(HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        List<Student> students = null;
        String param = request.getParameter("page");
        int totalPage = 0;  // Số trang
        int recordPage = 10; // Số bản ghi trong một trang
        int currPage = 1;  // Trang hiện tại.
        if (param != null) {
            currPage = Integer.parseInt(param);   // Chuyển trang khi người dùng ấn vào số trang ở dưới.
        }
        StudentsDAO studentsDAO = new StudentsDAO();
        try {
            int count = studentsDAO.countStudent();
            students = studentsDAO.getListStudent(recordPage, recordPage * (currPage - 1));
            totalPage = (int) Math.floor(count / recordPage) + 1;
        } catch (Exception e) {
            System.out.println("Can not get list students");
            e.printStackTrace();
        }
        modelAndView.addObject("students", students);
        modelAndView.setViewName("student/manage-student");
        modelAndView.addObject("totalPage", totalPage);
        modelAndView.addObject("currPage", currPage);
        Student student = new Student();
        modelAndView.addObject("student", student);
        return  modelAndView;
    }

//    @RequestMapping(value = {"/manage-student/edit"}, method = RequestMethod.GET)
//    public ModelAndView editStudent(HttpServletRequest request) {
//        ModelAndView modelAndView = new ModelAndView();
//        String id = request.getParameter("id");
//        StudentsDAO studentsDAO = new StudentsDAO();
//        try {
//            Student student = (Student)studentsDAO.getInfo(id);
//            modelAndView.addObject("student", student);
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        modelAndView.setViewName("student/student-edit");
//        return  modelAndView;
//    }

    @RequestMapping(value = {"/manage-student/edit-db"}, method = RequestMethod.POST)
    public ModelAndView viewInfo(@ModelAttribute(name = "student") Student student, HttpServletRequest request) {
//        String id = request.getParameter("id");
//        student.setId(id);
        ModelAndView modelAndView = new ModelAndView();
        StudentsDAO studentsDAO = new StudentsDAO();
        try {
            studentsDAO.edit(student);
        } catch (SQLException e) {
            System.out.println("Can not edit");
            e.printStackTrace();
        }
        modelAndView.setViewName("redirect:/manage-student");
        return modelAndView;
    }

    @RequestMapping(value = {"/manage-student/edit-delete"}, method = RequestMethod.GET)
    public ModelAndView deleteStudent(HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        String id = request.getParameter("id");
        StudentsDAO studentsDAO = new StudentsDAO();
        try {
            studentsDAO.delete(id);
        } catch (SQLException e) {
            System.out.println("Can not delete");
            e.printStackTrace();
        }
        modelAndView.setViewName("redirect:/manage-student");
        return modelAndView;
    }

    @RequestMapping(value = {"/manage-student/add-student"}, method = RequestMethod.GET)
    public ModelAndView addStudent(HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        Student student = new Student();
        modelAndView.addObject("student", student);
        modelAndView.setViewName("student/add-student");
        return modelAndView;
    }

    @RequestMapping(value = {"/manage-student/add-student"}, method = RequestMethod.POST)
    public ModelAndView addStudent(@ModelAttribute(name = "student") Student student, HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        StudentsDAO studentsDAO = new StudentsDAO();
        try {
            studentsDAO.add(student);
        } catch (SQLException e) {
            System.out.println("Can not add");
            e.printStackTrace();
        }
        modelAndView.setViewName("redirect:/manage-student");
        return modelAndView;
    }
    @RequestMapping(value = {"/manage-student/search"}, method = RequestMethod.GET)
    public ModelAndView search(HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        String search = request.getParameter("search");
        System.out.println(search);
        if(search == "") {
            modelAndView.setViewName("redirect:/manage-student");
            return modelAndView;
        }
        List<Student> students = null;
        String param = request.getParameter("page");
        int totalPage = 0;  // Số trang
        int recordPage = 10; // Số bản ghi trong một trang
        int currPage = 1;  // Trang hiện tại.
        if (param != null) {
            currPage = Integer.parseInt(param);   // Chuyển trang khi người dùng ấn vào số trang ở dưới.
        }
        StudentsDAO studentsDAO = new StudentsDAO();
        try {
            int count = studentsDAO.countStudent();
            students = studentsDAO.find(search,recordPage, recordPage * (currPage - 1));
            totalPage = (int) Math.floor(count / recordPage) + 1;
        } catch (Exception e) {
            System.out.println("Can not get list students");
            e.printStackTrace();
        }
        modelAndView.addObject("students", students);
        modelAndView.setViewName("student/manage-student");
        modelAndView.addObject("totalPage", totalPage);
        modelAndView.addObject("currPage", currPage);
        Student student = new Student();
        modelAndView.addObject("student", student);
        return modelAndView;
    }
}
