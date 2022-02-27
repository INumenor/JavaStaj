
package KullanıcıGiris;

import Admin.Admin;
import Login.Login_Sql;
import Login.Login_db;
import Users.Users_Sql;
import com.mysql.cj.xdevapi.Result;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import static dbConnection.Connection.con;
import static dbConnection.Connection.preparedStatement;
import java.sql.ResultSet;

public  class Kontrol 
{
    public boolean KullanıcıGirisKontrol(HttpServletRequest request) throws SQLException
    {
        
        
        System.out.println("burası1");
        System.out.println(request.getParameter("email")+"321");
        
        Kontrol_Db KontrolDb = new Kontrol_Db();
        System.out.println("Burası2");
        ArrayList<Kontrol_Sql> list = KontrolDb.gettum_loginusers();
        System.out.println(list);
        System.out.println("GEldim222");
        
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        System.out.println(email);
        System.out.println(password);
        
         for (Kontrol_Sql Kon : list) 
        {
           System.out.println("Girilen : " + email+ " Veri tabani : " + Kon.getEmail()+ " Girilen : " + password + " Veri tabani : " + Kon.getPassword() );
           
           String SqlEmail = Kon.getEmail();
           String SqlPassword = Kon.getPassword();
                
           if(SqlEmail.equals(email) && SqlPassword.equals(password))
           {
               System.out.println("Geldim1");
               System.out.println("Kullanıcı var");
               return true;
           } 
        }
       return false;   
    }

    private void conneciton_open() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
