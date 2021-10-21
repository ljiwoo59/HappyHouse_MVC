<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${empty id}"> 
		<form id="loginForm" class="form-inline my-2 my-lg-0" method='post' action= 'loginProcess.happy'>
	      <button type="button" class="btn btn-info mr-2" data-toggle="modal" data-target="div#mymodal">
	               		 회원가입
	      </button>
	      <input class="form-control mr-sm-2" type="text" id="id" name = "id" placeholder="Enter ID" />
	      <input class="form-control mr-sm-2" type="password" id="pw" name = "pw" placeholder="Enter Password"/>
	      <button class="btn btn-success my-2 my-sm-0" type="submit" id="login">Login</button>
		</form>
	</c:if>
	
	<c:if test="${!empty id}"> 
		
	    <button onclick = "location = './views/profile.jsp'" type="button" class="btn btn-info" id="info">회원정보</button>
	    <form id="logoutForm" class="form-inline my-2 my-lg-0" method='get' action= 'logout.happy' >
	       <button class="btn btn-success" type="submit" id="logout">Logout</button>
		</form>
	</c:if>
</body>
</html>