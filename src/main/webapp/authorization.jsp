<%-- 
    Document   : authorization
    Created on : 19.Ara.2021, 15:18:31
    Author     : Batuh
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Login.Login_db"%>
<%@page import="Login.Login_Sql"%>
<%@page import="Login.Login"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Custom fonts for this template-->
    <link href="startbootstrap-sb-admin-2-gh-pages/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="startbootstrap-sb-admin-2-gh-pages/css/sb-admin-2.min.css" rel="stylesheet">

</head>
<style>
    body
    {
        background-image: url("Image/bg7.jpg");
        background-repeat: no-repeat;
        background-size: cover;
    }
</style>
<body>
    <%
        boolean a = false;
        Login login = new Login();
        
        Login_db Logindb = new Login_db();
        System.out.println(request.getParameter("username")+"321");
        ArrayList<Login_Sql> list = Logindb.gettum_login();
        
        a = login.loginauthorization(request); 
    %>
    <%if(a==true)
    {
        System.out.println("Geldim 4");
    %>
<center>
    <h1 style="color:black;
               font-size: 75px;">Giriş Başarılı</h1>
        <div class="my-2"></div>
        <a href="Sorular.jsp" class="btn btn-secondary btn-icon-split">
            <span class="icon text-white-50">
                <i class="fas fa-arrow-right"></i>
            </span>
            <span class="text">Devam Et</span>
        </a>
    <%}else
    {%>
</center>
<center>
    <h1 style="color:black;
               font-size: 75px;">Giriş Başarısız</h1>
        <div class="my-2"></div>
        <a href="login.jsp" class="btn btn-secondary btn-icon-split">
            <span class="icon text-white-50">
                <i class="fas fa-arrow-right"></i>
            </span>
            <span class="text">Devam Et</span>
        </a>
</center>
    <%}
    %>
</body>
</html>