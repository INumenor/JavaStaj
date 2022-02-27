/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Users;

import Sorular.Sorular_Sql;
import Sorular.Sorular_db;
import static Sorular.Sorular_db.Sorular2;
import static Sorular.Sorular_db.iKacSoru;
import static Sorular.Sorular_db.obj2;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;
import static Sorular.Sorular_db.iTemelSorular;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import org.json.CDL;
import org.json.JSONArray;
import org.json.simple.JSONObject;

public class Users_db extends dbConnection.Connection
{
    
    public boolean users_save(HttpServletRequest request) throws SQLException{
    boolean donus=false;

      
        String sql = "INSERT INTO formrecords (firstname,lastname,age,email,telnum,questionsandanswers) VALUES (?,?,?,?,?,?)";
        try {
             preparedStatement = con.prepareStatement(sql);
             
             JSONObject obj = new JSONObject();
                         
             obj.put("firstname",request.getParameter("soru1"));
             obj.put("lastname",request.getParameter("soru2"));
             obj.put("age",request.getParameter("soru3"));
             obj.put("email",request.getParameter("soru4"));
             obj.put("telnum",request.getParameter("soru5"));
              
             
            JSONArray ja = new JSONArray();
            int i = 1, j = 0, k ;
            String sql_query="select * from forms ";
            preparedStatement = con.prepareStatement(sql_query);
            ResultSet rs = preparedStatement.executeQuery();
            
            for (int t = iTemelSorular; t < iKacSoru+iTemelSorular ; t++)
            {
                System.out.println(Sorular2[t]);
                ja.put(Sorular2[t]);
            }
            String string = request.getParameter("soru6");
            for (int t = 7 ; t < iKacSoru+iTemelSorular +1 ; t++)
            {
                string = string + "," + request.getParameter("soru" + t);
            }

            JSONArray result = CDL.toJSONArray(ja, string);
            
            preparedStatement = con.prepareStatement(sql);
            
            preparedStatement.setString(1,(String)obj.get("firstname"));
            preparedStatement.setString(2,(String)obj.get("lastname"));
            preparedStatement.setString(3,(String)obj.get("age"));
            preparedStatement.setString(4,(String)obj.get("email"));
            preparedStatement.setString(5,(String)obj.get("telnum"));
            preparedStatement.setString(6,result.toString());
           
            preparedStatement.execute();
            
            donus = true;
        } catch (SQLException ex) {
            System.out.println(ex);
            Logger.getLogger(Users_db.class.getName()).log(Level.SEVERE, null, ex);
            donus = false;
        }
    return donus;
    }   
}
