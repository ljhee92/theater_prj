<%@page import="java.util.ArrayList"%>
<%@page import="VO.ReservingVO"%>
<%@page import="java.util.List"%>
<%@page import="user.DAO.ReservingDAO"%>
<%@page import="java.util.Locale"%>
<%@page import="java.time.format.TextStyle"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info="로그인 전 예매 첫 페이지"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
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

<!-- S 로그인 세션 확인  -->
<%
// 세션에서 로그인 여부 확인
String id = (String)session.getAttribute("id");
if (id == null) {// 로그인되지 않은 경우 로그인 페이지로 리디렉션
%>
    <script type="text/javascript">
    window.location.href = "login.jsp?prevPage=ticket.jsp";
    </script>  
<%}%>
<!-- E 로그인 세션 확인  -->

<script type="text/javascript">
	$(function() {
		//a 태그 클릭 시 이벤트 핸들러 등록
		$(".selected").click(function(event) {
		    // 클릭 이벤트를 기본 동작으로부터 중지합니다.
		    event.preventDefault();
		    
		    /* // 클릭한 a 태그의 href 속성값을 가져옵니다.
		    var href = window.location.href;
	
		    // href 속성값에서 screeningDate 파라미터를 추출합니다.
		    var url = new URL(href);
		    var urlparams = url.searchParams;
		    var screeningDate = urlparams.get('screeningDate'); */
		    
		    // 추출된 screeningDate를 사용하여 searchTheater 함수를 호출합니다.
		    //searchTheater();
		});
	}); // ready

	/* 날짜를 클릭하면 상영관명 가져옴 */
	function searchTheater(screeningDate) {
		var request = new XMLHttpRequest();
		// 클릭한 a 태그의 href 속성값을 가져옵니다.
	    var href = window.location.href;

	    // href 속성값에서 screeningDate 파라미터를 추출합니다.
	    var url = new URL(href);
	    var urlparams = url.searchParams;
	    var screeningDate = urlparams.get('screeningDate');
	    
		request.open("Post", "http://localhost/theater_prj/TheaterSearchServlet?screeningDate=" 
				+ encodeURIComponent(screeningDate), true);
		request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
		request.onreadystatechange = function() {
			if (request.readyState == 4 && request.status == 200) {
				// 응답을 받으면 searchProcess 함수 호출하여 처리
				searchProcess(request);
			} // end if
		};
		request.send(null);
	} // searchTheater
	
	function searchProcess(request) {
		var div = document.getElementById("theaterBox");
		div.innerHTML = "";
		
		var href = window.location.href;
			
	    // href 속성값에서 screeningDate 파라미터를 추출합니다.
	    var url = new URL(href);
	    var urlparams = url.searchParams;
	    var screeningDate = urlparams.get('screeningDate');
	    //alert(screeningDate);
		
		// 서버에서 받은 JSON 데이터 파싱
		var object = JSON.parse(request.responseText);
		var result = object.result;
		
		// 각 Reserving 객체의 theaterName를 기반으로 옵션을 생성하여 추가
		for(var i = 0; i < result.length; i++) {
			var theaterName = result[i].value;

			// 새로운 a태그 생성
			var aTag = document.createElement("a");
			aTag.setAttribute("href", "ticket.jsp?screeningDate="+screeningDate+"&theaterName="+theaterName);
			aTag.setAttribute("class", "theater");
			aTag.setAttribute("style", "margin-left: 2px");
			aTag.textContent = theaterName;

			// a태그를 div에 추가
			div.appendChild(aTag);
		} // end for
	} // searchProcess
