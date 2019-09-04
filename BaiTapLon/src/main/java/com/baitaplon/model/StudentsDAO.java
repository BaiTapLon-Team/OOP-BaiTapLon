package com.baitaplon.model;

import com.baitaplon.objects.Student;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class StudentsDAO implements Management {
    private Connection connection = new ConnectDatabase().getConnection();

    public Student checkLogin(String username, String password) throws SQLException {
        String sql = "SELECT * FROM sinhvien WHERE username = ? AND password = ?";

        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, username);
        preparedStatement.setString(2, password);
        ResultSet rs = preparedStatement.executeQuery();
        Student student = null;
        if (rs.next()) {
            student = (Student) getInfo(rs.getString(1));
            return student;
        }
        connection.close();
        return student;
    }

    public List getList() {
        return null;
    }

    public void add(Object object) {

    }

    public void edit(Object object) throws SQLException {
        Student student = (Student) object;
        String sql = "UPDATE sinhvien SET name = ?, birthday = ?, address = ?, phone = ?, gender = ?, email = ? WHERE masv = ?";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, student.getName());
        preparedStatement.setString(2, student.getBirthday());
        preparedStatement.setString(3, student.getAddress());
        preparedStatement.setString(4, student.getPhone());
        preparedStatement.setString(5, student.getGender());
        preparedStatement.setString(6, student.getEmail());
        preparedStatement.setString(7, student.getId());
        preparedStatement.executeUpdate();
        connection.close();
    }

    public void delete(String id) {

    }

    public List find(String args) {
        return null;
    }

    public Object getInfo(String id) throws SQLException {
        String sql = "SELECT * FROM sinhvien WHERE masv = ?";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, id);
        ResultSet rs = preparedStatement.executeQuery();
        Student student = null;
        if (rs.next()) {
            student = new Student();
            student.setId(rs.getString(1));
            student.setUsername(rs.getString(2));
            student.setPassword(rs.getString(3));
            student.setName(rs.getString(4));
            Date date = rs.getDate(5);
            student.setBirthday(String.valueOf(date));
            student.setAddress(rs.getString(6));
            student.setPhone(rs.getString(7));
            student.setMagv(rs.getString(8));
            student.setGender(rs.getString(9));
            student.setEmail(rs.getString(10));
            connection.close();
            return student;
        }
        return student;
    }

    public void addScores(String idSV, Map svQuestion) {

    }

    public Map showAwnser(String id) {
        return new HashMap();
    }
}
