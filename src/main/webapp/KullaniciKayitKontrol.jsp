<%-- 
    Document   : KullanıcıKayıtKontrol
    Created on : 31.Oca.2022, 17:46:04
    Author     : Batuh
--%>

<%@page import="KullanıcıGiris.KullanıcıRegister"%>
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
        KullanıcıRegister rgsave = new KullanıcıRegister();
        System.out.println("Geldim999");
        
        boolean a = rgsave.register_save(request);
    %>
    <%if(a==true)
    {
    %>
<center>
    <h1 style="color:black;
               font-size: 75px;">Giriş Başarılı</h1>
        <div class="my-2"></div>
        <a href="KullaniciGiris.jsp?A=<%= request.getParameter("A")%>" class="btn btn-secondary btn-icon-split">
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
        <a href="KullaniciKayit.jsp?A=<%= request.getParameter("A")%>" class="btn btn-secondary btn-icon-split">
            <span class="icon text-white-50">
                <i class="fas fa-arrow-right"></i>
            </span>
            <span class="text">Devam Et</span>
        </a>
</center>
    <%}
    %>
</body>
</body>
</html>
