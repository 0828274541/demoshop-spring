<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/template/public/inc/header.jsp"%>
<c:url var="addToCart" value="/them-vao-gio" />
<c:url var="login" value="/dang-nhap" />
<c:url var="viewCartMini" value="/gio-hang-mini" />
<div id="single-product">
	<div class="container">

		<div class="no-margin col-xs-12 col-sm-6 col-md-5 gallery-holder">
			<div class="product-item-holder">

				<div id="owl-single-product">
					<c:if test="${not empty product.proImgList}">
						<c:forEach var="item" items="${product.proImgList}">

							<div class="single-product-gallery-item" id="${item.id}">
								<a data-rel="prettyphoto" href="#"> <img
									class="img-responsive"
									src="${pageContext.request.contextPath}/uploads/${item.name}" />


								</a>
							</div>
							<!-- /.single-product-gallery-item -->
						</c:forEach>
					</c:if>

				</div>
				<!-- /.single-product-slider -->
				<div class="nav-holder left hidden-xs">
					<a class="prev-btn slider-prev" data-target="#owl-single-product"
						href="#prev"></a>
				</div>
				<!-- /.nav-holder -->

				<div class="nav-holder right hidden-xs">
					<a class="next-btn slider-next" data-target="#owl-single-product"
						href="#next"></a>
				</div>
				<!-- /.nav-holder -->
			</div>
			<!-- /.single-product-gallery -->
		</div>
		<!-- /.gallery-holder -->

		<div class="no-margin col-xs-12 col-sm-7 body-holder">
			<div class="body">


				<div class="title">
					<a href="#">${product.name}</a>
				</div>
				<div class="brand">${product.producer}</div>

				<div class="social-row">
					<!--         <span class="st_facebook_hcount"></span>
            <span class="st_twitter_hcount"></span>
            <span class="st_pinterest_hcount"></span> -->
				</div>

				<div class="excerpt">
					<p>${product.preview}</p>
				</div>

				<div class="prices">

					<c:set var="salePrice" value="${product.salePrice}" />
					<c:set var="price" value="${product.price}" />
					<c:choose>
						<c:when test="${product.salePrice != 0}">
							<div class="price-prev">
								<fmt:formatNumber value="${price}" type="currency" />
							</div>
							<div class="price-current">
								<fmt:formatNumber value="${salePrice}" type="currency" />
							</div>
						</c:when>
						<c:otherwise>
							<div class="price-current">
								<fmt:formatNumber value="${price}" type="currency" />
							</div>
						</c:otherwise>
					</c:choose>


				</div>

				<div class="qnt-holder">
					<div class="le-quantity">
						<form id="quickForm">
							<a class="minus" href="#reduce"></a> <input id="quantity"
								name="quantity" readonly="readonly" type="text" value="1"
								min="1" /> <a class="plus" href="#add"></a>
						</form>
					</div>
					<button id="addToCart" class="le-button huge">Thêm vào giỏ</button>
				</div>
				<!-- /.qnt-holder -->
			</div>
			<!-- /.body -->

		</div>
		<!-- /.body-holder -->
	</div>
	<!-- /.container -->
</div>
<!-- /.single-product -->

<!-- ========================================= SINGLE PRODUCT TAB ========================================= -->
<section id="single-product-tab">
	<div class="container">
		<div class="tab-holder">

			<ul class="nav nav-tabs simple">
				<li class="active"><a href="#description" data-toggle="tab">Mô
						tả sản phẩm</a></li>
				<li><a href="#additional-info" data-toggle="tab">Thông tin
						sản phẩm</a></li>

			</ul>
			<!-- /.nav-tabs -->


			<div class="tab-content">
				<div class="tab-pane active" id="description">
					<p>${product.preview}</p>



				</div>
				<!-- /.tab-pane #description -->

				<div class="tab-pane" id="additional-info">
					<ul class="tabled-data">
						<li><input type="hidden" id="productId" value="${product.id}"
							name="${product.id}" /></li>
						<li><label>Khối lượng</label>
							<div class="value">20 kg</div></li>
						<li><label>Kích thước</label>
							<div class="value">90x60x90 cm</div></li>
						<li><label>Dung lượng</label>
							<div class="value">${product.storage}</div></li>
						<li><label>Ram</label>
							<div class="value">${product.ram}</div></li>
						<li><label>Tính năng Camera</label>
							<div class="value">${product.cameraFeature}</div></li>
						<li><label>Dung lượng PIn</label>
							<div class="value">${product.batteryCapacity}</div></li>
						<li><label>Nhà sản xuất</label>
							<div class="value">${product.producer}</div></li>
						<li><label>Năm sản xuất</label>
							<div class="value">${product.releaseDate}</div></li>
					</ul>
					<!-- /.tabled-data -->


				</div>
				<!-- /.tab-pane #additional-info -->



			</div>
			<!-- /.tab-content -->

		</div>
		<!-- /.tab-holder -->
	</div>
	<!-- /.container -->
