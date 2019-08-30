package com.baitaplon.model;


import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectDatabase {
    private String dbURL = "jdbc:sqlserver://localhost:1433;" + "databaseName=BAITAPLON;" + "authenticationScheme=JavaKerberos";
    private String userNameSQL = "sa";
    private String passWordSQL = "Vanhajvst123";


    public Connection getConnection () {
        Connection connection = null;
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(dbURL, userNameSQL, passWordSQL);
        } catch (Exception ex) {
            System.out.println("Connect Fail");
            ex.printStackTrace();
            System.out.println(ex.getMessage());
        }
        return connection;
    }

//    public static void main(String [] args) {
//        new ConnectDatabase().getConnection();
//    }
}
