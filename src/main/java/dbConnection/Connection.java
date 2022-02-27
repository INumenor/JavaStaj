/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dbConnection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Batuh
 */
public class Connection 
{
    public static java.sql.Connection con;
    public static Statement st;
    public static PreparedStatement preparedStatement;
    public static ResultSet rs;
    
    public void connection_open() {
        //Data getirmek için
        try {
            if (con == null) {
                Class.forName("com.mysql.jdbc.Driver");
                
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/veritabaniform?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull", "root", "");
                
                st = con.createStatement();
                
                System.out.println("Bağlantı Sağlandı");
            } else {
                   System.out.println("Bağlantı Zaten Açık");
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Open Connection Error" + e.toString());
        }      
    }
     
     public void connection_close() throws SQLException 
        {
        try {
            if (con != null) {
                con.close();
//                st.close();
//                rs.close();
//            preparedStatement.close();
                System.out.println("1");
            }
        } catch (Exception e2) {
            System.out.println("2");
            }
        }
    
}
