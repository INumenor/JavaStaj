/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Json;
import java.util.Scanner;
import org.json.CDL;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.XML;

public class Json {

    public static int PRETTY_PRINT_INDENT_FACTOR = 4;
    public static String TEST_XML_STRING =
        "<?xml version=\"1.0\" ?><test attrib=\"moretest\">Turn this to JSON</test>";

    public static void main(String[] args) {
        try {
            JSONObject xmlJSONObj = XML.toJSONObject(TEST_XML_STRING);
            String jsonPrettyPrintString = xmlJSONObj.toString(PRETTY_PRINT_INDENT_FACTOR);
            System.out.println(jsonPrettyPrintString);
        } catch (JSONException je) {
            System.out.println(je.toString());
        }
        
        JSONObject jo = new JSONObject();
        jo.put("name", "jon doe");
        jo.put("age", "22");
        jo.put("city", "chicago");
        System.out.println(jo.toString());
        
        Scanner scanner = new Scanner(System.in);
        
        //String a = "john, chicago, 22 \n";
        
        JSONArray ja = new JSONArray();
        
        System.out.println("1.Soru: ");
        ja.put("soru1");        
        String a = scanner.nextLine();
        
        System.out.println("2.Soru: ");
        ja.put("soru2");
        String b= scanner.nextLine();
        
        System.out.println("3.Soru: ");
        ja.put("soru3");
        String c= scanner.nextLine();
        
        String string = a +","+ b+"," + c;

        JSONArray result = CDL.toJSONArray(ja, string);        
        System.out.println(result);
    }
}