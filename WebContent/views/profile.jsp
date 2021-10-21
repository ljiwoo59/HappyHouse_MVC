<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <!--header-->
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
              <li class="nav-item"><a class="nav-link" id="dong">동별 거래가</a></li>
              <li class="nav-item"><a class="nav-link" id="apt">아파트별 거래가</a></li>
            </ul>

            <form id="loginForm" class="form-inline my-2 my-lg-0" style="display: none">
              <input class="form-control mr-sm-2" type="text" id="id" placeholder="Enter ID" />
              <input
                class="form-control mr-sm-2"
                type="password"
                id="pw"
                placeholder="Enter Password"
              />
              <button class="btn btn-success my-2 my-sm-0" type="button" id="login">Login</button>
            </form>

              <button onclick = "location = '../index.jsp'" class="btn btn-success" type="button" id="Main">Main</button>
         
          </div>
        </nav>
      </header>
    </div>

    <br /><br />
    <div class="container">
      <h1>회원 정보</h1>
      <hr>
      <img src="../img/blank-profile-picture-973460_1280.png" alt="profile" style="width: 30%; height: 30%;">
      <br><br><br>
      <table class="table">
        <tbody>
          <tr>
            <td>아이디</td>
            <td id="tid">${id}</td>
          </tr>
          <tr>
            <td>비밀번호</td>
            <td id="tpw">1234</td>
          </tr>
          <tr>
            <td>이름</td>
            <td id="tname">홍길동</td>
          </tr>
          <tr>
            <td>이메일</td>
            <td id="taddress">jondoe@abcd.com</td>
          </tr>
          <tr>
            <td>전화번호</td>
            <td id="ttel">010-1234-5678</td>
          </tr>
        </tbody>
      </table>

      <button type="button" class="btn btn-warning" id="edit" data-toggle="modal" data-target="div#mymodal">
        	수정
      </button>
      
      <button onclick = "location = 'delete.happy?id=${id}'" type="button" class="btn btn-danger" id="remove">삭제</button>
    </div>

    <div class="modal fade" id="mymodal">
      <div class="modal-dialog">
        <div class="modal-content">
          <!-- Modal Header -->
          <div class="modal-header">
            <h4 class="modal-title">정보 수정</h4>
            <button type="button" class="close" data-dismiss="modal">×</button>
          </div>

          <!-- Modal body -->
          <div class="modal-body">
            <form action="">
              <p><label>아이디</label> <input type="text" name="nid" id="nid" placeholder="abcd12"/><br /></p>
              <p><label>비밀번호</label> <input type="password" name="npw" id="npw" placeholder="1234"/><br /></p>
              <p><label>이름</label> <input type="text" name="name" id="name" placeholder="홍길동"/><br /></p>
              <p><label>이메일</label> <input type="text" name="address" id="address" placeholder="jondoe@abcd.com"/><br /></p>
              <p><label>전화번호</label> <input type="tel" name="tel" id="tel" placeholder="010-1234-5678"/></p>
            </form>
          </div>

          <!-- Modal footer -->
          <div class="modal-footer">
            <button type="button" class="btn btn-primary" id="editted">확인</button>
          </div>
        </div>
      </div>
    </div>
    <br><br><br><br><br><br><br>
    <div class="mt-4">
      <footer>
        <p>HappyHouse by 이지우, 임상순</p>
        <p></p>
      </footer>
    </div>
  </body>
</html>