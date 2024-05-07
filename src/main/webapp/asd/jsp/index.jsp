<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<%@page import="java.util.Date"%>
<%@page import="java.time.ZoneId"%>
<%@page import="java.time.ZonedDateTime"%>
<%@page import="java.time.Instant"%>
<%@page import="java.util.List"%>
<%@page import="user.DAO.MovieDAO"%>
<%@page import="VO.MovieVO"%>
<%@page import="java.time.temporal.ChronoUnit"%>
<%@page import="java.time.LocalDate"%>

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



<meta id="ctl00_og_image" property="og:image"
	content="https://img.cgv.co.kr/WebApp/images/common/logo_new_kakao_prevw.png">
</meta>
<link rel="alternate" href="http://m.cgv.co.kr" />
<link rel="shortcut icon" href="../favicon.ico" type="image/x-icon" />
<title id="ctl00_headerTitle">명화 그 이상의 감동. 띵화관</title>

<link rel="shortcut icon" type="image/x-icon"
	href="https://img.cgv.co.kr/R2014/images/favicon.ico" />
<link rel="stylesheet" media="all" type="text/css"
	href="https://img.cgv.co.kr/R2014/css/webfont.css" />
<link rel="stylesheet" media="all" type="text/css"
	href="https://img.cgv.co.kr/R2014/css/reset.css" />
<link rel="stylesheet" media="all" type="text/css"
	href="../css/layout.css" />
<link rel="stylesheet" media="all" type="text/css"
	href="../css/module.css" />
<link rel="stylesheet" media="all" type="text/css"
	href="https://img.cgv.co.kr/R2014/css/content.css" />
<link rel="stylesheet" media="all" type="text/css"
	href="https://img.cgv.co.kr/R2014/css/common.css" />

<link rel="stylesheet" media="all" type="text/css"
	href="https://img.cgv.co.kr/R2014/css/eggupdate.css" />
<link rel="stylesheet" media="print" type="text/css"
	href="https://img.cgv.co.kr/R2014/css/print.css" />
<link rel="stylesheet" type="text/css"
	href="https://img.cgv.co.kr/R2014/js/jquery.ui/smoothness/jquery-ui-1.10.4.custom.min.css" />

<script type="text/javascript" src="/common/js/extraTheaters.js"></script>
<script type="text/javascript"
	src="https://img.cgv.co.kr/R2014/js/app.config.js"></script>
<script type="text/javascript"
	src="https://img.cgv.co.kr/R2014/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript"
	src="https://img.cgv.co.kr/R2014/js/jquery.plugin/jquery.tmpl.min.js"></script>
<script type="text/javascript"
	src="https://img.cgv.co.kr/R2014/js/jquery.plugin/jquery.validate.js"></script>
<script type="text/javascript"
	src="https://img.cgv.co.kr/R2014/js/jquery.plugin/jquery.paging.min.js"></script>
<script type="text/javascript"
	src="https://img.cgv.co.kr/R2014/js/jquery.ui/jquery-ui-1.10.4.custom.min.js"></script>
<script type="text/javascript"
	src="https://img.cgv.co.kr/R2014/js/jquery.utils.js"></script>
<script type="text/javascript"
	src="https://img.cgv.co.kr/R2014/js/app.utils.js"></script>
<script type="text/javascript"
	src="https://img.cgv.co.kr/R2014/js/jquery.utils.pageing.js"></script>
<script type="text/javascript"
	src="https://img.cgv.co.kr/R2014/js/app.init.js"></script>


<script type="text/javascript"
	src="https://img.cgv.co.kr/R2014/js/jquery.plugin/jquery.dotdotdot.min.js"></script>
<script type="text/javascript"
	src="https://img.cgv.co.kr/R2014/js/silverlight_link.js"></script>
<script src="https://img.cgv.co.kr/R2014/js/slick/slick.js"
	type="text/javascript" charset="utf-8"></script>

<link rel="stylesheet" media="all" type="text/css"
	href="https://img.cgv.co.kr/R2014/css/phototicket/phototicket.css" />
<link rel="stylesheet" media="all" type="text/css"
	href="https://img.cgv.co.kr/R2014/css/slick.css" />
