<%@page import="java.util.ArrayList"%>
<%@page import="user.VO.ReservingVO"%>
<%@page import="java.util.List"%>
<%@page import="user.DAO.ReservingDAO"%>
<%@page import="java.util.Locale"%>
<%@page import="java.time.format.TextStyle"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info="예매 첫 페이지" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
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
<!-- <link rel="stylesheet" media="all" type="text/css" href="../css/reset.css" /> -->
<link rel="stylesheet" media="all" type="text/css" href="../css/layout.css" />
<link rel="stylesheet" media="all" type="text/css" href="../css/module.css" />
<link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/content.css" />
<link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/common.css" />

<link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/eggupdate.css" />
<link rel="stylesheet" media="print" type="text/css" href="https://img.cgv.co.kr/R2014/css/print.css" />
<link rel="stylesheet" type="text/css" href="https://img.cgv.co.kr/R2014/js/jquery.ui/smoothness/jquery-ui-1.10.4.custom.min.css" />
<link rel="stylesheet" href="http://img.cgv.co.kr/CGV_RIA/Ticket/Common/css/2024/0325/FORM_TYPE/reservation_tnb.css">

<!-- <script type="text/javascript" src="/common/js/extraTheaters.js"></script> -->
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

<style type="text/css">
.section-pop-left .wrap-theater .list-movie-name input.p-movie-check:checked ~ .check {
	background: #f9f9f9;
}

input[type="radio"] {
  box-sizing: border-box; /* 1 */
  padding: 0; /* 2 */
  opacity: 0;
}
</style>

<!-- S 로그인 세션 확인  -->
<%
// 세션에서 로그인 여부 확인
String id = (String)session.getAttribute("id");
if (id == null) {// 로그인되지 않은 경우 로그인 페이지로 리디렉션
%>
<script type="text/javascript">
alert("예매는 로그인 후 가능합니다.");
window.location.href = "login.jsp?prevPage=ticket.jsp";
</script>  
<%
  }
  %>
<!-- E 로그인 세션 확인  -->

