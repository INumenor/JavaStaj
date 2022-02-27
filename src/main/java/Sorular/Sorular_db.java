
package Sorular;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import javax.servlet.http.HttpServletRequest;
import org.json.JSONArray;
import org.json.simple.JSONObject;



public class Sorular_db extends dbConnection.Connection
{
    public static JSONArray obj3 = new JSONArray();
    public static JSONObject obj2 = new JSONObject();
    public static String[] Sorular2;
    public String Sorular;
    public static int iKacSoru;
    public static int iTemelSorular;
    
    public ArrayList<Sorular_Sql> gettum_sorular(int iSoruSayisi, String SecilenSorular) throws SQLException{

    connection_open();
    System.out.println("Actım1");
    String sql_query="select * from forms ";
    preparedStatement = con.prepareStatement(sql_query);

    ResultSet rs = preparedStatement.executeQuery();
    
    ArrayList<Sorular_Sql> list = new ArrayList<Sorular_Sql>();
    
     Random random = new Random();
     System.out.println("deneme0");
     
    int iToplamSoruSayisi = iToplamSoruSayisi();
     
    iTemelSorular = 5;
    this.iKacSoru = iSoruSayisi;
    int iDegiskenSorular = iToplamSoruSayisi-iTemelSorular, iSayi = 0, iBayrak = 0;
    System.out.println("GEldim"+iKacSoru+"  "+iSoruSayisi);
    int[] idizi = new int[(iTemelSorular + iDegiskenSorular + 1)];
    
    if(SecilenSorular == ""){
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
        }
    }
    else{
        System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        String Sorular[] = SecilenSorular.split("-");
        System.out.println("____________________________________");
        for(int i = 0; i < Sorular.length; i++){
            System.out.println("!?!?");
            idizi[i] = Integer.parseInt(Sorular[i]);
            
        }
        System.out.println("???????????????????????????????????");
        
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
          
     String Sorular ="";
        int iSayac;
        Sorular2 = new String[iTemelSorular + iKacSoru];
        System.out.println(iTemelSorular + " " + iKacSoru);
        for (iSayac=iTemelSorular;iSayac<iTemelSorular + iKacSoru ;iSayac++)
        {   
            System.out.println("Geldim");
            Sorular = Sorular + " " + list.get(iSayac).getSorular() ;
            Sorular2[iSayac] = list.get(iSayac).getSorular();
            System.out.println(Sorular2[iSayac]);
        }   
        obj2.put("Sorular", Sorular);
        System.out.println(obj2.get("Sorular"));
        
        
        

//   connection_close();
        System.out.println("Kapadım1");
        System.out.println(iKacSoru);
    return list;
    }
    
     public int iToplamSoruSayisi() throws SQLException
    {
        int iToplamSoruSayisi=0;
        String sql_queryy="select * from forms ";
        preparedStatement = con.prepareStatement(sql_queryy);
        ResultSet rs2 = preparedStatement.executeQuery();
        while (rs2.next()) 
        {
            iToplamSoruSayisi++;
        }
        
        return iToplamSoruSayisi;
    }
}
