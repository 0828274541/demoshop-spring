<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@include file="/template/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Đăng ký tài khoản | Registration Page (v2)</title>

<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="<c:url value='/template/admin/assets/plugins/fontawesome-free/css/all.min.css' />">
<!-- icheck bootstrap -->
<link rel="stylesheet"
	href="<c:url value='/template/admin/assets/plugins/icheck-bootstrap/icheck-bootstrap.min.css' />">
<!-- Theme style -->
<link rel="stylesheet"
	href="<c:url value='/template/admin/assets/dist/css/adminlte.min.css' />">
<!-- SweetAlert 2 -->
<link rel="stylesheet"
	href="<c:url value='/template/admin/assets/plugins/sweetalert2/sweetalert2.min.css' />">
</head>
<body class="hold-transition register-page">
	<div class="register-box">
		<div class="card card-outline card-primary">
			<div class="card-header text-center">
				<a href="<%=request.getContextPath()%>/login" class="h1"><b>Admin</b>LTE</a>
			</div>
			<div class="card-body">
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
				<c:url var="register" value="/dang-ky" />
				<form:form id="quickForm" action="${register}" method="POST"
					modelAttribute="user">
					<div class="form-group">
						<form:input type="text" class="form-control" id="username"
							path="username" placeholder="nhập tên tài khoản"
							required="required" />
					</div>
					<div class="form-group">
						<form:input type="password" class="form-control" id="password"
							path="password" placeholder=" mật khẩu" required="required" />
					</div>
					<div class="form-group">
						<form:input type="password" class="form-control" id="repassword"
							path="repassword" placeholder="nhập lại mật khẩu"
							required="required" />
					</div>
					<div class="row">
						<div class="form-group mb-0">
							<div class="icheck-primary">
								<input type="checkbox" id="agreeTerms" name="terms"
									value="agree" required="required"> <label
									for="agreeTerms"> Tôi đồng ý với các điều <a href="#">điều
										khoảng</a>
								</label>
							</div>
						</div>
						<!-- /.col -->
						<div class="col-4">
							<button type="submit" class="btn btn-primary btn-block">Đăng
								ký</button>
						</div>
						<!-- /.col -->
					</div>
				</form:form>

				<div class="social-auth-links text-center"></div>
				<a href="<%=request.getContextPath()%>/dang-nhap"
					class="text-center">Tôi đã có tài khoản</a><br> <a
					href="<%=request.getContextPath()%>/" class="text-center">Về
					giao diện mua sắm</a>
			</div>


			<!-- /.form-box -->
		</div>
		<!-- /.card -->
	</div>
	<!-- /.register-box -->

	<!-- jQuery -->
	<script
		src="<c:url value='/template/admin/assets/plugins/jquery/jquery.min.js' />"></script>
	<!-- Bootstrap 4 -->
	<script
		src="<c:url value='/template/admin/assets/plugins/bootstrap/js/bootstrap.bundle.min.js' />"></script>
	<!-- SweetAlert 2 -->
	<script
		src="<c:url value='/template/admin/assets/plugins/sweetalert2/sweetalert2.min.js' />"></script>
	<!-- AdminLTE App -->
	<script
		src="<c:url value='/template/admin/assets/dist/js/adminlte.min.js' />"></script>
	<!-- jquery-validation -->
	<script
		src="<c:url value='/template/admin/assets/plugins/jquery-validation/jquery.validate.min.js' />"></script>
	<script
		src="<c:url value='/template/admin/assets/plugins/jquery-validation/additional-methods.min.js' />"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="<c:url value='/template/admin/assets/dist/js/demo.js' />"></script>
	<!-- Page specific script -->

	<script>
		$(document).ready(function() {
			var messageSucces = '${messageSucces}';
			if (messageSucces != '') {
				alert(messageSucces)
			}
		});
	</script>
</body>
</html>
