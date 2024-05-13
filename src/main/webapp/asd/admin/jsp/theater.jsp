<%@page import="admin.DAO.TheaterDAO"%>
<%@page import="VO.TheaterVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info="명화관 관리자 영화관리"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>명화관 관리자 페이지</title>
<link rel="icon" href="http://localhost/theater_prj/asd/favicon.ico">
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
	background-color: red !important; /* 선택된 좌석의 배경색을 빨간색으로 설정 */
	color: white !important;
}

.unavailable {
	background-color: gray; /* 예약 불가능한 좌석을 회색으로 설정 */
	color: white; /* 텍스트 색상을 흰색으로 설정 */
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

#theaterName {
	width: 100px; /* 원하는 너비 설정 */
}

#theaterNum {
	width: 100px; /* 원하는 너비 설정 */
}
</style>

<script type="text/javascript">
	$(document).ready(function() {
		// 영화관 선택 시 이벤트 핸들러 등록
		$("select[name='theaterName']").change(searchTheaterNum);

		// 버튼 클릭 시 좌석 저장 함수 호출
		$('#saveButton').off('click').on('click', function() {
			checkSeat(); // 버튼을 클릭할 때마다 좌석 저장 함수 호출
		});

	});

	function searchTheaterNum() {
		var request = new XMLHttpRequest(); // request 변수를 선언

		request
				.open(
						"Post",
						"http://localhost/theater_prj/TheaterNumSearchServlet?theaterName="
								+ encodeURIComponent(document
										.querySelector("select[name='theaterName']").value),
						true);
		request.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded; charset=UTF-8");
		request.onreadystatechange = function() {
			if (request.readyState == 4 && request.status == 200) {
				// 응답을 받으면 searchProcess 함수 호출하여 처리
				searchTheater(request);
			}
		};
		request.send(null);

	}

	function searchTheater(request) {
		var theaterNum = document.getElementById("theaterNum");
		theaterNum.innerHTML = ""; // 이전 옵션 제거

		// 서버에서 받은 JSON 데이터 파싱
		var object = JSON.parse(request.responseText);
		var result = object.result;

		// 각 Theater 객체의 theaterNumber를 기반으로 옵션을 생성하여 추가
		for (var i = 0; i < result.length; i++) {
			var theaterNumber = result[i].value;

			// 새로운 옵션 생성
			var option = document.createElement("option");
			option.value = theaterNumber;
			option.text = theaterNumber;

			// 옵션을 <select> 요소에 추가
			theaterNum.appendChild(option);
		}
	}

	function searchTheaterSeat() {
		// 선택된 영화관과 상영관 정보 가져오기
		var selectedTheater = document.querySelector("select[name='theaterName']").value;

		var selectedTheaterNum = document.querySelector("select[name='theaterNum']").value;

		document.getElementById("name").value = document.querySelector("select[name='theaterName']").value;
		document.getElementById("number").value = document.querySelector("select[name='theaterNum']").value;

		// 선택된 영화관과 상영관 정보를 표시할 요소 선택
		var selectedTheaterElement = document.getElementById('selectedTheather');

		// 선택된 영화관과 상영관 정보 표시
		selectedTheaterElement.innerText = selectedTheater + ' '+ selectedTheaterNum + " 관리중";

		var request = new XMLHttpRequest(); // request 변수를 선언
		// alert(document.querySelector("select[name='theaterName'] ").value);

		request
				.open(
						"Post",
						"http://localhost/theater_prj/TheaterSeatsSearchServlet",true);
		request.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded; charset=UTF-8");
		request.onreadystatechange = function() {
			if (request.readyState == 4 && request.status == 200) {
				// 응답을 받으면 searchProcess 함수 호출하여 처리
				searchSeat(request);
			}
		};
		request.send("theaterName=" + encodeURIComponent(document.querySelector("select[name='theaterName']").value)
			+ "&theaterNum="+ encodeURIComponent(document.querySelector("select[name='theaterNum']").value));

	}

	function searchSeat(request) {
		// 좌석을 생성할 부모 요소를 가져옵니다.
		var seatContainer = document.querySelector(".seat-container");

		// 이전에 생성된 좌석을 모두 제거합니다.
		seatContainer.innerHTML = "";

		// JSON 데이터를 받아와서 좌석 생성
		var object = JSON.parse(request.responseText);

		var result = object.result;

		//console.log(result);

		var seatContainer = document.querySelector(".seat-container");

		// 첫 번째 줄 좌석 생성
		for (var i = 0; i <= 9; i++) {

			var seat = document.createElement("div");
			seat.className = "seat";
			seat.style.left = i * 60 + "px";
			seat.style.textAlign = "center";
			seat.innerText = "A" + (i + 1);

			if (result[i].ReservationStatus === "N") {
				seat.classList.add("unavailable");
			} else {
				seat.classList.add("available");
			}

			seatContainer.appendChild(seat);
		}

		// 두 번째 줄 좌석 생성
		for (var i = 10; i <= 19; i++) {
			var seat = document.createElement("div");
			seat.className = "seat second-row";
			seat.style.left = (i - 10) * 60 + "px";
			seat.style.textAlign = "center";
			seat.innerText = "B" + (i - 9);

			if (result[i].ReservationStatus === "N") {
				seat.classList.add("unavailable");
			} else {
				seat.classList.add("available");

			}
			seatContainer.appendChild(seat);
		}

		// 좌석을 클릭할 때 색 변경 이벤트 핸들러 등록
		$('.seat').off('click').on('click', function() {

			$(this).toggleClass('selected');
			$('.seat').not(this).removeClass('selected');

		});

		checkSeat();

	}

	function countSeatsByStatus(status) {
		return $('.seat.' + status).length; // 해당 상태 클래스가 적용된 좌석의 개수 반환
	}

	function checkSeat() {
		var totalSeatCount = countSeatsByStatus('seat'); // 사용 가능한 좌석 개수
		var availableSeatCount = countSeatsByStatus('available'); // 사용 가능한 좌석 개수
		var unavailableSeatCount = countSeatsByStatus('unavailable'); // 사용 불가능한 좌석 개수

		// 선택 가능한 좌석 수와 선택 불가능한 좌석 수를 HTML에 적용
		$('#totalSeat').text('총좌석 : ' + totalSeatCount + '석');
		$('#availableSeat').text('선택가능 : ' + availableSeatCount + '석');
		$('#unavailableSeat').text('선택불가능 : ' + unavailableSeatCount + '석');

	}

	function saveSeat() {//좌석상태 저장메서드

		// 선택된 좌석의 개수 확인
		var selectedSeats = $('.seat.selected');
		var theaterName = document.getElementById("name").value
		var theaterNumber = document.getElementById("number").value
		var setSeatStatus = document.querySelector("select[name='status']").value
		var selectedSeatStatus = '';

		// 선택된 좌석이 없는 경우 알림창 띄우기
		if (selectedSeats.length === 0) {
			alert('좌석을 선택해주세요.');
		} else {
			// 선택된 좌석이 있는 경우
			var seatInfo = '';
			// 선택된 좌석의 정보를 문자열에 추가
			selectedSeats.each(function(index) {
				seatInfo = $(this).text();
				// 선택된 좌석의 상태를 확인하여 selectedSeatStatus 변수에 할당
				if ($(this).hasClass('unavailable')) {
					selectedSeatStatus = "N";
				} else if ($(this).hasClass('available')) {
					selectedSeatStatus = "Y";
				}
			});
			// 선택된 좌석 정보를 알림창으로 출력
			alert('영화관명 : ' + theaterName + '\n' + '영화관 : ' + theaterNumber
					+ '\n' + '선택된 좌석 : ' + seatInfo + '\n' + '선택된 좌석의 상태 : '
					+ selectedSeatStatus + '\n' + '바꿀 좌석 상태 : ' + setSeatStatus);

			// 선택된 좌석의 상태와 적용할 좌석 상태가 동일한지 확인
			if (selectedSeatStatus === setSeatStatus) {
				alert("적용되어있는 좌석의 상태와 적용할 좌석 상태가 동일합니다.");
				return;
			}

			
			var request = new XMLHttpRequest(); // request 변수를 선언

			request
					.open(
							"POST",
							"http://localhost/theater_prj/UpdateSeatStatusServlet",
							true);
			request.setRequestHeader("Content-Type",
					"application/x-www-form-urlencoded; charset=UTF-8");

			// 에러 핸들링
			request.onerror = function() {
				alert("요청을 보낼 때 오류가 발생했습니다.");
			};

			request.onreadystatechange = function() {
				if (request.readyState == 4) {
					if (request.status == 200) {
						// 응답을 받으면 처리
						alert("성공적으로 상태가 변경되었습니다.");
						searchTheaterSeat();
					} else {
						alert("문제가 발생했습니다.");
					}
				}
			};

			// POST 요청의 파라미터를 설정하여 보냄
			request.send("theaterName=" + encodeURIComponent(theaterName)
					+ "&theaterNumber=" + encodeURIComponent(theaterNumber)
					+ "&seatInfo=" + encodeURIComponent(seatInfo)
					+ "&setSeatStatus=" + encodeURIComponent(setSeatStatus));

			

		}//checkSeat();

	}//saveSeat
