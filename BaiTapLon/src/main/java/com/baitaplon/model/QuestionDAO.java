package com.baitaplon.model;

import com.baitaplon.objects.Question;
import com.baitaplon.objects.SQuestion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class QuestionDAO implements Management {
    //Khai báo các biến cần thiết để thao tác vs data
    private Connection connection = new ConnectDatabase().getConnection();
    private PreparedStatement preparedStatement = null;
    private ResultSet resultSet = null;

    //Lấy 50 câu hỏi bất kì trong data Question
    public List getList () {
        String sqlQuery = "SELECT * FROM question " +
                "ORDER BY questionid " +
                "OFFSET 0 ROWS " +
                "FETCH NEXT 50 ROWS ONLY";
        List<Question> questionList = new ArrayList<Question>();
        try {
            preparedStatement = connection.prepareStatement(sqlQuery);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Question questionTemp = new Question();
                questionTemp.setQuestionID(resultSet.getInt("questionid"));
                questionTemp.setContent(resultSet.getString("content"));
                questionTemp.setCorrect(resultSet.getString("correct"));
                questionTemp.setAnwserA(resultSet.getString("answer_a"));
                questionTemp.setAnwserB(resultSet.getString("answer_b"));
                questionTemp.setAnwserC(resultSet.getString("answer_c"));
                questionTemp.setAnwserD(resultSet.getString("answer_d"));
                questionList.add(questionTemp);
            }
            System.out.println("Get Question List Successfuly");
            return questionList;
        }catch (Exception ex) {
            System.out.println("Get Question List Fail");
            ex.printStackTrace();
            return null;
        }
    }

    //Thêm câu hỏi vào database
    public void add ( Object questionObject ) {
        //Chuyển đổi Object sang Question
        Question question = (Question) questionObject;
        String sqlRequest = "INSERT INTO question " +
                "VALUES (" +
                "N'" + question.getContent() + "'," +
                "N'" + question.getCorrect() + "'," +
                "N'" + question.getAnwserA() + "'," +
                "N'" + question.getAnwserB() + "'," +
                "N'" + question.getAnwserC() + "'," +
                "N'" + question.getAnwserD() + "'" +
                ")";
        try {
            preparedStatement = connection.prepareStatement(sqlRequest);
            preparedStatement.executeUpdate();
            System.out.println("insert Question successfuly");
        } catch (Exception ex) {
            System.out.println("insert Question fail");
            System.out.println(ex.getMessage());
        }
    }

    //Sửa một câu hỏi nào đó với tham số là Question
    public void edit ( Object questionObject ) {
        //Chuyển đổi Object sang Question
        Question question = (Question) questionObject;

        String sqlRequest = "UPDATE question " +
                "SET content=N'" + question.getContent() + "'," +
                "correct=N'" + question.getCorrect() + "'," +
                "answer_a=N'" + question.getAnwserA() +"',"+
                "answer_b=N'" + question.getAnwserB() +"',"+
                "answer_c=N'" + question.getAnwserC() +"',"+
                "answer_d=N'" + question.getAnwserD() +"'"+
                " WHERE questionid=" + question.getQuestionID();
        try {
            preparedStatement = connection.prepareStatement(sqlRequest);
            preparedStatement.executeUpdate();
            System.out.println("update successfuly");
        } catch (SQLException ex) {
            System.out.println("update fail");
            ex.printStackTrace();
        }
    }

    //Xóa một câu hỏi theo id câu hỏi
    public void delete ( String id ) {
        String sqlRequest = "DELETE FROM Question WHERE questionid=" + id;
        try {
            preparedStatement = connection.prepareStatement(sqlRequest);
            preparedStatement.executeUpdate();
            System.out.println("Delete Successfuly");
        } catch (SQLException ex) {
            System.out.println("Delete Fail");
            ex.printStackTrace();
        }
    }

    public List find ( String args ) {
        return null;
    }

    //Lấy thông tin của một câu hỏi theo id câu hỏi
    public Object getInfo ( String id ) {
        String sqlQuery = "SELECT * FROM Question WHERE questionid="+id;
        Question questionInfo = new Question();
        try {
            preparedStatement = connection.prepareStatement(sqlQuery);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                questionInfo.setQuestionID(resultSet.getInt("questionid"));
                questionInfo.setContent(resultSet.getString("content"));
                questionInfo.setCorrect(resultSet.getString("correct"));
                questionInfo.setAnwserA(resultSet.getString("anwser_a"));
                questionInfo.setAnwserB(resultSet.getString("anwser_b"));
                questionInfo.setAnwserC(resultSet.getString("anwser_c"));
                questionInfo.setAnwserD(resultSet.getString("anwser_d"));
            }
            System.out.println("Get Question Successfuly");
            return questionInfo;
        }catch (Exception ex) {
            System.out.println("Get Question Fail");
            ex.printStackTrace();
            return questionInfo;
        }
    }

