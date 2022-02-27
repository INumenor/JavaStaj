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
        Users_db dbUsers = new Users_db();

        boolean a = dbUsers.users_save(request);
    %>
    <%if(a==true)
    {
    %>
    <center>
        <h1 style="color:white">KAYIT BASARILI</h1>   
    </center>  
        <h1></h1>   
    <center>
        <div class="my-2"></div>
                <a href="javascript:window.close();" class="btn btn-success btn-icon-split">
                    <span class="icon text-white-50">
                        <i class="fas fa-check"></i>
                    </span>
                    <span class="text">Pencereyi Kapat</span>
                </a><!-- comment -->
    </center>
    <%}else
    {%>
<center>
        <h1 style="color:white">KAYIT BAŞARISIZ</h1>
    </center>  
        <h1></h1>   
    <center>
        <div class="my-2"></div>
                <a href="javascript:window.close();" class="btn btn-success btn-icon-split">
                    <span class="icon text-white-50">
                        <i class="fas fa-check"></i>
                    </span>
                    <span class="text">Pencereyi Kapat</span>
                </a><!-- comment -->
    </center>
    <%}
    %>
</body>
</html>
