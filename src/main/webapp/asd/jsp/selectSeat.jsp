<%@page import="user.VO.UserSeatVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="VO.SeatVO"%>
<%@page import="java.util.List"%>
<%@page import="user.DAO.ReservingDAO"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info="좌석 선택 페이지" trimDirectiveWhitespaces="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta http-equiv="Expires" content="-1" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Cache-Control" content="No-Cache" />
<meta http-equiv="imagetoolbar" content="no" />
<meta name="viewport" content="width=1024" />

<link rel="shortcut icon" href="../favicon.ico" type="image/x-icon" />
<title id="ctl00_headerTitle">예매 | 명화 그 이상의 감동. 띵화관</title>

<link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/webfont.css" />
<link rel="stylesheet" media="all" type="text/css" href="../css/reset.css" />
<link rel="stylesheet" media="all" type="text/css" href="../css/layout.css" />
<link rel="stylesheet" media="all" type="text/css" href="../css/module.css" />
<link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/content.css" />
<link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/common.css" />

<link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/eggupdate.css" />
<link rel="stylesheet" media="print" type="text/css" href="https://img.cgv.co.kr/R2014/css/print.css" />
<link rel="stylesheet" type="text/css" href="https://img.cgv.co.kr/R2014/js/jquery.ui/smoothness/jquery-ui-1.10.4.custom.min.css" />
<link rel="stylesheet" href="http://img.cgv.co.kr/CGV_RIA/Ticket/Common/css/2024/0325/FORM_TYPE/reservation_tnb.css">

<script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/app.config.js"></script>
<script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery.plugin/jquery.tmpl.min.js"></script>
<script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery.plugin/jquery.validate.js"></script>
<script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery.plugin/jquery.paging.min.js"></script>
<script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery.ui/jquery-ui-1.10.4.custom.min.js"></script>
<script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery.utils.js"></script>
<script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/app.utils.js"></script>
<script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery.utils.pageing.js"></script>
<script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/app.init.js"></script>

<script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery.plugin/jquery.dotdotdot.min.js"></script>
<script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/silverlight_link.js"></script>
<script src="https://img.cgv.co.kr/R2014/js/slick/slick.js" type="text/javascript" charset="utf-8"></script>

<link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/phototicket/phototicket.css" />
<link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/slick.css" />
<link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/slick-theme-custom.css" />

<script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/icheck/login.timer.js"></script>
<script src="https://img.cgv.co.kr/R2014/js/icheck/icheck.min.js" type="text/javascript" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="https://img.cgv.co.kr/R2014/js/icheck/iCheck.css" />

<!-- 홈페이지 CSS 일원화로 인한 반영 20220721 -->
<link rel="stylesheet" type="text/css" href="https://img.cgv.co.kr/resource_pc/css/cgv.min.css" />
<script type="text/javascript" src="https://img.cgv.co.kr/resource_pc/js/cgvUi.js"></script>

<!-- 각페이지 Header Start-->
<script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/swiper.min.js"></script>
<link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/swiper-bundle.min.css" />

<!-- 예매 CSS, JS -->
<link href="https://www.cineq.co.kr/bundles/css?v=oiZxrFB4-kROndwe9FLU4L2IiIJAaPO8AdRMkkO1wbE1" rel="stylesheet">
<script src="https://www.cineq.co.kr/bundles/script?v=BivSx9O848D5V0Qog32Mgvmnh92IWQV9phYbkYbZeJg1"></script>
<!-- 예매 CSS, JS -->

<!-- S 로그인 세션 확인  -->
<%
// 세션에서 로그인 여부 확인
String id = (String)session.getAttribute("id");
if (id == null) {// 로그인되지 않은 경우 로그인 페이지로 리디렉션
%>
<script type="text/javascript">
window.location.href = "login.jsp?prevPage=ticket.jsp"; // 로그인하지 않고 직접 접근했을 경우 예매 첫 페이지로 이동
</script>  
<%}%>
<!-- E 로그인 세션 확인  -->

<style type="text/css">
.table-movie-info > tbody > tr > td {
	width: 175px;
}
</style>

