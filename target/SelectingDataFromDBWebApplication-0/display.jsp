<%-- 
    Document   : display
    Created on : 03.Eki.2021, 02:46:20
    Author     : Batuh
--%>

<%@page import="Users.Users_Sql"%>
<%@page import="Users.Users_db"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
    <%
        Users_db dbUsers = new Users_db();
        Users_Sql sqlUsers = new Users_Sql();
        
        //JSONObject obj = new JSONObject();
        
        //obj.put("firstname",request.getParameter("soru1"));
        //obj.put("lastname",request.getParameter("soru2"));
        //obj.put("age",request.getParameter("soru3"));
        //obj.put("email",request.getParameter("soru4"));
        //obj.put("telnum",request.getParameter("soru5"));
        //obj.put("bircty",request.getParameter("soru6"));
        //obj.put("marry",request.getParameter("soru7"));
        //obj.put("edu",request.getParameter("soru8"));
        //obj.put("hobby",request.getParameter("soru9"));
        //obj.put("lcknum",request.getParameter("soru10"));
        //obj.put("bscolor",request.getParameter("soru11"));
        //obj.put("bsmusic",request.getParameter("soru12"));
        
        //out.print(obj);

        sqlUsers.setFirstname(request.getParameter("soru1"));
        sqlUsers.setLastname(request.getParameter("soru2"));
        sqlUsers.setage(Integer.parseInt(request.getParameter("soru3")));
        sqlUsers.setEmail(request.getParameter("soru4"));
        sqlUsers.settelnum(Integer.parseInt(request.getParameter("soru5")));
        sqlUsers.setBircty(request.getParameter("soru6"));
        sqlUsers.setMarry(request.getParameter("soru7"));
        sqlUsers.setEdu(request.getParameter("soru8"));
        sqlUsers.setHobby(request.getParameter("soru9"));
        sqlUsers.setlcknum(request.getParameter("soru10"));
        sqlUsers.setBscolor(request.getParameter("soru11"));
        sqlUsers.setBsmusic(request.getParameter("soru12"));
  
        boolean a = dbUsers.users_save(sqlUsers,request);
    %>
    <%if(a==true)
    {
    %>
    <h1>Kayıt Basarılı</h1>
    <%  }else
    {%>
    <h1>Kayıt Başarısız</h1>
    <%}
    %>
</body>
</html>