<link rel="stylesheet" media="all" type="text/css"
	href="https://img.cgv.co.kr/R2014/css/slick-theme-custom.css" />

<script type="text/javascript"
	src="https://img.cgv.co.kr/R2014/js/icheck/login.timer.js"></script>
<script src="https://img.cgv.co.kr/R2014/js/icheck/icheck.min.js"
	type="text/javascript" charset="utf-8"></script>
<link rel="stylesheet" type="text/css"
	href="https://img.cgv.co.kr/R2014/js/icheck/iCheck.css" />



<!-- 홈페이지 CSS 일원화로 인한 반영 20220721 -->
<link rel="stylesheet" type="text/css"
	href="https://img.cgv.co.kr/resource_pc/css/cgv.min.css" />
<script type="text/javascript"
	src="https://img.cgv.co.kr/resource_pc/js/cgvUi.js"></script>

<!-- 각페이지 Header Start-->


<script type="text/javascript"
	src="https://img.cgv.co.kr/R2014/js/swiper.min.js"></script>
<link rel="stylesheet" media="all" type="text/css"
	href="https://img.cgv.co.kr/R2014/css/swiper-bundle.min.css" />

<style type="text/css">
</style>

<script type="text/javascript">
	$(document)
			.ready(
					function() {

						$("#btnMovie").click(
								function() { //사용
									$("#movieChart_list").show();
									$("#movieChart_list_Reser").hide();
									$("#btn_allView_Movie").attr("href",
											"/movies/?lt=1&ft=0");
								});

						var movieChartSwiper = new Swiper(
								"#movieChart_list",
								{ // 사용

									slidesPerView : 5,
									spaceBetween : 32,
									slidesPerGroup : 5,
									loopFillGroupWithBlank : true,
									navigation : {
										nextEl : ".swiper-button-next",

										prevEl : ".swiper-button-prev",
									},
									a11y : {
										prevSlideMessage : '이전 슬라이드',
										nextSlideMessage : '다음 슬라이드',
										slideLabelMessage : '총 {{slidesLength}}장의 슬라이드 중 {{index}}번 슬라이드 입니다.',
									},
								});

						var movieChartSwiper2 = new Swiper(
								"#movieChart_list_Reser",
								{

									slidesPerView : 5,
									spaceBetween : 32,
									slidesPerGroup : 5,
									loopFillGroupWithBlank : true,
									navigation : {
										nextEl : ".swiper-button-next",

										prevEl : ".swiper-button-prev",
									},
									a11y : {
										prevSlideMessage : '이전 슬라이드',
										nextSlideMessage : '다음 슬라이드',
										slideLabelMessopenPopupage : '총 {{slidesLength}}장의 슬라이드 중 {{index}}번 슬라이드 입니다.',
									},
								});

						$("#movieChart_list_Reser").hide(); //swiper 랜더링 완료 후 숨기기해야함

						var eventSwiper = new Swiper(
								".event_list",
								{
									autoplay : {
										delay : 2500,
										disableOnInteraction : false,
									},
									slidesPerView : 3,
									spaceBetween : 24,
									slidesPerGroup : 3,
									loopFillGroupWithBlank : true,
									navigation : {
										nextEl : ".swiper-button-next",
										prevEl : ".swiper-button-prev",
									},
									a11y : {
										prevSlideMessage : '이전 슬라이드',
										nextSlideMessage : '다음 슬라이드',
										slideLabelMessage : '총 {{slidesLength}}장의 슬라이드 중 {{index}}번 슬라이드 입니다.',
									},
								});

						var noticeClientBannerSwiper = new Swiper(
								".noticeClient_banner_list", {
									autoplay : {
										delay : 2500,
										disableOnInteraction : false,
									},
									slidesPerView : 1,
									spaceBetween : 0,
									loopFillGroupWithBlank : true,
								});

						if (noticeClientBannerSwiper.autoplay.running) {
							$('.btn_noticeClientBannerControl').addClass(
									'active');
						}

						$('.btn_noticeClientBannerControl').on({
							click : function(e) {
								if (noticeClientBannerSwiper.autoplay.running) {
									$(this).removeClass('active');
									noticeClientBannerSwiper.autoplay.stop();
								} else {
									$(this).addClass('active');
									noticeClientBannerSwiper.autoplay.start();
								}
							}
						});

					});
