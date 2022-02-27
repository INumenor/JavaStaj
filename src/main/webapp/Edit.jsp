<%@page import="Admin.Admin"%>
<%@page import="java.sql.Statement"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="static dbConnection.Connection.preparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="static dbConnection.Connection.con"%>
<%@page import="org.json.CDL"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Sorular.Sorular_Sql"%>
<%@page import="org.json.JSONArray"%>
<%@page import="Users.Users_Sql"%>
<%@page import="Users.Users_db"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>

        <form action="Admin.jsp" method="POST">
            <table border="1">
        <%
            ResultSet rs;
            Admin admin = new Admin();
            
            String eid = request.getParameter("edit_id");
            int editid = 0;
            if(eid != null){
                editid = Integer.parseInt(eid);
                if(editid != 0){
                    
                }
            }
            rs = admin.Admin_Bagla();
            while (rs.next()){
                if(rs.getInt("id") == editid) break;
            }
        %>
                <tr>
                    <td>Isim</td>
                    <td><input type="text" name="firstname" value="<%= rs.getString("firstname") %>" size="50" /></td>
                </tr>
                <tr>
                    <td>Soy Isim</td>
                    <td><input type="text" name="lastname" value="<%= rs.getString("lastname") %>" size="50" /></td>
                </tr>
                <tr>
                    <td>Yas</td>
                    <td><input type="text" name="age" value="<%= rs.getString("age") %>" size="50" /></td>
                </tr>
                <tr>
                    <td>Cevaplar</td>
                    <td><input type="text" name="answers" value="<%= rs.getString("answers") %>" size="50" /></td>
                </tr>
            </table>
            <a href="Admin.jsp?edit_id=<%= rs.getInt("id") %>&firstname=<%= rs.getString("firstname") %>&lastname=<%= rs.getString("lastname") %>&age=<%= rs.getString("age") %>&answers=<%= rs.getString("answers") %>"><button type="button" class="delete">Duzenle</button></a>
            
        </form>
    </body>
</html>
