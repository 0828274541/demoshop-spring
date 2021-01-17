<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/template/public/inc/header.jsp"%>


<div id="top-banner-and-menu">
	<div class="container">
		<div class="col-xs-12 col-sm-4 col-md-3 sidemenu-holder">


			<%@ include file="/template/public/inc/sidebar.jsp"%>


		</div>
		<!-- /.sidemenu-holder -->

		<div class="col-xs-12 col-sm-8 col-md-9 homebanner-holder">
			<!-- ========================================== SECTION – HERO ========================================= -->

			<div id="hero">
				<div id="owl-main" class="owl-carousel owl-inner-nav owl-ui-sm">


					<c:if test="${not empty imageBanner}">
						<c:forEach var="itemBanner" items="${imageBanner}">
							<div class="item"
								style="background-image: url(${pageContext.request.contextPath}/uploads/${itemBanner.name});  background-size: 300px 200px;">
								<div class="container-fluid">
									<div class="caption vertical-center text-left" style="color:white">
										<div class="big-text fadeInDown-1">
											Tiết kiệm đến<span class="big"><span class="sign">10.000</span>đ</span>
										</div>

										<div class="excerpt fadeInDown-2">
											Lựa chọn<br>điện thoại<br>
											
										</div>
										<div class="small fadeInDown-2">máy tính bảng cho bạn</div>
										<div class="button-holder fadeInDown-3">
											<a
												href="<c:url value ='chi-tiet?id=${itemBanner.productId}' /> "
												class="big le-button ">Mua ngay</a>
										</div>
									</div>
									<!-- /.caption -->
								</div>
								<!-- /.container-fluid -->
							</div>
							<!-- /.item -->
						</c:forEach>
					</c:if>
				</div>
				<!-- /.owl-carousel -->
			</div>

			<!-- ========================================= SECTION – HERO : END ========================================= -->
		</div>
		<!-- /.homebanner-holder -->

	</div>
	<!-- /.container -->
</div>
<!-- /#top-banner-and-menu -->



<div id="products-tab" class="wow fadeInUp">
	<div class="container">
		<div class="tab-holder">
			<!-- Nav tabs -->
			<ul class="nav nav-tabs">
				<li class="active"><a href="#featured" data-toggle="tab">Sản
						phẩm nổi bật</a></li>

			</ul>

			<!-- Tab panes -->
			<div class="tab-content">
				<div class="tab-pane active" id="featured">
					<div class="product-grid-holder">

						<c:forEach var="item" items="${model.listResult}">


							<div
								class="col-sm-4 col-md-3 no-margin product-item-holder hover">
								<div class="product-item">
									<div class="ribbon blue">
										<span>Mới!</span>
									</div>
									<div class="image">
										<a href="<c:url value='chi-tiet?id=${item.id}'/>"> <c:if
												test="${not empty imageList}">
												<c:forEach var="itemImage" items="${imageList}">
													<c:if test="${item.id == itemImage.productId}">
														<img height="200px"
															src="${pageContext.request.contextPath}/uploads/${itemImage.name}" />
													</c:if>
												</c:forEach>
											</c:if>
										</a>


									</div>
									<div class="body">
										<div class="label-discount clear"></div>
										<div class="title">
											<a href="<c:url value='chi-tiet?id=${item.id}'/>">${item.name}</a>
										</div>
										<div class="brand">${item.producer}</div>
									</div>
									<div class="prices">
									<c:set var="price" value="${item.price}" />
									<c:set var="salePrice" value="${item.salePrice}" />
										<c:choose>
											<c:when test="${item.salePrice != 0}">
												<div class="price-prev">
													<fmt:formatNumber value="${price}" type="currency" />
												</div>
												<div class="price-current">
													<fmt:formatNumber value="${salePrice}"
														type="currency" />
												</div>
											</c:when>
											<c:otherwise>
												<div class="price-current">
												
													<fmt:formatNumber value="${price}" type="currency" />
												</div>
											</c:otherwise>
										</c:choose>





									</div>
									<div class="hover-area">
										<div class="add-cart-button">
											<a href="<c:url value='chi-tiet?id=${item.id}'/>"
												class="le-button">Thêm vào giỏ</a>
										</div>

									</div>
								</div>
							</div>
						</c:forEach>
					</div>



				</div>


			</div>

		</div>

	</div>


	<div>

		<ul class="pagination " style="margin-left: 500px;">

			<c:url var="homePage" value="/trang-chu" />
			<li class=""><button id="button1" class=""
					onclick="location.href='${homePage}?page=1&searchKey=${model.searchKey}'"
					type="button">Trang đầu</button></li>
			<li class=""><button id="button2" class=""
					onclick="location.href='${homePage}?page=${model.page  - 1}&searchKey=${model.searchKey}'"
					type="button">Trang trước</button></li>
			<li class="current"><button class=""
					style="background-color: #c8ea0d;" disabled>${model.page}</button></li>
			<li class=""><button id="button4" class=""
					onclick="location.href='${homePage}?page=${model.page  + 1}&searchKey=${model.searchKey}'"
					type="button">Trang sau</button></li>
			<li class=""><button id="button5" class=""
					onclick="location.href='${homePage}?page=${model.totalPage}&searchKey=${model.searchKey}'"
					type="button">Trang cuối</button></li>

		</ul>
	</div>




</div>

<%@ include file="/template/public/inc/footer.jsp"%>

<script>
	$(document).ready(function() {
		//reload lai trang khi click go to back tren trinh duyet
		if (!!window.performance && window.performance.navigation.type == 2) {
			window.location.reload();
		}

		var totalPages = ${model.totalPage};
		var currentPage = ${model.page};
		if (totalPages == 1) {
			document.getElementById("button1").disabled = true;
			document.getElementById("button2").disabled = true;
			document.getElementById("button4").disabled = true;
			document.getElementById("button5").disabled = true;

		} else if (currentPage == 1) {
			document.getElementById("button1").disabled = true;
			document.getElementById("button2").disabled = true;

		} else if (currentPage == totalPages) {
			document.getElementById("button4").disabled = true;
			document.getElementById("button5").disabled = true;

		}
	});
</script>