<script type="text/javascript">
	$(function() {
		// hidden에 저장한 예약된 좌석 배열 얻기
		var rvsArray = $(".rvs-hidden").map(function() {
		    return this.value;
		}).get();
		
		// 좌석의 id값이 예약된 좌석 배열의 값과 같다면 disabled 클래스 추가
		$(".choose-seat").each(function() {
		    var id = $(this).attr("id");
		    for (var i = 0; i < rvsArray.length; i++) {
		        if (id === rvsArray[i]) {
		        	$(this).addClass("disabled");
		            break;
		        } // end id
		    } // end for
		});
		
		// 인원 선택이 변경되면
		$(".input-select").change(function(){
			var selectedPerson = $(".input-select").val();
			var checkedSeat = $("input[type='checkbox']:checked").length;
			var price = (10000*selectedPerson).toLocaleString('ko-KR');
			
			// 변경한 선택 옵션이 선택한 좌석 수보다 적을 때
			if(selectedPerson < checkedSeat) {
				alert("선택한 좌석보다 인원수가 적습니다.");
				$(".input-select").val(checkedSeat);
				return;
			} // end if
			
			// 왼쪽 하단 인원, 가격, 오른쪽 하단 선택 인원(오른쪽만) 변경
			if(selectedPerson == 0) {
				$(".table-movie-info .number").text("");
				$(".total-price .price").text("0");
				$(".right .number-want").text("0");
			} else {
				$(".table-movie-info .number").text(selectedPerson+"명");
				$(".total-price .price").text(price);
				$(".right .number-want").text(selectedPerson);
			} // end else
		});
		
		// disabled 좌석을 클릭한다면 아무런 변화 없이 체크만 해제
		$(".choose-seat.disabled").click(function() {
			$(this).prop("checked", false);
		})
		
		// disabled가 아닌 좌석을 클릭한다면
		$(".choose-seat:not(.disabled)").click(function() {
			var selectedPerson = $(".input-select").val();
			
			// 인원 선택 전이라면
			if(selectedPerson == 0) {
				alert("상단에서 인원을 선택해주세요.");
				$(this).prop("checked", false);
				return;
			} // end if

			// 선택한 인원 수보다 좌석을 많이 선택한다면
			if($("input[type='checkbox']:checked").length > selectedPerson) {
				alert("선택한 인원수보다 좌석을 많이 선택하셨습니다.");
				$(this).prop("checked", false);
				return;
			} // end if
			
			// 선택한 좌석 수대로 오른쪽 하단 인원(왼쪽) 변경
			$(".right .number-chosen").text($("input[type='checkbox']:checked").length);
		})
		
		// 체크박스 상태가 변경될 때 왼쪽 하단 좌석 변경
		$("input[type='checkbox'].choose-seat").change(function() {
		    var seatValue = $(this).val();
		    
		    // 체크될 때
		    if ($(this).is(":checked")) {
		        $(".table-movie-info .seats").append(seatValue + " ");
		    } else {
		        $(".table-movie-info .seats").text(function(index, text) {
		            return text.replace(seatValue + " ", "");
		        });
		    } // end else
		});
		
		// 다시선택 버튼 클릭 시
		$(".right .btn-reset-seats").click(function() {
			$("input[type='checkbox']").each(function() {
				$(this).prop("checked", false);
				$(".right .number-chosen").text("0");
				$(".table-movie-info .seats").text("");
			})
		})
		
		// 다음 버튼 클릭 시
		$(".btn-rsv-next2").click(function() {
			var selectedPerson = $(".input-select").val();
			var checkedSeat = $("input[type='checkbox']:checked").length;
			
			if(selectedPerson > checkedSeat) {
				alert("좌석선택을 완료해주세요.");
				return;
			} // end if
			
			var screeningDate = $(".popup").data("screeningdate");
			var theaterName = $(".popup").data("theatername");
			var theaterNumber = $(".popup").data("theaternumber");
			var movieCode = $(".popup").data("moviecode");
			var movieTitle = $(".popup").data("movietitle");
			var movieRate = $(".popup").data("movierate");
			var screeningCode = $(".popup").data("screeningcode");
			var screeningTime = $(".popup").data("screeningtime");
			var checkedSeats = $(".seats").text().trim().split(" ").join(" "); // 선택한 좌석이 많으면 배열이 됨
			var totalPrice = $(".price").text();
			console.log(checkedSeats);
			
			// 다음 페이지 파라미터로 넘길 값들 JSON으로 변경 
 		    var params = {
 		    		screeningDate: screeningDate,
 		    		theaterName: theaterName,
 		    		theaterNumber: theaterNumber,
 		    		movieCode: movieCode,
 		    		movieTitle: movieTitle,
 		    		movieRate: movieRate,
 		    		screeningCode: screeningCode,
 		    		screeningTime: screeningTime,
 		    		selectedPerson: selectedPerson,
 		    		checkedSeats: checkedSeats,
 		    		price: totalPrice
 		    }
 		    
 		   	var form = document.createElement('form');        //form엘리먼트 생성
 		    
 		    form.setAttribute('method', 'post');              //POST 메서드 적용
 		    form.setAttribute('action', "payment.jsp");	      //데이터를 전송할 url
 		    document.charset = "utf-8";                       //인코딩
 		    
 		    for (var key in params) {	// key, value로 이루어진 객체 params
 		        var hiddenField = document.createElement('input');
 		        hiddenField.setAttribute('type', 'hidden'); //값 입력
 		        hiddenField.setAttribute('name', key);
 		        hiddenField.setAttribute('value', params[key]);
 		        form.appendChild(hiddenField);
 		    } // end for
 		    
 		    document.body.appendChild(form);
 		    form.submit();	// 전송
		})
	}); // ready
