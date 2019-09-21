package com.baitaplon.model;

import com.baitaplon.objects.SQuestion;
import com.baitaplon.objects.SVQuestion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class SVQuestionDAO {
    //Khai báo các biến cần thiết để thao tác vs data
    private Connection connection = new ConnectDatabase().getConnection();
    private PreparedStatement preparedStatement = null;
    private ResultSet resultSet = null;

    //Thêm vào bảng sv_question 1 câu trả lời của 1 sinh viên
    public void addSV_Question( String studentID, int questionID, String answer ) {
        String sqlRequest = "INSERT INTO dbo.sv_question\n" +
                "(\n" +
                "    masv,\n" +
                "    questionid,\n" +
                "    answer\n" +
                ")\n" +
                "VALUES\n" +
                "(   '"+studentID+"', -- masv - varchar(50)\n" +
                "    "+questionID+",  -- questionid - int\n" +
                "    N'"+answer+"' -- answer - nvarchar(100)\n" +
                ")";
        try {
            preparedStatement = connection.prepareStatement(sqlRequest);
            preparedStatement.executeUpdate();
            System.out.println("insert sv_question successfuly");
        }catch (Exception ex) {
            System.out.println("insert sv_question Fail");
            ex.printStackTrace();
        }
    }

    //Thêm vào bảng sv_question 50 câu trả lời của 1 sinh viên
    public void addSV_Questions( String studentID, Map<Integer, String> answers) {
        for(Integer key : answers.keySet()) {
            addSV_Question(studentID, key, answers.get(key));
        }
    }

    //Lấy kết quả thi ra từ bẳng
    public  int getScores(String studentID) {
        int scores = 0;
        String sqlRequest = "SELECT COUNT(*) FROM dbo.question INNER JOIN dbo.sv_question\n" +
                "ON sv_question.questionid = question.questionid AND masv = '"+studentID+"' AND answer = correct";
        try {
            preparedStatement = connection.prepareStatement(sqlRequest);
            resultSet = preparedStatement.executeQuery();
            if(resultSet.next()) {
                scores = resultSet.getInt(1);
            }
            System.out.println("get Scores Susscess");
            return  scores;
        }catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("get Scores fail");
            return scores;
        }
    }

    public List getAnswerList( String studentID) {
        List<SQuestion> sQuestionList = new ArrayList<SQuestion>();
        String sqlRequest = "SELECT masv, sv_question.questionid, content, answer, correct FROM dbo.question INNER JOIN dbo.sv_question\n" +
                "ON sv_question.questionid = question.questionid AND masv = '"+studentID+"'";
        try {
            preparedStatement = connection.prepareStatement(sqlRequest);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                SQuestion sQuestion = new SQuestion();
                sQuestion.setStudentID(resultSet.getString("masv"));
                sQuestion.setQuestionID(resultSet.getInt("questionid"));
                sQuestion.setContent(resultSet.getString("content"));
                sQuestion.setAnswer(resultSet.getString("answer"));
                sQuestion.setCorrect(resultSet.getString("correct"));
                sQuestionList.add(sQuestion);
            }
            System.out.println("get list answer success");
            return  sQuestionList;
        }catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("get list answer fail");
            return sQuestionList;
        }
    }

    //Thêm vào bảng sv_question 1 câu trả lời của 1 sinh viên
    public void updateSV_Question( String studentID, int questionID, String answer ) {
        String sqlRequest = "UPDATE dbo.sv_question\n" +
                "SET answer = N'" + answer + "'\n" +
                "WHERE questionid = "+questionID+" AND masv = '"+studentID+"'";
        try {
            preparedStatement = connection.prepareStatement(sqlRequest);
            preparedStatement.executeUpdate();
            System.out.println("insert sv_question successfuly");
        }catch (Exception ex) {
            System.out.println("insert sv_question Fail");
            ex.printStackTrace();
        }
    }

    //Thêm vào bảng sv_question 50 câu trả lời của 1 sinh viên
    public void updateSV_Questions( String studentID, Map<Integer, String> answers) {
        for(Integer key : answers.keySet()) {
            updateSV_Question(studentID, key, answers.get(key));
        }
    }

    public void addScores(String studentID, int scores) {
        String sqlRequest = "INSERT INTO scores (masv, scores)" +
                "VALUES ('"+studentID+"', "+scores+")";
        try {
            preparedStatement = connection.prepareStatement(sqlRequest);
            preparedStatement.executeUpdate();
            System.out.println("Add Scores success!");
        } catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("Add Scores fail!");
        }
    }

    public void updateScores(String studentID, int scores) {
        String sqlRequest = "UPDATE dbo.scores \n" +
                "SET scores = "+scores+" \n" +
                "WHERE  masv = '"+studentID+"'";;
        try {
            preparedStatement = connection.prepareStatement(sqlRequest);
            preparedStatement.executeUpdate();
            System.out.println("Update Scores success!");
        } catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("Update Scores fail!");
        }
    }

    public List<SVQuestion> getScoresList() {
        String sqlRequest = "SELECT scores.masv, name, scores\n" +
                "FROM dbo.scores INNER JOIN dbo.sinhvien\n" +
                "ON sinhvien.masv = scores.masv";
        List<SVQuestion> scoresList = new ArrayList<SVQuestion>();
        try{
            preparedStatement = connection.prepareStatement(sqlRequest);
            resultSet = preparedStatement.executeQuery();
            while(resultSet.next()) {
                SVQuestion svQuestion = new SVQuestion();
                svQuestion.setStudentID(resultSet.getString("masv"));
                svQuestion.setStudentName(resultSet.getString("name"));
                svQuestion.setScores(resultSet.getInt("scores"));
                scoresList.add(svQuestion);
            }
            System.out.println("Get List Scores Success");
            return scoresList;
        } catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("Get List Scores Fail");
            return scoresList;
        }
    }

}