</script>





<script type="text/javascript">
	_TRK_CP = "/홈";

	app.config('staticDomain', 'https://img.cgv.co.kr/R2014/').config(
			'imageDomain', 'https://img.cgv.co.kr').config('isLogin', 'False');

	function getCookieVal(offset) {
		var endstr = document.cookie.indexOf(";", offset);
		if (endstr == -1)
			endstr = document.cookie.length;
		return unescape(document.cookie.substring(offset, endstr));
	}
</script>
</head>
<body class="">

	<div class="skipnaiv">
		<a href="#contents" id="skipHeader">메인 컨텐츠 바로가기</a>
	</div>
	<div id="cgvwrap">

	<!-- S Header -->
	<jsp:include page="header.jsp"></jsp:include>
	<!-- E Header -->

		<!-- Contaniner -->
		<div id="contaniner" class="">
			<!-- 벽돌 배경이미지 사용 시 class="bg-bricks" 적용 / 배경이미지가 없을 경우 class 삭제  -->


			<!-- Contents Area -->



			<!-- Contents Start -->






			<!-- S > 무비차트 | 상영예정작
  			- Description:
            - 검색 값 있는 경우 영역 미노출
            - 관람제한 (12.png, 15.png, 19.png, all.png, notyet.png)
			 -->
 

 
			<div class="movieChartBeScreen_wrap">
				<div class="contents">
					<div class="movieChartBeScreen_btn_wrap">
						<div class="tabBtn_wrap">
							<h3>
								<a class="active" id="btnMovie">무비차트</a>
							</h3>
						</div>
						<a href="movieChart.jsp" id="btn_allView_Movie"
							class="btn_allView">전체보기</a>
					</div>

					<div class="swiper movieChart_list" id="movieChart_list">
						<div class="swiper-wrapper">
						
						
						
						
						
<%
 
 
 MovieDAO mDAO = MovieDAO.getInstance();
 List<MovieVO> mVO = mDAO.selectMovieList();
 
