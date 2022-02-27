
package ListGetir;

import Sorular.Sorular_Sql;
import static dbConnection.Connection.con;
import static dbConnection.Connection.preparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class AdminListGetir 
{
    public ArrayList<AdminListGetir_Sql> gettum_AdminList() throws SQLException
    {
        System.out.println("1");
        String sql_query = "select * from login ";
        System.out.println("2");
        preparedStatement = con.prepareStatement(sql_query);
        System.out.println("3");
        ResultSet rs = preparedStatement.executeQuery();
        System.out.println("4");
        ArrayList<AdminListGetir_Sql> list = new ArrayList<AdminListGetir_Sql>();
        
        while(rs.next())
        {
            System.out.println("5");
            AdminListGetir_Sql Liste = new AdminListGetir_Sql();
            
            Liste.setId(rs.getInt("ID"));
            Liste.setUserName(rs.getString("username"));
            Liste.setPassword(rs.getString("password"));
            
            list.add(Liste);
        }
        
        return list;
    }
}
