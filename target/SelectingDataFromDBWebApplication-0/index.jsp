<%-- 
    Document   : index
    Created on : 22.Eyl.2021, 15:25:02
    Author     : Batuh
--%>


<%@page import="java.util.ArrayList"%>
<%@page import="Sorular.Sorular_Sql"%>
<%@page import="Sorular.Sorular_db"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>FORM</title>
</head>
<body>
    <h1>Data Base'den Gelenler</h1>
    <table border="1">
        <thead>
            <tr>
                <th>TABLO</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
        <form action="display.jsp" method="POST">
            <%
        Sorular_db Sorudb = new Sorular_db();
        ArrayList<Sorular_Sql> list = Sorudb.gettum_sorular();
        int soruno = 0;
        for (Sorular_Sql Soru : list) 
        {
            System.out.println(Soru.getId());
            System.out.println(Soru.getSorular());
            soruno++; 
            %>
            <tr>
                <td><%= soruno %>.Soru</td>
                <td><%= Soru.getSorular() %></td>
                <td><input type="text" name="soru<%= soruno %>" value="" size="50" /></td>
            </tr>
            <%       
            }
            %>   
    </table>
        <input type="reset" value="Temizle" name="clear" />
        <input type="submit" value="Gönder" name="submit" />              
   </form>
</body>   
</html>
