<%-- 
    Document   : SoruGonder
    Created on : 01-Feb-2022, 12:04:08
    Author     : Lenovo
--%>

<%@page import="JavaMail.JavaMail"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Buttons</title>

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
        JavaMail mail = new JavaMail();
        String sIslem = request.getParameter("islem");
        int SoruSayisi = 0;
        String sSecilenSorular = "";
        String secimler[] = request.getParameterValues("sec");
        String sKacSoru = request.getParameter("KacSoru");
        String sMail = request.getParameter("email");
        String sPhone = request.getParameter("phone");
            if(sKacSoru != null){
                SoruSayisi = Integer.parseInt(sKacSoru);
                if(sMail != ""){
                    mail.main(sMail,"http://localhost:8080/SelectingDataFromDBWebApplication/KullaniciGiris.jsp?A="+sKacSoru+"");
                }
                %>
    <center>
        <h1 style="color:white">FORM YOLLANDI</h1>   
    </center>
    <center>
        <div class="p-3 bg-gray-800 text-white">Link : http://localhost:8080/SelectingDataFromDBWebApplication/KullaniciGiris.jsp?A=<%=sKacSoru%></div>
    </center>
        <h1></h1>
        <center>
                <div class="my-2"></div>
                                    <a href= "https://api.whatsapp.com/send?phone=90<%=request.getParameter("phone")%>&text=http://localhost:8080/SelectingDataFromDBWebApplication/KullaniciGiris.jsp?A=<%=sKacSoru%>"
                                       class="btn btn-success btn-icon-split">
                                        <span class="icon text-white-50">
                                            <i class="fas fa-check"></i>
                                        </span>
                                        <span class="text">WhatsApp ile Gönder</span>
                                    </a>
                <div class="my-2"></div>
                                    <button onclick="copyText('http://localhost:8080/SelectingDataFromDBWebApplication/KullaniciGiris.jsp?A=<%=sKacSoru%>')" 
                                            class="btn btn-success btn-icon-split">
                                        <span class="icon text-white-50">
                                            <i class="fas fa-check"></i>
                                        </span>
                                        <span class="text">Copy</span>
                                    </button>
        </center>
                <%
            }
            else{
                for(int i = 0; i < secimler.length; i++){
                    if(i == 0) sSecilenSorular = sSecilenSorular + secimler[i];
                    else sSecilenSorular = sSecilenSorular+ "-" + secimler[i];
                }
                SoruSayisi = secimler.length;
                if(sMail != ""){
                    mail.main(sMail,"http://localhost:8080/SelectingDataFromDBWebApplication/KullaniciGiris.jsp?A="+sSecilenSorular +"");
                }
                %>
    <center>
        <h1 style="color:white">FORM YOLLANDI</h1>   
    </center>  
    <center>
        <div class="p-3 bg-gray-800 text-white">Link: http://localhost:8080/SelectingDataFromDBWebApplication/KullaniciGiris.jsp?A=<%=sSecilenSorular%></div>
    </center>
        <h1></h1>
        <center>
                <div class="my-2"></div>
                                    <a href= "https://api.whatsapp.com/send?phone=90<%=request.getParameter("phone")%>&text=http://localhost:8080/SelectingDataFromDBWebApplication/KullaniciGiris.jsp?A=<%=sSecilenSorular%>"
                                       class="btn btn-success btn-icon-split">
                                        <span class="icon text-white-50">
                                            <i class="fas fa-check"></i>
                                        </span>
                                        <span class="text">WhatsApp ile Gönder</span>
                                    </a>
                <div class="my-2"></div>
                                    <button onclick="copyText('http://localhost:8080/SelectingDataFromDBWebApplication/KullaniciGiris.jsp?A=<%=sSecilenSorular%>')"
                                            class="btn btn-success btn-icon-split">
                                        <span class="icon text-white-50">
                                            <i class="fas fa-check"></i>
                                        </span>
                                        <span class="text">Copy</span>
                                    </button>
        </center>    
                <%
            }
        %>
        <script>
            function copyText(text) {
                navigator.clipboard.writeText(text);
            }
        </script>
    </body>
</html>
