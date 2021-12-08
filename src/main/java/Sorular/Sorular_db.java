/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Sorular;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Random;
import org.json.JSONArray;
import org.json.simple.JSONObject;



public class Sorular_db extends dbConnection.Connection
{
    public static JSONObject obj2 = new JSONObject();
    public String Sorular;
    
    public ArrayList<Sorular_Sql> gettum_sorular() throws SQLException{

    connection_open();
        System.out.println("Actım1");
    String sql_query="select * from forms ";
    preparedStatement = con.prepareStatement(sql_query);

    ResultSet rs = preparedStatement.executeQuery();
    
    ArrayList<Sorular_Sql> list = new ArrayList<Sorular_Sql>();
    
     Random random = new Random();
//   obj2 = new JSONObject();
     System.out.println("deneme0");
     
    
    int iTemelSorular = 5, iDegiskenSorular = 12, iKacSoru = 7, iSayi = 0, iBayrak = 0;
    int[] idizi = new int[(iTemelSorular + iDegiskenSorular + 1)];
    for(int i = 0; i < iKacSoru; i++)
    {
        iSayi = random.nextInt(iDegiskenSorular)+ iTemelSorular + 1;
        iBayrak = 0;
        System.out.println("iSayi ="+ iSayi);
        
        for(int j = 0; j <= iKacSoru; j++)
        {
            if(iSayi == idizi[j])
            {
                iBayrak = 0;
                System.out.println("BREAK!");
                break;
            }
            else if (iSayi != idizi[j])
            {
                iBayrak = 1;
            }
        }
      if(iBayrak == 1)
        {
            idizi[i] = iSayi;
            iBayrak = 0;
        }
      else
        {
            i--;
        }
        //System.out.println("diziyazilan = " + idizi[i]);
    }
        System.out.println("deneme1");
    while (rs.next()) 
    {
        Sorular_Sql Soru = new Sorular_Sql();
        
        Soru.setId(rs.getInt("ID"));
        Soru.setSorular(rs.getString("Soru"));
        if(Soru.getId() <= iTemelSorular){
            list.add(Soru);
        }
        for(int i = 0; i <= (iTemelSorular + iDegiskenSorular); i++)
        {
           if(Soru.getId() == idizi[i])
           {
                System.out.println(idizi[i]);
                list.add(Soru);
           }
        }
    }
//       list.add(Soru);
//       iSayac++;
        
               
     String Sorular ="";
        int iSayac;
        //for (iSayac=5;iSayac<list.size();iSayac++) 
        for (iSayac=5;iSayac<12;iSayac++)
        {   
            
            Sorular = Sorular + " " + list.get(iSayac).getSorular() ;
//            obj3.put("Sorular"+iSayac,Soru.getSorular());
//            System.out.println(obj3.toString());
//            System.out.println(Soru.getId());
//            System.out.println(Soru.getSorular());
        }    
        obj2.put("Sorular", Sorular);
        System.out.println(obj2.get("Sorular"));
        
//        System.out.println(Sorular);
//        System.out.println(obj2.get("soru0"));
//        System.out.println(obj2.get("soru1"));
//        System.out.println(obj2.get("soru2"));
//        System.out.println(obj2.get("soru3"));
//        System.out.println(obj2.get("soru4"));
        
////     connection_close();
        System.out.println("Kapadım1");
    return list;
    }
    public static void main(String[] args) throws SQLException 
    {
        Sorular_db Sorudb = new Sorular_db();
        ArrayList<Sorular_Sql> list = Sorudb.gettum_sorular();
//        for (Sorular_Sql Soru : list) 
//        {
//            System.out.println(Soru.getId());
//            System.out.println(Soru.getSorular());
//        }
         
    }
}
