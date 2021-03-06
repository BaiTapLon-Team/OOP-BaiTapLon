package com.baitaplon.model;

import com.baitaplon.objects.Student;
import com.baitaplon.objects.Teacher;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
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

    public List getList(String sql, int limit, int offset) throws SQLException {
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(2, limit);
        preparedStatement.setInt(1, offset);
        ResultSet rs = preparedStatement.executeQuery();
        List<Teacher> teacherList = new ArrayList<Teacher>();

        while (rs.next()) {
            Teacher teacher = new Teacher();
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
            teacherList.add(teacher);
        }
        connection.close();
        return teacherList;
    }

    public List getListTeacher(int limit, int offset) throws SQLException {
        String sql = "select * from giaovien  ORDER BY magv OFFSET  ? ROWS  FETCH NEXT ? ROWS ONLY ";
        List<Teacher> teacherList = getList(sql, limit, offset);
        return teacherList;
    }

    public int countTeacher() throws SQLException {
        String sql = "SELECT COUNT(*) FROM giaovien";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        ResultSet rs = preparedStatement.executeQuery();
        rs.next();
        return rs.getInt(1);
    }

    public int validate(Teacher teacher) throws SQLException {
        String sql = "Select * from giaovien where magv = ?";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, teacher.getId());
        ResultSet rs = preparedStatement.executeQuery();
        if(rs.next()) {
            String sql1 = "Select * from giaovien where username = ?";
            PreparedStatement preparedStatement1 = connection.prepareStatement(sql1);
            preparedStatement1.setString(1, teacher.getUsername());
            ResultSet rs1 = preparedStatement1.executeQuery();
            if(rs1.next()) {
                return 3;
            }
            return 2;
        }
        String sql1 = "Select * from giaovien where username = ?";
        PreparedStatement preparedStatement1 = connection.prepareStatement(sql1);
        preparedStatement1.setString(1, teacher.getUsername());
        ResultSet rs1 = preparedStatement1.executeQuery();
        if(rs1.next()) {
            return 1;
        }
        return 0;
    }

    public void add(Object object) throws SQLException {
        Teacher teacher = (Teacher) object;
        String sql = "INSERT INTO giaovien values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, teacher.getId());
        preparedStatement.setString(2, teacher.getUsername());
        preparedStatement.setString(3, teacher.getPassword());
        preparedStatement.setString(4, teacher.getName());
        preparedStatement.setString(5, teacher.getBirthday());
        preparedStatement.setString(6, teacher.getAddress());
        preparedStatement.setString(7, teacher.getPhone());
        preparedStatement.setString(8, teacher.getGender());
        preparedStatement.setString(9, teacher.getEmail());
        preparedStatement.setString(10, teacher.getQualifications());
        preparedStatement.setFloat(11, teacher.getCoefficientsSalary());
        preparedStatement.executeUpdate();
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

    public void delete(String id) throws SQLException {
        String sql = "DELETE FROM giaovien WHERE magv = ?";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, id);
        preparedStatement.executeUpdate();
        connection.close();
    }

    public List find(String args, int limit, int offset) throws SQLException {
        String sql = "select * from giaovien where name like N'%" + args + "%' or username like N'%" + args +
                "%' or magv like N'%" + args + "%' ORDER BY magv OFFSET  ? ROWS  FETCH NEXT ? ROWS ONLY ";
        List<Teacher> teacherList = getList(sql, limit, offset);
        return teacherList;
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

    public boolean editPass(String user, String pass, String newPass) throws SQLException {
        String sql = "Select * from giaovien where username = ? and password = ?";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, user);
        preparedStatement.setString(2, pass);
        ResultSet rs = preparedStatement.executeQuery();
        if(rs.next()) {
            sql = "UPDATE giaovien SET password = ? where username = ?";
            PreparedStatement preparedStatement1 = connection.prepareStatement(sql);
            preparedStatement1.setString(1, newPass);
            preparedStatement1.setString(2, user);
            int rs1 = preparedStatement1.executeUpdate();
            return true;
        }
        return false;
    }

}
