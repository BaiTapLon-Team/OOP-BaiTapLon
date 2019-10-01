package com.baitaplon.model;

import com.baitaplon.objects.Admin;
import com.baitaplon.objects.Student;
import com.baitaplon.objects.Teacher;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

public class AdminDAO {
    private Connection connection = new ConnectDatabase().getConnection();

    public Admin checkLogin(String username, String password) throws SQLException {
        String sql = "SELECT * FROM admin WHERE username = ? AND password = ?";

        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, username);
        preparedStatement.setString(2, password);
        ResultSet rs = preparedStatement.executeQuery();
        Admin admin = null;
        if (rs.next()) {
            admin = (Admin) getInfo(rs.getString(1));
            return admin;
        }
        connection.close();
        return admin;
    }

    public Object getInfo(String id) throws SQLException {
        String sql = "SELECT * FROM admin WHERE maad = ?";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, id);
        ResultSet rs = preparedStatement.executeQuery();
        Admin admin = null;
        if (rs.next()) {
            admin = new Admin();
            admin.setId(rs.getString(1));
            admin.setUsername(rs.getString(2));
            admin.setPassword(rs.getString(3));
            admin.setName(rs.getString(4));
            admin.setBirthday(String.valueOf(rs.getDate(5)));
            admin.setGender(rs.getString(6));
            admin.setPhone(rs.getString(7));
            admin.setAddress(rs.getString(8));
            admin.setEmail(rs.getString(9));
            admin.setTypeAdmin(rs.getString(10));
            connection.close();
            return admin;
        }
        return admin;
    }

    public void edit(Object object) throws SQLException {
        Admin admin = (Admin) object;
        String sql = "UPDATE admin SET name = ?, birthday = ?, gender = ?, phone = ?, address = ?,   email = ? WHERE maad = ?";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, admin.getName());
        preparedStatement.setString(2, admin.getBirthday());
        preparedStatement.setString(3, admin.getGender());
        preparedStatement.setString(4, admin.getPhone());
        preparedStatement.setString(5, admin.getAddress());
        preparedStatement.setString(6, admin.getEmail());
        preparedStatement.setString(7, admin.getId());
        preparedStatement.executeUpdate();
        connection.close();
    }
}
