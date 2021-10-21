<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <script type="text/javascript">
      

        var cafeArea = {
          중구: ["명동", "소공동"],
          용산구: ["이태원1동", "이태원2동"],
          종로구: ["삼청동", "혜화동"],
          성북구: ["안암동", "삼선동"],
          강남구: ["청담동", "압구정동"],
        };

        // var officePosition = {
        //   명동: {lat: 37.500613, lng: 127.036431},
        //   소공동: {lat: 37.504268, lng: 127.048188},
        //   이태원1동: {lat: 36.35536, lng: 127.298294},
        //   이태원2동: {lat: 36.358843, lng: 127.344192},
        //   삼청동: {lat: 36.098594, lng: 128.38977},
        //   혜화동: {lat: 36.109553, lng: 128.415011},
        //   안암동: {lat: 35.204279, lng: 126.807198},
        //   삼선동: {lat: 35.165476, lng: 126.909216},
        //   청담동: {lat: 35.095765, lng: 128.856344},
        //   압구정동: {lat: 35.093641, lng: 128.855679},
        // };

        var officeAddress = {
          명동: "서울특별시 종로구 명동",
          소공동: "서울특별시 종로구 소공동",
          이태원1동: "서울특별시 용산구 이태원1동",
          이태원2동: "서울특별시 용산구 이태원2동",
          삼청동: "서울특별시 종로구 삼청동",
          혜화동: "서울특별시 종로구 혜화동",
          안암동: "서울특별시 성북구 안암동",
          삼선동: "서울특별시 성북구 삼선동",
          청담동: "서울특별시 강남구 청담동",
          압구정동: "서울특별시 강남구 압구정동",
        };

        $(".dropdown-item.cafe_area").click(function () {
          var selArea = $(this).text();
          $("#areaBtn").text(selArea);
          $("#officeBtn").text("동 선택");
          var offices = cafeArea[selArea];
          $("#office_div").empty();
          $.each(offices, function (i, office) {
            $("#office_div").append(
              '<label class="dropdown-item cafe_office">' + office + "</label>"
            );
          });
        });

        // // officePosition의 lat, lng를 이용한 marker
        // $(document).on("click", ".dropdown-item.cafe_office", function () {
        //   var selOffice = $(this).text();
        //   $("#officeBtn").text(selOffice);
        //   var office = officePosition[selOffice];
        //   deleteMarkers();
        //   var officemarker = {
        //     coords: {lat: office.lat, lng: office.lng},
        //     iconImage: null,
        //     content: selOffice,
        //   };
        //   addMarker(officemarker);
        // });

        //officeAddress의 주소를 이용하여 geocoding으로 lat, lng 얻어온 후 marker
        $(document).on("click", ".dropdown-item.cafe_office", function () {
          var markers = [];
          setMapOnAll(null);
          var selOffice = $(this).text();
          $("#officeBtn").text(selOffice);
          var officeAddr = officeAddress[selOffice];

          $.get(
            "https://maps.googleapis.com/maps/api/geocode/json",
            {
              key: "AIzaSyCsfmdqVYsvhkK4jNpwPxc5STwYGRyrL8U",
              address: officeAddr,
            },
            function (data, status) {
              deleteMarkers();
              var officemarker = {
                coords: {
                  lat: data.results[0].geometry.location.lat,
                  lng: data.results[0].geometry.location.lng,
                },
                iconImage: null,
                content: selOffice,
              };
              console.log(officemarker);
              addMarker(officemarker);

              // if (selOffice == "명동") {
              var locations = [
                {place: "삼풍맨션아파트", lat: 37.556203, lng: 126.982525},
                {place: "삼익아파트", lat: 37.559737, lng: 126.9916},
                {place: "이지우아파트1단지", lat: 37.558445, lng: 126.985353},
                {place: "이지우아파트2단지", lat: 37.558105, lng: 126.981984},
                {place: "임상순아파트1단지", lat: 37.561854, lng: 126.9916},

                {place: "춘식아파트1단지", lat: 37.564432, lng: 126.971338},
                {place: "춘식빌라", lat: 37.563964, lng: 126.971992},
                {place: "춘식라이언아파트2단지", lat: 37.562152, lng: 126.975609},
                {place: "어피치아파트2단지", lat: 37.563853, lng: 126.980491},
                {place: "라이언주택", lat: 37.563819, lng: 126.981832},

                {place: "뚜비온더힐", lat: 37.537693, lng: 126.993132},
                {place: "뚜비온더그라운드", lat: 37.53623, lng: 126.99075},
                {place: "뚜비빌라", lat: 37.534937, lng: 126.992252},
                {place: "나나주택", lat: 37.531167, lng: 126.992604},
                {place: "나나빌라", lat: 37.530895, lng: 126.996048},

                {place: "호빵맨아파트6단지", lat: 37.536776, lng: 126.987784},
                {place: "호빵맨온더스카이", lat: 37.534649, lng: 126.987709},
                {place: "세균맨빌라", lat: 37.538988, lng: 126.992161},
                {place: "세균맨주택", lat: 37.541421, lng: 126.992451},
                {place: "세균맨오두막", lat: 37.543412, lng: 126.994457},

                {place: "보라돌이아파트7단지", lat: 37.588546, lng: 126.981399},
                {place: "보라돌이아파트2단지", lat: 37.587424, lng: 126.980938},
                {place: "보라돌이빌라", lat: 37.585834, lng: 126.983556},
                {place: "프로도주택", lat: 37.580995, lng: 126.980818},
                {place: "프로도빌라", lat: 37.57716, lng: 126.982256},

                {place: "혜화아파트1단지", lat: 37.587479, lng: 126.998331},
                {place: "혜화아파트2단지", lat: 37.588492, lng: 126.998004},
                {place: "혜화아파트3단지", lat: 37.589147, lng: 127.001641},
                {place: "혜화아파트4단지", lat: 37.590218, lng: 126.996931},
                {place: "혜화주택", lat: 37.584328, lng: 127.002814},

                {place: "안암아파트1단지", lat: 37.58749, lng: 127.029289},
                {place: "안암아파트2단지", lat: 37.581574, lng: 127.024664},
                {place: "안암아파트3단지", lat: 37.585828, lng: 127.022323},
                {place: "안암아파트4단지", lat: 37.585905, lng: 127.031591},
                {place: "안암주택", lat: 37.589102, lng: 127.029864},

                {place: "삼선아파트1단지", lat: 37.583868, lng: 127.010485},
                {place: "삼선아파트2단지", lat: 37.583502, lng: 127.013309},
                {place: "삼선아파트3단지", lat: 37.584667, lng: 127.008084},
                {place: "삼선아파트4단지", lat: 37.587252, lng: 127.006148},
                {place: "삼선주택", lat: 37.587112, lng: 127.014582},

                {place: "청담아파트 1단지", lat: 37.525419, lng: 127.041084},
                {place: "청담아파트 2단지", lat: 37.526633, lng: 127.045899},
                {place: "청담아파트 3단지", lat: 37.526769, lng: 127.049697},
                {place: "청담아파트 4단지", lat: 37.525807, lng: 127.051467},
                {place: "청담주택", lat: 37.519875, lng: 127.051679},

                {place: "압구정아파트 1단지", lat: 37.529061, lng: 127.041316},
                {place: "압구정아파트 2단지", lat: 37.531198, lng: 127.028898},
                {place: "압구정아파트 3단지", lat: 37.527388, lng: 127.02524},
                {place: "압구정아파트 4단지", lat: 37.525305, lng: 127.020775},
                {place: "압구정주택", lat: 37.52408, lng: 127.018715},
              ];

              //인포윈도우
              var infowindow = new google.maps.InfoWindow();

              //마커 생성
              for (var i = 0; i < locations.length; i++) {
                var marker = new google.maps.Marker({
                  map: map,
                  //label: locations[i].place,
                  position: new google.maps.LatLng(locations[i].lat, locations[i].lng),
                });
                markers.push(marker);

                google.maps.event.addListener(
                  marker,
                  "click",
                  (function (marker, i) {
                    return function () {
                      //html로 표시될 인포 윈도우의 내용
                      infowindow.setContent(locations[i].place);
                      //인포윈도우가 표시될 위치
                      infowindow.open(map, marker);
                    };
                  })(marker, i)
                );

                if (marker) {
                  marker.addListener("click", function () {
                    //중심 위치를 클릭된 마커의 위치로 변경
                    map.setCenter(this.getPosition());
                    //마커 클릭 시의 줌 변화
                    map.setZoom(15);
                  });
                }
              }
              // }
            },
            "json"
          ); //get
        });
      });
    </script>
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
          <a class="navbar-brand" href="mainpage.html">HappyHouse</a>

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
      <div class="dropdown">
        <div class="btn-group">
          <button
            type="button"
            id="cityBtn"
            class="btn btn-primary dropdown-toggle dropdown-toggle-split"
            data-toggle="dropdown"
            value="서울시"
          >
            서울시
          </button>
          <div class="dropdown-menu">
            <label>서울시</label>
          </div>
        </div>
        <div class="btn-group">
          <button
            type="button"
            id="areaBtn"
            class="btn btn-primary dropdown-toggle dropdown-toggle-split"
            data-toggle="dropdown"
          >
            구 선택
          </button>
          <div class="dropdown-menu">
            <label class="dropdown-item cafe_area">중구</label>
            <label class="dropdown-item cafe_area">용산구</label>
            <label class="dropdown-item cafe_area">종로구</label>
            <label class="dropdown-item cafe_area">성북구</label>
            <label class="dropdown-item cafe_area">강남구</label>
          </div>
        </div>
        <div class="btn-group">
          <button
            type="button"
            id="officeBtn"
            class="btn btn-primary dropdown-toggle dropdown-toggle-split"
            data-toggle="dropdown"
          >
            동 선택
          </button>
          <div id="office_div" class="dropdown-menu"></div>
        </div>
      </div>
    </div>
    <br>
    <div class="row">
      <div class="col-lg-4" style="overflow: auto; height: 800px">
        <h1>거래정보</h1>
        <hr>
        <h4>이지우아파트1단지</h4>
        <h5>거래금액 : 100,000만원</h5>
        <h5>면적 : 100.00㎡</h5>
        <hr />
        <h4>이지우아파트2단지</h4>
        <h5>거래금액 : 100,000만원</h5>
        <h5>면적 : 100.00㎡</h5>
        <hr />
        <h4>이지우아파트3단지</h4>
        <h5>거래금액 : 100,000만원</h5>
        <h5>면적 : 100.00㎡</h5>
        <hr />
        <h4>임상순아파트1단지</h4>
        <h5>거래금액 : 100,000만원</h5>
        <h5>면적 : 100.00㎡</h5>
        <hr />
        <h4>임상순아파트2단지</h4>
        <h5>거래금액 : 100,000만원</h5>
        <h5>면적 : 100.00㎡</h5>
        <hr />
        <h4>임상순아파트3단지</h4>
        <h5>거래금액 : 100,000만원</h5>
        <h5>면적 : 100.00㎡</h5>
        <hr />
      </div>
      <div id="map" style="width: 90%; height: 800px; margin: auto" class="col-lg-8"></div>
      <script
        defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCsfmdqVYsvhkK4jNpwPxc5STwYGRyrL8U&callback=initMap"
      ></script>
      <script>
        var multi = {lat: 37.5012743, lng: 127.039585};
        var map;
        var markers = [];
        var infoWindow;

        function initMap() {
          map = new google.maps.Map(document.getElementById("map"), {
            center: multi,
            zoom: 15,
          });

          infoWindow = new google.maps.InfoWindow();

          const myposition = "img/my_position.png";

          //멀티캠퍼스
          //const multimarker = new google.maps.Marker({coords: multi, content: '멀티캠퍼스', iconImage: myposition});
        }

        function handleLocationError(browserHasGeolocation, infoWindow, pos) {
          infoWindow.setPosition(pos);
          infoWindow.setContent(
            browserHasGeolocation
              ? "Error: Geolocation 서비스 실패."
              : "Error: Geolocation을 지원하지 않는 브라우저."
          );
          infoWindow.open(map);
        }

        function addMarker(props) {
          const marker = new google.maps.Marker({
            position: new google.maps.LatLng(
              parseFloat(props.coords.lat),
              parseFloat(props.coords.lng)
            ),
            map: map,
          });
          map.setCenter(marker.getPosition());
          map.setZoom(15);

          if (props.iconImage) {
            marker.setIcon(props.iconImage);
          }

          if (props.content) {
            infoWindow = new google.maps.InfoWindow({
              content: props.content,
            });
          }

          marker.addListener("click", function () {
            map.setZoom(17);
            map.setCenter(marker.getPosition());
            infoWindow.setPosition(marker.getPosition);
            infoWindow.setContent("이지우아파트1단지" + "<br/>" + "100,000");
            infoWindow.open(map, marker);
            bounceMarker(marker);
          });
          markers.push(marker);
          setMapOnAll(map);
        }

        function bounceMarker(marker) {
          if (marker.getAnimation() !== null) {
            marker.setAnimation(null);
          } else {
            marker.setAnimation(google.maps.Animation.BOUNCE);
          }
        }

        function deleteMarkers() {
          clearMarkers();
          markers = [];
        }

        function clearMarkers() {
          setMapOnAll(null);
        }

        function setMapOnAll(map) {
          for (let i = 0; i < markers.length; i++) {
            markers[i].setMap(map);
          }
        }
      </script>
      <!-- Google Map end -->
    </div>
    </div>
    <br><br><br>
    <div class="mt-4">
      <footer>
        <p>HappyHouse by 이지우, 임상순</p>
        <p></p>
      </footer>
    </div>
  </body>
</html>
