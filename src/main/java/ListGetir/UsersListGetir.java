/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ListGetir;

import static dbConnection.Connection.con;
import static dbConnection.Connection.preparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Batuh
 */
public class UsersListGetir 
{
    public ArrayList<UsersListGetir_Sql> gettum_UsersList() throws SQLException
    {

        String sql_query = "select * from users ";
        preparedStatement = con.prepareStatement(sql_query);
        
        ResultSet rs = preparedStatement.executeQuery();
        
        ArrayList<UsersListGetir_Sql> list = new ArrayList<UsersListGetir_Sql>();
        
        while(rs.next())
        {
            UsersListGetir_Sql Liste = new UsersListGetir_Sql();
            
            Liste.setId(rs.getInt("ID"));
            Liste.setEmail(rs.getString("email"));
            Liste.setPassword(rs.getString("password"));
            
            list.add(Liste);
        }
        
        return list;
    }
    
}
