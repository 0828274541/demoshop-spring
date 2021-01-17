
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/template/public/inc/header.jsp"%>
<c:url var='dellItemOnCart' value='/xoa-san-pham' />
<c:url var='changeQuantityItem' value='/thay-doi-so-luong' />

<section id="cart-page">
	<div class="container">
		<!-- ========================================= CONTENT ========================================= -->
		<div class="col-xs-12 col-md-9 items-holder no-margin">


			<c:if test="${not empty cart }">
				<c:forEach var="item" items="${cart }">

					<div id="${item.products.id}">
						<div class="row no-margin cart-item">
							<div class="col-xs-12 col-sm-2 no-margin">
								<a href="<c:url value ='/chi-tiet?id=${item.products.id}' />"
									class="thumb-holder"> <c:if test="${not empty imageList}">
										<c:forEach var="itemImage" items="${imageList}">
											<c:if test="${item.products.id == itemImage.productId}">
												<img class="lazy" width="79px" height="79px"
													src="${pageContext.request.contextPath}/uploads/${itemImage.name}" />
											</c:if>
										</c:forEach>
									</c:if></a>



							</div>

							<div class="col-xs-12 col-sm-5">
								<div class="title">
									<a href="<c:url value ='/chi-tiet?id=${item.products.id}' />">${item.products.name}</a>
								</div>
								<div class="brand">${item.products.producer}</div>
							</div>

							<div class="col-xs-12 col-sm-3 no-margin" style="width: 150px;">
								<div class="quantity">
									<div class="le-quantity">
										<form>
											<div id="div1">
												<a class="minus changeQuantity" id="${item.products.id}"
													href="#"></a>
											</div>
											<input id="getQuantity${item.products.id}" name="quantity"
												readonly="readonly" type="text" value="${item.quantity}" />
											<a class="plus changeQuantity" id="${item.products.id}"
												href="#"></a>
										</form>
									</div>
								</div>
							</div>

							<div class="col-xs-12 col-sm-2 no-margin">
								<div class="price">
									<div class="price${item.products.id}">
										<c:set var="salePrice" value="${item.products.salePrice}" />
										<c:set var="price" value="${item.products.price}" />
										<c:if test="${item.products.salePrice != 0}">
											<fmt:formatNumber value="${salePrice}" type="currency" /> x ${item.quantity}
										</c:if>
										<c:if test="${item.products.salePrice == 0}">
											<fmt:formatNumber value="${price}" type="currency" /> x ${item.quantity}
										</c:if>
									</div>
								</div>
							</div>

							<div class="col-xs-12 col-sm-3 no-margin"
								style="width: 50px; height: 50px;">
								
										<a class="close-btn delOnCart"
											style="width: 30px;height: 30px;padding-left: 30px;padding-top: 10px;"
											id="${item.products.id}" href="#"></a>
									
							</div>

						</div>
						<!-- /.cart-item -->
					</div>
				</c:forEach>
			</c:if>

		</div>
		<!-- ========================================= CONTENT : END ========================================= -->

		<!-- ========================================= SIDEBAR ========================================= -->

		<div class="col-xs-12 col-md-3 no-margin sidebar ">
			<div class="widget cart-summary">
				<h1 class="border">Giỏ hàng</h1>
				<div class="body">
					<ul class="tabled-data no-border inverse-bold">
						<li><label>Tổng tiền</label>
							<div class="value pull-right">
								<c:set var="totalMoney" value="${totalMoney}" />
								<div class="orderMoney">
									<fmt:formatNumber value="${totalMoney}" type="currency" />
								</div>
							</div></li>
						<li><label>Phí giao hàng</label>
							<div class="value pull-right">Miến phí</div></li>
					</ul>
					<ul id="total-price" class="tabled-data inverse-bold no-border">
						<li><label>Thanh toán</label>
							<div class="value pull-right">
								<c:set var="totalMoney" value="${totalMoney}" />
								<div class="orderMoney">
									<fmt:formatNumber value="${totalMoney}" type="currency" />
								</div>

							</div></li>
					</ul>
					<div class="buttons-holder">
						<a class="le-button big" href="<c:url value ='dat-hang' /> ">Mua
							hàng</a> <a class="simple-link block"
							href="<c:url value ='trang-chu' />">Tiếp tục mua sắm</a>
					</div>
				</div>
			</div>
			<!-- /.widget -->


		</div>
		<!-- /.sidebar -->

		<!-- ========================================= SIDEBAR : END ========================================= -->
	</div>
</section>

<%@ include file="/template/public/inc/footer.jsp"%>
<script>
	$(document).ready(function() {
		if (!!window.performance && window.performance.navigation.type == 2) {
			window.location.reload();
		}

		$("#cart1").hide();

		$('.delOnCart').click(function() {
			var proId = $(this).attr("id");
			//alert("dell")
			$.ajax({
				url : '${dellItemOnCart}',

				type : 'GET',
				cache : false,
				data : {
					productId : proId,
				},

				success : function(data) {

					$("div").remove("#" + proId);
					$('.orderMoney').text(data);

				},
				error : function() {
					alert('Có lỗi xảy ra khi click');
				}
			});
		});

		$('.changeQuantity').click(function() {
			var productId = $(this).attr("id");
			var quantity1 = $('#getQuantity' + productId).val();
			/* 			 var data = {}
			 data["productId"] = proId;
			 data["quantity1"] = quantity1; */
			$.ajax({
				url : '${changeQuantityItem}',
				type : 'GET',
				cache : false,
				contentType : 'application/json',
				data : {
					productId : productId,
					quantity1 : quantity1,
				},
				dataType : 'json',
				success : function(ajaxResponse) {
					$('.price' + productId).text(ajaxResponse.priceShow);
					$('.orderMoney').text(ajaxResponse.totalMoney);

				},
				error : function() {
					alert('Có lỗi xảy ra khi click');
				}
			});
		});

	});
</script>