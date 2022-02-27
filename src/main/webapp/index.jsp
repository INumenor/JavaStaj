<%-- 
    Document   : index
    Created on : 22.Eyl.2021, 15:25:02
    Author     : Batuh
--%>
<%@page import="Admin.Admin"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="KullanıcıKonrtol.Answers_Sql"%>
<%@page import="static Login.Login.bGirisYapildiMi"%>
<%@page import="JavaMail.JavaMail"%>
<%@page import="JavaMail.JavaMailUntil"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Sorular.Sorular_Sql"%>
<%@page import="Sorular.Sorular_db"%>
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


    <!-- Custom fonts for this template -->
    <link href="startbootstrap-sb-admin-2-gh-pages/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="startbootstrap-sb-admin-2-gh-pages/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="startbootstrap-sb-admin-2-gh-pages/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

</head>
<style>
th, td {
  padding: 8px;
  text-align: left;
  border-bottom: 1px solid #ddd;
}

tr:hover {background-color: lightblue;}

</style>
<body id="page-top">

    <div id="wrapper">

        <div id="content-wrapper" class="d-flex flex-column">

      
            <div id="content">

                <div class="container-fluid">
                    
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="50%" cellspacing="0">
                                    <h1></h1>
        <form action="display.jsp" method="POST">
    <%
        boolean mailvarmi = false;
        String smail = request.getParameter("email");
        String smailkontrol = "";
        ResultSet rs;
        Admin admin = new Admin();
        rs = admin.Admin_Bagla();
        while (rs.next()){
            System.out.println(rs.getString("email"));
            if(rs.getString("email").equals(smail)){
                mailvarmi = true;
            }
        }
        if(mailvarmi == true){
            %>  
                <h1>Daha once bu formu doldurdunuz.</h1>
                <h1>Tekrar dolduramazsiniz.</h1>
            <% 
        }
        
        else if(mailvarmi == false){
            %> <center><h1>Sorular</h1></center> <%
        int SoruSayisi = 0;
        String sSecilenSorular = "";
        String A = request.getParameter("A");
        String ParcaA[] = A.split("-");
        if(ParcaA.length > 1){
            sSecilenSorular = A;
            SoruSayisi = ParcaA.length;
        }
        else if(ParcaA.length == 1){
            SoruSayisi = Integer.parseInt(A);
        }
        Sorular_db Sorudb = new Sorular_db();
        ArrayList<Sorular_Sql> list = Sorudb.gettum_sorular(SoruSayisi, sSecilenSorular);
        int soruno = 0;
        for (Sorular_Sql Soru : list) 
        {
            soruno++; 
    %>
            <tr>
                <td><%= soruno %>.Soru</td>
                <td><%= Soru.getSorular() %></td>
                <td><input type="text" name="soru<%= soruno %>" value="" size="70" /></td>
            </tr>
            <%       
            }
            %>   
    </table>
    <center>
            <div class="my-2"></div>
                                    <button class="btn btn-success btn-icon-split" type="submit" value="Gönder" name="submit" >
                                        <span class="icon text-white-50">
                                            <i class="fas fa-check"></i>
                                        </span>
                                        <span class="text">Gönder</span>
                                    </button>
            <div class="my-2"></div>
                                    <button  href="#" class="btn btn-info btn-icon-split" type="reset" value="Temizle" name="clear">
                                        <span class="icon text-white-50">
                                            <i class="fas fa-info-circle"></i>
                                        </span>
                                        <span class="text">Temizle</span>
                                    </button>
    </center>
        </form>
        <% } %>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
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

    <!-- Page level plugins -->
    <script src="startbootstrap-sb-admin-2-gh-pages/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="startbootstrap-sb-admin-2-gh-pages/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="startbootstrap-sb-admin-2-gh-pages/js/demo/datatables-demo.js"></script>
        </center>
    </body>
</html>
