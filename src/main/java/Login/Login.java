
package Login;

import static dbConnection.Connection.con;
import static dbConnection.Connection.preparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;


public class Login extends dbConnection.Connection
{
    public static boolean bGirisYapildiMi =false;
    
    public boolean loginauthorization(HttpServletRequest request) throws SQLException
    {
        
      connection_open();
      
        System.out.println(request.getParameter("username")+"321");
        
        Login_db Logindb = new Login_db();
        ArrayList<Login_Sql> list = Logindb.gettum_login();
        
        System.out.println(list);
        System.out.println("GEldim222");
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        System.out.println(username);
        System.out.println(password);
        
         for (Login_Sql Log : list) 
        {
           System.out.println("Girilen : " + username+ " Veri tabani : " + Log.getUsername()+ " Girilen : " + password + " Veri tabani : " + Log.getPassword() );
           
           String SqlUserName = Log.getUsername();
           String SqlPassword = Log.getPassword();
                
           if(SqlUserName.equals(username) && SqlPassword.equals(password))
           {
               System.out.println("Geldim1");
               System.out.println("Kullanıcı var");
               bGirisYapildiMi = true;
               System.out.println(bGirisYapildiMi+"||||||||||");
               return true;
           } 
        }

       return false;   
    }
}
