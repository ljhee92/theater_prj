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
    
    $("#cancelButton").click(function() {
    	
    if( confirm("취소하시겠습니까?")){
    $("#cancelForm").submit();
    	
    }
      //  $("#reserveDropDown").submit(); // 폼 제출
    });
    
    $(function() {

    }); // ready
    
    function searchReserve() {
        var theater = document.getElementById("theaterDropdown").value;
        var screeningRoom = document.getElementById("screeningRoomDropdown").value;
        var year = document.getElementById("yearDropdown").value;
        var month = document.getElementById("monthDropdown").value;
        var day = document.getElementById("dayDropdown").value;
        var reservationNumber = document.getElementById("reservationNumber").value.trim();
        
        // screeningRoomDropdown의 값이 '전체'이거나 reservationNumber가 비어있는 경우
        if (screeningRoom === '전체' || reservationNumber === '') {
            // 알림 창 표시
            alert("모든 값을 선택 또는 입력하세요.");
            return; // 함수 종료
        }

        var tableRows = document.querySelectorAll("#contentBoard tr");

        tableRows.forEach(function(row) {
            var rowScreeningRoom = row.querySelector("td:nth-child(6)").textContent.trim(); // 상영관 열의 값
            var rowReservationNumber = row.querySelector("td:nth-child(2)").textContent.trim(); // 예매번호 열의 값

            // screeningRoom이 '전체'이거나 입력된 값과 일치할 경우 또는 reservationNumber가 입력되지 않았을 경우
            if ((screeningRoom === '전체' || rowScreeningRoom === screeningRoom) &&
                (reservationNumber === '' || rowReservationNumber === reservationNumber)) {
                row.style.display = ""; // 해당 행을 보여줌
            } else {
                row.style.display = "none"; // 해당 행을 숨김
            }
        });

        // 날짜 문자열을 YYYYMMDD 형식으로 조합
        var dateString = year + month + day;

        // 검색 폼 제출
        var form = document.getElementById("reserveDropDown");
        form.submit();
    }
    

    updateDays(); // 초기화
    yearDropdown.addEventListener("change", updateDays);
    monthDropdown.addEventListener("change", updateDays);
});
</script>

</head>
<body id="page-top">
<%request.setCharacterEncoding("UTF-8"); %>
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
					<form id="reserveDropDown" method="post" action="reserveDetail.jsp" accept-charset="UTF-8">
    <!--  <button type="button" id="cancelButton" class="btn btn-danger float-right" name="cancelButton" style="margin-right: 10px;">취소</button>-->
    <!-- 드롭다운 매뉴들, inputText와 button을 감싸는 div -->
    <div class="searchReserve">
        <!-- 지점 드롭다운 메뉴 -->
        <div class="form-group">
            <select class="form-select" id="theaterDropdown" name="theaterDropdown"> <!-- 수정 -->
                <option value="강남점">강남점</option>
                <option value="역삼점">역삼점</option>
                <option value="동대구역점">동대구역점</option>
                <!-- JavaScript로 받아온 지점 목록을 여기에 추가 -->
            </select>
        </div>

        <!-- 상영관 드롭다운 메뉴 -->
        <div class="form-group">
            <select class="form-select" id="screeningRoomDropdown" name="screeningRoomDropdown"> <!-- 수정 -->
                <option value="전체">전체</option>
                <option value="1관">1관</option>
                <option value="2관">2관</option>
                <option value="3관">3관</option>
                <!-- JavaScript로 받아온 상영관 목록을 여기에 추가 -->
            </select>
        </div>

        <!-- 년, 월, 일 드롭다운 메뉴 -->
        <div class="form-group">
            <span style="display: flex; align-items: center;">
                <select class="form-select" id="yearDropdown" name="yearDropdown" style="margin-right: 5px;"></select> <!-- 수정 -->
                년
            </span>
        </div>
        <div class="form-group">
            <span style="display: flex; align-items: center;">
                <select class="form-select" id="monthDropdown" name="monthDropdown" style="margin-right: 5px;"></select> <!-- 수정 -->
                월
            </span>
        </div>
        <div class="form-group">
            <span style="display: flex; align-items: center;">
                <select class="form-select" id="dayDropdown" name="dayDropdown" style="margin-right: 5px;"></select> <!-- 수정 -->
                일
            </span>
        </div>

        <!-- 예매번호 검색 텍스트 -->
        <div class="form-group">
        </div>

        <div class="form-group">
            <button type="submit" id="searchButton" name="searchButton" class="btn btn-primary" onclick="searchReserve()">검색</button>
        </div>
    </div>
</form>


					<form id="cancelForm" method="post" action="reserveDeleteProcess.jsp">
<!-- 					<button id="cancelButton" class="btn btn-danger float-right" name="cancelButton" style="margin-right: 10px;">취소</button> -->
					<input type="button" id="cancelButton" class="btn btn-danger float-right"  value="취소" name="cancelButton" style="margin-right: 10px;">
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
									List<AdminReserveManageVO> reserveList;

									String reservationNumber = request.getParameter("reservationNumber");
									String theater = request.getParameter("theaterDropdown"); // HTML 폼에서 선택한 이름으로 수정
									String screeningRoom = request.getParameter("screeningRoomDropdown"); // HTML 폼에서 선택한 이름으로 수정
									String dateString = request.getParameter("yearDropdown") + request.getParameter("monthDropdown")
									+ request.getParameter("dayDropdown");

									// reservationNumber가 있을 경우 해당 예약 검색, 없을 경우 모든 예약 검색
									if (reservationNumber != null && !reservationNumber.isEmpty()) {
										reserveList = armDAO.searchReserve(theater, screeningRoom, dateString, reservationNumber.trim());
										System.out.println(theater);
										System.out.println(screeningRoom);
										System.out.println(dateString);
										System.out.println(reservationNumber.trim());
									} else {
										// 상영관이 '전체'인 경우와 아닌 경우를 나눠서 처리
										if ("전체".equals(screeningRoom)) {
									// Case 2: screeningRoom이 '전체'인 경우
									reserveList = armDAO.searchReserve2(theater, dateString, null); // reserveNum 파라미터 추가하여 전달
										} else {
									// Case 4: screeningRoom이 '전체'가 아니고 reservationNumber가 없는 경우
									reserveList = armDAO.searchReserve4(theater, screeningRoom, dateString);
										}
									}

									for (AdminReserveManageVO reserve : reserveList) {
								%>
								<tr>
									<td>
										<div class="form-check" style="margin-left: 15px;">
											<input type="checkbox" class="form-check-input"
												style="width: 20px; height: 20px;" name="reservationNumber"
												value="<%=reserve.getReservationNumber()%>">
										</div>
									</td>
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
					</form>
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