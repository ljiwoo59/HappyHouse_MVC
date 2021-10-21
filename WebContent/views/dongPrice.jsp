<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>HappyHouse</title>
    <link rel="shortcut icon" href="./img/favicon.ico" />
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
    />
    <link
      rel="stylesheet"
      href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
      integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
      crossorigin="anonymous"
    />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="./js/main.js"></script>
    <script type="text/javascript" src="./js/info.js"></script>
    <style>
      @import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
  
      * {
        text-align: center;
      }
  
      ul.nav {
        background-color: rgba(201, 201, 201, 0.5);
        padding: 10px;
        border-radius: 10px;
      }
      footer {
        font-family: "Nanum Gothic", sans-serif;
        text-align: center;
        background-color: rgba(125, 111, 111, 0.5);
      }
      .carousel-inner img {
        width: 100%;
        height: 100%;
      }
  
      label {
        display: inline-block;
        width: 140px;
        text-align: left;
      }
    </style>
  </head>

  <body>
    <div>
      <header>
        <!-- nav bar -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark" style="margin: 24px 0">
          <a class="navbar-brand" href="../index.jsp">HappyHouse</a>

          <button
            class="navbar-toggler navbar-toggler-right"
            type="button"
            data-toggle="collapse"
            data-target="#navb"
          >
            <span class="navbar-toggler-icon"></span>
          </button>

          <div class="collapse navbar-collapse" id="navb">
            <ul class="navbar-nav mr-auto">
              <li class="nav-item"><a href="/HappyHouse_BackEnd_team5/views/dongPrice.jsp" class="nav-link" id="dong">동별 거래가</a></li>
              <li class="nav-item"><a href="/HappyHouse_BackEnd_team5/views/aptPrice.jsp" class="nav-link" id="apt">아파트별 거래가</a></li>
            </ul>

            <form id="loginForm" class="form-inline my-2 my-lg-0">
              <button type="button" class="btn btn-info mr-2" id="register">회원가입</button>
              <input class="form-control mr-sm-2" type="text" id="id" placeholder="Enter ID" />
              <input
                class="form-control mr-sm-2"
                type="password"
                id="pw"
                placeholder="Enter Password"
              />
              <button class="btn btn-success my-2 my-sm-0" type="button" id="login">Login</button>
            </form>

            <form id="logoutForm" class="form-inline my-2 my-lg-0" style="display: none">
              <button type="button" class="btn btn-info" id="info">회원정보</button>
              <button class="btn btn-success" type="button" id="logout">Logout</button>
            </form>
          </div>
        </nav>
      </header>
    </div>
    <!-- Google Map start -->
    <div class="container">
      <br><br>
    <div class="text-center mb-2">
      <form method="post" action="search.happy">
		 	동 선택:<select name="condition">
		 			<option value="사직동">사직동</option>
		 			<option value="당주동">당주동</option>
		 			<option value="내수동">내수동</option>
		 			<option value="연건동">연건동</option>
		 			<option value="명륜1가">명륜1가</option>
		 			<option value="명륜2가">명륜2가</option>
		 			<option value="창신동">창신동</option>
		 			<option value="숭인동">숭인동</option>
		 			<option value="교북동">교북동</option>
		 			<option value="평창동">평창동</option>
		 			<option value="무악동">무악동</option>
		 		</select>
		 		<input type="submit" value="검색">
		 </form>
    </div>
    <br>
    <div class="row">
      <div class="col-lg-4" style="overflow: auto; height: 800px">
        <h1>거래정보 ${infos[0].dongName }</h1>
        <hr>
        <c:forEach items="${infos}" var="i">
        	<h4>${i.aptName }</h4>
        	<h5>${i.dealAmount }</h5>
        	<hr>
        </c:forEach>
      </div>
      <div id="map" style="width: 90%; height: 800px; margin: auto" class="col-lg-8"></div>
      
      
      <script
        defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCsfmdqVYsvhkK4jNpwPxc5STwYGRyrL8U&callback=initMap"
      ></script>
      <script>
        var multi = {lat: 37.5, lng: 127.6};
      </script>
      <c:if test="${!empty infos }">
      	<script>
      		multi = {lat: ${infos[0].lat}, lng: ${infos[0].lng}};
      	</script>
      </c:if>
        
      <script>
        var map;
        var markers = [];
        var infoWindow;

        function initMap() {
          map = new google.maps.Map(document.getElementById("map"), {
            center: multi,
            zoom: 16,
          });

          infoWindow = new google.maps.InfoWindow();
        }
        
        new google.maps.Marker({
            position: multi,
            map
        });
  

      </script>
      <!-- Google Map end -->
    </div>
    </div>
    <br><br><br>
    <div class="mt-4">
      <footer>
        <p>HappyHouse by 이지우, 박지연</p>
        <p></p>
      </footer>
    </div>
  </body>
</html>

