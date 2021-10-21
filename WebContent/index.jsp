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
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
    />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link
      href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&family=Pacifico&display=swap"
      rel="stylesheet"
    />
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript" src="./js/info.js"></script>
    <script
      defer
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCqjCmStOPrSUnoum7Y13WHxjWqC2g1ccc&callback=initMap"
    ></script>
    <script>
      // Initialize and add the map
      function initMap() {
        // The start location
        const start = {lat: 36.4, lng: 127.7669};
        // The map, centered at start
        const map = new google.maps.Map(document.getElementById("map"), {
          zoom: 7,
          center: start,
        });
        // The marker

        new google.maps.Marker({
          position: {lat: 37.5665, lng: 126.978},
          map: map,
        });
        new google.maps.Marker({
          position: {lat: 35.1796, lng: 129.0756},
          map: map,
        });
        new google.maps.Marker({
          position: {lat: 35.8714, lng: 128.6014},
          map: map,
        });
        new google.maps.Marker({
          position: {lat: 36.3504, lng: 127.3845},
          map: map,
        });
        new google.maps.Marker({
          position: {lat: 37.4563, lng: 126.7052},
          map: map,
        });
        new google.maps.Marker({
          position: {lat: 35.1595, lng: 126.8526},
          map: map,
        });
        
      }
    </script>

    <style>
      @import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

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
        height: 500px;
      }

      label {
        display: inline-block;
        width: 140px;
        text-align: right;
      }
      
    </style>
  </head>
  <body>
    <!--header-->
    <div>
      <header>
        <!-- nav bar -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark" style="margin: 24px 0">
          <a class="navbar-brand" href="index.jsp">HappyHouse</a>

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

           <jsp:include page="./views/loginCheck.jsp"></jsp:include>
           
          </div>
        </nav>
      </header>
    </div>

    <!--modal-->

    <div class="modal fade" id="mymodal">
      <div class="modal-dialog">
        <div class="modal-content">
          <!-- Modal Header -->
          <div class="modal-header">
            <h4 class="modal-title">회원가입</h4>
            <button type="button" class="close" data-dismiss="modal">×</button>
          </div>

          <!-- Modal body -->
          <div class="modal-body" >
            <form method='post' action= 'addUser.happy'>
              <p><label>아이디</label> <input type="text" name="nid" id="nid" /><br /></p>
              <p><label>비밀번호</label> <input type="password" name="npw" id="npw" /><br /></p>
              <p><label>이름</label> <input type="text" name="name" id="name" /><br /></p>
              <p><label>이메일</label> <input type="text" name="address" id="address" /><br /></p>
              <p><label>전화번호</label> <input type="tel" name="tel" id="tel" /></p>
              <div class="modal-footer">
            	<button type="submit" class="btn btn-primary" id="register">등록</button>
          	  </div>
            </form>
          </div>
        </div>
      </div>
    </div>
    

    <div class="container">
      <!-- 1. carousel -->
      <div id="cdemo" class="carousel slide my-5" data-ride="carousel">
        <!-- Indicators -->
        <ul class="carousel-indicators">
          <li data-target="#cdemo" data-slide-to="0" class="active"></li>
          <li data-target="#cdemo" data-slide-to="1"></li>
          <li data-target="#cdemo" data-slide-to="2"></li>
        </ul>

        <!-- The slideshow -->
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img src="./img/Daegu.jpg" alt="Banpo" width="300" height="300" />
            <div class="carousel-caption">
              <h1>HappyHouse</h1>
            </div>
          </div>
          <div class="carousel-item">
            <img src="./img/Banpo.jpg" alt="Daegu" width="300" height="300" />
            <div class="carousel-caption">
              <h1>HappyHouse</h1>
            </div>
          </div>
          <div class="carousel-item">
            <img src="./img/Chundam.jpg" alt="Chungdam" width="300" height="300" />
            <div class="carousel-caption">
              <h1>HappyHouse</h1>
            </div>
          </div>
        </div>

        <!-- Left and right controls -->
        <a class="carousel-control-prev" href="#cdemo" data-slide="prev">
          <span class="carousel-control-prev-icon"></span>
        </a>
        <a class="carousel-control-next" href="#cdemo" data-slide="next">
          <span class="carousel-control-next-icon"></span>
        </a>
      </div>

      <hr />

      <!--map-->
      <div class="row">
        <div class="col-6" id="map" style="width: 100%; height: 400px"></div>
        <!-- 인기글 Article Start  -->
        <div class="col-6">
          <h3>게시판</h3>
          <table class="table table_striped table-hover">
            <thead>
              <tr class="table-warning">
                <th class="title">제목</th>
                <th>작성자</th>
                <th>조회수</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>춘식이의 부동산</td>
                <td>춘식</td>
                <td>1756</td>
              </tr>
              <tr>
                <td>춘식아파트 매매</td>
                <td>라이언</td>
                <td>998</td>
              </tr>
              <tr>
                <td>춘식빌라 임대 구함</td>
                <td>춘식</td>
                <td>856</td>
              </tr>
              <tr>
                <td>춘식이의 맛집탐방</td>
                <td>춘식</td>
                <td>852</td>
              </tr>
              <tr>
                <td>춘식이의 고구마 나눔</td>
                <td>춘식</td>
                <td>644</td>
              </tr>
              <tr>
                <td>하히후헤호</td>
                <td>어피치</td>
                <td>102</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>

    <div class="mt-4">
      <footer>
        <p>HappyHouse by 이지우, 박지연</p>
        <p></p>
      </footer>
    </div>
  </body>
</html>