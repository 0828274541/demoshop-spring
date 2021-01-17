<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

		            <!-- ========================================= CATEGORY TREE ========================================= -->
<div class="widget accordion-widget category-accordions">
    <h2 class="border">Danh mục cửa hàng</h2>
    <div class="accordion">
    <!-- --------------------------------- -->
        
  <c:set var ="cat" value="${sidebar}" />
  ${cat}
     
    </div><!-- /.accordion -->
</div><!-- /.category-accordions -->
<!-- ========================================= CATEGORY TREE : END ========================================= -->
