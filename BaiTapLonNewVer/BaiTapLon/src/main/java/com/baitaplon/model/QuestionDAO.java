package com.baitaplon.model;

import com.baitaplon.objects.Question;
import com.baitaplon.objects.SQuestion;
import com.baitaplon.objects.Student;

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

    public List getListQuestionTeacher () {
        String sqlQuery = "SELECT * FROM question ";
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

    public List find (String search) {
        String sqlQuery = "SELECT * FROM question where content like '%"+search+"%'";
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
            System.out.println("Search Question List Successfuly");
            return questionList;
        }catch (Exception ex) {
            System.out.println("Search Question List Fail");
            ex.printStackTrace();
            return null;
        }
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

    public List getList (String sql, int limit, int offset) {
        return null;
    }

    public List find(String args, int limit, int offset) throws SQLException {
        return null;
    }
}
