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
        <title>Admin</title>
    </head>
    <body>
        <h1>Admin</h1>
        <table border="1">
            <tbody>
                <tr>
                    <td>sec</td>
                    <td>firstname</td>
                    <td>lastname</td>
                    <td>age</td>
                    <td>answers</td>
                </tr>
        <%
            ResultSet rs;
            Admin admin = new Admin();
            String sid = request.getParameter("sil_id");
            String eid = request.getParameter("edit_id");
            String sfname = request.getParameter("firstname");
            String slname = request.getParameter("lastname");
            String sage = request.getParameter("age");
            String sansw = request.getParameter("answers");      
            int iage;
            int editid = 0;
            int silid;
            if(sfname != null){
                iage = Integer.parseInt(sage);
                //iage = 20;
                admin.Admin_Edit(editid, sfname, slname, iage, sansw);
                return;
            }
            if(sid != null){
                silid = Integer.parseInt(sid);
                if(silid != 0){
                    admin.Admin_Sil(silid);
                }
            }
            rs = admin.Admin_Bagla();
            while (rs.next()){
                
        %>
                <tr>
                    <td><input type="checkbox" name="Sec" value="ON" checked="checked" /></td>
                    <td><%= rs.getString("firstname") %></td>
                    <td><%= rs.getString("lastname") %></td>
                    <td><%= rs.getInt("age") %></td>
                    <td><%= rs.getString("answers") %></td>
                    <td><a href="Edit.jsp?edit_id=<%= rs.getInt("id") %>"><button type="button" class="delete">Duzenle</button></a></td>
                    <td><a href="Admin.jsp?sil_id=<%= rs.getInt("id") %>"><button type="button" class="delete">Sil</button></a></td>
                </tr>
        <%
            }
        %>
                <script language="javascript">
                    function editRecord(ID){
                    }
                    function deleteRecord(id){
                        document.getElementById("demo2").innerHTML = "st = " + st;
                        int sayi = id;
                        javascript:alert('Hello World!');
                        document.getElementById("demo").innerHTML = id + " numarali ID silinmistir! 0";
                    }
                    function myFunction(ID) {
                      document.getElementById("demo").innerHTML = "Hello World " + ID;
                    }
                </script>
            </tbody>
        </table>
    </body>
</html>