</section>
<!-- /#single-product-tab -->
<!-- ========================================= SINGLE PRODUCT TAB : END ========================================= -->

<%@ include file="/template/public/inc/footer.jsp"%>
<script>
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
	
	$(document).on('click', '.basket', function(e) {
		e.stopPropagation();
	});
	
	$(document)
			.ready(
					function() {
						var error = '${error}';
						if (error != 0) {
							alert(error);
						}
						if (!!window.performance
								&& window.performance.navigation.type == 2) {
							window.location.reload();
						}
						$('#addToCart')
								.click(
										function() {
											var quantity = $('#quantity').val();
											var productId = $('#productId')
													.val();
											$
													.ajax({
														url : '${addToCart}',
														type : 'GET',
														contentType : "application/json; charset=utf-8",
														cache : false,
														data : {
															quantity : quantity,
															productId : productId,
														},
														dataType : 'json',
														success : function(
																response) {
															if (response == null) {
																if (window
																		.confirm('Bạn có muốn đăng nhập để thêm hàng vào giỏ?')) {
																	window.location = "${login}";
																}
															}else{
																alert("Thêm vào giỏ hàng thành công")
																var cartMini = "<div class='basket-item-count'>"+
																"<span class='count'>" +response.orderDetails.length +"</span>"+
																"<img src='${pageContext.request.contextPath}/template/public/assets/images/icon-cart.png' alt='' /></div>"+
																"<div class='total-price-basket'>"+
																"<span class='lbl'>Giỏ hàng:</span>"+
																"<span class='total-price'>"+
																"<span class='value'>" + formatCurrency(response.totalMoney) + "</span></span></div>";
														
																var cartMiniDetail = '';
																for(var i = 0; i< response.orderDetails.length; i++) {
																	cartMiniDetail += "<li id=" + response.orderDetails[i].products.id + ">"
																		+"<div class='basket-item'>"
																	+ "<div class='row'>"
																	+ "<div class='col-xs-4 col-sm-4 no-margin text-center'>"
																	+ "<div class='thumb'>"
																	+ "<a href='${pageContext.request.contextPath}/chi-tiet?id=" + response.orderDetails[i].products.id
																	+ "'>";
																	if (response.orderDetails[i].image != null) {
																		cartMiniDetail += "<img  height='50px' width='50px' src='${pageContext.request.contextPath}/uploads/"
																				+ response.orderDetails[i].image + "' />";
																	} else {
																		cartMiniDetail += "<img  height='50px' width='50px' src='${pageContext.request.contextPath}/template/public/assets/images/noimg.png' />";
																	}
																	cartMiniDetail += "</a></div></div>"
																	+ "<div class='col-xs-8 col-sm-8 no-margin'>"
																	+ "<div class='title'>"
																	+ "<a href='${pageContext.request.contextPath}/chi-tiet?id=" + response.orderDetails[i].products.id
																			+ "' style='font-weight: bold;'>"
																	+ response.orderDetails[i].products.name + "</a></div>"
																	+ "<div class='price'>"
																	+ formatCurrency(response.orderDetails[i].price) + " x " + response.orderDetails[i].quantity
																	+"</div></div></div>"
																	+"<button type='button' class='close-btn xoa' id='" + response.orderDetails[i].products.id
																	+ "' onclick='dellItem(this)' style='font-weight: bold; font-size: medium; float: right;'>Xóa </button>"
																	+"</div></li>";
																}
																$('#eventAddCart').html(cartMini);
																$('#viewCart').html(cartMiniDetail);
															}

														},
														error : function() {
															alert('Có lỗi xảy ra');
														}
													});
										});
					});
</script>