for (MovieVO tempMovie : mVO) {
	String code = tempMovie.getMovieCode();
    String posterPath = tempMovie.getMoviePosterPath();
    String title = tempMovie.getMovieTitle();
    String rating = tempMovie.getMovieRating(); // All, 12, 15, 18
    
 	// 문자열로 된 날짜
    String movieReleaseDate = tempMovie.getMovieReleaseDate();
    
 	// 문자열을 LocalDate로 변환
    LocalDate specifiedDate = LocalDate.parse(movieReleaseDate);
 	
    // 현재 날짜
    LocalDate today = LocalDate.now();

    // 두 날짜의 차이 계산
    long dDay = ChronoUnit.DAYS.between(today,specifiedDate);
    


%>

<div class="swiper-slide swiper-slide-movie">
    <div class="img_wrap" data-scale="false">

        <img src="../images/movie/<%= posterPath %>" alt="<%= title %>">
        <div class="movieAgeLimit_wrap">
            <!-- 영상물 등급 노출 변경 -->
            <i class="cgvIcon etc age<%= rating %>"><%= rating %></i>
            <!-- 개봉일 - 오늘 -->
            <% if (dDay > 0) { %>
                <i class='cgvIcon etc ageDay' data-before-text='D - <%= dDay %>'>DDay</i>
            <% } %>
        </div>
        <div class="movieChart_btn_wrap">
            <a href= "movieDetail.jsp?midx=<%= code %>"                
                onclick="gaEventLog('PC_메인', '무비차트_영화상세', '<%= title %>');"
                class="btn_movieChart_detail">상세보기</a>
            <a href="ticket.jsp"
                onclick="gaEventLog('PC_메인', '무비차트_예매하기', '<%= title %>')"
                class='btn_movieChart_ticketing'>예매하기</a>
        </div>
    </div>
    <div class="movie_info_wrap">
        <strong class="movieName"><%= title %></strong>
    </div>
</div>

<%
}
%>	
						
						

						</div>

						<div class="swiper-button-next"></div>
						<div class="swiper-button-prev"></div>
					</div>



				</div>
			</div>
			<!-- E > 무비차트 | 상영예정작 -->
			
			
			
			
			
			
			<!-- S > EVENT -->
			<div id="ctl00_PlaceHolderContent_event_wrap" class="event_wrap">
				<div class="contents">
					<div class="event_list_wrap">
						<div class="swiper event_list">
							<div class="swiper-button-next"></div>
							<div class="swiper-button-prev"></div>
						</div>
					</div>
				</div>
			</div>
			<!-- E > EVENT -->






			<!-- S > 공지사항 & 고객센터 -->
			<div class="noticeClient_wrap">
				<div class="contents">
					<div class="noticeClient_container">
						<div class="noticeClient_content">

							<div id="ctl00_PlaceHolderContent_notice_wrap"
								class="notice_wrap">
								<strong>공지사항</strong> <a
									href="/support/news/detail-view.aspx?idx=8004" class="btn_link">[속보]
									장원영 : 명화 , 차은우 : 웅찬</a> <a
									href="http://www.cgv.co.kr/support/news/default.aspx"
									id="notice_more" class="btn_more">더보기</a>
							</div>

							<div class="client_wrap">
								<dl class="client_list">
									<dt>
										<strong>고객센터</strong>
									</dt>
									<dd>
										<strong>3828-4632</strong> <span>고객센터 운영시간 (연중무휴
											00:00~24:00)
											<p>내가 상담하는거 아닌데 알빠노!.</p>
									</dd>
								</dl>

								<div class="client_btn_wrap" id="client_btn_wrap">
									<a href="http://www.cgv.co.kr/support/faq/default.aspx">자주
										찾는 질문</a> <a href="http://www.cgv.co.kr/support/qna/default.aspx">할만한거
										1</a>
									<!--<a href="http://www.cgv.co.kr/support/lost/default.aspx">분실물 문의</a>//-->
									<a href="http://www.cgv.co.kr/support/lease/default.aspx">할만한거2</a>
								</div>
							</div>
						</div>

						<div class="qr_wrap">
							<strong>이스터에그</strong> <span>QR코드를 스캔해보세요</span>
							<div class="img_wrap" data-scale=false>
								<img
									src="https://img.cgv.co.kr/R2014/images/common/img_qrcode.gif"
									alt="QR CODE">
							</div>
							<p>QR코드를 스캔해보세요</p>
						</div>
					</div>
					<div class="noticeClient_banner_wrap">

						<!-- <div class="event_list_wrap"> -->
						<div class="swiper noticeClient_banner_list">
							<div class="swiper-wrapper">
								<div class="swiper-slide" id="divSpecialDiscountData">
									<a id="bannerType1"
										href="http://www.cgv.co.kr/culture-event/event/detailViewUnited.aspx?seq=36641&menu=006">
										<img src="" alt="카카오페이카드"
										onError="onerror=null;javacript:;error_specialDiscountData();" />
									</a>
								</div>

								<div class="swiper-slide">
									<!--211x238-->
									<iframe
										src="https://ad.cgv.co.kr/NetInsight/html/CGV/CGV_201401/main@Branding"
										width="211" height="238" title="" frameborder="0"
										scrolling="no" marginwidth="0" marginheight="0"
										name="Branding" id="Branding"></iframe>
								</div>
							</div>
						</div>
						<a href="#none" class="btn_noticeClientBannerControl">playStop</a>
					</div>
				</div>
			</div>
			<!-- E > 공지사항 & 고객센터 -->

			<script id="temp_popup" type="text/x-jquery-tmpl">

