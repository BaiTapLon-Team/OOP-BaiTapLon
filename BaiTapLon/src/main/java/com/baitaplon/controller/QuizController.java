package com.baitaplon.controller;

import com.baitaplon.model.QuestionDAO;
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

    @RequestMapping(value = {"/thi-trac-nghiem"})
    public String quizStudent( Model model ) {
        QuestionDAO questionDAO = new QuestionDAO();
        List questionList = questionDAO.getList();
        model.addAttribute("questionList", questionList);
        return "thitracnghiem";
    }

    @RequestMapping(value = "/ket-qua-thi", method = RequestMethod.POST)
    public String handleQuizStudent( Model model, HttpServletRequest request, HttpServletResponse response ) {
        Map<Integer, String> mapStudentAnswer = new HashMap<Integer, String>();
        int i = 0;
        while (request.getParameter(String.valueOf(i)) != null) {
            String sAnswer = request.getParameter(String.valueOf(i));
            Integer questionID = Integer.parseInt(request.getParameter("questionID"+String.valueOf(i)));
            mapStudentAnswer.put(questionID, sAnswer);
            i++;
        }
        System.out.println(mapStudentAnswer);
        return "sinhvien";
    }

}
