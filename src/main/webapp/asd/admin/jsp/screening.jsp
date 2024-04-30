<%@page import="admin.ScreeningVO"%>
<%@page import="admin.ScreeningDAO1"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" info="명화관 관리자 상영관리" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.SQLException" %>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.GregorianCalendar"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>명화관 관리자 페이지</title>
<!-- 필요한 CSS 및 JavaScript 라이브러리 링크 및 스타일 시트 -->
<link rel = "icon" href = "http://localhost/movie_admin/favicon.ico">
<!--bootstrap 시작-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<!--bootstrap 끝-->

<!--jQuery CDN 시작-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!--jQuery CDN 끝-->
<script>
				        // 페이지 로드 시 년, 월, 일 값 설정
				        $(document).ready(function() {
				            var now = new Date();
				            var year = now.getFullYear();
				            var month = now.getMonth() + 1;
				            var day = now.getDate();
				
				            // 년도 선택 드롭다운 설정
				            var yearDropdown = document.getElementById("yearDropdown");
				            for (var i = year - 2; i <= year + 2; i++) {
				                var option = document.createElement("option");
				                option.text = i;
				                option.value = i;
				                if (i === year) {
				                    option.selected = true;
				                }
				                yearDropdown.add(option);
				            }
				
				            // 월 선택 드롭다운 설정
				            var monthDropdown = document.getElementById("monthDropdown");
				            for (var j = 1; j <= 12; j++) {
				                var option = document.createElement("option");
				                option.text = j;
				                option.value = j;
				                if (j === month) {
				                    option.selected = true;
				                }
				                monthDropdown.add(option);
				            }
				
				            // 일 선택 드롭다운 설정 (31일까지)
				            function updateDays() {
				                var selectedYear = parseInt(yearDropdown.value);
				                var selectedMonth = parseInt(monthDropdown.value);
				                var lastDay = new Date(selectedYear, selectedMonth, 0).getDate();
				
				                var dayDropdown = document.getElementById("dayDropdown");
				                dayDropdown.innerHTML = ""; // 기존 옵션 제거
				
				                for (var k = 1; k <= lastDay; k++) {
				                    var option = document.createElement("option");
				                    option.text = k;
				                    option.value = k;
				                    if (k === day) {
				                        option.selected = true;
				                    }
				                    dayDropdown.add(option);
				                }
				            }
				
				            updateDays(); // 초기화
				            yearDropdown.addEventListener("change", updateDays);
				            monthDropdown.addEventListener("change", updateDays);
				        });
				    </script>
<!-- Custom fonts for this template-->
<link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
    rel="stylesheet">
<!-- Custom styles for this template-->
<link href="../css/sb-admin-2.css" rel="stylesheet">
</head>
<body id="page-top">
    <!-- 페이지 래퍼 및 내용 -->
    <div id="wrapper">
        <!-- 사이드바 include -->
        <%@ include file = "sidebar.jsp" %>
        <div id="content-wrapper" class="d-flex flex-column">
            <!-- 메인 내용 -->
            <div id="content">
               <%@ include file = "topbar.jsp" %>
                <!-- 메인 컨텐츠 -->
				<div class="container-fluid">
				    <div class="d-sm-flex align-items-center justify-content-between mb-4">
				        <h1 class="h3 mb-0 text-gray-800">상영관리</h1>
				    </div>
				    <div class="table-responsive">
				    <!-- 검색 폼 -->
                    <form id="searchForm" method="post" action="screening_service.jsp">
                        <!-- 지점 드롭다운 메뉴 -->
                        <select id="theaterDropdown" name="theater">
                            <option value="강남점">--강남점--</option>
                            <option value="역삼점">--역삼점--</option>
                            <!-- JavaScript로 받아온 지점 목록을 여기에 추가 -->
                        </select>
                        
                        <!-- 상영관 드롭다운 메뉴 -->
                        <select id="screeningRoomDropdown" name="screeningRoom">
                            <option value="1관">1관</option>
                            <option value="2관">2관</option>
                            <option value="3관">3관</option>
                            <!-- JavaScript로 받아온 상영관 목록을 여기에 추가 -->
                        </select>
                        
                        <!-- 년, 월, 일 드롭다운 메뉴 -->
                        <select id="yearDropdown" name="year"></select> 년
                        <select id="monthDropdown" name="month"></select> 월
                        <select id="dayDropdown" name="day"></select> 일

                        <button type="submit" id="searchButton" class="btn btn-primary">검색</button>
                    </form>
					
				    <button id="registerButton" class="btn btn-info float-right">등록</button>
				        <table class="table table-striped">
						    <thead>
						        <tr>
						            <th>번호</th>
						            <th>지점</th>
						            <th>상영관</th>
						            <th>영화명</th>
						            <th>상영일자</th>
						            <th>상영시작시간</th>
						        </tr>
						    </thead>
						    <tbody>
						        <% 
						        try {
						        	ScreeningDAO1 screeningDAO = ScreeningDAO1.getInstance();
						            List<ScreeningVO> screeningList = screeningDAO.selectScreeningList();
						            int num = 1;
						            for (ScreeningVO screening : screeningList) {
						        %>
						        <tr>
								    <td><%= num++ %></td>
								    <td><%= screening.getTheaterName() %></td>
								    <td><%= screening.getTheaterNumber() %></td>
								    <td><%= screening.getMovieName() %></td>
								    <td><%= screening.getScreeningDate() %></td>
								    <td><%= screening.getScreeningRound() %></td>
								</tr>
						        <% 
						            }
						        } catch (SQLException e) {
						            e.printStackTrace();
						        }
						        %>
						    </tbody>
						</table>
				    </div>
				</div>
                <!-- /.container-fluid -->
            </div>
            <!-- 메인 내용 끝 -->
            <%@ include file = "footer.jsp" %>
        </div>
        <!-- 내용 래퍼 끝 -->
    </div>
    <!-- 페이지 래퍼 끝 -->
    <!-- 필요한 JavaScript 파일 -->
</body>
</html>
