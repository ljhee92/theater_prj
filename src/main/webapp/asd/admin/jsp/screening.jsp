<%@page import="admin.ScreeningVO"%>
<%@page import="admin.ScreeningDAO1"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" info="명화관 관리자 상영관리" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.SQLException" %>
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
<script>
    // Ajax를 사용하여 데이터베이스에서 데이터를 가져오는 함수
    function fetchDataFromDatabase() {
        $.ajax({
            url: 'screening_service.jsp', // 데이터를 처리할 서버 측의 스크립트 주소
            method: 'GET', // HTTP 메서드 (GET, POST 등)
            dataType: 'json', // 응답 데이터 타입 (JSON, XML 등)
            success: function(data) { // Ajax 요청이 성공했을 때 실행될 함수
                // 서버에서 받아온 데이터(data)를 처리하는 로직을 여기에 작성
                console.log(data); // 받아온 데이터를 콘솔에 출력 (디버깅용)
                // 받아온 데이터를 사용하여 드롭다운 메뉴 등을 동적으로 생성하는 등의 작업을 수행
            },
            error: function(xhr, status, error) { // Ajax 요청이 실패했을 때 실행될 함수
                console.error(error); // 에러 메시지를 콘솔에 출력 (디버깅용)
            }
        });
    }

    // 페이지 로드 시 자동으로 데이터를 가져오도록 호출
    $(document).ready(function() {
        fetchDataFromDatabase();
    });
</script>
<!--jQuery CDN 시작-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!--jQuery CDN 끝-->
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
				    <!-- 지점 드롭다운 메뉴 -->
					<select id="theaterDropdown">
					    <option value="">지점 선택</option>
					    <!-- JavaScript로 받아온 지점 목록을 여기에 추가 -->
					</select>
					
					<!-- 상영관 드롭다운 메뉴 -->
					<select id="screeningRoomDropdown">
					    <option value="">상영관 선택</option>
					    <!-- JavaScript로 받아온 상영관 목록을 여기에 추가 -->
					</select>
					
					<!-- 년, 월, 일 드롭다운 메뉴 -->
					<select id="yearDropdown">
					    <option value="">년도 선택</option>
					    <!-- JavaScript로 받아온 년도 목록을 여기에 추가 -->
					</select>
					
					<select id="monthDropdown">
					    <option value="">월 선택</option>
					    <!-- JavaScript로 받아온 월 목록을 여기에 추가 -->
					</select>
					
					<select id="dayDropdown">
					    <option value="">일 선택</option>
					    <!-- JavaScript로 받아온 일 목록을 여기에 추가 -->
					</select>
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
