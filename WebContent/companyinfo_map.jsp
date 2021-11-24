<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 메타포 데이터 -->

    <!-- 파비콘 설정 -->

    <!-- 오픈 그래프 -->

    <!-- 필요한 구성요소 및 플러그인 가져오기 -->

    <title>서브 페이지</title>
    <!--여기부터 -->
    <script src="https://maps.googleapis.com/maps/api/js?sensor=false"></script> 
    <script> 
    //좌표 값을 바꿔서 입력 37.66002126408024, 126.77100244884178
    function initialize() {
    var myLatlng = new google.maps.LatLng(37.66002126408024, 126.77100244884178);
    var mapOptions = {
        zoom: 17,           //지도 확대 배율
        center: myLatlng
    }

    var map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions);
    var marker = new google.maps.Marker({
        position: myLatlng,
        map: map,
        title: '더조은컴퓨터학원'	  //레이블을 바꿔서 입력
    });
    }
    google.maps.event.addDomListener(window, 'load', initialize);
    </script>
    <!-- 여기까지를 head태그 닫기 전에 복사해서 붙여넣기 -->
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/common.css">
    <link rel="stylesheet" href="./css/main.css">
    <link rel="stylesheet" href="./css/ban.css">
    <style>
    .content { clear:both; width: 100%; }
    .breadcrumb { clear:both; width: 1000px; height: 80px; background-color:#fff; 
    margin: 0 auto; }
    .tit { float:left; font-size:24px; line-height:80px; }
    .bread { float:right; line-height: 80px;  }    
    .bread a, .bread span, .bread select, .bread .loc_area { display:block; line-height: 80px; float:left; 
    margin-left:10px; font-size:14px;}
    .bread select {height: 40px;width: 100px;margin: 20px;}
    .bread a { color:#333; }
    .bread span:last-child { color:#333; }

    .con { clear:both; width: 100%; border-top:2px solid #f1f1f1; }
    .sidebar {width: 200px;min-height:calc(100vh - 307px);float:left;background-color: #030a50;}
    .lnb { clear:both; }
    .lnb li { line-height:50px; background-color: #030a50; }
    .lnb li a { padding-left: 30px; color:#fff; font-size:14px; }
    .lnb li a.cur { color:gold; font-size:16px; font-weight:bold; }
    .con_data { float:right; width:calc(100% - 202px); border-left:2px solid #f1f1f1; }
    .vs { clear:both; width:900px; margin: 0 auto; }
    .vs img { display:block; width: 100%; height:auto; }
    .map_area { width: 600px; height: 400px; clear:both; margin:20px auto; position:relative; }    
    .wrap{ display: flex; min-height: calc(100vh - 225px); flex-direction: column; width:100%;}
    
    </style>
 <script src="https://code.jquery.com/jquery-latest.js"></script>
</head>
<body onload="initialize()"><!-- body 태그에 onload이벤트 등록 -->
  <%@ include file = "header.jsp" %>
    <div class="wrap">
        <div class="content">
            <div class="breadcrumb">
                <h2 class="tit">오시는 길</h2>
                <div class="bread">
                    <a href="">회사소개</a><span>&gt;</span> 
                    <select name="loc" id="loc">
                        <option value="" selected>오시는 길</option>
                        <option value="companyinfo_history.jsp">회사연혁</option>
                        <option value="companyinfo_greeting.jsp">인사말</option>
                        <option value="companyinfo_organization.jsp">회사조직</option>
                    </select>
                    <!--<div class="loc_area">
                        <input list="locurl" name="loc" id="loc">
                        <datalist id="locurl">
                            <option value="">오시는길</option>
                            <option value="1">회사연혁</option>
                            <option value="2">인사말</option>
                            <option value="3">회사조직</option>
                        </datalist>
                    </div>-->
                </div>
                <script>
                 document.getElementById("loc").addEventListener("change", function(){
                   if(this.value != ""){
                        location.href=this.value;
                    }
                });    
                </script>
            </div>
            <section class="con">
                <aside class="sidebar">
                    <nav class="lnb">
                        <ul>
                            <li><a href="" class="cur">오시는 길</a></li>
                            <li><a href="companyinfo_history.jsp">회사연혁</a></li>
                            <li><a href="companyinfo_greeting.jsp">인사말</a></li>
                            <li><a href="companyinfo_organization.jsp">회사조직</a></li>
                        </ul>
                    </nav>
                </aside>
                <div class="con_data">
                    <div class="map_area">
                        <!-- API 지도 삽입 -->
                        <div id="map_canvas" style="width:600px; height:400px"></div>
                    </div>
                </div>    
            </section>    
        </div>
    </div>
    <%@ include file = "footer.jsp" %>
</body>
</html>