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

    @RequestMapping(value = {"/teacher/manage-student"}, method = RequestMethod.GET)
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
        if(request.getSession().getAttribute("teacher") == null) {
            modelAndView.setViewName("redirect:/teacher-login");
        }
        else {
            StudentsDAO studentsDAO = new StudentsDAO();
            try {
                int count = studentsDAO.countStudent();
                students = studentsDAO.getListStudent(recordPage, recordPage * (currPage - 1));
                totalPage = (int) Math.floor(count / recordPage) + 1;

            } catch (Exception e) {
                System.out.println("Can not get list students");
                e.printStackTrace();
            }
        }
        modelAndView.addObject("students", students);
        modelAndView.setViewName("teacher/manage-student");
        modelAndView.addObject("totalPage", totalPage);
        modelAndView.addObject("currPage", currPage);
        return  modelAndView;
    }

    @RequestMapping(value = {"/teacher/manage-student/edit"}, method = RequestMethod.GET)
    public ModelAndView editStudent(HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        String id = request.getParameter("id");
        StudentsDAO studentsDAO = new StudentsDAO();
        try {
            Student student = (Student)studentsDAO.getInfo(id);
            modelAndView.addObject("student", student);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        modelAndView.setViewName("teacher/student-edit");
        return  modelAndView;
    }

    @RequestMapping(value = {"/teacher/manage-student/edit-db"}, method = RequestMethod.POST)
    public ModelAndView viewInfo(@ModelAttribute(name = "student") Student student, HttpServletRequest request) {
        String id = request.getParameter("id");
        student.setId(id);
        ModelAndView modelAndView = new ModelAndView();
        StudentsDAO studentsDAO = new StudentsDAO();
        try {
            studentsDAO.edit(student);
        } catch (SQLException e) {
            System.out.println("Can not edit");
            e.printStackTrace();
        }
        modelAndView.setViewName("redirect:/teacher/manage-student");
        return modelAndView;
    }

    @RequestMapping(value = {"/teacher/manage-student/edit-delete"}, method = RequestMethod.GET)
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
        modelAndView.setViewName("redirect:/teacher/manage-student");
        return modelAndView;
    }

    @RequestMapping(value = {"/teacher/manage-student/add-student"}, method = RequestMethod.GET)
    public ModelAndView addStudent(HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        Student student = new Student();
        modelAndView.addObject("student", student);
        modelAndView.setViewName("teacher/add-student");
        return modelAndView;
    }

    @RequestMapping(value = {"/teacher/manage-student/add-student"}, method = RequestMethod.POST)
    public ModelAndView addStudent(@ModelAttribute(name = "student") Student student, HttpServletRequest request) {
        Teacher temp = (Teacher) request.getSession().getAttribute("teacher");
        ModelAndView modelAndView = new ModelAndView();
        StudentsDAO studentsDAO = new StudentsDAO();
        student.setMagv(temp.getId());
        try {
            studentsDAO.add(student);
        } catch (SQLException e) {
            System.out.println("Can not add");
            e.printStackTrace();
        }
        modelAndView.setViewName("redirect:/teacher/manage-student");
        return modelAndView;
    }
}
