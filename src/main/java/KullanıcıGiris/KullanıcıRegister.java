/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package KullanıcıGiris;

import static dbConnection.Connection.con;
import static dbConnection.Connection.preparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author Batuh
 */
public class KullanıcıRegister 
{
    
    public boolean register_save(HttpServletRequest request) throws SQLException
    {
        boolean donus = false;
        
        String sql = "INSERT INTO users (email,password) VALUES (?,?)";
       
        Kontrol_Db Kontroldb = new Kontrol_Db();
        ArrayList<Kontrol_Sql> list = Kontroldb.gettum_loginusers();
                
        preparedStatement = con.prepareStatement(sql);
             
        System.out.println("Deneme1");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        

        
        for (Kontrol_Sql Kon : list) 
        {
           System.out.println("Girilen : " + email+ " Veri tabani : " + Kon.getEmail()+ " Girilen : " + password + " Veri tabani : " + Kon.getPassword() );
           
           System.out.println(email);
           System.out.println(password);
           String SqlEmail = Kon.getEmail();
           String SqlPassword = Kon.getPassword();
           
           System.out.println(SqlEmail);
           System.out.println(SqlPassword);
           
           if(SqlEmail.equals(email) && SqlPassword.equals(password))
           {
               System.out.println("Geldim1");
               System.out.println("Kullanıcı var");
               donus= false;
           } 
           else
           {
               preparedStatement.setString(1,(email));
               preparedStatement.setString(2,(password)); 
               donus = true;
           }
        }
        preparedStatement.execute();  

        
//        connection_close();
        return donus;
    }
    
}
