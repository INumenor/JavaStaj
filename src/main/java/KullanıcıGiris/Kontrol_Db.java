/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package KullanıcıGiris;

import Sorular.Sorular_Sql;
import static dbConnection.Connection.con;
import static dbConnection.Connection.preparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author Batuh
 */
public class Kontrol_Db 
{
    public ArrayList<Kontrol_Sql> gettum_loginusers() throws SQLException
    {
         
        System.out.println("Actım1");
        String sql_query="select * from users ";
        preparedStatement = con.prepareStatement(sql_query);
        
        ResultSet rs = preparedStatement.executeQuery();
        
        System.out.println("Suan burası");
        ArrayList<Kontrol_Sql> list = new ArrayList<Kontrol_Sql>();
        
        while (rs.next()) 
        {
            Kontrol_Sql kontrol = new Kontrol_Sql();
            System.out.println("Suan burası2");
            
            kontrol.setId(rs.getInt("ID"));
            kontrol.setEmail(rs.getString("Email"));
            kontrol.setPassword(rs.getString("Password"));
            list.add(kontrol);
        }
        System.out.println("GEldik 3131313");
       return list;
    }

}
