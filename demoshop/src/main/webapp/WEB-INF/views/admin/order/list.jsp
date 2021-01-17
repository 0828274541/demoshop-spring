
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/template/admin/inc/header.jsp"%>
<%@ include file="/template/admin/inc/leftbar.jsp"%>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>Order</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="#">Home</a></li>
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
						<div class="card-header"></div>
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
										<th>Mã đơn hàng</th>
										<th>Tổng tiền</th>
										<th>Phương thức thanh toán</th>
										<th>Giảm giá</th>
										<th>Ngày mua hàng</th>
										<th>Người mua</th>
										<th>Chi tiết đơn hàng</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${not empty orderList}">
										<c:forEach var="order" items="${orderList}">

											<tr>
												<td>${order.id}</td>
												<c:set var="totalMoney" value="${order.totalMoney}" />
												<td><fmt:formatNumber value="${totalMoney}"
														type="currency" /></td>
												<td>${order.paymentMethod}</td>
												<td>${order.discount * 100}%</td>
												<td>${order.createdDate}</td>
												<td>${order.createdBy}</td>

												<td>
													<button type="button" class="btn btn-block btn-success"
														data-toggle="modal" data-target="#modal-default${order.id}">Xem</button>
													<!-- The Modal -->
													<div class="modal fade" id="modal-default${order.id}">
														<div class="modal-dialog">
															<div class="modal-content">
																<div class="modal-header">
																	<h4 class="modal-title">Chi tiết đơn hàng</h4>
																	<button type="button" class="close"
																		data-dismiss="modal" aria-label="Close">
																		<span aria-hidden="true">&times;</span>
																	</button>
																</div>
																<div class="modal-body">
																	<table id="example1"
																		class="table table-bordered table-striped">
																		<thead>
																			<tr>
																				<th>Tên sản phẩm</th>
																				<th>Số lượng</th>
																				<th>Đơn Giá</th>
																			</tr>
																		</thead>
																		<tbody>
																			<c:if test="${not empty orderDetailList }">
																				<c:forEach var="orderDetail"
																					items="${orderDetailList}">
																					<c:if test="${orderDetail.orderId == order.id}">
																						<tr>
																							<td>${orderDetail.productName }</td>
																							<td>${orderDetail.quantity }</td>
																							<c:set var="price" value="${orderDetail.price}" />
																							<td><fmt:formatNumber value="${price}"
																									type="currency" /></td>
																						</tr>
																					</c:if>
																				</c:forEach>
																			</c:if>
																		</tbody>
																	</table>
																</div>
															</div>
															<!-- /.modal-content -->
														</div>
														<!-- /.modal-dialog -->
													</div> <!-- /.modal -->
												</td>
											</tr>
										</c:forEach>
									</c:if>
								</tbody>

							</table>
						</div>
						<!-- /.card-body -->
						<c:if test="${not empty orderList}">
						<div class="card-footer clearfix">
							<ul class="pagination pagination float-left"
								style="font-size: 150%">
								<li>Trang ${page} / ${totalPage} trang (
									${totalItem} kết quả)</li>
							</ul>
							<ul class="pagination pagination-sm m-6 float-right"
								style="font-size: 150%">

								<li class="page-item"><button id="button1"
										class="btn btn-block btn-default"
										onclick="location.href='${productHome}?page=1'"
										type="button">First</button>
								<li class="page-item"><button id="button2"
										class="btn btn-block btn-default"
										onclick="location.href='${productHome}?page=${page  - 1}'"
										type="button">Previous</button>
								<li class="page-item active"><p
										class="btn btn-block btn-default"
										style="background-color: coral;" disabled="disabled">${page}</p></li>
								<li class="page-item"><button id="button4"
										class="btn btn-block btn-default"
										onclick="location.href='${productHome}?page=${page  + 1}'"
										type="button">Next</button>
								<li class="page-item"><button id="button5"
										class="btn btn-block btn-default"
										onclick="location.href='${productHome}?page=${totalPage}'"
										type="button">Last</button>
							</ul>
						</div>
						</c:if>
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

  $(document).ready(function() {  

	  var totalPages = ${totalPage};
	  var currentPage = ${page};
	  if (totalPages == 1) {
	  	document.getElementById("button1").disabled = true;
	  	document.getElementById("button2").disabled = true;
	  	document.getElementById("button4").disabled = true;
	  	document.getElementById("button5").disabled = true;

	  } else if (currentPage == 1 ) {
	  	document.getElementById("button1").disabled = true;
	  	document.getElementById("button2").disabled = true;

	  } else if (currentPage == totalPages) {
	  	document.getElementById("button4").disabled = true;
	  	document.getElementById("button5").disabled = true;

	  }
	  
	 document.getElementById("order").classList.add('active');
	 
	
});
</script>