<script type="text/javascript">
	function resetMovieList() {
		$("#movieList > li").remove();
		$("#movieList > p").remove();
		$("#movieList").append($("<p>").text("날짜와 영화관을 선택하면 영화가 나옵니다.").css({"color":"#7d7d7d", "text-align":"center", "margin-top":"30%"}));
	} // resetMovieList

	function resetMovieTime() {
		$(".wrap-timetable > .title").remove();
		$(".wrap-timetable > .theater-info").remove();
		$(".wrap-timetable > .time").remove();
		$(".wrap-timetable > p").remove();
		$(".wrap-timetable").append($("<p>").text("영화관과 영화를 선택하면 시간표가 나옵니다.").addClass("ready"));
	} // resetMovieTime

	// 현재 날짜 이후에 상영 중인 상영일자 구하기
	function searchScreeningDate(formattedDate1) {
		$.ajax({
			type: 'POST',
			url: '/theater_prj/ScreeningDateServlet',
			success: function(response) {
				// 받은 JSON 데이터를 파싱하여 표시
				var data = JSON.parse(response);
				
				displayDisabled(response, formattedDate1);
			},
			error: function(xhr, status, error) {
				console.error('Error', error);
			}
		});
	} // searchScreeningDate
	
	function displayDisabled(response, formattedDate1) {
	    var object = JSON.parse(response);
	    
	    formattedArray = formattedDate1.split(",");
	    var deleteDate = "";
	    
	    object.forEach(function(item) {
	        if (item.screeningDate.includes(formattedArray)) {
	        	deleteDate = item.screeningDate;
	        } // end if
	    });
	    var deleteIndex = formattedArray.indexOf(deleteDate);
	    
	    if(deleteIndex === -1) {
	    	formattedArray.splice(deleteIndex, 1);
	    } // end if
	    
	    formattedArray.forEach(function(date) {
		    $(".cal-week .datelist a[data-date='" + date + "']").removeClass("disabled");
	    })
	} // displayDisabled

	$(function() {
		$("div.section-pop-top", "div.popup").on("click", "a.btn-rsv-reset", function() {
			if (confirm("모든 선택정보가 사라집니다. 계속하시겠습니까?") == false) {
				return false;
			} // end if
			location.href = "ticket.jsp"
		});
		
		$(".cal-week").on("click", ".datelist", function(event){
		    event.preventDefault();
		    
		    if($(this).find("a").hasClass("disabled")) {
				return;
		    } // end if
		    
		    var clickedDate = $(this).find("a").attr("data-date");
		    
		    if($(this).hasClass("selected")) {
				$(this).removeClass("selected");
				$(".theater-box a.selected").removeClass("selected");
				resetMovieList();
				resetMovieTime();
				
			} else {
				$(".cal-week a.selected").removeClass("selected");
				$(".theater-box a.selected").removeClass("selected");
				resetMovieList();
				resetMovieTime();
				$(this).find("a").addClass("selected");
			} // end else
		})
		
		$(".cal-week").on("click", ".prev", function(event) {
			var now = new Date();
			var year = now.getFullYear();
			var month = (now.getMonth() + 1).toString().padStart(2, '0');
			var day = now.getDate().toString().padStart(2, '0');
			
			var formattedDate = year + month + day;
			
			// 오늘이면 클릭이벤트 중지
			if(formattedDate == $(".today").attr("data-date")) {
			    event.preventDefault();
			} // end if
		});
		
		$(".cal-week").on("click", ".next", function(event) {
			event.preventDefault();
			
			// 기존 달력 지우고
			$(".cal-week").remove();
			
			// 새로 만들기
			var ul = $("<ul>").addClass("cal-week");
			
			var prevListItem = $("<li>").append($("<a>").attr("href", "ticket.jsp")
							.addClass("prev viewDate").attr("data-viewdate", "").text("이전"));
			ul.append(prevListItem);
			
			var daysOfWeek = ["일", "월", "화", "수", "목", "금", "토"];

			for(var i=10; i<20; i++) {
				var now = new Date();
				now.setDate(now.getDate() + i);
				
				var year = now.getFullYear();
				var month = (now.getMonth() + 1).toString().padStart(2, "0");
				var day = now.getDate().toString().padStart(2, "0");
				var day2 = now.getDate().toString().padStart(2, "");
				var dayOfWeek = daysOfWeek[now.getDay()];
				var formattedDate1 = year + month + day;
				var formattedDate2 = year + "-" + month + "-" + day;
				
				var listItem = $("<li>").addClass("datelist");
				var link = $("<a>").attr("href", "ticket.jsp?screeningDate=" + formattedDate1)
								.attr("data-date", formattedDate1)
								.attr("data-selectdate", formattedDate2)
								.addClass("disabled")
								.css("margin", "0 2px 0 2px")
								.click(function() {
									event.preventDefault();
									 
								    
									if($(this).hasClass("selected")) {
										$(this).removeClass("selected");
										$(".theater-box a.selected").removeClass("selected");
										resetMovieList();
										resetMovieTime();
									} else {
										$(".cal-week a.selected").removeClass("selected");
										$(".theater-box a.selected").removeClass("selected");
										resetMovieList();
										resetMovieTime();
										
										$(this).addClass("selected");
									} // end else
										
									if($(this).hasClass("disabled")) {
										$(this).removeClass("selected");
								    } // end if
									return false;
								});
				
				searchScreeningDate(formattedDate1);
				
				if(dayOfWeek === "토") {
					link.addClass("sat ");
				} else if(dayOfWeek === "일") {
					link.addClass("sun ");
				} // end else if
				
				var spanDay = $("<span>").addClass("day").text(dayOfWeek);
				
				link.append(spanDay, day2);
				listItem.append(link);
				ul.append(listItem);
			} // end for
			
			var nextListItem = $("<li>").append($("<a>").attr("href", "#").css("margin", "0 2px 0 2px")
							.addClass("next viewDate").attr("data-viewdate", "").text("다음"));
			ul.append(nextListItem);
			
			$(".wrap-date").append(ul);
		});
		
		$(".theater-box").on("click", ".theater", function(event) {
		    event.preventDefault();
			
			var clickedId = $(this).attr("id");
			
			if($("#"+clickedId).hasClass("selected")) {
				$(".theater-box .theater.selected").removeClass("selected");
				resetMovieList();
		    } else {
				$(".theater-box .theater.selected").removeClass("selected");
				$("#"+clickedId).addClass("selected");
				resetMovieTime();

				var url = new URL(window.location.href);
			    var params = url.searchParams;
			    var screeningDate = params.get("screeningDate");
			    var theaterName = $(this).text();
			    
			    if(screeningDate === null) {
			    	screeningDate = $(".datelist > .selected").attr("data-date");
			    } // end if
			    
		        searchMovie(screeningDate, theaterName);
			} // end else
		});
		
		$("#movieList").on("click", "li > label", function(event) {
		    // label이 속한 li 요소를 찾습니다.
		    var li = $(this).parent("li");
		    
		    // li 요소에서 input radio의 id 값을 가져옵니다.
		    var url = new URL(window.location.href);
		    var params = url.searchParams;
		    var screeningDate = params.get("screeningDate");
		    var theaterName = $(".theater.selected").text();
		    var movieCode = li.find("input[type='radio']").attr("id");
		    
		    if(screeningDate === null) {
		    	screeningDate = $(".datelist > .selected").attr("data-date");
		    } // end if
		    
		    $(".wrap-timetable > .title").remove();
		    $(".wrap-timetable > .theater-info").remove();
		    $(".wrap-timetable > .time").remove();
		    
		    searchTime(screeningDate, theaterName, movieCode);
		    //alert(movieCode+","+screeningDate+","+theaterName);
	    });
		
 		$(".wrap-timetable").on("click", ".time", function(event) {
			var clickedId = $(this).attr("id");
			
			if($("#"+clickedId).hasClass("on")) {
				 $(".wrap-timetable .time.on").removeClass("on").css("color", "black");
			} else {
				 $(".wrap-timetable .time.on").removeClass("on").css("color", "black");
				$("#"+clickedId).addClass("on").css("color", "white");
			} // end else
		}); 
 		
 		$(".btn-rsv-next").click(function(event) {
 			var url = new URL(window.location.href);
 		    var params = url.searchParams;
 		    var screeningDate = params.get("screeningDate");
 		    var theaterName = $(".theater.selected").text();
 		    var movieCode = $("#movieList>li").find("input[type='radio']:checked").attr("id");
 		    var movieTitle = $("#movieList>li").find("input[type='radio']:checked").attr("movieTitle");
 		    var movieRate = $("#movieList>li").find("input[type='radio']:checked").parent().find("span").text();
 		    var theaterNumber = $(".wrap-timetable > .time.on").attr("theaterNumber");
 		    var screeningCode = $(".wrap-timetable > .time.on").attr("id");
 		    var screeningTime = $(".wrap-timetable > .time.on").text();
 		    
 		    if(screeningDate === null) {
		    	screeningDate = $(".datelist > .selected").attr("data-date");
		    } // end if
 		    
 		    // 유효성 검증
 		    if(theaterName=="") {
 		    	alert("영화관을 선택해주세요.");
 		    	return;
 		    } // end if
 		    
 		    if(movieTitle=="" || movieRate =="") {
 		    	alert("영화를 선택해주세요.");
 		    	return;
 		    } // end if
 		    
 		    if(theaterNumber =="" || screeningCode == "" || screeningTime=="") {
 		    	alert("영화 시간을 선택해주세요.");
 		    	return;
 		    } // end if
 		    
 		   	if(movieRate == "12") {
 		   		if(!confirm("12세 이상 등급\n\n본 영화는 12세 이상 관람 영화입니다.\n\n만 12세 미만 고객님(영, 유아포함)께서는 반드시 보호자(부모님 포함) 동반 하에 관람이 가능합니다.")){
 		   			return;
 		   		} // end if
 		   	} // end if

 		   	if(movieRate == "15") {
 		   		if(!confirm("15세 이상 등급\n\n본 영화는 15세 이상 관람 영화입니다.\n\n만 15세 미만 고객님(영, 유아포함)께서는 반드시 보호자(부모님 포함) 동반 하에 관람이 가능합니다.")){
 		   			return;
 		   		} // end if
 		   	} // end if
 		   	
 		   	if(movieRate == "18") {
 		   		if(!confirm("청소년 불가 등급\n\n본 영화는 청소년 관람 불가 영화입니다.\n\n"
 		   				+"만 19세 미만 고객님(영, 유아포함)께서는 반드시 보호자(부모님 포함)를 동반하여도 관람하실 수 없습니다.\n"
 		   				+"(만 19세가 되는 해의 1월1일을 맞이한 사람은 제외)\n\n영화 관람 시, 반드시 신분증을 지참해주세요.")){
 		   			return;
 		   		} // end if
 		   	} // end if
 		    
 		    // 다음 페이지 파라미터로 넘길 값들 JSON으로 변경 
 		    var params = {
 		    		screeningDate: screeningDate,
 		    		theaterName: theaterName,
 		    		theaterNumber: theaterNumber,
 		    		movieCode: movieCode,
 		    		movieTitle: movieTitle,
 		    		movieRate: movieRate,
 		    		screeningCode: screeningCode,
 		    		screeningTime: screeningTime
 		    }
 		    
 		   	var form = document.createElement('form');        //form엘리먼트 생성
 		    
 		    form.setAttribute('method', 'post');              //POST 메서드 적용
 		    form.setAttribute('action', "selectSeat.jsp");	      //데이터를 전송할 url
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
 		});
	}); // ready

	// 날짜를 클릭하고 상영관을 클릭하면 상영 중인 영화를 가져옴
	function searchMovie(screeningDate, theaterName) {
		//alert(screeningDate+","+theaterName);
		var request = new XMLHttpRequest();
	    
		request.open("Post", "http://localhost/theater_prj/MovieSearchServlet?screeningDate=" 
				+ encodeURIComponent(screeningDate)
				+ "&theaterName=" + encodeURIComponent(theaterName), true);
		request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
		request.onreadystatechange = function() {
			if (request.readyState == 4 && request.status == 200) {
				// 응답을 받으면 searchProcess 함수 호출하여 처리
				searchMovieProcess(request);
			} // end if
		};
		request.send(null);
	} // searchMovie
	
	function searchMovieProcess(request) {
		var ul = document.getElementById("movieList");
		var messageParagraph = ul.querySelector("p");
		ul.innerHTML = "";
		
		// 서버에서 받은 JSON 데이터 파싱
		var object = JSON.parse(request.responseText);
		var result = object.result;
		
		if(result.length != 0) {
			for(var i = 0; i < result.length; i++) {
				var movieTitle = result[i].movieTitle;
				var movieRating = result[i].movieRating;
				var movieCode = result[i].movieCode;
	
				// 각 영화에 대한 li 요소 생성
		        var li = document.createElement("li");
		        
		        // 라디오 생성
		        var radio = document.createElement("input");
		        radio.type = "radio";
		        radio.className = "p-movie-check";
		        radio.setAttribute("id", movieCode);
		        radio.setAttribute("name", "movie-check");
		        radio.setAttribute("movieTitle", movieTitle);
		        
		        // 영화 등급 표시를 위한 레이블 생성
		        var label = document.createElement("label");
		        label.setAttribute("for", movieCode);
		        label.setAttribute("style", "overflow:hidden; text-overflow: ellipsis; white-space: nowrap; scrollbar-gutter: stable;");
	
		        var movieRatingSpan = document.createElement("span");
		        if(movieRating == "18") {
		        	movieRatingSpan.className = "rate-x";
		        } else {
			        movieRatingSpan.className = "rate-"+ movieRating.toLowerCase();
		        } // end else
		        movieRatingSpan.textContent = movieRating; // 등급 값 설정
		        label.appendChild(movieRatingSpan);
		        label.appendChild(document.createTextNode(movieTitle));
		        
		        var checkSpan = document.createElement("span");
		        checkSpan.className = "check";
		        
		        // li 요소에 라디오와 레이블 추가
		        li.appendChild(radio);
		        li.appendChild(label);
		        li.appendChild(checkSpan);
		        
		        // li 요소를 ul에 추가
		        ul.appendChild(li);
			} // end for
		} else {
			// p 태그 생성
			var paragraph = $("<p>");
			paragraph.text("해당 날짜, 영화관에 상영 중인 영화가 없습니다.").css({"color":"blue", "text-align":"center", "margin-top":"30%"});
			$("#movieList").append(paragraph);
		} // end else
	} // searchProcess
	
	// 선택 날짜, 영화관, 영화의 시간 가져오기
	function searchTime(screeningDate, theaterName, movieCode) {
		// ajax에서 처리할 데이터 모음
		var param = {
				screeningDate: screeningDate,
				theaterName: theaterName,
				movieCode: movieCode
		}
		
		$.ajax({
			type: 'POST',
			url: '/theater_prj/MovieTimeServlet',
			data: param,
			success: function(response) {
				// 받은 JSON 데이터를 파싱하여 표시
				var data = JSON.parse(response);
				
				$(".wrap-timetable > p").remove();

				if(data == "") { // 데이터가 현재시간 이전이라면
					$(".wrap-timetable").append($("<p>").text("영화관과 영화를 선택하면 시간표가 나옵니다.").addClass("ready"));
				} else {
					displayData(response);
				} // end else
			},
			error: function(xhr, status, error) {
				console.error('Error', error);
			}
		});
	} // searchTime
	
	// 시간표에 파싱한 데이터를 표시하는 함수
	function displayData(response) {
		var object = JSON.parse(response);
		
		var divTimeTable = $(".wrap-timetable");
		
		for(var i = 0; i < object.length; i++) {
			if(object[i].movieRating == "18") {
				 object[i].movieRating = "x";
	        } // end if

			var divTitle = $("<div>").addClass("title");
			var spanRate = $("<span>").addClass("rate-"+object[i].movieRating.toLowerCase());
			var divTheaterInfo = $("<div>").addClass("theater-info");
			var divTime = $("<div>").addClass("time");
			
			spanRate.append(object[i].movieRating);
			divTitle.append(spanRate);
			divTitle.append(object[i].movieTitle);
			divTimeTable.append(divTitle);
			
			divTheaterInfo.attr("theaterName", object[i].theaterName);
			divTheaterInfo.append(object[i].theaterNumber);
			divTimeTable.append(divTheaterInfo);
			
			divTime.append(object[i].screeningTime);
			divTime.css("margin-left", "25px");
			divTime.css("padding", "8px 20px");
			divTime.attr("screeningDate", object[i].screeningDate);
			divTime.attr("id", object[i].screeningCode);
			divTime.attr("theaterNumber", object[i].theaterNumber);
			divTimeTable.append(divTime);
		} // end for
	} // displayData
		
