/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Users;

import Sorular.Sorular_Sql;
import Sorular.Sorular_db;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;


public class Users_db extends dbConnection.Connection
{
    public boolean users_save(Users_Sql users) throws SQLException{
    boolean donus=false;
    connection_open();
      String sql = "INSERT INTO users (firstname, lastname, age, email, telnum, bircty, marry, edu, hobby, lcknum, bscolor, bsmusic) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";

        try {
            preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, users.getFirstname());
            preparedStatement.setString(2, users.getLastname());
            preparedStatement.setInt(3, users.getage());
            preparedStatement.setString(4, users.getEmail());
            preparedStatement.setInt(5, users.gettelnum());
            preparedStatement.setString(6, users.getBircty());
            preparedStatement.setString(7, users.getMarry());
            preparedStatement.setString(8, users.getEdu());
            preparedStatement.setString(9, users.getHobby());
            preparedStatement.setInt(10, users.getlcknum());
            preparedStatement.setString(11, users.getBscolor());
            preparedStatement.setString(12, users.getBsmusic());
            preparedStatement.execute();  
            
            donus = true;
        } catch (SQLException ex) {
            System.out.println(ex);
            Logger.getLogger(Users_db.class.getName()).log(Level.SEVERE, null, ex);
            donus = false;
        }
    
    return donus;
    }
    
    public static void main(String[] args) throws SQLException 
    {
        Sorular_db Sorudb = new Sorular_db();
        ArrayList<Sorular_Sql> list = Sorudb.gettum_sorular();
        for (Sorular_Sql Soru : list) 
        {
            System.out.println(Soru.getId());
            System.out.println(Soru.getSorular());
        }
        
        Users_db dbUsers = new Users_db();
        Users_Sql sqlUsers = new Users_Sql();
        
        sqlUsers.setFirstname("Batuhan");
        sqlUsers.setLastname("Car");
        sqlUsers.setage(15);
        sqlUsers.setEmail("Batuhan@gmail.com");
        sqlUsers.settelnum(156161);
        sqlUsers.setBircty("Ankara");
        sqlUsers.setMarry("Bekar");
        sqlUsers.setEdu("Lisans");
        sqlUsers.setHobby("Basketbol");
        sqlUsers.setlcknum(3);
        sqlUsers.setBscolor("Mavi");
        sqlUsers.setBsmusic("Bts");
        
        boolean a = dbUsers.users_save(sqlUsers);
        
        System.out.println(a);
    }
}