</script>
</head>
<body class="top">

	<div id="wrap">
		<!-- S Header -->
		<jsp:include page="header.jsp"></jsp:include>
		<!-- E Header -->

        <jsp:useBean id="rsVO" class="VO.ReservingVO" scope="page"/>
        <jsp:setProperty property="*" name="rsVO"/>
		<%
		LocalDateTime now = LocalDateTime.now();
		DateTimeFormatter dataDateFormat = DateTimeFormatter.ofPattern("yyyyMMdd");
		String today = now.format(dataDateFormat);
		pageContext.setAttribute("today", today);

		DateTimeFormatter selectDateFormat = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		
		ReservingDAO rsDAO = ReservingDAO.getInstance();
		List<ReservingVO> screeningDates = new ArrayList<>();
		screeningDates = rsDAO.selectScreeningDate();
		pageContext.setAttribute("screeningDates", screeningDates);
		
		List<ReservingVO> theaters = new ArrayList<>();
		theaters = rsDAO.selectAllTheater();
		pageContext.setAttribute("theaters", theaters);
		
		String screeningDate = request.getParameter("screeningDate");
		pageContext.setAttribute("screeningDate", screeningDate);
		%>

		<!-- Contaniner -->
		<div id="container" class>
			<!-- Contents Area -->
			<div id="contents" class style="padding-bottom: 0px;">
				<!-- Contents Start -->

				<!-- 예매 본문 -->
				<div class="popup" data-theatercode="6001" data-moviecode=""
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
									
									classStringBuilder.append(isToday ? "today " : ""); // 오늘 날짜인 경우 today 클래스 추가
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
										data-selectdate="<%= selectDate %>" class="<%= classString %>" <%=isDisabled%> onclick="searchTheater();">
										<span class="day"><%= dayOfWeek %></span><%= dayOfMonth %></a>
									</li>
								<% classStringBuilder.delete(0, classStringBuilder.length());
								} // end for %>
								<li><a href="#" class="next viewDate" data-viewdate="">다음</a></li>
							</ul>
						</div>
						
						<div class="wrap-theater">
							<h4 class="title">영화관</h4>
							<div class="theater-box" id="theaterBox">
							<c:forEach var="rsVO" items="${ theaters }" varStatus="i">
								<a href="ticket.jsp?screeningDate=${ screeningDate }&theaterName=${ rsVO.theaterName }"
								 	class="theater">${ rsVO.theaterName }</a>
							</c:forEach>
							</div>
						</div>
						
						<div class="wrap-theater wrap-movielist">
							<h4 class="title">영화</h4>
							<div class="btn-box1">
								<a href="#" class="" data-type="select">전체 선택</a>
								<a href="#" class="" data-type="reload">전체 해제</a>
							</div>
							<ul class="list-movie-name" style="height: 278px;">
								<li><input type="checkbox" id="pm_20228797"
									name="movie_movieCode" value="20228797" class="p-movie-check"><label
									for="pm_20228797"><span class="rate-15">15</span>범죄도시4</label><span
									class="check"></span></li>
								<li><input type="checkbox" id="pm_20236614"
									name="movie_movieCode" value="20236614" class="p-movie-check"><label
									for="pm_20236614"><span class="rate-all">0</span>쿵푸팬더4</label><span
									class="check"></span></li>
								<li><input type="checkbox" id="pm_20249318"
									name="movie_movieCode" value="20249318" class="p-movie-check"><label
									for="pm_20249318"><span class="rate-15">15</span>챌린저스</label><span
									class="check"></span></li>
								<li><input type="checkbox" id="pm_20248466"
									name="movie_movieCode" value="20248466" class="p-movie-check"><label
									for="pm_20248466"><span class="rate-12">12</span>고스트버스터즈:
										오싹한 뉴욕</label><span class="check"></span></li>

								<li><input type="checkbox" id="pm_20235613"
									name="movie_movieCode" value="20235613" disabled=""
									class="p-movie-check"><label for="pm_20235613"><span
										class="rate-15">15</span>스턴트맨</label><span class="check"></span></li>
								<li><input type="checkbox" id="pm_20249313"
									name="movie_movieCode" value="20249313" disabled=""
									class="p-movie-check"><label for="pm_20249313"><span
										class="rate-all">0</span>포켓몬스터: 성도지방 이야기, ...</label><span
									class="check"></span></li>
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
	
	
<!-- <script type="text/javascript">
	function simpleReserv(playDate, theaterCode, movieCode, screenPlanId) {
		$.desktop.reserve.open({
			playDate : playDate,
			theaterCode : theaterCode,
			movieCode : movieCode,
			screenPlanId : screenPlanId
		});
		return false;
	}

	$(function() {
		$(".simplereservepop").click(function(e) {
			e.preventDefault();
			$.desktop.reserve.open({
				playDate : ''
			});
			return false;
		})
	})
