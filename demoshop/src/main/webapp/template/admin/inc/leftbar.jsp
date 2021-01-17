<%@ include file="/template/taglib.jsp"%>
<%@page import="com.demoshop.util.SecurityUtils"%>
<%@page import="java.util.ArrayList"%>

<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-dark-primary elevation-4	">
	<!-- Brand Logo -->
	<a href="<c:url value='/quan-tri/trang-chu' />" class="brand-link">
		<img
		src="<c:url value ='/template/admin/assets/dist/img/AdminLTELogo.png' />"
		alt="AdminLTE Logo" class="brand-image img-circle elevation-3"
		style="opacity: .8"><span class="brand-text font-weight-light">AdminLTE
			3</span>
	</a>

	<!-- Sidebar -->
	<div class="sidebar">
		<!-- Sidebar user panel (optional) -->
		<div class="user-panel mt-3 pb-3 mb-3 d-flex">
			<div class="image">
				<img
					src="<c:url value ='/template/admin/assets/dist/img/default-avatar2.png' />"
					class="img-circle elevation-2" alt="User Image">
			</div>
			<div class="info">
				<a href="#" class="d-block"> Xin chào, <%=SecurityUtils.getPrincipal().getUsername()%></a>

			</div>
		</div>

		<!-- SidebarSearch Form -->
		<div class="form-inline">
			<div class="input-group" data-widget="sidebar-search">
				<input class="form-control form-control-sidebar" type="search"
					placeholder="Search" aria-label="Search">
				<div class="input-group-append">
					<button class="btn btn-sidebar">
						<i class="fas fa-search fa-fw"></i>
					</button>
				</div>
			</div>
		</div>

		<!-- Sidebar Menu -->
		<nav class="mt-2">
			<ul class="nav nav-pills nav-sidebar flex-column"
				data-widget="treeview" role="menu" data-accordion="false">
				<!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
               	<c:set var ="myRole" value ="ROLE_ADMIN"/>
               	<c:set var="contains" value="false" />
				<c:forEach var="item" items="<%=SecurityUtils.getAuthorities()%>">
					<c:if test="${item eq myRole}">
						<c:set var="contains" value="true" />
					</c:if>
				</c:forEach>
				<c:if test="${contains eq true}">

				<li class="nav-item"><a id="category"
					href="<c:url value='/quan-tri/danh-muc/list' />" class="nav-link"> <i
						class="nav-icon fas fa-th"></i>
						<p>
							Quản lý danh mục <span class="right badge badge-danger">New</span>
						</p>
				</a></li>
				<!-- <li class="nav-item menu-open"> -->
				<li class="nav-item"><a id="product"
					href="<c:url value='/quan-tri/san-pham/list' />" class="nav-link"> <i
						class="nav-icon fas fa-tachometer-alt"></i>
						<p>Quản lý Sản phẩm</p>
				</a></li>
				<li class="nav-item"><a id="order"
					href="<c:url value='/quan-tri/don-hang/list' />"
					class="nav-link"> <i class="nav-icon fas fa-circle"></i>
						<p>Quản lý đơn hàng</p>
				</a></li>				
				</c:if>
				<li class="nav-item"><a id="user"
					href="<c:url value='/quan-tri/tai-khoan/list' />" class="nav-link">
						<i class="nav-icon fas fa-copy"></i>
						<p>Quản lý người dùng</p>
				</a></li>
				<%--  
           <li class="nav-item">
            <a id ="contact" href="<%=request.getContextPath()%>" class="nav-link">
              <i class="nav-icon fas fa-copy"></i>
              <p>
                Quản lý liên hệ
                
              </p>
            </a>
          </li> --%>


				<li class="nav-item"><a
					href='<c:url value='/j_spring_security_logout'/>' class="nav-link">
						<i class="nav-icon fa fa-power-off"></i>
						<p>Thoát</p>

				</a></li>
			</ul>
		</nav>
		<!-- /.sidebar-menu -->
	</div>
	<!-- /.sidebar -->
</aside>