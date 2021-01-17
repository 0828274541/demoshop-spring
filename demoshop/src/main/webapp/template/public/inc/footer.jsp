<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- ========================================= CONTENT : END ========================================= -->
<!-- ============================================================= FOOTER ============================================================= -->
<!-- ============================================================= FOOTER ============================================================= -->
<footer id="footer" class="color-bg">


	<div class="copyright-bar">
		<div class="container">
			<div class="col-xs-12 col-sm-6 no-margin">
				<div class="copyright">
					&copy; - Click <a href="<c:url value='/quan-tri/trang-chu' /> ">ADMIN</a>
					to Admin Page
				</div>
				<!-- /.copyright -->
			</div>

		</div>
		<!-- /.container -->
	</div>
	<!-- /.copyright-bar -->

</footer>
<!-- /#footer -->
<!-- ============================================================= FOOTER : END ============================================================= -->
</div>
<!-- /.wrapper -->



<!-- JavaScripts placed at the end of the document so the pages load faster -->
<script
	src="<c:url value='/template/public/assets/js/jquery-1.10.2.min.js' />"></script>
<script
	src="<c:url value='/template/public/assets/js/jquery-migrate-1.2.1.js' />"></script>
<script
	src="<c:url value='/template/public/assets/js/bootstrap.min.js' />"></script>
<script
	src="http://maps.google.com/maps/api/js?sensor=false&amp;language=en"></script>
<script src="<c:url value='/template/public/assets/js/gmap3.min.js' />"></script>
<script
	src="<c:url value='/template/public/assets/js/bootstrap-hover-dropdown.min.js' />"></script>
<script
	src="<c:url value='/template/public/assets/js/owl.carousel.min.js' />"></script>
<script
	src="<c:url value='/template/public/assets/js/css_browser_selector.min.js' />"></script>
<script src="<c:url value='/template/public/assets/js/echo.min.js' />"></script>
<script
	src="<c:url value='/template/public/assets/js/jquery.easing-1.3.min.js' />"></script>
<script
	src="<c:url value='/template/public/assets/js/bootstrap-slider.min.js' />"></script>
<script
	src="<c:url value='/template/public/assets/js/jquery.raty.min.js' />"></script>
<script
	src="<c:url value='/template/public/assets/js/jquery.prettyPhoto.min.js' />"></script>
<script
	src="<c:url value='/template/public/assets/js/jquery.customSelect.min.js' />"></script>
<script src="<c:url value='/template/public/assets/js/wow.min.js' />"></script>
<script src="<c:url value='/template/public/assets/js/scripts.js' />"></script>

<!-- For demo purposes – can be removed on production -->

<script
	src="<c:url value='/template/public/assets/js/switchstylesheet.js' />"></script>
<script
	src="<c:url value='/template/public/assets/css/sweetalert2/sweetalert2.min.js' />"></script>

<script>
		$(document).ready(function(){ 
			$(".changecolor").switchstylesheet( { seperator:"color"} );
			$('.show-theme-options').click(function(){
				$(this).parent().toggleClass('open');
				return false;
			});
		});

		$(window).bind("load", function() {
		   $('.show-theme-options').delay(2000).trigger('click');
		});

		
	</script>
<!-- For demo purposes – can be removed on production : End -->

<script src="<c:url value='/template/public/assets/js/button.js' />"></script>

</body>
</html>