</script>

			<script type="text/javascript"> 

				//oms 
				if ("http://www.cgv.co.kr/culture-event/event/detailViewUnited.aspx?seq=36641&menu=006" == ""
						|| "" == "") {
					error_specialDiscountData();
				}

				//배너이미지가 깨질경우 oms등록 안보이게 처리
				function error_specialDiscountData() {
					$(
							".noticeClient_banner_list > .swiper-wrapper > .swiper-slide:eq(0)")
							.hide();
					$(".btn_noticeClientBannerControl").click();
					$(".btn_noticeClientBannerControl").hide(); //시작중지 버튼
				}

				(function($) {
					$(function() {
						var popupData = {
							'List' : []
						}; //cgv 공지사항
						var userPopupData = []; //고객개인화 처리

						function getCookie(cName) {
							cName = cName + '=';
							var cookieData = document.cookie;
							var start = cookieData.indexOf(cName);
							var cValue = '';
							if (start != -1) {
								start += cName.length;
								var end = cookieData.indexOf(';', start);
								if (end == -1)
									end = cookieData.length;
								cValue = cookieData.substring(start, end);
							}
							return unescape(cValue);
						}

						function setCookie(name, value, expiredays) {
							var todayDate = new Date();
							todayDate.setDate(todayDate.getDate() + expiredays);
							document.cookie = name + "=" + escape(value)
									+ "; path=/; expires="
									+ todayDate.toGMTString() + ";"
						}

						function setCookie_Main(name, value) {
							var todayDate = new Date();

							todayDate.setSeconds(59);
							todayDate.setMinutes(59);
							todayDate.setHours(23);

							document.cookie = name + "=" + escape(value)
									+ "; path=/; expires="
									+ todayDate.toGMTString() + ";"
						}

						function openPopup() {
							var cookie = getCookie("mainpopup");

							if (!popupData || !popupData.List
									|| popupData.List.length < 1
									|| cookie == "true")
								return;

							/* 전체 template */
							var $std = $('.skipnaiv'), options = {
								'$target' : $std,
								'html' : $("#temp_popup").tmpl(popupData)
							};
							app.instWin.add(options);
							/* 위치잡는 스크립트 */
							//var offsetLeft = $('#contaniner').offset().left;
							//$std.next('.layer-wrap').css('left', offsetLeft + 30);
							/* 슬라이더 */
							var popsliderOptions = {
								//2014.09.15 디마팀 방재현님 요청으로 2초로 (수정 default : 4초), 이지용님 요청으로 3초로 재수정
								'term' : 3000,
								'effect' : 'none',
								'auto' : true,
								callback : function(_index) {
									$('.noti-num strong').text(_index + 1);
								}
							};
							$('#mainNoticeSlider').visualMotion(
									popsliderOptions);
						}

						openPopup();

						var uAgent = navigator.userAgent;

						if (uAgent.indexOf("NT 5.1") != -1) {
							$.fn.openPopup('pop_supportOS');
						} else if (uAgent.indexOf("MSIE 6") > 0
								|| uAgent.indexOf("MSIE 7") > 0
								|| uAgent.indexOf("MSIE 8") > 0) {
							$.fn.openPopup('pop_supportBrower'); // IE버전     
						}

						OpenSystemPopup();

						$("#btn_allView_Movie")
								.on(
										{
											click : function() {

												var action = $(".movieChartBeScreen_btn_wrap > .tabBtn_wrap > h3 > .active")[0].innerText;
												gaEventLog('PC_메인', action
														+ " 더보기", '');
											}
										});
						$("#btn_allView_Event").on({
							click : function() {
								gaEventLog('PC_메인', "이벤트 더보기", '');
							}
						});
						$("#btn_allView_Special").on({
							click : function() {
								gaEventLog('PC_메인', "특별관 더보기", '');
							}
						});

						//공지사항 더보기 - 사용
						$("#notice_more").on({
							click : function() {
								gaEventLog('PC_메인', '공지사항_더보기', '');
							}
						});

						//공지사항 클릭
						$(".notice_wrap > .btn_link").on({
							click : function() {
								gaEventLog('PC_메인', '공지사항', '');
							}
						});
						//FAQ, 1:1문의, 분실물 문의, 대관/단체 문의 클릭
						$("#client_btn_wrap >  a").on({
							click : function() {
								gaEventLog('PC_메인', this.text, '');
							}
						});
						//하단배너 1
						$("#bannerType1").on({
							click : function() {
								gaEventLog('PC_메인', '하단배너1', '');
							}
						});

					});
				})(jQuery);
			</script>



			<!--/ Contents End -->

			<!-- /Contents Area -->
		</div>
		<!-- E Contaniner -->



		<!-- S 예매하기 및 TOP Fixed 버튼 -->
	<jsp:include page="sideTicketingAndTop.jsp"/>
		<!-- E 예매하기 및 TOP Fixed 버튼 -->

	
		<!-- S footer_area -->
	<jsp:include page="footer.jsp"/>
		<!-- E footer_area -->
		


	</div>








</body>
</html>