</script> -->

<script type="text/javascript">
	$(function() {
		/* $.desktop.reservepop = {};
		$.desktop.reservepop = {
			option : {
				theaterCode : "",
				movieCode : "",
				playDate : "",
				screenPlanId : "",
				playNumber : "",
				sortType : 1,
				grade : "",
				screenPropertyCode : 0
			},

			initLoad : true,
			selectedMovieCode : new Array(),
			firstScreenPlanId : "",
			dateWidget : null,
			mouseOverMinimap : null,

			init : function() {
				$.desktop.reservepop.option.theaterCode = $("div.popup").data("theatercode");
				$.desktop.reservepop.option.movieCode = $("div.popup").data("moviecode");
				$.desktop.reservepop.option.playDate = $("div.popup").data("playdate");
				$.desktop.reservepop.option.screenPlanId = $("div.popup").data("screenplanid");
				$.desktop.reservepop.option.playNumber = $("div.popup").data("playnumber");

				$.desktop.firstScreenPlanId = $.desktop.reservepop.option.screenPlanId;
				$.desktop.reservepop.initLoad = true;
				$.desktop.reservepop.selectedMovieCode = new Array();

				if ($.desktop.reservepop.option.movieCode != "") {
					$.desktop.reservepop.selectedMovieCode
							.push($.desktop.reservepop.option.movieCode);
				}

				$.desktop.reservepop._initEvent();
				$.desktop.reservepop._initSelected();

				$.desktop.reservepop.loadDate($.desktop.reservepop.option.playDate);
				$.desktop.reservepop.loadMovie($.desktop.reservepop.option.sortType);

				$.desktop.reservepop.dateWidget = $("div.wrap-date #rsvcal", "div.popup").hide().datepicker(
						{
							minDate : "2024-04-30",
							maxDate : "2024-05-30",
							dateFormat : "yy-mm-dd",
							onSelect : function(d, i) {
								var selectedDate = d.replace(/-/gi, "");
								$.desktop.reservepop.loadPlayDate(selectedDate,
										selectedDate);
							}
						});
			},

			_initEvent : function() {

				$("div.wrap-date", "div.popup").on("click", ".btn-show-cal", function(e) {
					if ($.desktop.reservepop.dateWidget.datepicker("widget").is(":hidden")) {
						$.desktop.reservepop.dateWidget.datepicker("show").datepicker("widget").show()
						.position({
							my : "right bottom",
							at : "right top",
							of : this
						});
					} else {
						$.desktop.reservepop.dateWidget.hide();
					}
					e.preventDefault();
				}); */

				/* $("a.close-modal", "div.popup").click(function() {
					if (confirm("모든 선택정보가 사라집니다. 계속하시겠습니까?") == false) {
						return false;
					}

					$.modal.close();
					return false;
				}); */

				$("div.section-pop-top", "div.popup").on("click",
						"a.btn-rsv-reset", function() {
							if (confirm("모든 선택정보가 사라집니다. 계속하시겠습니까?") == false) {
								return false;
							}
							/* var theaterCode = $("div#popup_olddata").data("theatercode");
							var movieCode = $("div#popup_olddata").data("moviecode");
							var playDate = $("div#popup_olddata").data("playdate");
							var screenPlanId = $("div#popup_olddata").data("screenplanid");
							var playNumber = $("div#popup_olddata").data("playnumber");

							$.desktop.reserve.openPrev(
							    {
							        playDate: playDate,
							        theaterCode: theaterCode,
							        movieCode: "",
							        screenPlanId: "",
							        playNumber: "",
							    }
							); */
							location.href = "ticket.jsp"
						});

				/* $("div.wrap-date", "div.popup").on("click", "a.viewDate", function(event) {
					var viewDate = $(this).data("viewdate");
					if (viewDate != "") {
						$.desktop.reservepop.loadDate(viewDate);
					}
					event.preventDefault();
					return false;
				}); */

				/* $("div.wrap-date", "div.popup").on("click", "li.datelist>a", function(event) {
					if ($(this).hasClass("disabled") == false) {
						var date = $(this).data("date");
						var selectDate = $(this).data("selectdate");
						$("div.wrap-date #rsvcal", "div.popup").val(selectDate);

						$.desktop.reservepop.option.playDate = date;
						$(this).closest("ul").find("li.datelist>a").removeClass("selected");
						$(this).closest("ul").find("li.datelist>a._sat").addClass("sat").removeClass("_sat");
						$(this).closest("ul").find("li.datelist>a._sun").addClass("sun").removeClass("_sun");

						$(this).addClass("selected");

						if ($(this).hasClass("sun")) {
							$(this).addClass("_sun").removeClass("sun");
						}
						if ($(this).hasClass("sat")) {
							$(this).addClass("_sat").removeClass("sat");
						}

						$.desktop.reservepop.loadMovie();
					}
					event.preventDefault();
					return false;
				}) */

				/* $("div.theater-box", "div.popup").on("click", "a", function(event) {
					if ($.desktop.reservepop.option.theaterCode != $(this).data("theatercode")) {
						$.desktop.reservepop.option.theaterCode = $(this).data("theatercode");
						$("div.wrap-theater div.theater-box a.theater", "div.popup").removeClass("selected");
						$(this).addClass("selected");
						$.desktop.reservepop.selectedMovieCode = new Array();
						$.desktop.reservepop.loadDate($.desktop.reservepop.option.playDate);
						$.desktop.reservepop.loadMovie();
						$.desktop.reservepop.loadScreenPlan($.desktop.reservepop.selectedMovieCode);
					}
					event.preventDefault();
					return false;
				});

				$("div.wrap-movielist", "div.popup").on("click", ".p-movie-check", function(event) {
					$.desktop.reservepop.selectedMovieCode = new Array();
					$("input.p-movie-check:checked", "div.wrap-movielist").each(function(e) {
						$.desktop.reservepop.selectedMovieCode.push($(this).val());
					});
					$.desktop.reservepop.loadScreenPlan($.desktop.reservepop.selectedMovieCode);
				});

				$("div.wrap-movielist", "div.popup").on("click", "div.btn-box1>a", function(event) {
					event.preventDefault();
					var type = $(this).data("type");
					if (type == "select") {
						$.desktop.reservepop.selectedMovieCode = new Array();
						$("div.wrap-movielist input.p-movie-check", "div.popup").each(function() {
							if ($(this).prop("disabled") == false) {
								$.desktop.reservepop.selectedMovieCode.push($(this).val());
								$(this).prop("checked", true);
							}
						});
						$.desktop.reservepop.loadMovie();
					} else if (type == "reload") {
						$.desktop.reservepop.selectedMovieCode = new Array();
						$.desktop.reservepop.loadMovie();
						$.desktop.reservepop.loadScreenPlan($.desktop.reservepop.selectedMovieCode);
					}
					return false;
				});

				$("div.wrap-movielist").on("click", "div.btn-box2>a", function(event) {
					event.preventDefault();
					if ($(this).hasClass("selected") == false) {
						var sorttype = $(this).data("sorttype");
						$(this).closest("div.btn-box2").find("a").removeClass("selected");
						$(this).addClass("selected");
						$.desktop.reservepop.loadMovie(sorttype);
					}
					return false;
				});

				$("div.wrap-timetable", "div.popup").on("mouseenter", ".time", function(e) {
					$("div.wrap-timetable div.pop-map","div.popup").remove();
					var $this = $(this);
					var screenPlanId = $(this).data("screenplanid");
					$.desktop.reservepop.mouseOverMinimap = screenPlanId;
					
					$.post("/popup/ReserveMinimap",{screenPlanId : screenPlanId}, function(data) {
						if ($.desktop.reservepop.mouseOverMinimap == screenPlanId) {
							var $timeTable = $("<div class='pop-map'>"+ data+ "</div>");
							$("div.wrap-timetable", "div.popup").append($timeTable);
							var pos_this = $this.position();
							var h_pop = $timeTable.height();
							var w_pop = $timeTable.width();
							var h_this = $this.height();
							var w_this = $this.width();
							$timeTable.css("top", parseInt(pos_this.top - h_pop - h_this + 7));
							if ($this.index() % 3 == 2) {
								$timeTable.css("left", parseInt(pos_this.left + w_this - w_pop - 7));
							} else {
								$timeTable.css("left",parseInt(pos_this.left));
							}
							$timeTable.css("margin-left", $this.css("margin-left"));
							if ($.desktop.reservepop.mouseOverMinimap != screenPlanId) {
								$timeTable.remove();
							}
						}
					})
				});

				$("div.wrap-timetable", "div.popup").on("mouseleave", ".time", function() {
					$("div.wrap-timetable div.pop-map", "div.popup").remove();
				});

				$("div.wrap-timetable", "div.popup").on("click", ".time", function(e) {
					$(".wrap-timetable .time").removeClass("on");
					$.desktop.reservepop.option.screenPlanId = $(this).data("screenplanid");
					$.desktop.reservepop.option.grade = $(this).data("grade");
					$.desktop.reservepop.option.screenPropertyCode = $(this).data("sproperty");

					$(this).toggleClass("on");
				});

				$(".section-pop-bottom", "div.popup").on("click", "a.btn-rsv-next", function(event) {
					event.preventDefault();

					if ($.desktop.reservepop.option.theaterCode == "") {
						alert("영화관을 선택하세요.");
						return false;
					}

					if ($.desktop.reservepop.option.playDate == "") {
						alert("날짜를 선택하세요.");
						return false;
					}

					if ($.desktop.reservepop.option.screenPlanId == "") {
						alert("영화 시간을 선택하세요.");
						return false;
					}

					if ($.desktop.reservepop.option.grade == "18"
							|| $.desktop.reservepop.option.grade == "x") {
						alert("청불등급\r\n\r\n본 영화는 청소년 관람불가 영화입니다.\r\n\r\n만 18세 미만의 고객님(영, 유아)은 보호자(부모님 포함)를 동반하여도 관람하실 수 없습니다.\r\n만 18세 이상이라도 초/중/고 재학중인 고객님은 영화를 관람하실 수 없습니다.\r\n영화 관람 시, 반드시 신분증을 지참해주세요.");
					} else if ($.desktop.reservepop.option.grade == "15") {
						alert("15세 이상 등급\r\n\r\n본 영화는 15세 이상 관람 영화입니다.\r\n\r\n만 15세 미만 고객님(영, 유아포함)께서는 반드시 보호자(부모님 포함) 동반하에 관람이 가능합니다.");
					} else if ($.desktop.reservepop.option.grade == "12") {
						alert("12세 이상 등급\r\n\r\n본 영화는 12세 이상 관람 영화입니다.\r\n\r\n만 12세 미만 고객님(영, 유아포함)께서는 반드시 보호자(부모님 포함) 동반하에 관람이 가능합니다");
					}

					$.desktop.seatchoice.open({
						playDate : $.desktop.reservepop.option.playDate,
						theaterCode : $.desktop.reservepop.option.theaterCode,
						screenPlanId : $.desktop.reservepop.option.screenPlanId
					});

					return false;
				});
			},

			_initSelected : function() {
				$("div.wrap-theater div.theater-box", "div.popup").find("a").removeClass("selected");
				$("div.wrap-theater div.theater-box", "div.popup").find(
								"a[data-theatercode=" + $.desktop.reservepop.option.theaterCode + "]").addClass("selected");
			},

			loadDate : function(viewDate) {
				$.post("/popup/ReserveDateList", {
					theaterCode : $.desktop.reservepop.option.theaterCode,
					selectDate : $.desktop.reservepop.option.playDate,
					viewDate : viewDate,
				}, function(data) {
					var $data = $(data);
					var maxdate = $data.data("maxdate");
					$("div.wrap-date #rsvcal", "div.popup").hide().datepicker("option", "maxDate", maxdate);
					$("div.wrap-date ul.cal-week", "div.popup").html($data.html());
				});
			},

			loadPlayDate : function(playDate) {
				$.post("/popup/ReserveDateList", {
					theaterCode : $.desktop.reservepop.option.theaterCode,
					selectDate : playDate,
					viewDate : playDate,
				}, function(data) {
					var $data = $(data);
					var maxdate = $data.data("maxdate");
					$("div.wrap-date #rsvcal", "div.popup").datepicker("option", "maxDate", maxdate);
					$("div.wrap-date ul.cal-week", "div.popup").html($data.html());
					$.desktop.reservepop.option.playDate = playDate;
					$(this).closest("ul").find("li.datelist>a").removeClass("selected");
					$(this).addClass("selected");

					$.desktop.reservepop.loadMovie();
				});
			},

			loadMovie : function(sortType) {
				$.desktop.reservepop.option.sortType = sortType == undefined ? $.desktop.reservepop.option.sortType
						: sortType;

				if ($("div.wrap-date ul.cal-week a[data-date=" + $.desktop.reservepop.option.playDate + "]",
						"div.popup").hasClass("disabled") == true) {
					$("div.wrap-movielist input.p-movie-check", "div.popup").prop("disabled", true).prop("checked", false);
					$.desktop.reservepop.clearScreenPlan();
					return;
				}

				$.post("/popup/ReserveMovieList",
						{
						"PlayDate" : $.desktop.reservepop.option.playDate,
						"TheaterCode" : $.desktop.reservepop.option.theaterCode,
						"movieCode" : $.desktop.reservepop.selectedMovieCode
								.toString(),
						"SortType" : $.desktop.reservepop.option.sortType
						},
				function(data) {
					$("div.wrap-movielist", "div.popup").html(data);

					var selectMovieCode = new Array();
					$("div.wrap-movielist input.p-movie-check", "div.popup").each(function() {
						for (var i = 0; i < $.desktop.reservepop.selectedMovieCode.length; i++) {
							if ($(this).val() == $.desktop.reservepop.selectedMovieCode[i]) {
								if ($(this).prop("disabled") == true) {
									$(this).prop("checked", false).removeProp("checked");
								} else {
									selectMovieCode.push($.desktop.reservepop.selectedMovieCode[i])
								}
								break;
							}
						}
					});

					$.desktop.reservepop.loadScreenPlan(selectMovieCode);
				});
			},

			loadScreenPlan : function(movieCodeList) {
				if (movieCodeList.length == 0) {
					$.desktop.reservepop.clearScreenPlan();
					return;
				}

				$.post("/popup/ReserveScreenPlan", {
					"theaterCode" : $.desktop.reservepop.option.theaterCode,
					"playDate" : $.desktop.reservepop.option.playDate,
					"movieCode" : movieCodeList.toString()
				}, function(data) {
					if ($.trim(data) == "")
						$.desktop.reservepop.clearScreenPlan();
					else $("div.wrap-timetable", "div.popup").html(data);
					if ($.desktop.firstScreenPlanId != "")
						$("div.wrap-timetable div[data-screenplanid=" + $.desktop.firstScreenPlanId + "]", "div.popup").click();

					$.desktop.firstScreenPlanId = "";
				});
			},

			clearScreenPlan : function() {
				$("div.wrap-timetable", "div.popup").html('<p class="ready">영화관과 영화를 선택하면 시간표가 나옵니다.</p>');
			}
		} */
	});
</script>

<!-- <script type="text/javascript">
	$(function() {
		$.desktop.reservepop.init();
	})
</script> -->
</body>
</html>