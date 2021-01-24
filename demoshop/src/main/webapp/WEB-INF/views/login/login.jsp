<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>AdminLTE 3 | Log in (v2)</title>

<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/template/admin/assets/plugins/fontawesome-free/css/all.min.css">
<!-- icheck bootstrap -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/template/admin/assets/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/template/admin/assets/dist/css/adminlte.min.css">
<!-- SweetAlert 2 -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/template/admin/assets/plugins/sweetalert2/sweetalert2.min.css">
</head>
<body class="hold-transition login-page">
	<div class="login-box">
		<!-- /.login-logo -->
		<div class="card card-outline card-primary">
			<div class="card-header text-center">
				<a href="#" class="h1"><b>Đăng nhập</b></a>
			</div>
			<div class="card-body">
				<p class="login-box-msg">Sign in to start your session</p>
				<c:if test="${param.incorrectAccount != null}">
					<div class="alert alert-danger">Username or password are
						correct</div>
				</c:if>
				<c:if test="${param.accessDenied != null}">
					<div class="alert alert-danger">you Not authorize</div>
				</c:if>
				<c:if test="${messageSuccess ne null}">
					<div class="alert alert-success alert-dismissable" role="alert">
						<button type="button" class="close" data-dismiss="alert">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						${messageSuccess}
					</div>
				</c:if>
				<c:if test="${messageError ne null}">
					<div class="alert alert-success alert-dismissable" role="alert">
						<button type="button" class="close" data-dismiss="alert">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						${messageError}
					</div>
				</c:if>
				<form id="quickForm" action="j_spring_security_check" method="POST">
					<div class="form-group">
						<input type="text" class="form-control" id="username"
							name="j_username" placeholder="Username" required="required">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" id="password"
							name="j_password" placeholder="Password" required="required">
					</div>
					<!-- <div class="row">
          <div class="col-8">
            <div class="icheck-primary">
              <input type="checkbox" id="remember">
              <label for="remember">
                Remember Me
              </label>
            </div>
          </div> -->
					<!-- /.col -->
					<div class="col-4 ">
						<button type="submit" class="btn btn-primary btn-block"
							style="width: 150px;">Đăng nhập</button>
					</div>
					<!-- /.col -->
			</div>
			</form>
			<div class="social-auth-links text-left" style="width: 250px; padding-left: 25px;"><a href="<%=request.getContextPath()%>/dang-ky" class="text-center">Đăng
				ký </a><br> <a href="<%=request.getContextPath()%>/"
				class="text-center">Về giao diện mua sắm</a></div>
			                                    <div class="form-group">
                                      <div class="btn-group" role="group" aria-label="Basic example" style="height: 50px;width: 360px;">
			                            <button type="button" class="btn btn-outline-warning btn-sm" data-user="admin">Admin</button>
			                            <button type="button" class="btn btn-outline-warning btn-sm" data-user="nguyenvana">Nguyễn Văn A</button>
			                            <button type="button" class="btn btn-outline-warning btn-sm" data-user="nguyenvanb">Nguyễn Văn B</button>
			                            <button type="button" class="btn btn-outline-warning btn-sm" data-user="nguyenvanc">Nguyễn Văn C</button>
			                          </div>
			                        </div>

			<!-- /.social-auth-links -->

			<!--       <p class="mb-1">
        <a href="#">I forgot my password</a>
      </p> -->

		</div>
		<!-- /.card-body -->
	</div>
	<!-- /.card -->
	</div>
	<!-- /.login-box -->


	<!-- jQuery -->
	<script
		src="<%=request.getContextPath()%>/template/admin/assets/plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script
		src="<%=request.getContextPath()%>/template/admin/assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script
		src="<%=request.getContextPath()%>/template/admin/assets/dist/js/adminlte.min.js"></script>
	<!-- SweetAlert 2 -->
	<script
		src="<%=request.getContextPath()%>/template/admin/assets/plugins/sweetalert2/sweetalert2.min.js"></script>
	<!-- jquery-validation -->
	<script
		src="<%=request.getContextPath()%>/template/admin/assets/plugins/jquery-validation/jquery.validate.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/template/admin/assets/plugins/jquery-validation/additional-methods.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script
		src="<%=request.getContextPath()%>/template/admin/assets/dist/js/demo.js"></script>
									<script>
									$(document).ready(function() {
										$("button").click(function() {
											 var username = $(this).data('user');
											 var password = "123456";
											 if (username) {
											 	$("#username").val(username);
											 	$("#password").val(password);
											 }
										});
									});
									</script>   
</body>
</html>
