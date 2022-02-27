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
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Tables</title>

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
    
    <body id="page-top">

    <div id="wrapper">
        
        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">Admin Panel</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item">
                <a class="nav-link" href="Sorular.jsp">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>Sorular</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Formlar
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
                    aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>Form</span>
                </a>
                <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Formlar</h6>
                        <a class="collapse-item" href="login.html">Formlar</a>
                    </div>
                </div>
            </li>

            <!-- Heading -->
            <div class="sidebar-heading">
                Listeler
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-fw fa-cog"></i>
                    <span>Liste</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Genel Listeler</h6>
                        <a class="collapse-item" href="AdminList.jsp">Admin Liste</a>
                        <a class="collapse-item" href="UsersList.jsp">Kullanıcı Liste</a>
                    </div>
                </div>
            </li>

            <!-- Nav Item - Utilities Collapse Menu -->

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <!-- Nav Item - Pages Collapse Menu -->
            <!-- Nav Item - Charts -->

            <!-- Nav Item - Tables -->

            <!-- Divider -->

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

        </ul>

        <div id="content-wrapper" class="d-flex flex-column">

      
            <div id="content">

                <div class="container-fluid">
                    
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <center>
                                <h1></h1>
                                <h1 style="" class="m-0 font-weight-bold text-primary">Sorular</h1>
                            </center>
                        </div>
                    </body>
         <center>
    <form action="SoruGonder.jsp?" method="POST">
        <h3>Kac Soru Sorulsun: <input type="text" name="KacSoru" value="" size="30" /></h3>
        <h3>E Posta Adresi: <input type="text" name="email" value="" placeholder="Email" /></h3>
        <h3>WhatApp'dan Gönder: <input type="text" name="phone" value="" placeholder="Telefon Numarası"/></h3>
        <div class="my-2"></div>
            <button type="submit" value="Gonder" name="2" class="btn btn-success btn-icon-split">
                <span class="icon text-white-50">
                    <i class="fas fa-check"></i>
                </span>
                <span class="text">Gonder</span>
            </button>
    </form>
           </center>
    <h1> </h1>
    <form action="SoruGonder.jsp?" method="POST">
        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
             <thead>
                <tr>
             
                    <th>
                        <div class="my-2"></div>
                                    <a href="SorularEkle.jsp" class="btn btn-secondary btn-icon-split">
                                        <span class="icon text-gray-600">
                                            <i class="fas fa-arrow-right"></i>
                                        </span>
                                        <span class="text">Soru Ekle</span>
                                    </a>
                    </th>
                    <th style="font-size: 25px;"><center> Sorular</center></th>
                    <th style="font-size: 25px;"><center>Düzenle </center></th>
                    <th style="font-size: 25px;"><center>Sil </center></th>
            
                </tr>
            </thead>
        <%
            ResultSet rs;
            Admin admin = new Admin();
            admin.Connection();
            String sid = request.getParameter("sil_id");
            String sQst = request.getParameter("Question");
            String sSEkle = request.getParameter("SoruEkle");
            String soruid = request.getParameter("ID_Edit");
            int silid;
            int editid;
            if(sid != null){
                silid = Integer.parseInt(sid);
                if(silid != 0){
                    admin.Sorular_Sil(silid);
                }
            }
            if(soruid != null){
                editid = Integer.parseInt(soruid);
                if(editid != 0){
                    admin.Sorular_Edit(editid, sQst);
                }
            }
            if(sSEkle != null){
                admin.Soru_Ekle(sSEkle);
            }
            rs = admin.Sorular_Bagla();
            while (rs.next()){
        %>
                <tr>
                    <%if(rs.getInt("id") > 5){%>
                    <td><input type="checkbox" name="sec" value="<%= rs.getInt("id") %>"/></td>
                    <%} else{%>
                    <td>X</td>
                    <%}%>
                    <td style="font-size: 20px;"><%= rs.getString("Soru") %></td>
                    <td>
                    <center>
                        <div class="my-2"></div>
                    <a href="SorularEdit.jsp?edit_id=<%= rs.getInt("id") %>" class="btn btn-primary btn-icon-split">
                        <span class="icon text-white-50">
                            <i class="fas fa-info-circle"></i>
                        </span>
                        <span class="text">Düzenle</span>
                    </a>    
                    </center>  
                    </td>
                    <td>
                    <center>
                     <div class="my-2"></div>
                    <a href="Sorular.jsp?sil_id=<%= rs.getInt("id") %>" class="btn btn-danger btn-icon-split">
                        <span class="icon text-white-50">
                            <i class="fas fa-trash"></i>
                        </span>
                        <span class="text"><center>Kaldır</center></span>
                    </a>
                        </center>
                    </td>
                    
                    
                </tr>
        <%
            }
        %>
        <tr>
            <td>E Posta Adresi: </td>
            <td><input type="text" name="email" value="" size="30"  placeholder="Email"/></td>
            <td>WhatApp'dan Gönder: <input type="text" name="phone" value="" placeholder="Telefon Numarası"/></td>
        </tr>
        <td>
        <div class="my-2"></div>
            <button type="submit" value="Gonder" name="2" class="btn btn-success btn-icon-split">
                <span class="icon text-white-50">
                    <i class="fas fa-check"></i>
                </span>
                <span class="text">Gonder</span>
            </button>
        </td>
        <center>

        </center>
            </tbody>
        </table>    
        </form>
        
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
    </body>
</html>