</script>

</head>
<body class="">
<%
	request.setCharacterEncoding("UTF-8");
	
	// 파라미터로 넘어온 JSON Parsing
	Map<String, String[]> requestParams = request.getParameterMap();
	Map<String, String> params = new HashMap<>();
	
	for(String key : requestParams.keySet()) {
		//System.out.println("======================= "+key+":"+request.getParameter(key));
		params.put(key, request.getParameter(key));
	} // end for
	
	// 날짜 형식 변환
	String inputDateStr = params.get("screeningDate");
	SimpleDateFormat inputSdf = new SimpleDateFormat("yyyyMMdd");
	SimpleDateFormat outputSdf = new SimpleDateFormat("yyyy-MM-dd");
	
	try{
		Date inputDate = inputSdf.parse(inputDateStr);
		String outputDate = outputSdf.format(inputDate);
		
		ReservingDAO rsDAO = ReservingDAO.getInstance();

		// 선택한 영화관의 좌석 가져오기
		List<UserSeatVO> seatsInfo = rsDAO.selectSeat(params.get("theaterName"), params.get("theaterNumber"));
		
		// 좌석 열 중복 제거
		List<String> seatLowNumbers = new ArrayList<String>();
		for(UserSeatVO sVO : seatsInfo) {
			seatLowNumbers.add(sVO.getSeatLowNumber());
		} // end for
		Set<String> set = new HashSet<>(seatLowNumbers);
		List<String> lowsList = new ArrayList<>(set);
				
		// 예약된 좌석 가져오기
		List<UserSeatVO> reservatedSeats 
		= rsDAO.selectReservatedSeats(params.get("screeningCode"), params.get("theaterName"), params.get("theaterNumber"));
	
		request.setAttribute("params", params);
		request.setAttribute("outputDate", outputDate);
		request.setAttribute("seatsInfo", seatsInfo);
		request.setAttribute("lowsList", lowsList);
		request.setAttribute("reservatedSeats", reservatedSeats);
%>
	<div id="wrap">
		<!-- S Header -->
		<jsp:include page="header.jsp"></jsp:include>
		<!-- E Header -->
		
		<jsp:useBean id="usVO" class="user.VO.UserSeatVO" scope="page"/>
		<jsp:setProperty property="*" name="usVO"/>
		
		<jsp:useBean id="rvsVO" class="user.VO.UserSeatVO" scope="page"/>
		<jsp:setProperty property="*" name="rvsVO"/>
		
		<!-- Contaniner -->
		<div id="container" class>
			<!-- Contents Area -->
			<div id="contents" class style="padding-bottom: 0px;">
				<!-- Contents Start -->

				<!-- 좌석 선택 본문 -->
				<div class="popup seatChoice" data-theatername="${ params['theaterName'] }" data-theaternumber="${ params['theaterNumber'] }"
					data-moviecode="${ params['movieCode'] }" data-movietitle="${ paramas['movieTitle'] }" data-movierate="${ params['movieRate'] }"
					data-screeningdate="${ params['screeningDate'] }" data-screeningtime="${ params['screeningTime'] }"
					data-screeningcode="${ params['screeningCode'] }">
					<div class="section-pop-top">
						<h3 class="title">인원/좌석선택</h3>
						<a href="ticket.jsp" class="btn-rsv-reset" onclick="confirm('모든 선택정보가 사라집니다. 계속하시겠습니까?');">다시 예매</a>
					</div>

					<div class="section-pop-movie">
						<img src="../images/movie/${ params['movieCode'] }.jpg" class="poster" alt="포스터">

						<div class="title" style="white-space:normal; overflow:visible; margin:15px 20px 5px 20px;">
							<span class="rate-${fn:toLowerCase(params['movieRate'] == '18' ? 'x' : params['movieRate'])}">${ params['movieRate'] }</span>${ params['movieTitle'] }
						</div>
						<table class="table-movie-info" style="margin-left:15px; margin-top:20px; width:auto;">
							<tbody>
								<tr>
									<th>영화관</th>
									<td>${ params['theaterName'] }</td>
								</tr>
								<tr>
									<th>상영관</th>
									<td>${ params['theaterNumber'] }</td>
								</tr>
								<tr>
									<th>날짜</th>
									<td>${ outputDate }</td>
								</tr>
								<tr>
									<th>시간</th>
									<td class="time">${ params['screeningTime'] }</td>
								</tr>
								<tr>
									<th>인원</th>
									<td class="number"></td>
								</tr>
								<tr>
									<th>좌석</th>
									<td class="seats" style="white-space:normal;"></td>
								</tr>
							</tbody>
						</table>

						<span class="total-price"><span class="price">0</span> 원</span>

					</div>
					<!--.section-pop-movie-->

					<div class="section-pop-theater">
						<div class="wrap-number-info">
							<span class="kind">인원</span>
							<select class="input-select">
								<c:forEach var="person" begin="0" end="8" step="1">
								<option value="${ person }">${ person }명</option>
								</c:forEach>
							</select>
						</div>
						<!--.number-info-->

						<div class="wrap-seats">
							<div class="title-head">
								<span class="title-time" style="width:300px;">${ params['screeningTime'] }</span>
							</div>

							<div class="note">
								안내
								<ul>
									<li><span class="selected"></span>선택좌석</li>
									<li><span class="normal"></span>선택가능</li>
									<li><span class="reserved"></span>예매완료</li>
									<li><span class="disabled"></span>선택불가</li>
								</ul>
							</div>

							<div class="map big seatmap">
								<span class="screen">SCREEN</span>
								
								<c:forEach var="rvsVO" items="${ reservatedSeats }">
								<input type="hidden" class="rvs-hidden" value="${ rvsVO.seatLowNumber }${ rvsVO.seatColNumber }">
								</c:forEach>
								
								<c:forEach var="row" items="${lowsList}">
								    <ul class="row" data-rowname="${row}">
							        <li class="head">${row}</li>
							        <c:forEach var="usVO" items="${seatsInfo}" varStatus="innerStatus">
							            <c:if test="${usVO.seatLowNumber eq row}">
							                <c:set var="disabled" value=""/>
							                <c:if test="${usVO.reservationStatus eq 'N'}">
							                    <c:set var="disabled" value="disabled"/>
							                </c:if>
							                <li>
						                    <input type="checkbox" class="choose-seat ${disabled}" id="${row}${usVO.seatColNumber}"
						                           value="${row}${usVO.seatColNumber}" data-rowname="${row}"
						                           data-colnumber="${usVO.seatColNumber}"">
						                    <label for="${row}${usVO.seatColNumber}" class="mini">${usVO.seatColNumber}</label>
							                </li>
							            </c:if>
							        </c:forEach>
								    </ul>
								</c:forEach>
							</div>

						</div>
						<!--.wrap-seats-->

						<div class="seats-control">
							<div class="right">
								<a href="#" class="btn-reset-seats">다시선택</a>
								<span class="status">선택인원 <span class="number-chosen">0</span>
									/ <span class="number-want">0</span>명
								</span>
							</div>
							<!--.right-->
						</div>
						<!--.seats-control-->
					</div>
					<!--.section-pop-theater-->

					<div class="section-pop-bottom">
						<div class="wrap-rsv-select">
							<a href="ticket.jsp" class="btn-rsv-cancel2" onclick="confirm('모든 선택정보가 사라집니다. 계속하시겠습니까?');">이전</a>
							<a href="#" class="btn-rsv-next2">다음</a>
						</div>
					</div>

					<!--/ Contents End -->
				</div>
				<!-- /Contents Area -->
			</div>
			<!-- E Contaniner -->

			<!-- S 예매하기 및 TOP Fixed 버튼 -->
			<div class="fixedBtn_wrap">

				<a href="#none" class="btn_gotoTop"><img
					src="https://img.cgv.co.kr/R2014/images/common/btn/gotoTop.png"
					alt="최상단으로 이동" /></a>
			</div>
			<!-- E 예매하기 및 TOP Fixed 버튼 -->

			<!-- S footer_area -->
			<jsp:include page="footer.jsp"></jsp:include>
			<!-- E footer_area -->
		</div>
<%
	} catch(Exception e) {
		out.println("에러 발생. 담당자에게 문의해주세요.");
		e.printStackTrace();
	}
%>
</body>
</html>