</script>
</head>
<body id="page-top">
	<!-- S 로그인 세션 확인  -->
	<%
	// 세션에서 로그인 여부 확인
	String id = (String) session.getAttribute("adminId");
	if (id == null) {// 로그인되지 않은 경우 로그인 페이지로 리디렉션
	%>
	<script type="text/javascript">
    window.location.href = "login.jsp?prevPage=theater.jsp";
    </script>
	<%
	}
	%>
	<!-- E 로그인 세션 확인  -->




	<%
	TheaterDAO tDAO = TheaterDAO.getInstance(); //DAO호출

	List<TheaterVO> tVONameList = tDAO.selectTheaterName();//상영관지점명이 담긴 리스트 

	String theaterName = tVONameList.get(0).getTheaterName();//첫번째옵션의 상영관지점명

	List<TheaterVO> tVONumList = tDAO.selectTheaterNum(theaterName); //첫번째옵션의 상영관지점명에 대한 상영관 리스트
	%>






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
				<form>
					<div class="row">
						<div class="section" id="section1">
							<select name="theaterName" id="theaterName">
								<%
								for (TheaterVO theater : tVONameList) {
								%>
								<option value="<%=theater.getTheaterName()%>"><%=theater.getTheaterName()%></option>
								<%
								}
								%>
							</select> <select name="theaterNum" id="theaterNum">
								<%
								for (TheaterVO theater : tVONumList) {
								%>
								<option value="<%=theater.getTheaterNumber()%>"><%=theater.getTheaterNumber()%></option>
								<%
								}
								%>
							</select>


							<button type="button" name="search"
								class="btn btn-secondary btn-sm" onclick="searchTheaterSeat()">검색</button>

							<div class="selectedTheather" id='selectedTheather'></div>
						</div>


						<div class="section" id="section2">
							<select name="status" style="width: 90px">
								<option value="Y">선택가능</option>
								<option value="N">선택불가</option>
							</select>
							<button type="button" name="setOption"
								class="btn btn-secondary btn-sm" onclick="saveSeat()">저장</button>
						</div>
					</div>

					<div class="theater">
						<div class="screen-container">

							<div class="screen">SCREEN</div>
						</div>




						<div class="empty-container" style="justify-content: flex-end;">
							<div class="viewSeat"
								style="border: 1px solid black; padding: 10px;">
								<div style="margin-top: 10px;">
									<span id="totalSeat">총좌석 : 석</span><br>
									<div style="display: flex; align-items: center;">
										<div
											style="width: 20px; height: 20px; background-color: red; border: 1px solid black; margin-right: 5px;"></div>
										<span style="font-size: 16px;">선택좌석</span>
									</div>
									<div style="display: flex; align-items: center;">
										<div
											style="width: 20px; height: 20px; background-color: white; border: 1px solid black; margin-right: 5px;"></div>
										<span id="availableSeat" style="font-size: 16px;">선택가능
											: 석</span>
									</div>
									<div
										style="display: flex; align-items: center; margin-top: 5px;">
										<div
											style="width: 20px; height: 20px; background-color: gray; border: 1px solid black; margin-right: 5px;"></div>
										<span id="unavailableSeat" style="font-size: 16px;">선택불가능
											: 석</span>
									</div>
								</div>
							</div>
						</div>





						<div class="seat-container"></div>




						<input type="hidden" id="name" value="" /> <input type="hidden"
							id="number" value="" />







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