<%@page import="com.demoshop.dto.CategoryDTO"%>

<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/template/admin/inc/header.jsp"%>
<%@ include file="/template/admin/inc/leftbar.jsp"%>
<c:url var="home" value="/quan-tri/trang-chu" />
<c:url var="categoryHome" value="/quan-tri/danh-muc/list" />
<c:url var="deleteCategoryURL" value="/quan-tri/danh-muc/xoa" />
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1 style="color:blue; font-weight: bold; font-family: courier; font-size: 250%;">Danh mục</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="${home}">Trang chủ</a></li>
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
				<div class="col-12">
					<div class="card">
						<div class="card-header">
							<h3 class="card-title">
								<a class="btn btn-block btn-success"
									href="<c:url value ='/quan-tri/danh-muc/them' />">Thêm danh
									muc</a>
							</h3>
	
						</div>
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
						<!-- /.card-header -->
						<div class="card-body">
							<table id="example1" class="table table-bordered table-striped">
								<thead>
									<tr>
										
										<th>Tên</th>
										<th>Id Danh muc cha</th>
										<td>Thao tac</td>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="item" items="${categoryDTO.listResult}">

										<tr>
											
											<td>${item.name}</td>
											<td>${item.parentId}</td>
											<td><c:url var="updateCategoryURL"
													value="/quan-tri/danh-muc/chinh-sua">
													<c:param name="id" value="${item.id}" />
												</c:url><a class="btn btn-block btn-success"
												title="Cập nhật danh muc" style="width: 50px"
												href='${updateCategoryURL}'><i class="fas fa-edit"
													style="color: pink"></i></a><button id="${item.id}" type="button"
													onclick="warningBeforeDelete(this)" style="width: 50px"
													class="btn btn-block btn-danger" data-toggle="tooltip"
													title='Xóa danh mục'>
													<i class="fas fa-trash"></i>
												</button></td>
										</tr>
									</c:forEach>
								</tbody>

							</table>
						</div>
						<!-- /.card-body -->

						<div class="card-footer clearfix"></div>

						<div style="display: none;" id="result"></div>
					</div>
					<!-- /.card -->
				</div>
				<!-- /.col -->
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

	
	function warningBeforeDelete(obj) {
		var id = obj.id;
		Swal.fire({
			title : "Xác nhận xóa",
			text : "Bạn có chắc chắn muốn xóa hay không",
			type : "warning",
			showCancelButton : true,
			confirmButtonClass : "btn-success",
			cancelButtonClass : "btn-danger",
			confirmButtonText : "Xác nhận",
			cancelButtonText : "Hủy bỏ",
		}).then((result) => {
	      	  if (result.isConfirmed) {
	      		window.location.href = "${deleteCategoryURL}?id="+id;
				}
			});
	}
</script>