//    //Thêm vào bảng sv_question 1 câu trả lời của 1 sinh viên
//    public void addSV_Question( String studentID, int questionID, String answer ) {
//        String sqlRequest = "INSERT INTO dbo.sv_question\n" +
//                "(\n" +
//                "    masv,\n" +
//                "    questionid,\n" +
//                "    answer\n" +
//                ")\n" +
//                "VALUES\n" +
//                "(   '"+studentID+"', -- masv - varchar(50)\n" +
//                "    "+questionID+",  -- questionid - int\n" +
//                "    N'"+answer+"' -- answer - nvarchar(100)\n" +
//                ")";
//        try {
//            preparedStatement = connection.prepareStatement(sqlRequest);
//            preparedStatement.executeUpdate();
//            System.out.println("insert sv_question successfuly");
//        }catch (Exception ex) {
//            System.out.println("insert sv_question Fail");
//            ex.printStackTrace();
//        }
//    }
//
//    //Thêm vào bảng sv_question 50 câu trả lời của 1 sinh viên
//    public void addSV_Questions( String studentID, Map<Integer, String> answers) {
//        for(Integer key : answers.keySet()) {
//            addSV_Question(studentID, key, answers.get(key));
//        }
//    }
//
//    //Lấy kết quả thi ra từ bẳng
//    public  int getScores(String studentID) {
//        int scores = 0;
//        String sqlRequest = "SELECT COUNT(*) FROM dbo.question INNER JOIN dbo.sv_question\n" +
//                "ON sv_question.questionid = question.questionid AND masv = '"+studentID+"' AND answer = correct";
//        try {
//            preparedStatement = connection.prepareStatement(sqlRequest);
//            resultSet = preparedStatement.executeQuery();
//            if(resultSet.next()) {
//                scores = resultSet.getInt(1);
//            }
//            System.out.println("get Scores Susscess");
//            return  scores;
//        }catch (Exception ex) {
//            ex.printStackTrace();
//            System.out.println("get Scores fail");
//            return scores;
//        }
//    }
//
//    public List getAnswerList( String studentID) {
//        List<SQuestion> sQuestionList = new ArrayList<SQuestion>();
//        String sqlRequest = "SELECT masv, sv_question.questionid, content, answer, correct FROM dbo.question INNER JOIN dbo.sv_question\n" +
//                "ON sv_question.questionid = question.questionid AND masv = '"+studentID+"'";
//        try {
//            preparedStatement = connection.prepareStatement(sqlRequest);
//            resultSet = preparedStatement.executeQuery();
//            while (resultSet.next()) {
//                SQuestion sQuestion = new SQuestion();
//                sQuestion.setStudentID(resultSet.getString("masv"));
//                sQuestion.setQuestionID(resultSet.getInt("questionid"));
//                sQuestion.setContent(resultSet.getString("content"));
//                sQuestion.setAnswer(resultSet.getString("answer"));
//                sQuestion.setCorrect(resultSet.getString("correct"));
//                sQuestionList.add(sQuestion);
//            }
//            return  sQuestionList;
//        }catch (Exception ex) {
//            ex.printStackTrace();
//            System.out.println("get list answer fail");
//            return sQuestionList;
//        }
//    }



//    public static void main(String args[]) {
//        int score = new QuestionDAO().getScores("AT140216");
//        System.out.println(score);
//    }
}
