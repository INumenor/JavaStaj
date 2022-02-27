/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Login;

import Users.Users_db;
import static dbConnection.Connection.con;
import static dbConnection.Connection.preparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import org.json.simple.JSONObject;

public class Register extends dbConnection.Connection
{
    public boolean register_save(HttpServletRequest request) throws SQLException
    {
        boolean donus = false;
        connection_open();
        
        String sql = "INSERT INTO login (username,password) VALUES (?,?)";
       
        Login_db Logindb = new Login_db();
        ArrayList<Login_Sql> list = Logindb.gettum_login();
     
        preparedStatement = con.prepareStatement(sql);
             
        System.out.println("Deneme1");
        try
        {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        

        
        for (Login_Sql Log : list) 
        {
           System.out.println("Girilen : " + username+ " Veri tabani : " + Log.getUsername()+ " Girilen : " + password + " Veri tabani : " + Log.getPassword() );
           
           System.out.println(username);
           System.out.println(password);
           String SqlUserName = Log.getUsername();
           String SqlPassword = Log.getPassword();
           
           System.out.println(SqlUserName);
           System.out.println(SqlPassword);
           
           if(SqlUserName.equals(username) && SqlPassword.equals(password))
           {
               System.out.println("Geldim1");
               System.out.println("Kullanıcı var");
               donus= false;
           } 
           else
           {
               preparedStatement.setString(1,(username));
               preparedStatement.setString(2,(password)); 
               donus = true;
           }
        }
        preparedStatement.execute();  
        }
        catch (SQLException ex) 
        {
        System.out.println(ex);
        Logger.getLogger(Users_db.class.getName()).log(Level.SEVERE, null, ex);
        donus = false;
        }
//        connection_close();
        return donus;
    }
}
