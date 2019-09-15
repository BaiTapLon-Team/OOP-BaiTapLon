package com.baitaplon.controller;

import com.baitaplon.model.QuestionDAO;
import com.baitaplon.model.SVQuestionDAO;
import com.baitaplon.objects.Question;
import com.baitaplon.objects.SQuestion;
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
        try {
            while (request.getParameter(String.valueOf(i)) != null) {
                String sAnswer = request.getParameter(String.valueOf(i));
                Integer questionID = Integer.parseInt(request.getParameter("questionID" + String.valueOf(i)));
                mapStudentAnswer.put(questionID, sAnswer);
                i++;
            }
            Student student = (Student) request.getSession().getAttribute("student");
            String StudentID = student.getId();
            SVQuestionDAO svQuestionDAO = new SVQuestionDAO();
            if (svQuestionDAO.getAnswerList(student.getId()).size() == 0) {
                svQuestionDAO.addSV_Questions(student.getId(), mapStudentAnswer);
                svQuestionDAO.addScores(student.getId(), svQuestionDAO.getScores(student.getId()));
            } else {
                svQuestionDAO.updateSV_Questions(student.getId(), mapStudentAnswer);
                svQuestionDAO.updateScores(student.getId(), svQuestionDAO.getScores(student.getId()));
            }
            return "redirect:/sinhvien/bang-diem";
        } catch (Exception ex) {
            ex.printStackTrace();
            return "Thi thất bại. Để yên và báo cho giám thị ở đó. Thi ca sau !";
        }
    }

    @RequestMapping(value = "/sinhvien/bang-diem")
    public String scoreTableSV(Model model , HttpServletRequest request, HttpServletResponse response) {
        SVQuestionDAO svQuestionDAO = new SVQuestionDAO();
        Student student = (Student) request.getSession().getAttribute("student");
        List sQuesstionList = svQuestionDAO.getAnswerList(student.getId());
        int scores = svQuestionDAO.getScores(student.getId());
        if(sQuesstionList.size() == 0) {
            SQuestion sQuestion = new SQuestion(student.getId(), 0, "Bạn chưa thi lần nào", " ", " ");
            sQuesstionList.add(sQuestion);
            model.addAttribute("sQuesionList", sQuesstionList);
            model.addAttribute("scores", scores);
        } else {
            model.addAttribute("sQuesionList", sQuesstionList);
            model.addAttribute("scores", scores);
        }
        return "student/scorestudent";
    }


}
