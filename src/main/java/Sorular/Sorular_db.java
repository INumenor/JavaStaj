/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Sorular;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class Sorular_db extends dbConnection.Connection
{
    public ArrayList<Sorular_Sql> gettum_sorular() throws SQLException{

    connection_open();
    String sql_query="select * from forms ";
    preparedStatement = con.prepareStatement(sql_query);

    ResultSet rs = preparedStatement.executeQuery();
    
    ArrayList<Sorular_Sql> list = new ArrayList<Sorular_Sql>();
    
    
    
    while (rs.next()) {
        
       Sorular_Sql Soru =new Sorular_Sql();
        
       Soru.setId(rs.getInt("ID"));
       Soru.setSorular(rs.getString("Soru"));
       
       list.add(Soru);

    }

    return list;
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
    }
}
