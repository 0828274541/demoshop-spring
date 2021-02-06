
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/template/public/inc/header.jsp"%>
<c:url var='dellItemOnCart' value='/xoa-san-pham' />
<c:url var='changeQuantityItem' value='/thay-doi-so-luong' />

<section id="cart-page">
	<div class="container">
		<!-- ========================================= CONTENT ========================================= -->
		<div class="col-xs-12 col-md-9 items-holder no-margin">

			<c:set var="order" value="${order}" scope="session" />
			<c:if test="${not empty order}">
					<div class="row no-margin cart-item" style="border-bottom: 1px solid red; height: 85px; ;padding-bottom: 0px;">
						<div class="col-xs-12 col-sm-2 no-margin" style="width: 80px;"></div>

						<div class="col-xs-12 col-sm-5" style="width: 180px;"><div class="price">Sản
							phẩm</div></div>
						<div class="col-xs-12 col-sm-2 no-margin"><div class="price">Đơn giá</div></div>
						<div class="col-xs-12 col-sm-2 no-margin" style="width: 150px;"><div class="price">
							Số lượng</div></div>
							

						<div class="col-xs-12 col-sm-2 no-margin"><div class="price">Giá tiền</div></div>

						<div class="col-xs-12 col-sm-2 no-margin"
							style="width: 100px; height: 50px;"><div class="price">Thao tác</div></div>
					
				</div>
				<c:forEach var="item" items="${order.orderDetails}">
								<div id="${item.products.id}" class="row no-margin cart-item" style="border-bottom: 1px solid red; height: 90px;padding-top: 0px;padding-bottom: 0px;">
									<div class="col-xs-12 col-sm-2 no-margin" style="width: 80px;">
										<a href="<c:url value ='/chi-tiet?id=${item.products.id}' />"
											class="thumb-holder"> 
											<c:if test="${not empty item.image}">
												<img class="lazy" width="70px" height="70px"
												src="${pageContext.request.contextPath}/uploads/${item.image}" />
											</c:if>
											<c:if test="${empty item.image}">
												<img class="lazy" width="79px" height="79px"
												src="${pageContext.request.contextPath}/template/public/assets/images/noimg.png" />
											</c:if>
										</a>
									</div>

									<div class="col-xs-12 col-sm-5" style="width: 180px; height: 81px;">
									<div class="price"><a href="<c:url value ='/chi-tiet?id=${item.products.id}' />">${item.products.name}</a>
										</div>
											
									</div>

									<div class="col-xs-12 col-sm-2 no-margin">
										<div class="price">
												<c:set var="price" value="${item.price}" />
													<fmt:formatNumber value="${price}" type="currency" />
										</div>
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
												<c:set var="price" value="${item.price * item.quantity}" />
													<fmt:formatNumber value="${price}" type="currency" />
											</div>
										</div>
									</div>
									<div class="col-xs-12 col-sm-3 no-margin"
										style="width: 50px; height: 50px;">

										<a class="close-btn delOnCart"
											style="width: 30px; height: 30px; padding-left: 30px; padding-top: 10px;"
											id="${item.products.id}" href="#"></a>

									</div>

								</div>
								<!-- /.cart-item -->
							
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
								<c:set var="totalMoney" value="${order.totalMoney}" />
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
								<c:set var="totalMoney" value="${order.totalMoney}" />
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
			$.ajax({
				url : '${dellItemOnCart}',
				type : 'GET',
				cache : false,
				contentType : "application/json; charset=utf-8",
				data : {
					productId : proId,
				},
				dataType : 'json',
				success : function(data) {
					$("div").remove("#" + proId);
					console.log(data.totalMoney)
					$('.orderMoney').text(formatCurrency(data.totalMoney));
				},
				error : function() {
					alert('Có lỗi xảy ra khi click');
				}
			});
		});

		$('.changeQuantity').click(function() {
			var productId = $(this).attr("id");
			var quantity1 = $('#getQuantity' + productId).val();
			$.ajax({
				url : '${changeQuantityItem}',
				type : 'GET',
				cache : false,
				contentType : 'application/json; charset=utf-8',
				data : {
					productId : productId,
					quantity1 : quantity1,
				},
				dataType : 'json',
				success : function(ajaxResponse) {
					$('.price' + productId).text(formatCurrency(ajaxResponse.orderDetails[0].price * ajaxResponse.orderDetails[0].quantity));
					$('.orderMoney').text(formatCurrency(ajaxResponse.totalMoney));

				},
				error : function() {
					alert('Có lỗi xảy ra khi click');
				}
			});
		});
		
		 function formatCurrency(n){
			  var s = n.toString();
			  var len = s.length;
			  var ret = "";
			  for(var i = 1; i <= len; i++) {
			    ret = s[(len-i)] + ret;
			    
			    if( i % 3  === 0 && i < len) {
			      ret = "." + ret;
			    }
			  }
			  return ret +" đ";
			}

	});
</script>