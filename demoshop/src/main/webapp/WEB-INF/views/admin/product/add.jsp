<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/template/admin/inc/header.jsp"%>
<%@ include file="/template/admin/inc/leftbar.jsp"%>
<c:url var="productHome" value="/quan-tri/san-pham/list" />
<c:url var="addProductURL" value="/quan-tri/san-pham/them" />
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1 style="color:blue; font-weight: bold; font-family: courier; font-size: 250%;">Thêm sản phẩm</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="${productHome}">Trang
								chu</a></li>
						<li class="breadcrumb-item active">/</li>
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
					<div class="card card-primary">
						<!-- <div class="card-header">
							<h2 class="card-title" id="message"></h2>
							
						</div> -->
						<c:if test="${messageError ne null}">
							<div class="alert alert-danger alert-dismissable" role="alert">
								<button type="button" class="close" data-dismiss="alert">
									<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
								</button>
								${messageError}
							</div>
						</c:if>
						<!-- /.card-header -->
						<!-- form start -->
						<form:form id="formSubmit" modelAttribute="productDTO"
							method="POST" action="${addProductURL }"
							enctype="multipart/form-data">
							<div class="card-body">
								<div class="form-group">
									<label>Tên sản phẩm(*)</label>
									<form:input class="form-control" path="name"
										placeholder="Enter category name" required="required" />
								</div>
								<div class="form-group">
									<label>Thuộc danh mục(*)</label>
									<form:select path="categoryId" class="form-control select2"
										title="Please select something!"  required="required">
										<form:option value="" label="-- Chọn danh muc --" />
										<c:forEach var="item" items="${categoryList}">

											<form:option value="${item.id }" label="${item.name }" />

										</c:forEach>
									</form:select>
								</div>
								<div class="form-group">
									<label>Giá(*)</label>

									<form:input type="number" class="form-control" path="price"
										placeholder="Enter price"  required="required" />
								</div>
								<div class="form-group">
									<label>Giá sale</label>
									<form:input type="number" class="form-control" path="salePrice"
										placeholder="Enter price_new" />

								</div>
								<div class="form-group">
									<label>Mô tả</label>
									<form:input class="form-control" path="preview"
										placeholder="Enter preview" />
								</div>
								<div class="form-group">
									<label>Lưu trữ</label>
									<form:input class="form-control" path="storage"
										placeholder="Enter storage" />
								</div>

								<div class="form-group">
									<label>Ram</label>
									<form:input class="form-control" path="ram"
										placeholder="Enter input" />
								</div>
								<div class="form-group">
									<label>Tính năng Camera</label>
									<form:input class="form-control" path="cameraFeature"
										placeholder="Enter camera_feature" />
								</div>
								<div class="form-group">
									<label>Dung lượng pin</label>
									<form:input class="form-control" path="batteryCapacity"
										placeholder="Enter battery_capacity" />
								</div>

								<div class="form-group">
									<label>Nhà sản xuất(*):</label>
									<form:input class="form-control" path="producer"
										placeholder="Enter producer"  required="required" />

								</div>

								<div class="form-group">
									<label>Ngày sản xuất(*):</label>
									<div class="input-container">
										<form:input class="form-control" type="date"
											path="releaseDate"  required="required" />
									</div>
								</div>
								<div class="form-group">
									<label>Thêm ảnh</label> <input class="form-control"
										type="file" id="file" multiple="multiple"
										name="productImageses" />
									<div class="gallery"></div>
								</div>
							</div>
							<!-- /.card-body -->

							<div class="card-footer">

								<button id="" type="submit" class="btn btn-primary">Đồng Ý</button>
								<a class="btn btn-secondary" href="${productHome }">Hủy</a>
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
	document.getElementById("product").classList.add('active');

	;
	var imagesPreview = function(input, placeToInsertImagePreview) {

		if (input.files) {
			var filesAmount = input.files.length;

			for (i = 0; i < filesAmount; i++) {
				var reader = new FileReader();

				reader.onload = function(event) {

					$($.parseHTML('<img width="150px" height="100px"  >'))
							.attr('src', event.target.result).appendTo(
									placeToInsertImagePreview);
				}

				reader.readAsDataURL(input.files[i]);//base64encoded string
			}
		}

	};

	$("#file").on('change', function() {
		$(".gallery").empty();

		imagesPreview(this, 'div.gallery');
	});
</script>
<style type="text/css">
.input-container input {
	outline: 0;
	padding: .75rem;
	position: relative;
	width: 100%;
}

input[type="date"]::-webkit-calendar-picker-indicator {
	background: transparent;
	bottom: 0;
	color: transparent;
	cursor: pointer;
	height: auto;
	left: 0;
	position: absolute;
	right: 0;
	top: 0;
	width: auto;
}
</style>
