package com.baitaplon.controller;

import com.baitaplon.model.QuestionDAO;
import com.baitaplon.objects.Student;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class QuizController {

    @RequestMapping(value = {"/sinhvien/thi-trac-nghiem"})
    public String quizStudent( Model model, HttpServletRequest request ) {
        QuestionDAO questionDAO = new QuestionDAO();
        List questionList = questionDAO.getList();
        model.addAttribute("questionList", questionList);
        return "student/quiz";
    }

    @RequestMapping(value = "/sinhvien/ket-qua-thi", method = RequestMethod.POST)
    public String handleQuizStudent( Model model, HttpServletRequest request, HttpServletResponse response ) {
        Map<Integer, String> mapStudentAnswer = new HashMap<Integer, String>();
        int i = 0;
        while (request.getParameter(String.valueOf(i)) != null) {
            String sAnswer = request.getParameter(String.valueOf(i));
            Integer questionID = Integer.parseInt(request.getParameter("questionID"+String.valueOf(i)));
            mapStudentAnswer.put(questionID, sAnswer);
            i++;
        }
        Student student = (Student) request.getSession().getAttribute("student");
        String StudentID = student.getId();
        QuestionDAO questionDAO = new QuestionDAO();
        questionDAO.addSV_Questions(student.getId(), mapStudentAnswer);
        return "redirect:/sinhvien/bang-diem";
    }

    @RequestMapping(value = "/sinhvien/bang-diem")
    public String scoreTable(Model model , HttpServletRequest request, HttpServletResponse response) {
        QuestionDAO questionDAO = new QuestionDAO();
        Student student = (Student) request.getSession().getAttribute("student");
        List sQuesstionList = questionDAO.getListScores(student.getId());
        int scores = questionDAO.getScores(student.getId());
        model.addAttribute("sQuesionList", sQuesstionList);
        model.addAttribute("scores", scores);
        return "student/scorestudent";
    }


}