</script>
</head>
<body class="top">

	<div id="wrap">
		<!-- S Header -->
		<jsp:include page="header.jsp"></jsp:include>
		<!-- E Header -->

        <jsp:useBean id="rsVO" class="user.VO.ReservingVO" scope="page"/>
        <jsp:setProperty property="*" name="rsVO"/>
		<%
		LocalDateTime now = LocalDateTime.now();
		DateTimeFormatter dataDateFormat = DateTimeFormatter.ofPattern("yyyyMMdd");
		String today = now.format(dataDateFormat);
		pageContext.setAttribute("today", today);

		DateTimeFormatter selectDateFormat = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		
		ReservingDAO rsDAO = ReservingDAO.getInstance();
		List<ReservingVO> screeningDates = new ArrayList<>();
		screeningDates = rsDAO.selectScreeningDate("N");
		pageContext.setAttribute("screeningDates", screeningDates);
		
		List<ReservingVO> theaters = new ArrayList<>();
		theaters = rsDAO.selectAllTheater();
		pageContext.setAttribute("theaters", theaters);
		%>

		<!-- Contaniner -->
		<div id="container" class>
			<!-- Contents Area -->
			<div id="contents" class style="padding-bottom: 0px;">
				<!-- Contents Start -->

				<!-- 예매 본문 -->
				<div class="popup" data-theatercode="" data-moviecode=""
					data-playdate="${ today }" data-screenplanid="" data-playnumber="">
					<div class="section-pop-top">
						<!--<h3 class="title">제목</h3>-->
						<a href="#" class="btn-rsv-reset">다시 예매</a>
					</div>
					<div class="section-pop-left">
						<div class="wrap-date">
							<h4 class="title">날짜</h4>
							<input type="hidden" name="cal" id="rsvcal" class="input-cal hasDatepicker"
								value="${ today }" style="display: none;">
							<ul class="cal-week">
								<li><a href="#" class="prev viewDate" data-viewdate="">이전</a></li>
								
								<%
								StringBuilder classStringBuilder = new StringBuilder();
								
								for(int i = 0; i < 10; i++) {
									String dataDate = now.plusDays(i).format(dataDateFormat);
									String selectDate = now.plusDays(i).format(selectDateFormat);
									String dayOfWeek = now.plusDays(i).getDayOfWeek().getDisplayName(TextStyle.SHORT, Locale.KOREAN);
									int dayOfMonth = now.plusDays(i).getDayOfMonth();
									
									boolean isToday = i == 0;
									boolean isSelected = request.getParameter("screeningDate") != null && request.getParameter("screeningDate").equals(dataDate)
														|| (i == 0 && request.getParameter("screeningDate") == null);
									boolean isScreening = false;
									String isDisabled = "";
									
									classStringBuilder.append(isToday ? "today selected " : ""); // 오늘 날짜인 경우 today 클래스 추가
									classStringBuilder.append(isSelected ? "selected " : ""); // 선택된 날짜인 경우 selected 클래스 추가
									classStringBuilder.append(dayOfWeek.equals("토") ? "sat " : ""); // 토요일인 경우 sat 클래스 추가
									classStringBuilder.append(dayOfWeek.equals("일") ? "sun " : ""); // 일요일인 경우 sun 클래스 추가
									
									for(int j = 0; j < screeningDates.size(); j++) {
										rsVO = screeningDates.get(j);
										
										if(rsVO.getScreeningDate().equals(dataDate)) {
											isDisabled = "";
											isScreening = true;
										} // end if
										
										if(!isScreening) {
											isDisabled = "onclick=\"return false\"";
										} // end if
									} // end for
									
									classStringBuilder.append(isScreening ? "" : "disabled "); 
									
									String classString = classStringBuilder.toString();
								%>
									<li class="datelist">
										<a href="ticket.jsp?screeningDate=<%= dataDate %>" data-date="<%= dataDate %>"
										data-selectdate="<%= selectDate %>" class="<%= classString %>" <%=isDisabled%> >
										<span class="day"><%= dayOfWeek %></span><%= dayOfMonth %></a>
									</li>
								<% classStringBuilder.delete(0, classStringBuilder.length());
								} // end for
								String dataDate2 = now.plusDays(10).format(dataDateFormat); %>
								<li><a href="ticket.jsp?screeningDate=<%= dataDate2 %>" class="next viewDate" data-viewdate="" >다음</a></li>
							</ul>
						</div>
						
						<div class="wrap-theater">
							<h4 class="title">영화관</h4>
							<div class="theater-box" id="theaterBox">
							<c:forEach var="rsVO" items="${ theaters }" varStatus="i">
								<a href="ticket.jsp?screeningDate=${ param.screeningDate }&theaterName=${ rsVO.theaterName }"
								 	class="theater" id="${ rsVO.theaterName }">${ rsVO.theaterName }</a>
							</c:forEach>
							</div>
						</div>
						
						<div class="wrap-theater wrap-movielist">
							<h4 class="title">영화</h4>
							<ul class="list-movie-name" id="movieList" style="height: 390px;">
								<p class="ready" style="color: #7d7d7d; text-align: center; margin-top: 30%;">날짜와 영화관을 선택하면 영화가 나옵니다.</p>
							</ul>
						</div>
					</div>
					<!--.section-pop-left-->

					<div class="section-pop-right">
						<div class="wrap-timetable-head" style = "align-content: center;">
							<h4 class="title">시간표</h4>
						</div>
						
						<div class="wrap-timetable">
							<p class="ready">영화관과 영화를 선택하면 시간표가 나옵니다.</p>
						</div>
					</div>
					<!--.section-pop-left-->

					<div class="section-pop-bottom">
						<div class="wrap-rsv-select">
							<a href="#" class="btn-rsv-next">다음</a>
						</div>
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
</body>
</html>