<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ page import = "java.sql.*" %>
   
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>북스크린 | 영화 예매, 정보 검색, 다운로드까지 한 곳에서</title>
    
    <!-- 문서 메타포 설정 -->
    <meta name="title" content="북스크린">
    <meta name="keywords" content="영화 예매 | 영화관람  | 영화예매권  | 영화 검색">
    <meta name="description" content="영화 예매, 정보 검색, 다운로드까지 한 곳에서">
    <meta name="author" content="북스크린">
    
    <!-- 트위터만을 위한 오픈 그래프 설정 -->
    <meta name="twitter:card" content="summary">
    <meta name="twitter:site" content="트위터 페이지에 표시할 사이트 주소">
    <meta name="twitter:creator" content="북스크린">
    <meta name="twitter:url" content="https://bookscreen.co.kr">
    <meta name="twitter:title" content="북스크린">
    <meta name="twitter:description" content="북스크린">
    <meta name="twitter:image" content="./img/apple-touch-icon.png">
    
    <!-- 소셜 네트워크 서비스에서의 공통 오픈 그래프 설정 -->
    <meta property="og:url" content="https://bookscreen.co.kr">
    <meta property="og:image" content="./img/apple-touch-icon.png">
    <meta property="og:type" content="website">
    <meta property="og:site_name" content="북스크린">
    <meta property="og:locale" content="kr_KR">
    <meta property="og:title" content="북스크린">
    <meta property="og:description" content="영화 예매, 정보 검색, 다운로드까지 한 곳에서">
    <meta property="og:country-name" content="bookscreen">
    
    <!-- 파비콘 설정 -->
    <link rel="shortcut icon" href="./ico/favicon.ico">
    <link rel="apple-touch-icon" href="./ico/favicon.ico" sizes="48x48">
    
    <!-- 구글 웹폰트 외부 스타일파일 로딩 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Nanum+Gothic&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/common.css">
    <link rel="stylesheet" href="./css/main.css">
    <link rel="stylesheet" href="./css/ban.css">
    <script src="./js/jquery.js"></script>
    <script src="./js/ban.js"></script>
    
</head>
<body>
<div class="wrap">
  <!-- 헤더 -->
  <%@ include file = "header.jsp" %>
  
  <%
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs;
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id="scott";
		String pw="tiger";
		String sql;
		
		Class.forName("oracle.jdbc.OracleDriver");
		conn = DriverManager.getConnection(url, id, pw);
		stmt = conn.createStatement();
		sql = "select * from m_product order by proNum";
		rs = stmt.executeQuery(sql);
%>
	<div class="content">
        <figure class="vs">
      		<ul class="img_box">
                    <li>
                        <img src="./img/bg1.jpeg" alt="서울도시철도공사" class="vs_img">
                        <div class="tit_box">
                            <h2 class="vs_tit">듄</h2>
                            <p class="vs_com">10191년, 아트레이데스 가문의 후계자인 폴(티모시 샬라메)은 시공을 초월한 존재이자 전 우주를 구원할 예지된 자의 운명을 타고났다. 그리고 어떤 계시처럼 매일 꿈에서 아라키스 행성에 있는 한 여인을 만난다. 모래언덕을 뜻하는 '듄'이라 불리는 아라키스는 물 한 방울 없는 사막이지만 우주에서 가장 비싼 물질인 신성한 환각제 스파이스의 유일한 생산지로 이를 차지하기 위한 전쟁이 치열하다. 황제의 명령으로 폴과 아트레이데스 가문은 죽음이 기다리는 아라키스로 향하는데… 위대한 자는 부름에 응답한다, 두려움에 맞서라, 이것은 위대한 시작이다!</p>
                            <a href="" class="more">더보기</a>
                        </div>
                    </li>
                    <li>
                        <img src="./img/bg2.jpg" alt="서울도시철도공사" class="vs_img">
                        <div class="tit_box">
                            <h2 class="vs_tit">베놈2 : 렛 데어 비 카니지</h2>
                            <p class="vs_com">‘베놈’과 완벽한 파트너가 된 ‘에디 브록’(톰 하디) 앞에 ‘클리터스 캐서디’(우디 해럴슨)가 ‘카니지’로 등장, 앞으로 닥칠 대혼돈의 세상을 예고한다. 대혼돈의 시대가 시작되고, 악을 악으로 처단할 것인가? </p>
                            <a href="" class="more">더보기</a>
                        </div>
                    </li>
                    <li>
                        <img src="./img/bg3.jpg" alt="서울도시철도공사" class="vs_img">
                        <div class="tit_box">
                            <h2 class="vs_tit">이터널스</h2>
                            <p class="vs_com">마블 스튜디오의 이터널스는 수 천년에 걸쳐 그 모습을 드러내지 않고 살아온 불멸의 히어로들이 인류의 가장 오래된 적 '데비안츠'에 맞서기 위해 다시 힘을 합치면서 벌어지는 이야기</p>
                            <a href="" class="more">더보기</a>
                        </div>
                    </li>
                </ul>        
        </figure>
        <h2 class="con_tit">현재 상영중인 영화</h2>

        <article class="art01">
            <ul>
            <%		
			while(rs.next()) {
			String pro_name = rs.getString("proName");
			int pro_price = rs.getInt("proPrice");
			int pro_cnt = rs.getInt("proCnt");
			String pro_img = rs.getString("proImg");
			if(pro_img==null){
				pro_img="./img/noname.png";
			}
			%>      
               <li>            
                    <img src="./img/<%=pro_img%>" alt="<%=pro_name%>">
                    <h3 class="pro_tit"><%=pro_name%></h3>
                    <p class="pro_price"><%=pro_price%>원</p>
                    <p class="pro_com"><%=pro_cnt%>개 남음</p>
               </li>
			<%		
			}
            rs.close();
    		stmt.close();
    		conn.close();
			%>  
            </ul>
        </article>
        </div>
    </div>
  <!-- 푸터 -->
  <%@ include file = "footer.jsp" %>
</body>
</html>