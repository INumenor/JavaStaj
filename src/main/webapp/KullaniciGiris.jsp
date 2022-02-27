<%-- 
    Document   : KullaniciGiris
    Created on : 31.Oca.2022, 14:04:17
    Author     : Batuh
--%>

<%@page import="JavaMail.JavaMail"%>
<%@page import="KullanıcıKonrtol.Answers_Sql"%>
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
    <body class="bg-gradient-primary">

    <div class="container">
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">Hoşgeldiniz</h1>
                                    </div>
                                    <form method="post" action="KullaniciKontrol.jsp" class="user">
                                        <div class="form-group">
                                            <input type="text" name="email" value="" class="form-control form-control-user"
                                                placeholder="Enter Email .... "/>
                                        </div>
                                        <div class="form-group">
                                            <input type="text" name="password" value="" class="form-control form-control-user"
                                                placeholder="Password"/>
                                        </div>
                                        <button class="btn btn-primary btn-user btn-block">
                                            Giriş Yap
                                        </button>
                                        <tr style="display:none;"> 
                                        <td style="display:none;">Degerler</td>
                                        <td style="display:none;"><input type="text" name="degerler" value="<%= request.getParameter("A")%>" /></td>
                                        </tr>
                                    </form>
                                    <h1></h1>
                                    <form method="post" action="KullaniciKayit.jsp?A=<%= request.getParameter("A")%>" autocomplete='off' class='user'>
                                            <button class="btn btn-primary btn-user btn-block">
                                            Kayıt Ol
                                            </button>
                                    </form> 
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="startbootstrap-sb-admin-2-gh-pages/vendor/jquery/jquery.min.js"></script>
    <script src="startbootstrap-sb-admin-2-gh-pages/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="startbootstrap-sb-admin-2-gh-pages/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="startbootstrap-sb-admin-2-gh-pages/js/sb-admin-2.min.js"></script>

</body>
</html>

