<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/template/admin/inc/header.jsp"%>
<%@ include file="/template/admin/inc/leftbar.jsp"%>
<c:url var="home" value="/quan-tri/trang-chu" />
<c:url var="userHome" value="/quan-tri/tai-khoan" />
<c:url var="editUserURL" value="/quan-tri/tai-khoan/chinh-sua" />
<c:url var="deleteUserURL" value="/quan-tri/tai-khoan/xoa" />
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1
						style="color: blue; font-weight: bold; font-family: courier; font-size: 250%;">Tài
						khoản</h1>
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
								<%-- <a class="btn btn-block btn-success"
									href="<c:url value ='/quan-tri/tai-khoan/them' />">Thêm tài khoản</a> --%>
							</h3>

						</div>
						<!-- /.card-header -->
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
						<div class="card-body">
							<div class="col-sm-6">
								<h3 style="color: blue">Tài khoản của bạn</h3>
							</div>
							<table id="example1" class="table table-bordered table-striped">
								<thead>
									<tr>
										<th>Id</th>
										<th>Username</th>
										<th>Fullname</th>
										<th>Address</th>
										<th>Telephone_number</th>
										<th>Role</th>
										<th>Action</th>
									</tr>
								</thead>
								<tbody>

									<tr>
										<td>${model.id}</td>
										<td>${model.username}</td>
										<td>${model.fullname}</td>
										<td>${model.address}</td>
										<td>${model.telephoneNumber}</td>
										<td><c:forEach var="item"
												items="${model.roleUserLoginList}">${item}&ensp;</c:forEach>
										</td>
										<td>
											<button type="button" class="btn btn-block btn-success"
												data-toggle="modal"
												data-target="#modal-default${model.id}">Edit</button> <!-- The Modal -->
											<div class="modal fade" id="modal-default${model.id}">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header">
															<h4 class="modal-title">Sửa thông tin</h4>
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
														</div>
														<div class="modal-body">
															<div class="card card-primary">
																<div class="card-header">
																	<h2 class="card-title">Sửa thông tin</h2>
																</div>
																<!-- /.card-header -->
																<!-- form start -->
																<form:form id="editForm"
																	action="${editUserURL}"
																	modelAttribute="model" method="POST">
																	<div class="card-body">
																		<div class="form-group">
																			<label>Fullname</label>
																			<form:input type="text" class="form-control"
																				id="fullname" path="fullname" value="${model.fullname}"
																				placeholder="Enter fullname" required="required" />
																		</div>
																		<div class="form-group">
																			<label>Address</label> <form:input type="text"
																				class="form-control" id="address" path="address"
																				placeholder="Enter address" value="${model.address}" required="required"/>
																		</div>
																		<div class="form-group">
																			<label>Telephone_number</label> <form:input type="number"
																				class="form-control" id="telephoneNumber"
																				path="telephoneNumber" value="${model.telephoneNumber}"
																				placeholder="Enter telephoneNumber" required="required" />
																		</div>
																		<form:input type="hidden" id="id" path="id" value="${model.id}"/>
																	</div>
																	<!-- /.card-body -->

																	<div class="card-footer">

																		<button type="submit" class="btn btn-primary">Save
																			changes</button>

																		<button type="button" class="btn btn-default"
																			data-dismiss="modal">Close</button>
																	</div>
																</form:form>
															</div>
															<!-- /.card -->
														</div>
													</div>
													<!-- /.modal-content -->
												</div>
												<!-- /.modal-dialog -->
											</div> <!-- /.modal -->
										</td>
									</tr>

								</tbody>

							</table>
						</div>
						<!-- /.card-body -->
						<div style="display: none;" id="result"></div>
					</div>
					<!-- /.card -->
					<c:if test="${not empty model.listResult }">
						<div class="card">
							<div class="card-body">
								<div class="col-sm-6">
									<h3>Quan Ly Tai Khoan</h3>
								</div>
								<table id="example1" class="table table-bordered table-striped">
									<thead>
										<tr>
											<th>Id</th>
											<th>Username</th>
											<th>Fullname</th>
											<th>Address</th>
											<th>Telephone_number</th>
											<th>Role</th>
											<th>Action</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="item" items="${model.listResult}">
											<tr>
												<td>${item.id}</td>
												<td>${item.username}</td>
												<td>${item.fullname}</td>
												<td>${item.address}</td>
												<td>${item.telephoneNumber}</td>
												<td><c:forEach var="roleItem"
														items="${item.roleUserList}">
														<c:out value="${roleItem.name}"></c:out>&ensp;
													</c:forEach>
												</td>
												<td>
													<button type="button" class="btn btn-block btn-success"
														data-toggle="modal" data-target="#modal-default${item.id}">Edit</button>
													<!-- The Modal -->
													<div class="modal fade" id="modal-default${item.id}">
														<div class="modal-dialog">
															<div class="modal-content">
																<div class="modal-header">
																	<h4 class="modal-title">Sửa thông tin</h4>
																	<button type="button" class="close"
																		data-dismiss="modal" aria-label="Close">
																		<span aria-hidden="true">&times;</span>
																	</button>
																</div>
																<div class="modal-body">
																	<div class="card card-primary">
																		<div class="card-header">
																			<h2 class="card-title">Sửa thông tin</h2>
																		</div>
																		<!-- /.card-header -->
																		<!-- form start -->
																		<form:form id="editForm"
																			action="${editUserURL}"
																			modelAttribute="model" method="POST">
																			<div class="card-body">
																				<div class="form-group">
																					<label>Fullname</label>
																					<form:input type="text" class="form-control"
																						id="fullname" path="fullname" value="${item.fullname}" 
																						placeholder="Enter fullname" required="required"/>
																				</div>
																				<div class="form-group">
																					<label>Address</label> <form:input type="text"
																						class="form-control" id="address" path="address" value="${item.address}"
																						placeholder="Enter address" required="required" />
																				</div>
																				<div class="form-group">
																					<label>Telephone_number</label> <form:input type="number"
																						class="form-control" id="telephoneNumber"
																						path="telephoneNumber" value="${item.telephoneNumber}"
																						placeholder="Enter telephoneNumber" required="required"/>
																				</div>
																				<form:input type="hidden" id="id" path="id" value="${item.id}" />
																			</div>
																			<!-- /.card-body -->

																			<div class="card-footer">

																				<button type="submit" class="btn btn-primary">Save
																					changes</button>

																				<button type="button" class="btn btn-default"
																					data-dismiss="modal">Close</button>
																			</div>
																		</form:form>
																	</div>
																	<!-- /.card -->
																</div>
															</div>
															<!-- /.modal-content -->
														</div>
														<!-- /.modal-dialog -->
													</div> <!-- /.modal -->
												</td>
											</tr>
										</c:forEach>
									</tbody>

								</table>
							</div>
							<!-- /.card-body -->
						</div>
						<!-- /.card -->
					</c:if>
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
      		window.location.href = "${deleteProductURL}?id="+id+"&page="+currentPage;
			}
		});
}


	document.getElementById("user").classList.add('active');

</script>
