
<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ include file="/template/public/inc/header.jsp" %>


            <div class="main-content page-track-your-order" id="main-content">

                <div class="inner-xs">
                    <div class="page-header">
                        <h2 class="page-title">Đơn hàng của bạn</h2>
                    </div>
                </div>

                <div class="row inner-bottom-sm">
                    <div class="col-lg-8 center-block">

                        <div class="section">
                         <div class="field-row row form-row form-row-first">
					<div class="col-xs-12">
						<c:if test="${not empty orderList }">
							<c:forEach var="item" items="${orderList}">
								<div style="border-bottom-style: solid;">
								<label for="orderid">Ma đơn hàng: ${item.id}</label>
								<c:set var="totalMoney" value="${item.totalMoney}" />
								<label for="orderid">Tổng tiền: <fmt:formatNumber
										value="${totalMoney}" type="currency" /></label>
								<label for="orderid">Ngày tạo: ${item.createdDate}</label>
								<label for="orderid">Giảm giá: ${item.discount * 100}&#37;</label>
								<div>
									<table id="example1" class="table table-bordered table-striped">

										<thead>
											<tr>
												<th>Tên sản phẩm</th>
												<th>Số lượng</th>
												<th>Đơn Giá</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="itemDetail" items="${item.orderDetails}">

												<tr>
													<td>${itemDetail.products.name}</td>
													<td>${itemDetail.quantity}</td>
													<c:set var="price" value="${itemDetail.price}" />
													<td><fmt:formatNumber value="${price}" type="currency" /></td>
												</tr>
											</c:forEach>


										</tbody>

									</table>
								</div>
                  				</div>		
							</c:forEach>
						</c:if>

						<c:if test="${not empty username}">
							<c:if test="${empty orderList }">
								<div class="page-header">
									<h2 class="page-title">Bạn chưa có đơn hàng nào</h2>
								</div>
							</c:if>
						</c:if>
						<c:if test="${empty username }">
							<div class="page-header">
								<h2 class="page-title">Vui lòng đăng nhập để kiểm tra</h2>
							</div>
						</c:if>
					</div>

				</div>
                             
                           
                        </div>
                    </div>
                </div>
                <div class="row inner-bottom-sm">
                <div class="col-lg-8 center-block">
                <div id="div2">
                </div>
                </div>
                </div>
            </div>
            <!-- ============================================================= FOOTER ============================================================= -->
        <%@ include file="/template/public/inc/footer.jsp" %>
        <script>
        var message = '${message}'
			if(message != ""){
				alert(message)
			}
        </script>
   		
  