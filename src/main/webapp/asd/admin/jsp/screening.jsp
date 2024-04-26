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
								    <td><%= num %></td>
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
