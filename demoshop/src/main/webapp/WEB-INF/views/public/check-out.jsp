
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/template/public/inc/header.jsp"%>



<!-- ========================================= CONTENT ========================================= -->

<section id="checkout-page">
	<div class="container">
		<div class="col-xs-12 no-margin">
			<section id="your-order">
				<h2 class="border h1">Đơn hàng của bạn : </h2>
					<c:if test="${empty cartList }">
						<h1 class="border">Chưa có sản phẩm nào</h1>
					</c:if>
				<form>
					<c:if test="${not empty cartList }">
						<c:forEach var="item" items="${cartList}">
							<div class="row no-margin order-item">
								<div class="col-xs-12 col-sm-1 no-margin">
									<a href="#" class="qty">${item.quantity} x</a>
								</div>

								<div class="col-xs-12 col-sm-9 ">
									<div class="title">
										<a href="<c:url value ='/chi-tiet?id=${item.products.id}' />">${item.products.name}</a>
									</div>
									<div class="brand">${item.products.producer}</div>
								</div>

								<div class="col-xs-12 col-sm-2 no-margin">

									<c:set var="salePrice" value="${item.products.salePrice}" />
									<c:set var="price" value="${item.products.price}" />
									<c:if test="${item.products.salePrice != 0}">
										<div class="price">
											<fmt:formatNumber value="${salePrice * item.quantity}"
												type="currency" />
										</div>
									</c:if>
									<c:if test="${item.products.salePrice == 0}">
										<div class="price">
											<fmt:formatNumber value="${price * item.quantity}"
												type="currency" />
										</div>
									</c:if>
								</div>
							</div>
							<!-- /.order-item -->
						</c:forEach>
					</c:if>

				</form>
			</section>
			<!-- /#your-order -->

			<div id="total-area" class="row no-margin">
				<div class="col-xs-12 col-lg-4 col-lg-offset-8 no-margin-left">
					<div id="cupon-widget" class="widget">
						<h1 class="border">Áp dụng mã giảm giá</h1>
						<div class="body">

							<div class="inline-input">
								<input id="coupon"
									data-placeholder="Nhập mã 123 để đc giảm giá 50% đơn hàng"
									type="text" /> <button class="le-button" id="applyCoupon">Apply</button>
							</div>

						</div>
					</div>
				</div>
			</div>
			<!-- /.widget -->
			<div id="total-area" class="row no-margin">
				<div class="col-xs-12 col-lg-4 col-lg-offset-8 no-margin-left">
					<div id="subtotal-holder">
						<ul class="tabled-data inverse-bold no-border">
							<li><label>Thanh toán</label> <c:set var="totalMoney"
									value="${order.totalMoney}" />
								<div class="value ">
									<fmt:formatNumber value="${totalMoney}" type="currency" />
								</div></li>
							<li><label>Mã giảm giá</label>
								<div class="value">
									<div id="valueCoupon"></div>
								</div></li>
						</ul>
						<!-- /.tabled-data -->

						<ul id="total-field" class="tabled-data inverse-bold ">
							<li><label>Tổng tiền</label>
								<div class="value">
									<div id="myDiv2">
										<fmt:formatNumber value="${totalMoney}" type="currency" />
									</div>
								</div></li>
						</ul>
						<!-- /.tabled-data -->

					</div>
					<!-- /#subtotal-holder -->
				</div>
				<!-- /.col -->
			</div>
			<!-- /#total-area -->


			<div class="billing-address">
				<h2 class="border h1">Địa chỉ</h2>
				<c:url var="order" value="/dat-hang" />
				<form:form action="${order}" modelAttribute="order" id="orderForm"
					method="POST">
					<form:input type="hidden" path="user.id" />
					<div class="row field-row">
						<div class="col-xs-12 col-sm-6">
							<label>Họ tên *</label>
							<form:input class="le-input" path="user.fullname" id="fullname"
								name="fullname" required="required" />
						</div>
					</div>
					<!-- /.field-row -->

					<div class="row field-row">
						<div class="col-xs-12 col-sm-6">
							<label>Địa chỉ nhận hàng*</label>
							<form:input type="text" class="le-input" path="user.address"
								id="address" name="address" required="required" />
						</div>

					</div>
					<!-- /.field-row -->

					<div class="row field-row">
						<div class="col-xs-12 col-sm-6">
							<label>Số điện thoại *</label>
							<form:input type="text" class="le-input"
								path="user.telephoneNumber" id="telephoneNumber"
								name="telephoneNumber" required="required" />
						</div>
					</div>
					<!-- /.field-row -->
					<div hidden="hidden">
						<form:input type="text" id="input1" name="totalMoney"
							path="totalMoney" />
					</div>
					<div hidden="hidden">
						<form:input type="text" id="input2" name="discount"
							path="discount" />
					</div>
					<div class="row field-row">
						<div class="col-xs-12 col-sm-2">
							<label>Phương thức thanh toán</label> <label class="radio-inline">
								Thanh toán tại nhà<form:radiobutton id="paymentMethod" value="Thanh toán tại nhà"
									path="paymentMethod" required="required" />
							</label>
						</div>
					</div>
					<!-- /.field-row -->
					<c:if test="${not empty cartList }">
						<div class="place-order-button">
							<button type="submit" class="le-button big">Đặt hàng</button>
						</div>
						<!-- /.place-order-button -->
					</c:if>
					<c:if test="${empty cartList }">
						<div class="place-order-button">
							<a href="<c:url value ='trang-chu' /> " class="le-button big">Về
								mua hàng</a>
						</div>
						<!-- /.place-order-button -->
					</c:if>
				</form:form>

			</div>
			<!-- /.billing-address -->
		</div>
		<!-- /.col -->
	</div>
	<!-- /.container -->
</section>
<!-- /#checkout-page -->
<%@ include file="/template/public/inc/footer.jsp"%>

<!-- jQuery -->
<script
	src="<c:url value ='/template/public/assets/js/jquery-3.2.1.min.js' /> "></script>
<!-- jquery-validation -->
<script
	src="<c:url value ='/template/public/assets/js/jquery.validate.min.js' /> "></script>

<script>
  $(document).ready(function() {  
	
		
	 $("#cart1").hide();
	 
	 function formatCurrency(n, separate = "."){
		  var s = n.toString();
		  var len = s.length;
		  var ret = "";
		  for(var i = 1; i <= len; i++) {
		    ret = s[(len-i)] + ret;
		    
		    if( i % 3  === 0 && i < len) {
		      ret = separate + ret;
		    }
		  }
		  return ret;
		}
	  
   	 $('#applyCoupon').click(function() {
   		 var coupon = $("#coupon").val();
   		 moneyCurrent = $('#input1').val();
   		 if(moneyCurrent!="0"){
   			if(coupon == '123'){
   	   			$("#valueCoupon").html("50%");
   	   			
   	   			var totalMoneySaleOff = moneyCurrent * 50 / 100;
   	   			$('#myDiv2').html(formatCurrency(totalMoneySaleOff, ".")+"&nbsp;₫");
   	   			$('#input1').val(totalMoneySaleOff);
   	   			$('#input2').val(0.5);
   	   		 }else{
   	   			alert("Mã giảm giá ko hợp lệ");
   	   		 }
   	   		 
   		 }
   		 
   	});
   	
	

});
 </script>