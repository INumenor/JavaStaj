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
            <form action="Sorular.jsp" method="GET">
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
            rs = admin.Sorular_Bagla();
            while (rs.next()){
                if(rs.getInt("id") == editid) break;
            }
        %>
        
                <tr>
                    <td>ID</td>
                    <td><input type="text" name="ID_Edit" value="<%= rs.getInt("id") %>" size="50" />
                </tr>    
                <tr>
                    <td>Soru</td>
                    <td><input type="text" name="Question" value="" size="50" />
                    </td>
            </table>
            <input type="submit" value="Gönder" name="submit" />            
            </form>
    </body>
</html>