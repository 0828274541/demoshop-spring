<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/template/admin/inc/header.jsp"%>
<%@ include file="/template/admin/inc/leftbar.jsp"%>
<c:url var="categoryHome" value="/quan-tri/danh-muc/list" />
<c:url var="categoryAPI" value="/api/category" />
<c:url var="addCategoryURL" value="/quan-tri/danh-muc/them" />

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1 style="color:blue; font-weight: bold; font-family: courier; font-size: 250%;">Thêm danh mục</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="${categoryHome}">Danh
								sách danh mục</a></li>
						<li class="breadcrumb-item active">(Về trang danh mục)</li>
					</ol>
				</div>
			</div>
		</div>
		<!-- /.container-fluid -->
	</section>

	<!-- Main content -->
	<section class="content">
		<div class="container-fluid">
			<div class="row">
				<!-- left column -->
				<div class="col-md-12">
					<!-- general form elements -->
					<div class="card">
						<div class="card-header">
							<h2 class="card-title" id="message"></h2>
						</div>
						<!-- /.card-header -->
												<c:if test="${messageError ne null}">
							<div class="alert alert-danger alert-dismissable" role="alert">
								<button type="button" class="close" data-dismiss="alert">
									<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
								</button>
								${messageError}
							</div>
						</c:if>
						<!-- form start -->
						<form:form id="formSubmit" modelAttribute="categoryDTO">
							
							<div class="card-body">
								<div class="form-group">
									<label>Tên danh mục</label>
									<form:input class="form-control" path="name"
										placeholder="Enter category name" required="required" />
								</div>
								<div class="form-group">
									<label>Thuộc danh mục</label>
									<form:select path="parentId" id="parentId"
										class="form-control select2" 
										title="Please select something!">
										<form:option value="0" label="Danh muc goc" />
										<c:forEach var="item" items="${categoryDTO.listResult}">
											<c:if test="${item.id != categoryDTO.id }">
												<form:option value="${item.id }" label="${item.name }" />
											</c:if>
										</c:forEach>
									</form:select>
								</div>
							</div>
							<!-- /.card-body -->

							<div class="card-footer">
								<button type="submit" class="btn btn-primary" id="btnAddCategory">Thêm
									danh mục</button>
								<a href="${categoryHome}" class="btn btn-secondary">Quay về</a>
							</div>
						</form:form>
					</div>
					<!-- /.card -->
				</div>
				<!--/.col (right) -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container-fluid -->
	</section>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<%@ include file="/template/admin/inc/footer.jsp"%>
<script>
    document.getElementById("category").classList.add('active');		
</script>
