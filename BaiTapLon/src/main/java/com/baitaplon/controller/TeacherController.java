package com.baitaplon.controller;

import com.baitaplon.model.QuestionDAO;
import com.baitaplon.model.SVQuestionDAO;
import com.baitaplon.model.TeacherDAO;
import com.baitaplon.objects.Question;
import com.baitaplon.objects.SVQuestion;
import com.baitaplon.objects.Teacher;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

    @RequestMapping(value = "/teacher/list-question", method = RequestMethod.GET)
    public String handleQuestion( Model model ) {
        QuestionDAO questionDAO = new QuestionDAO();
        List questionList = questionDAO.getList();
        Question question = new Question();
        model.addAttribute("question", question);
        model.addAttribute("questionList", questionList);
        return "teacher/list-question";
    }

    @RequestMapping(value = "/teacher/list-question/add", method = RequestMethod.POST)
    public String addQuestion( Model model, @ModelAttribute(name = "question")Question question ) {
        QuestionDAO questionDAO = new QuestionDAO();
        try {
            questionDAO.add(question);
        }catch (Exception ex)
        {
            ex.printStackTrace();
            return "redirect:/teacher/list-question";
        }
        return "redirect:/teacher/list-question";
    }

    @RequestMapping(value = "/teacher/list-question/delete", method = RequestMethod.GET)
    public String deleteQuestion( Model model, HttpServletRequest request ) {
        QuestionDAO questionDAO = new QuestionDAO();
        String id = request.getParameter("id");
        try {
            questionDAO.delete(id);
        }catch (Exception ex)
        {
            ex.printStackTrace();
            return "redirect:/teacher/list-question";
        }
        return "redirect:/teacher/list-question";
    }

    @RequestMapping(value = "/teacher/list-question/edit", method = RequestMethod.GET)
    public String editQuestion( Model model, HttpServletRequest request ) {
        QuestionDAO questionDAO = new QuestionDAO();
        Question question = new Question();
        question.setQuestionID(Integer.parseInt(request.getParameter("questionID")));
        question.setContent(request.getParameter("content"));
        question.setCorrect(request.getParameter("correct"));
        question.setAnwserA(request.getParameter("answer_a"));
        question.setAnwserB(request.getParameter("answer_b"));
        question.setAnwserC(request.getParameter("answer_c"));
        question.setAnwserD(request.getParameter("answer_d"));
        try {
            questionDAO.edit(question);
        }catch (Exception ex)
        {
            ex.printStackTrace();
            return "redirect:/teacher/list-question";
        }
        return "redirect:/teacher/list-question";
    }

    @RequestMapping(value = "/teacher/scores-table", method = RequestMethod.GET)
    public String showScoresTable(Model model) {
        SVQuestionDAO svQuestionDAO = new SVQuestionDAO();
        List scoresList;
        try {
            scoresList = svQuestionDAO.getScoresList();
            model.addAttribute("scoresList", scoresList);
            return "teacher/scores-table";
        } catch (Exception ex) {
            ex.printStackTrace();
            return "redirect:/teacher/info";
        }
    }
}
