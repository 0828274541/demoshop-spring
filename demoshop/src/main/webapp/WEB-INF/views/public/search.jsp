
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/template/public/inc/header.jsp"%>


<div class="main-content page-track-your-order" id="main-content">

	<div class="inner-xs">
		<div class="page-header">
			<%-- 	<c:if test="${not empty product.searchKey}">
				<h3 class="page-title">Tìm kiếm: ${product.searchKey}.</h3>
			</c:if> --%>

		</div>
	</div>

	<div class="row inner-bottom-sm">
		<div class="col-lg-8 center-block">

			<div class="section">

				<div class="field-row row form-row form-row-first">
					<div class="col-xs-12">
						<div class="tab-content">
							<c:if test="${not empty product.listResult }">
								<c:forEach var="item" items="${product.listResult}">


									<div id="list-view"
										class="products-grid fade tab-pane in active ">
										<div class="products-list">

											<div class="product-item product-item-holder">
												<div class="ribbon red">
													<span>Khuyến mãi!</span>
												</div>
												<div class="ribbon blue">
													<span>Mới!</span>
												</div>
												<div class="row">
													<div class="no-margin col-xs-12 col-sm-4 image-holder">
														<div class="image">
															<a href="<c:url value='/chi-tiet?id=${item.id}' />">
																<c:if test="${not empty product.proImgList}">
																	<c:forEach var="itemImage"
																		items="${product.proImgList}">
																		<c:if test="${item.id == itemImage.productId}">

																			<img
																				src="${pageContext.request.contextPath}/uploads/${itemImage.name}" />
																		</c:if>
																	</c:forEach>
																</c:if>
															</a>
														</div>
													</div>
													<!-- /.image-holder -->
													<div class="no-margin col-xs-12 col-sm-5 body-holder">
														<div class="body">

															<div class="title">
																<a href="<c:url value='/chi-tiet?id=${item.id}' />">${item.name}</a>
															</div>
															<div class="brand">${item.producer}</div>
															<div class="excerpt">
																<p>${item.preview}</p>
															</div>

														</div>
													</div>
													<!-- /.body-holder -->
													<div class="no-margin col-xs-12 col-sm-3 price-area">
														<div class="right-clmn">
															<c:set var="salePrice" value="${item.salePrice}" />
															<c:set var="price" value="${item.price}" />
															<c:choose>
																<c:when test="${item.salePrice != 0}">
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

															<a class="le-button"
																href="<c:url value='/chi-tiet?id=${item.id}' />">Thêm
																vào giỏ</a>

														</div>
													</div>
													<!-- /.price-area -->
												</div>
												<!-- /.row -->
											</div>
											<!-- /.product-item -->
										</div>
										<!-- /.products-list -->


									</div>
									<!-- /.products-grid #list-view -->
								</c:forEach>
							</c:if>
							<div class="inner-xs">
								<div class="page-header">
									<c:if test="${not empty product.message}">
										<h3 class="page-title">${product.message}.</h3>
									</c:if>
								</div>
							</div>
						</div>
						<!-- /.tab-content -->
					</div>
				</div>


			</div>
		</div>
	</div>
	<c:if test="${not empty product.listResult}">
		<div class="pagination-holder">
			<div class="row">
				<div class="col-xs-12 col-sm-12">
					<ul class="pagination " style="margin-left: 500px;">

						<c:url var="homePage" value="/tim-kiem" />
						<li class=""><button id="button1" class=""
								onclick="location.href='${homePage}?searchKey=${product.searchKey}&page=1'"
								type="button">Trang đầu</button></li>
						<li class=""><button id="button2" class=""
								onclick="location.href='${homePage}?searchKey=${product.searchKey}&page=${product.page  - 1}'"
								type="button">Trang trước</button></li>
						<li class="current"><button class=""
								style="background-color: #c8ea0d;" disabled>${product.page}</button></li>
						<li class=""><button id="button4" class=""
								onclick="location.href='${homePage}?searchKey=${product.searchKey}&page=${product.page  + 1}'"
								type="button">Trang sau</button></li>
						<li class=""><button id="button5" class=""
								onclick="location.href='${homePage}?searchKey=${product.searchKey}&page=${product.totalPage}'"
								type="button">Trang cuối</button></li>

					</ul>
				</div>

			</div>
			<!-- /.row -->
		</div>
		<!-- /.pagination-holder -->
	</c:if>
	<div class="row inner-bottom-sm">
		<div class="col-lg-8 center-block">
			<div id="div2"></div>
		</div>
	</div>
</div>
<!-- ============================================================= FOOTER ============================================================= -->
<%@ include file="/template/public/inc/footer.jsp"%>
<script>
	$(document).ready(function() {
		var searchKey = '${product.searchKey}';
		$('.search-field').val(searchKey);
	});
	var totalPages = ${product.totalPage};
	var currentPage = ${product.page};
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
</script>

