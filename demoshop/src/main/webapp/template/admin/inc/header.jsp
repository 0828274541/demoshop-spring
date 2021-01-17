<%@include file="/template/taglib.jsp" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>AdminLTE 3 | Dashboard</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="<c:url value='/template/admin/assets/plugins/fontawesome-free/css/all.min.css' />">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Tempusdominus Bootstrap 4 -->
  <link rel="stylesheet" href="<c:url value='/template/admin/assets/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css' />">
  <!-- iCheck -->
  <link rel="stylesheet" href="<c:url value='/template/admin/assets/plugins/icheck-bootstrap/icheck-bootstrap.min.css' />">
  <!-- JQVMap -->
  <link rel="stylesheet" href="<c:url value='/template/admin/assets/plugins/jqvmap/jqvmap.min.css' />">
  <!-- Theme style -->
  <link rel="stylesheet" href="<c:url value='/template/admin/assets/dist/css/adminlte.min.css' />">
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="<c:url value='/template/admin/assets/plugins/overlayScrollbars/css/OverlayScrollbars.min.css' />">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="<c:url value='/template/admin/assets/plugins/daterangepicker/daterangepicker.css' />">
  <!-- summernote -->
  <link rel="stylesheet" href="<c:url value='/template/admin/assets/plugins/summernote/summernote-bs4.min.css' />">
    <!-- SweetAlert 2 -->
  <link rel="stylesheet" href="<c:url value='/template/admin/assets/plugins/sweetalert2/sweetalert2.min.css' />">
  
     <link rel="stylesheet" href="<c:url value='/template/admin/assets/plugins/jquery-ui/jquery-ui.css' />">
  
</head>
<body class="hold-transition sidebar-mini layout-fixed sidebar-collapse">
<div class="wrapper">

  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="<c:url value='/trang-chu' />" class="nav-link"><p style="color:green; font-weight:bold">Cửa hàng<p></a>
      </li>
    </ul>


    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
    

      <!-- Notifications Dropdown Menu -->
 
      <li class="nav-item">
        <a class="nav-link" data-widget="fullscreen" href="#" role="button">
          <i class="fas fa-expand-arrows-alt"></i>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" data-widget="control-sidebar" data-slide="true" href="#" role="button">
          <i class="fas fa-th-large"></i>
        </a>
      </li>
    </ul>
  </nav>
  <!-- /.navbar -->