<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/template/taglib.jsp" %>
<link rel="stylesheet" href="<c:url value='/template/login/css/error-403.css' />">

<div class="maincontainer">
  <div class="bat">
    <img class="wing leftwing" 
         src="<c:url value='/template/login/img/bat-wing.png' />" >
    <img class="body"
         src="<c:url value='/template/login/img/bat-body.png' />" alt="bat">
    <img class="wing rightwing"
         src="<c:url value='/template/login/img/bat-wing.png' />">
  </div>
  <div class="bat">
    <img class="wing leftwing" 
         src="<c:url value='/template/login/img/bat-wing.png' />">
    <img class="body"
         src="<c:url value='/template/login/img/bat-body.png' />" alt="bat">
    <img class="wing rightwing"
         src="<c:url value='/template/login/img/bat-wing.png' />">
  </div>
  <div class="bat">
    <img class="wing leftwing" 
         src="<c:url value='/template/login/img/bat-wing.png' />">
    <img class="body"
         src="<c:url value='/template/login/img/bat-body.png' />" alt="bat">
    <img class="wing rightwing"
         src="<c:url value='/template/login/img/bat-wing.png' />">
  </div>
  <img class="foregroundimg" src="<c:url value='/template/login/img/HauntedHouseForeground.png' />" >
  
</div>
<h1 class="errorcode">ERROR 403</h1>
<div class="errortext">Tài khoản của Bạn ko có quyền truy cập trang này. <a href="<c:url value='/trang-chu' />">Quay về ngay!</a></div>