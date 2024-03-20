/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 *
 * @author User
 */
public class DBUtils {

    private final static String SERVER_NAME = "mysqlcatshark2003-annie1141.a.aivencloud.com";
    private final static String DB_NAME = "BOOKING_PARTY";
    private final static String PORT_NUMBER = "21361";
    private final static String USER_ID = "avnadmin";
    private final static String PASSWORD = "";

    public static Connection getConnection() throws SQLException, NamingException {
//        try {
//            String url = "jdbc:mysql://" + SERVER_NAME + ":" + PORT_NUMBER + "/" + DB_NAME;
//            Class.forName("com.mysql.jdbc.Driver");
//            return DriverManager.getConnection(url, USER_ID, PASSWORD);
//        } catch (SQLException | ClassNotFoundException e) {
//            System.out.println("Connection error! " + e.getMessage());
//        }
//        return null;
        Context currentContext = new InitialContext();
        Context tomcatContext = (Context) currentContext.lookup("java:comp/env");
        DataSource ds = (DataSource) tomcatContext.lookup("DSBOOKINGPARTY");
        Connection con = ds.getConnection();
        return con;
    }
}
