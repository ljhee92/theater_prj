<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info="명화관 관리자 영화관리"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>명화관 관리자 페이지</title>
<link rel="icon" href="http://localhost/movie_admin/favicon.ico">
<!--bootstrap 시작-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<!--bootstrap 끝-->
<!--jQuery CDN 시작-->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!--jQuery CDN 끝-->
<!-- Custom fonts for this template-->
<link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<!-- Custom styles for this template-->
<link href="../css/sb-admin-2.css" rel="stylesheet">
<style type="text/css">
.theater {
	display: flex;
	justify-content: center;
	flex-direction: column;
	align-items: center;
	height: 800px; /* 원하는 높이 설정 */
}

.screen-container {
	display: flex;
	justify-content: center;
	height: 100px; /* 원하는 높이 설정 */
}

.empty-container {
    display: flex;
    justify-content: flex-end; /* 우측 정렬 */
    height: 200px; /* 원하는 높이 설정 */
}

.viewSeat {
	display: flex;
	justify-content: center;
	height: 200px; /* 원하는 높이 설정 */
}

.seat-container {
	position: relative; /* 좌석 컨테이너를 상대적으로 위치시킴 */
	width: 600px; /* 좌석 컨테이너의 너비를 설정 (임의의 값) */
	height: 300px; /* 좌석 컨테이너의 높이를 설정 (임의의 값) */
}

.screen {
	background-color: gray;
	color: white; /* 흰색으로 설정 */
	width: 700px; /* 원하는 너비 설정 */
	height: 50px; /* 원하는 높이 설정 */
	padding: 13px; /* 원하는 내부 여백 설정 */
	border-radius: 10px; /* 원하는 모서리 둥글기 설정 */
	margin-top: 50px;
	text-align: center; /* 가운데 정렬 */
	font-weight: bold; /* 진하게 설정 */
}

.seat {
	width: 50px;
	height: 50px;
	margin: 10px;
	border: 1px solid black;
	cursor: pointer;
	position: absolute; /* 좌석을 절대적으로 위치시킴 */
}

.seat:nth-child(n+11) {
	top: 100px; /* 두 번째 줄 좌석의 위치를 조절 */
}

.second-row {
	margin-top: 20px; /* 두 번째 줄 좌석 위쪽 여백 추가 */
}

.selected {
	background-color: red; /* 선택된 좌석의 배경색을 빨간색으로 설정 */
}

#section1 {
	width: 300px; /* 원하는 너비 설정 */
	height: 70px; /* 원하는 높이 설정 */
	padding: 13px; /* 원하는 내부 여백 설정 */
	margin-left: 50px;
}

#section2 {
	width: 300px; /* 원하는 너비 설정 */
	height: 70px; /* 원하는 높이 설정 */
	padding: 13px; /* 원하는 내부 여백 설정 */
}

.row {
	display: flex;
	justify-content: space-between; /* 좌우 정렬 */
}




</style>

<script type="text/javascript">
	$(function() {
		// 좌석을 클릭할 때 색 변경
		$('.seat').click(function() {
			// 이전에 선택된 좌석의 색을 원래 색으로 되돌리기
			$('.selected').removeClass('selected');
			// 클릭된 좌석의 색 변경
			$(this).toggleClass('selected');
		});
	}); // ready
</script>
</head>
<body id="page-top">
	<!-- Page Wrapper -->
	<div id="wrapper">
		<%@ include file="sidebar.jsp"%>
		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<!-- Main Content -->
			<div id="content">
				<%@ include file="topbar.jsp"%>
				<!-- Begin Page Content -->
				<div class="container-fluid">
					<!-- Page Heading -->
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">상영관관리</h1>
					</div>
				</div>
				<!-- /.container-fluid -->
				<form action="">
					<div class="row">
						<div class="section" id="section1">
							<select name="theater">
								<option value="강남점">강남점</option>
								<option value="역삼점">역삼점</option>
							</select> <select name="theaterNum">
								<option value="1관">1관</option>
								<option value="2관">2관</option>
								<option value="3관">3관</option>
							</select>


							<button type="button" name="search"
								class="btn btn-secondary btn-sm">검색</button>
						</div>


						<div class="section" id="section2">
							<select name="option" style="width: 90px">
								<option value=0>선택가능</option>
								<option value=1>선택불가</option>
							</select>
							<button type="button" name="setOption"
								class="btn btn-secondary btn-sm">저장</button>
						</div>
					</div>

					<div class="theater">
						<div class="screen-container">

							<div class="screen">SCREEN</div>
						</div>




<div class="empty-container" style="justify-content: flex-end;">
    <div class="viewSeat" style="border: 1px solid black; padding: 10px;">
        <div style="margin-top: 10px;">
            <span>총좌석 : 20석</span><br>
            <div style="display: flex; align-items: center;">
                <div style="width: 20px; height: 20px; background-color: red; border: 1px solid black; margin-right: 5px;"></div>
                <span style="font-size: 16px;">선택좌석</span>
            </div>
            <div style="display: flex; align-items: center;">
                <div style="width: 20px; height: 20px; background-color: white; border: 1px solid black; margin-right: 5px;"></div>
                <span style="font-size: 16px;">선택가능 : 20석</span>
            </div>
            <div style="display: flex; align-items: center; margin-top: 5px;">
                <div style="width: 20px; height: 20px; background-color: gray; border: 1px solid black; margin-right: 5px;"></div>
                <span style="font-size: 16px;">선택불가능 : 0석</span>
            </div>
        </div>
    </div>
</div>

						<div class="seat-container">
							<!-- 첫 번째 줄 좌석 -->
							<%
							for (int i = 1; i <= 10; i++) {
							%>
							<div class="seat"
								style="left: <%=(i - 1) * 60%>px; text-align: center;">
								A<%=i%></div>
							<%
							}
							%>
							<!-- 두 번째 줄 좌석 -->
							<%
							for (int i = 11; i <= 20; i++) {
							%>
							<div class="seat second-row"
								style="left: <%=(i - 11) * 60%>px; text-align: center;">
								B<%=i - 10%></div>
							<%
							}
							%>
						</div>
					</div>
				</form>
			</div>

			<!-- End of Main Content -->
			<%@ include file="footer.jsp"%>
		</div>
		<!-- End of Content Wrapper -->
	</div>
	<!-- End of Page Wrapper -->
	<!-- Bootstrap core JavaScript-->
	<script src="../vendor/jquery/jquery.js"></script>
	<script src="../vendor/bootstrap/js/bootstrap.bundle.js"></script>
	<!-- Core plugin JavaScript-->
	<script src="../vendor/jquery-easing/jquery.easing.js"></script>
	<!-- Custom scripts for all pages-->
	<script src="../js/sb-admin-2.min.js"></script>
</body>
</html>