package com.baitaplon.model;

import com.baitaplon.objects.Student;
import com.baitaplon.objects.Teacher;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class TeacherDAO implements Management {
    private Connection connection = new ConnectDatabase().getConnection();

    public Teacher checkLogin(String username, String password) throws SQLException {
        String sql = "SELECT * FROM giaovien WHERE username = ? AND password = ?";

        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, username);
        preparedStatement.setString(2, password);
        ResultSet rs = preparedStatement.executeQuery();
        Teacher teacher = null;
        if (rs.next()) {
            teacher = (Teacher) getInfo(rs.getString(1));
            return teacher;
        }
        connection.close();
        return teacher;
    }

    public List getList() {
        return null;
    }

    public void add(Object object) {

    }

    public void edit(Object object) throws SQLException {
        Teacher teacher = (Teacher) object;
        String sql = "UPDATE giaovien SET name = ?, birthday = ?, gender = ?, address = ?, phone = ?, email = ?, qualifications = ? WHERE magv = ?";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, teacher.getName());
        preparedStatement.setString(2, teacher.getBirthday());
        preparedStatement.setString(3, teacher.getGender());
        preparedStatement.setString(4, teacher.getAddress());
        preparedStatement.setString(5, teacher.getPhone());
        preparedStatement.setString(6, teacher.getEmail());
        preparedStatement.setString(7, teacher.getQualifications());
        preparedStatement.setString(8, teacher.getId());
        preparedStatement.executeUpdate();
        connection.close();
    }

    public void delete(String id) {

    }

    public List find(String args) {
        return null;
    }

    public Object getInfo(String id) throws SQLException {
        String sql = "SELECT * FROM giaovien WHERE magv = ?";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, id);
        ResultSet rs = preparedStatement.executeQuery();
        Teacher teacher = null;
        if (rs.next()) {
            teacher = new Teacher();
            teacher.setId(rs.getString(1));
            teacher.setUsername(rs.getString(2));
            teacher.setPassword(rs.getString(3));
            teacher.setName(rs.getString(4));
            teacher.setBirthday(String.valueOf(rs.getDate(5)));
            teacher.setAddress(rs.getString(6));
            teacher.setPhone(rs.getString(7));
            teacher.setGender(rs.getString(8));
            teacher.setEmail(rs.getString(9));
            teacher.setQualifications(rs.getString(10));
            teacher.setCoefficientsSalary(rs.getFloat(11));
            connection.close();
            return teacher;
        }
        return teacher;
    }

}
