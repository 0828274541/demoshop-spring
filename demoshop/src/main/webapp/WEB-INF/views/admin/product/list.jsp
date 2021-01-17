<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/template/admin/inc/header.jsp"%>
<%@ include file="/template/admin/inc/leftbar.jsp"%>
<c:url var="home" value="/quan-tri/trang-chu" />
<c:url var="productHome" value="/quan-tri/san-pham/list" />
<c:url var="deleteProductURL" value="/quan-tri/san-pham/xoa" />
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1
						style="color: blue; font-weight: bold; font-family: courier; font-size: 250%;">Sản
						phẩm</h1>
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
									href="<c:url value ='/quan-tri/san-pham/them' />">Thêm sản
									phẩm</a>
							</h3>
							<form class="form-group" style='float: right;' method="get" id=""
								action="">
								<select name="searchCatId" id= "searchCatId"
									class="custom-select form-control-border"
									style='width: 180px; margin-right: 10px; float: left;'>
									<option value="0">--Show All--</option>
									<c:forEach var="catItem" items="${categoryList}">
										<c:if test=""></c:if>
										<option value="${catItem.id }" label="${catItem.name }" />
									</c:forEach>
								</select>
								<div class="input-group" style='width: 300px; float: right;'>
									<input class="form-control form-control-border" type="search"
										name="searchKey" value="${model.searchKey}"
										placeholder="Search" aria-label="Search" />
									<div class="input-group-append">
										<button class="btn btn-navbar" style='color: #605ca8;'
											type="submit">
											<i class="fas fa-search"></i>
										</button>
									</div>
								</div>
							</form>
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
							<table id="example1" class="table table-bordered table-striped">
								<thead>
									<tr>
										<th><input type="checkbox" id="checkAll"></th>
										<th>Tên sản phẩm</th>
										<th>Giá</th>
										<th>Giá sale</th>
										<th>Danh mục</th>
										<th>Mô tả</th>
										<th>Lưu trữ</th>
										<th>RAM</th>
										<th>Tính năng Camera</th>
										<th>Dung lượng pin</th>
										<th>Lượt xem</th>
										<th>Nhà sản xuất</th>
										<th>Ngày sản xuất</th>
										<th>Hinh anh</th>
										<th>Thao tác</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="item" items="${model.listResult}">
										<tr>
											<td><input type="checkbox" id="checkbox_${item.id}"
												value="${item.id}"></td>
											<td>${item.name}</td>
											<td>${item.price}</td>
											<td>${item.salePrice}</td>
											<td>${item.categoryName}</td>
											<td>${item.preview}</td>
											<td>${item.storage}</td>
											<td>${item.ram}</td>
											<td>${item.cameraFeature}</td>
											<td>${item.batteryCapacity}</td>
											<td>${item.count}</td>
											<td>${item.producer}</td>
											<td>${item.releaseDate}</td>

											<td>
												<button type="button" class="btn btn-block btn-success"
													data-toggle="modal" data-target="#modal-default${item.id}">Xem</button>
												<!-- The Modal -->
												<div class="modal fade" id="modal-default${item.id}">
													<div class="modal-dialog">
														<div class="modal-content">
															<div class="modal-header">
																<h4 class="modal-title">Hinh anh</h4>
																<button type="button" class="close" data-dismiss="modal"
																	aria-label="Close">
																	<span aria-hidden="true">&times;</span>
																</button>
															</div>
															<div class="modal-body">
																<div class="card card-primary">
																	<div class="card-header">
																		<h2 class="card-title">Hinh anh</h2>
																	</div>
																	<!-- /.card-header -->
																	<div class="card-body">
																		<table id="example2"
																			class="table table-bordered table-striped">
																			<thead>
																				<tr>
																					<th>Id</th>
																					<th>Tên ảnh</th>
																					<th>Hình ảnh</th>

																				</tr>
																			</thead>
																			<tbody>
																				<c:forEach var="itemImage" items="${imageList}">

																					<c:if test="${item.id == itemImage.productId}">
																						<tr>
																							<td>${itemImage.id}</td>
																							<td>${itemImage.name}</td>
																							<td><img width="150" height="100"
																								src="${pageContext.request.contextPath}/uploads/<c:url value="${itemImage.name}"/>" /></td>
																						</tr>
																					</c:if>
																				</c:forEach>

																			</tbody>
																		</table>
																		<div class="card-footer">
																			<button type="button" class="btn btn-default"
																				data-dismiss="modal">Close</button>
																		</div>
																	</div>
																	<!-- /.card -->
																</div>
															</div>
															<!-- /.modal-content -->
														</div>
														<!-- /.modal-dialog -->
													</div>
													<!-- /.modal -->
											</td>
											<td><c:url var="updateProductURL"
													value="/quan-tri/san-pham/chinh-sua">
													<c:param name="id" value="${item.id}" />
													<c:param name="page" value="${model.page}" />
												</c:url><a class="btn btn-block btn-success"
												title="Cập nhật sản phẩm" href='${updateProductURL}'><i
													class="fas fa-edit" style="color: pink"></i></a>
												<button id="${item.id}" type="button"
													onclick="warningBeforeDelete(this)"
													class="btn btn-block btn-danger" data-toggle="tooltip"
													title='Xóa sản phẩm'>
													<i class="fas fa-trash"></i>
												</button></td>
										</tr>
									</c:forEach>
								</tbody>

							</table>
						</div>
						<!-- /.card-body -->
						<c:if test="${not empty model.listResult}">
						<div class="card-footer clearfix">
							<ul class="pagination pagination float-left"
								style="font-size: 150%">
								<li>Trang ${model.page} / ${model.totalPage} trang (
									${model.totalItem} kết quả)</li>
							</ul>
							<ul class="pagination pagination-sm m-6 float-right"
								style="font-size: 150%">

								<li class="page-item"><button id="button1"
										class="btn btn-block btn-default"
										onclick="location.href='${productHome}?page=1&searchCatId=${model.searchCatId}&searchKey=${model.searchKey}'"
										type="button">First</button>
								<li class="page-item"><button id="button2"
										class="btn btn-block btn-default"
										onclick="location.href='${productHome}?page=${model.page  - 1}&searchCatId=${model.searchCatId}&searchKey=${model.searchKey}'"
										type="button">Previous</button>
								<li class="page-item active"><p
										class="btn btn-block btn-default"
										style="background-color: coral;">${model.page}</p></li>
								<li class="page-item"><button id="button4"
										class="btn btn-block btn-default"
										onclick="location.href='${productHome}?page=${model.page  + 1}&searchCatId=${model.searchCatId}&searchKey=${model.searchKey}'"
										type="button">Next</button>
								<li class="page-item"><button id="button5"
										class="btn btn-block btn-default"
										onclick="location.href='${productHome}?page=${model.totalPage}&searchCatId=${model.searchCatId}&searchKey=${model.searchKey}'"
										type="button">Last</button>
							</ul>
						</div>
						</c:if>

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
var totalPages = ${model.totalPage};
var currentPage = ${model.page};
var searchCatId = ${model.searchCatId};
if (totalPages ==1) {
	document.getElementById("button1").disabled = true;
	document.getElementById("button2").disabled = true;
	document.getElementById("button4").disabled = true;
	document.getElementById("button5").disabled = true;

} else if (currentPage ==1 ) {
	document.getElementById("button1").disabled = true;
	document.getElementById("button2").disabled = true;

} else if (currentPage == totalPages) {
	document.getElementById("button4").disabled = true;
	document.getElementById("button5").disabled = true;

}
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
selectElement('searchCatId', searchCatId)

function selectElement(searchCatId, valueToSelect) {    
    let element = document.getElementById(searchCatId);
    element.value = valueToSelect;
}

	document.getElementById("product").classList.add('active');

</script>
