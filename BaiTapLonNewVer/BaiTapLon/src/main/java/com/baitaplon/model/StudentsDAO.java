package com.baitaplon.model;

import com.baitaplon.objects.Student;

import java.sql.*;
import java.util.*;
import java.util.Date;

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

    public List getList(String sql, int limit, int offset) throws SQLException {
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(2, limit);
        preparedStatement.setInt(1, offset);
        ResultSet rs = preparedStatement.executeQuery();
        List<Student> studentList = new ArrayList<Student>();

        while (rs.next()) {
            Student student = new Student();
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
            studentList.add(student);
        }
        connection.close();
        return studentList;
    }

    public List getListStudent(int limit, int offset) throws SQLException {
        String sql = "select * from sinhvien  ORDER BY masv OFFSET  ? ROWS  FETCH NEXT ? ROWS ONLY ";
        List<Student> studentList = getList(sql, limit, offset);
        return studentList;
    }


    public int countStudent() throws SQLException, ClassNotFoundException {
        String sql = "SELECT COUNT(*) FROM sinhvien";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        ResultSet rs = preparedStatement.executeQuery();
        rs.next();
        return rs.getInt(1);
    }

    public int validate(Student student) throws SQLException {
        String sql = "Select * from sinhvien where masv = ?";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, student.getId());
        ResultSet rs = preparedStatement.executeQuery();
        if(rs.next()) {
            String sql1 = "Select * from sinhvien where username = ?";
            PreparedStatement preparedStatement1 = connection.prepareStatement(sql1);
            preparedStatement1.setString(1, student.getUsername());
            ResultSet rs1 = preparedStatement1.executeQuery();
            if(rs1.next()) {
                return 3;
            }
            return 2;
        }
        String sql1 = "Select * from sinhvien where username = ?";
        PreparedStatement preparedStatement1 = connection.prepareStatement(sql1);
        preparedStatement1.setString(1, student.getUsername());
        ResultSet rs1 = preparedStatement1.executeQuery();
        if(rs1.next()) {
            return 1;
        }
        return 0;
    }

    public void add(Object object) throws SQLException {
        Student student = (Student) object;
        String sql = "INSERT INTO sinhvien values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, student.getId());
        preparedStatement.setString(2, student.getUsername());
        preparedStatement.setString(3, student.getPassword());
        preparedStatement.setString(4, student.getName());
        preparedStatement.setString(5, student.getBirthday());
        preparedStatement.setString(6, student.getAddress());
        preparedStatement.setString(7, student.getPhone());
        preparedStatement.setString(8, student.getMagv());
        preparedStatement.setString(9, student.getGender());
        preparedStatement.setString(10, student.getEmail());
        preparedStatement.executeUpdate();
    }

    public void edit(Object object) throws SQLException {
        Student student = (Student) object;
        String sql = "UPDATE sinhvien SET name = ?, birthday = ?, address = ?, phone = ?, gender = ?, email = ?, magv = ? WHERE masv = ?";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, student.getName());
        preparedStatement.setString(2, student.getBirthday());
        preparedStatement.setString(3, student.getAddress());
        preparedStatement.setString(4, student.getPhone());
        preparedStatement.setString(5, student.getGender());
        preparedStatement.setString(6, student.getEmail());
        preparedStatement.setString(7, student.getMagv());
        preparedStatement.setString(8, student.getId());
        preparedStatement.executeUpdate();
        connection.close();
    }

    public void delete(String id) throws SQLException {
        String sql = "DELETE FROM sinhvien WHERE masv = ?";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, id);
        preparedStatement.executeUpdate();
        connection.close();
    }

    public List find(String args, int limit, int offset) throws SQLException {
        String sql = "select * from sinhvien where name like N'%" + args + "%' or username like N'%" + args +
                "%' or masv like N'%" + args + "%' ORDER BY masv OFFSET  ? ROWS  FETCH NEXT ? ROWS ONLY ";
        List<Student> studentList = getList(sql, limit, offset);
        return studentList;
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

    public boolean editPass(String user, String pass, String newPass) throws SQLException {
        String sql = "Select * from sinhvien where username = ? and password = ?";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, user);
        preparedStatement.setString(2, pass);
        ResultSet rs = preparedStatement.executeQuery();
        if(rs.next()) {
            sql = "UPDATE sinhvien SET password = ? where username = ?";
            PreparedStatement preparedStatement1 = connection.prepareStatement(sql);
            preparedStatement1.setString(1, newPass);
            preparedStatement1.setString(2, user);
            int rs1 = preparedStatement1.executeUpdate();
            return true;
        }
        return false;
    }
}
