<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/template/public/inc/header.jsp"%>

<!-- ============================================================= HEADER : END ============================================================= -->
<section id="category-grid">
	<div class="container">

		<!-- ========================================= SIDEBAR ========================================= -->
		<div class="col-xs-12 col-sm-3 no-margin sidebar narrow">
			<%@ include file="/template/public/inc/sidebar.jsp"%>
			<!-- ========================================= PRODUCT FILTER ========================================= -->




		</div>
		<!-- ========================================= SIDEBAR : END ========================================= -->

		<!-- ========================================= CONTENT ========================================= -->

		<div class="col-xs-12 col-sm-9 no-margin wide sidebar">

			<div id="grid-page-banner">
				<a href="#"> <img width="899px" height="277px"
					src="<%=request.getContextPath()%>/template/public/assets/images/banners/TA-4143-1606290908.jpg"
					alt="" />
				</a>
			</div>

			<section id="gaming">
				<div class="grid-list-products">
					<h2 class="section-title">
						<c:if test="${not empty catList}">
							<c:forEach var="item" items="${catList}">
        			|${item.name }
        		</c:forEach>
						</c:if>

					</h2>
					<div class="grid-list-buttons">
						<ul>
							<li class="grid-list-button-item active"><a
								data-toggle="tab" href="#list-view"><i class="fa fa-th-list"></i>
									List</a></li>
						</ul>
					</div>


					<div class="tab-content">

						<c:if test="${not empty product.listResult}">
							<c:forEach var="item" items="${product.listResult}">




								<div id="list-view"
									class="products-grid fade tab-pane in active ">
									<div class="products-list">

										<div class="product-item product-item-holder">
											<div class="ribbon red">
												<span>Khuyến mãi</span>
											</div>
											<div class="ribbon blue">
												<span>Mới!</span>
											</div>
											<div class="row">
												<div class="no-margin col-xs-12 col-sm-4 image-holder">
													<div class="image">
														<a href="<c:url value='/chi-tiet?id=${item.id}' />">
															<c:if test="${not empty imageList}">
																<c:forEach var="itemImage" items="${imageList}">
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
															<a href="<c:url value='/chi-tiet?id=${item.id}' /> ">${item.name}</a>
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
															href="<c:url value='/chi-tiet?id=${item.id}' /> ">Thêm
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



					</div>
					<!-- /.tab-content -->
					<c:if test="${not empty product.listResult}">
						<div class="pagination-holder">
							<div class="row">
								<div class="col-xs-12 col-sm-6 text-left">
									<ul class="pagination ">

										<c:url var="homePage" value="/danh-muc" />
										<li class=""><button id="button1" class=""
												onclick="location.href='${homePage}?id=${product.categoryId}&page=1'"
												type="button">Trang đầu</button></li>
										<li class=""><button id="button2" class=""
												onclick="location.href='${homePage}?id=${product.categoryId}&page=${product.page  - 1}'"
												type="button">Trang trước</button></li>
										<li class="current"><button class=""
												style="background-color: #c8ea0d;" disabled>${product.page}</button></li>
										<li class=""><button id="button4" class=""
												onclick="location.href='${homePage}?id=${product.categoryId}&page=${product.page  + 1}'"
												type="button">Trang sau</button></li>
										<li class=""><button id="button5" class=""
												onclick="location.href='${homePage}?id=${product.categoryId}&page=${product.totalPage}'"
												type="button">Trang cuối</button></li>

									</ul>
								</div>
								<div class="col-xs-12 col-sm-6">
									<div class="result-counter">
										
									</div>
									<!-- /.result-counter -->
								</div>
							</div>
							<!-- /.row -->
						</div>
						<!-- /.pagination-holder -->
					</c:if>
				</div>
				<!-- /.grid-list-products -->

			</section>
			<!-- /#gaming -->
		</div>
		<!-- /.col -->
		<!-- ========================================= CONTENT : END ========================================= -->
	</div>
	<!-- /.container -->
</section>
<!-- /#category-grid -->

<%@ include file="/template/public/inc/footer.jsp"%>
<script>
	$(document)
			.ready(
					function() {
						var error = '${error}';
						if (error != 0) {
							alert(error);
						}

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

						var getUrlParameter = function getUrlParameter(tech) {
							var sPageURL = window.location.search.substring(1), sURLVariables = sPageURL
									.split('&'), sParameterName, i;

							for (i = 0; i < sURLVariables.length; i++) {
								sParameterName = sURLVariables[i].split('=');

								if (sParameterName[0] === tech) {
									return sParameterName[1];

								}
							}
						};
						var tech = getUrlParameter('id');
						document.getElementById("showCat" + tech).classList
								.add('active');
					});
</script>