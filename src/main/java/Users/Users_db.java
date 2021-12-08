/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Users;

import Sorular.Sorular_Sql;
import Sorular.Sorular_db;
import static Sorular.Sorular_db.obj2;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import org.json.simple.JSONObject;

public class Users_db extends dbConnection.Connection
{
    
    public boolean users_save(Users_Sql users,HttpServletRequest request) throws SQLException{
    boolean donus=false;
   
      System.out.println("actım2");
//        for(int a = 1; a < 8; a++)
//        {
//            System.out.println(request.getParameter("soru"+a));
//        }
//      String sql = "INSERT INTO users (firstname, lastname, age, email, telnumb, bircty, marry, edu, hobby, lcknum, bscolor, bsmusic) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
        String sql = "INSERT INTO answerrecords (firstname,lastname,age,email,telnum,answers,questions) VALUES (?,?,?,?,?,?,?)";
        try {
             preparedStatement = con.prepareStatement(sql);
             
             JSONObject obj = new JSONObject();
             
             
             System.out.println("Deneme1");
             
             obj.put("firstname",users.getFirstname());
             obj.put("lastname",users.getLastname());
             obj.put("age",users.getage());
             obj.put("email",users.getEmail());
             obj.put("telnum",users.gettelnum());
             System.out.println("Deneme3");
             obj.put("questions", users.getBircty()+" "+ users.getMarry()+" "+ users.getEdu()+" "+ users.getHobby()+" "+users.getlcknum()+" "+ users.getBscolor() +" "+ users.getBsmusic());
                          
//            preparedStatement.setString(1, users.getFirstname());
//            preparedStatement.setString(2, users.getLastname());
//            preparedStatement.setInt(3, users.getage());
//            preparedStatement.setString(4, users.getEmail());
//            preparedStatement.setInt(5, users.gettelnum());
//            preparedStatement.setString(6, users.getBircty());
//            preparedStatement.setString(7, users.getMarry());
//            preparedStatement.setString(8, users.getEdu());
//            preparedStatement.setString(9, users.getHobby());
//            preparedStatement.setInt(10, users.getlcknum());
//            preparedStatement.setString(11, users.getBscolor());
//            preparedStatement.setString(12, users.getBsmusic());
//            preparedStatement.execute();  
             System.out.println("Deneme2");
            preparedStatement.setString(1,(String)obj.get("firstname"));
            preparedStatement.setString(2,(String)obj.get("lastname"));
            preparedStatement.setInt(3,(int)obj.get("age"));
            preparedStatement.setString(4,(String)obj.get("email"));
            preparedStatement.setInt(5,(int)obj.get("telnum"));
            if(obj2.get("Sorular")==null)
            {
                preparedStatement.setString(6,null);
                System.out.println("Deneme55");
            }
            else
            {
                preparedStatement.setString(6,obj2.get("Sorular").toString());
            }
            preparedStatement.setString(7,obj.get("questions").toString());        
////            System.out.println("Deneme3");
////            preparedStatement.setString(8,(String)obj.get("answers").toString());
////            System.out.println("Deneme4");
//            preparedStatement.setString(6,(String)obj.get("bircty"));
//            preparedStatement.setString(7,(String)obj.get("marry"));
//            preparedStatement.setString(8,(String)obj.get("edu"));
//            preparedStatement.setString(9,(String)obj.get("hobby"));
//            preparedStatement.setInt(10,(int)obj.get("lcknum"));
//            preparedStatement.setString(11,(String)obj.get("bscolor"));
//            preparedStatement.setString(12,(String)obj.get("bsmusic"));
            preparedStatement.execute();
            
            donus = true;
        } catch (SQLException ex) {
            System.out.println(ex);
            Logger.getLogger(Users_db.class.getName()).log(Level.SEVERE, null, ex);
            donus = false;
        }
    connection_close();
    return donus;
    }
    
    public static void main(String[] args) throws SQLException 
    {
        Sorular_db Sorudb = new Sorular_db();
        ArrayList<Sorular_Sql> list = Sorudb.gettum_sorular();        
        
//        obj3.put("Sorular",list);
//        System.out.println(obj3.toString());
//        System.out.println();
        
        System.out.println("Meaee");
//        System.out.println(obj2.get("soru0"));
//        System.out.println(obj2.get("soru1"));
//        System.out.println(obj2.get("soru2"));
//        System.out.println(obj2.get("soru3"));
//        System.out.println(obj2.get("soru4"));
        System.out.println("Selam");
        
        Users_db dbUsers = new Users_db();
        Users_Sql sqlUsers = new Users_Sql();
        
//        sqlUsers.setFirstname("Batuhan");
//        sqlUsers.setLastname("Car");
//        sqlUsers.setage(15);
//        sqlUsers.setEmail("Batuhan@gmail.com");
//        sqlUsers.settelnum(156161);
//        sqlUsers.setBircty("Ankara");
//        sqlUsers.setMarry("Bekar");
//        sqlUsers.setEdu("Lisans");
//        sqlUsers.setHobby("Basketbol");
//        sqlUsers.setlcknum(3);
//        sqlUsers.setBscolor("Mavi");
//        sqlUsers.setBsmusic("Bts");
        
//        boolean a = dbUsers.users_save(sqlUsers);
        
//        System.out.println(a);
    }
}
