<%@page import="java.sql.SQLException"%>
<%@page import="admin.AdminReserveManageVO"%>
<%@page import="java.util.List"%>
<%@page import="admin.AdminReserveManageDAO"%>
<%@page import="admin.AdminUserManageDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info = "명화관 관리자 예매관리" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>명화관 관리자 페이지</title>
<link rel = "icon" href = "http://localhost/theater_prj/asd/favicon.ico">
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
<style type = "text/css">


.form-group {
    display: inline-block; /* 인라인 블록 요소로 설정하여 수평 정렬 */
    margin-right: 10px; /* 각 요소 간의 간격 */
}

.searchReserve {
    position: relative; /* 부모 요소인 contentWrap를 기준으로 위치 지정 */
    left: 0; /* 왼쪽으로 이동 */
}



	
</style>
<script type="text/javascript">
$(document).ready(function() {
	// 페이지 로드 시 년, 월, 일 값 설정
    var now = new Date();
    var year = now.getFullYear();
    var month = (now.getMonth() + 1).toString().padStart(2, '0');
    var day = now.getDate().toString().padStart(2, '0');

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
        option.value = j.toString().padStart(2, '0');
        if (j === parseInt(month)) {
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
        dayDropdown.innerHTML = "";

        for (var k = 1; k <= lastDay; k++) {
            var option = document.createElement("option");
            option.text = k.toString().padStart(2, '0');
            option.value = k.toString().padStart(2, '0');
            if (k === parseInt(day)) {
                option.selected = true;
            }
            dayDropdown.add(option);
        }
    }

    updateDays(); // 초기화
    yearDropdown.addEventListener("change", updateDays);
    monthDropdown.addEventListener("change", updateDays);

    // 검색 버튼 클릭 이벤트 핸들러
    $("#searchButton").click(function() {
        var param = {
        		theater: $("#theaterDropdown").val(),
        		screeningRoom: $("#screeningRoomDropdown").val(),
                year: $("#yearDropdown").val(),
                month: $("#monthDropdown").val(),
                day: $("#dayDropdown").val(),
                reservationNumber : $("#reservationNumber").val()
                
                
        };
        alert(JSON.stringify(param));

        $.ajax({
            url: "reserveService.jsp",
            type: "get",
            data: param,
            dataType: "JSON",
            success: function(jsonArr) {
                // 검색 결과를 테이블에 반영
                updateTable(jsonArr);
                alert("searchButton:jsonArr response: " + JSON.stringify(jsonArr));
            },
            error: function(xhr) {
                alert(xhr.statusText);
            }
        });
    });
    
    //$("#contentBoard").on("click", "tr", clickTable);
});
</script>



</head>
<body id="page-top">
    <!-- Page Wrapper -->
    <div id="wrapper">

        <%@ include file = "sidebar.jsp" %>

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

               <%@ include file = "topbar.jsp" %>

                <!-- Begin Page Content -->
                <div class="container-fluid">
	                <!-- Page Heading -->
	                <div class="d-sm-flex align-items-center justify-content-between mb-4">
	                    <h1 class="h3 mb-0 text-gray-800">예매관리</h1>
	                </div>
				</div>
                <!-- /.container-fluid -->
                
				    <div id="contentWrap" class="contentWrap">
				    <!-- 검색 폼 -->
					<form id="reserveDropDown" method="post"
						action="reserveService.jsp">
						<button id="registerButton" class="btn btn-danger float-right" style="margin-right: 10px;">삭제</button>
						<!-- 드롭다운 매뉴들, inputText와 button을 감싸는 div -->
						<div class="searchReserve">
							<!-- 지점 드롭다운 메뉴 -->
							<div class="form-group">
								<select class="form-select" id="theaterDropdown" name="theater">
									<option value="강남점">강남점</option>
									<option value="역삼점">역삼점</option>
									<option value="동대구역점">동대구역점</option>
									<!-- JavaScript로 받아온 지점 목록을 여기에 추가 -->
								</select>
							</div>

							<!-- 상영관 드롭다운 메뉴 -->
							<div class="form-group">
								<select class="form-select" id="screeningRoomDropdown"
									name="screeningRoom">
									<option value="1관">1관</option>
									<option value="2관">2관</option>
									<option value="3관">3관</option>
									<!-- JavaScript로 받아온 상영관 목록을 여기에 추가 -->
								</select>
							</div>

							<!-- 년, 월, 일 드롭다운 메뉴 -->
							<div class="form-group">
							<span style="display: flex; align-items: center;">
								<select class="form-select" id="yearDropdown" name="year" style="margin-right: 5px;"></select>
								년
							</span>
							</div>
							<div class="form-group">
							<span style="display: flex; align-items: center;">
								<select class="form-select" id="monthDropdown" name="month" style="margin-right: 5px;"></select>
								월
							</span>
							</div>
							<div class="form-group">
							<span style="display: flex; align-items: center;">
								<select class="form-select" id="dayDropdown" name="day" style="margin-right: 5px;"></select>
								일
							</span>
							</div>

							<!-- 예매번호 검색 텍스트 -->
							<div class="form-group">
								<input type="text" class="form-control" id="reservationNumber"
									name="reservationNumber" value="${param.reservationNumber}"
									placeholder="예매번호 입력" />
							</div>

							<div class="form-group">
								<button type="button" id="searchButton" class="btn btn-primary">검색</button>
							</div>
						</div>

					</form>


					<table class="table table-striped">
						<thead>
							<tr>
								<th></th>
								<!-- 체크박스를 포함할 열 추가 -->
								<th>예매번호</th>
								<th>회원 아이디</th>
								<th>영화명</th>
								<th>지점</th>
								<th>상영관</th>
								<th>관람일/시간</th>
								<th>상영관/좌석</th>
								<th>총인원</th>
							</tr>
						</thead>
						<tbody id="contentBoard">
							<%
							try {
								AdminReserveManageDAO armDAO = AdminReserveManageDAO.getInstance();
								List<AdminReserveManageVO> reserveList = armDAO.selectAllReserve();
								for (AdminReserveManageVO reserve : reserveList) {
							%>
							<tr
								onClick="clickTable('<%=reserve.getReservationNumber()%>', '<%=reserve.getUserId()%>','<%=reserve.getMovieTitle()%>',
            					'<%=reserve.getTheaterName()%>', '<%=reserve.getTheaterNumber()%>', '<%=reserve.getScreeningDate() + ' ' + reserve.getScreeningTime()%>',
            					'<%=reserve.getSeatNumber()%>', '<%=reserve.getTotalPeopleNumber()%>')">
								<td>
									<div class="form-check" style="margin-left: 15px;">
										<input type="checkbox" class="form-check-input" style="width: 20px; height: 20px;" 
											name="reserveCheckbox" value="<%=reserve.getReservationNumber()%>">
									</div></td>
								<!-- 체크박스 열 -->
								<td><%=reserve.getReservationNumber()%></td>
								<td><%=reserve.getUserId()%></td>
								<td><%=reserve.getMovieTitle()%></td>
								<td><%=reserve.getTheaterName()%></td>
								<td><%=reserve.getTheaterNumber()%></td>
								<td><%=reserve.getScreeningDate() + ' ' + reserve.getScreeningTime()%></td>
								<td><%=reserve.getSeatNumber()%></td>
								<td><%=reserve.getTotalPeopleNumber()%></td>
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
            <!-- End of Main Content -->

            <%@ include file = "footer.jsp" %>

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