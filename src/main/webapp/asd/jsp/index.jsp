<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
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
<link rel="shortcut icon"
	href="https://img.cgv.co.kr/theater_img/favicon.ico"
	type="image/x-icon" />
<title id="ctl00_headerTitle">명화 그 이상의 감동. CGV</title>

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


			<input type="hidden" id="isOpenUserEmailYNPopup"
				name="isOpenUserEmailYNPopup" value="False" />



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
						<a href="/movies/?lt=1&ft=0" id="btn_allView_Movie"
							class="btn_allView">전체보기</a>
					</div>

					<div class="swiper movieChart_list" id="movieChart_list">
						<div class="swiper-wrapper">

							<div class="swiper-slide swiper-slide-movie">
								<div class="img_wrap" data-scale="false">
									<img src="../images/KakaoTalk_20240419_162826511.jpg"
										alt="범죄도시4" onerror="errorImage(this)">
									<div class="movieAgeLimit_wrap">
										<!-- 영상물 등급 노출 변경 2022.08.24 -->
										<i class="cgvIcon etc ageAll">All</i> <i
											class="cgvIcon etc age12">12</i> <i class="cgvIcon etc age15">15</i>
										<i class="cgvIcon etc age18">18</i>
										<!-- <img src="https://img.cgv.co.kr/R2014/images/common/flag/age/15.png" alt="15세"> -->
										<!-- <div class='dDay_wrap'><span>5</span></div>-->
										<i class='cgvIcon etc ageDay' data-before-text='D - 365'>D
											Day</i>

									</div>
									<div class="movieChart_btn_wrap">
										<a href="/movies/detail-view/?midx=88104"
											onclick="gaEventLog('PC_메인', '무비차트_영화상세', '범죄도시4');"
											class="btn_movieChart_detail">상세보기</a> <a
											href="/ticket/?MOVIE_CD=20035938&MOVIE_CD_GROUP=20035938"
											onclick="gaEventLog('PC_메인', '무비차트_예매하기','범죄도시4')"
											class='btn_movieChart_ticketing'>예매하기</a>


									</div>
								</div>
								<div class="movie_info_wrap">
									<strong class="movieName">웅찬도시4</strong> <span>예매율 68.6%</span>
								</div>
							</div>

							<div class="swiper-slide swiper-slide-movie">
								<div class="img_wrap" data-scale="false">
									<img src="../images/KakaoTalk_20240419_162826511.jpg"
										alt="쿵푸팬더4" onerror="errorImage(this)">
									<div class="movieAgeLimit_wrap">
										<!-- 영상물 등급 노출 변경 2022.08.24 -->
										<i class="cgvIcon etc ageAll">All</i> <i
											class="cgvIcon etc age12">12</i> <i class="cgvIcon etc age15">15</i>
										<i class="cgvIcon etc age18">18</i>
										<!-- <img src="https://img.cgv.co.kr/R2014/images/common/flag/age/All.png" alt="All세"> -->
										<!-- -->
										<i class='cgvIcon etc ageDay' data-before-text='D - 3'>D
											Day</i>



									</div>
									<div class="movieChart_btn_wrap">
										<a href="/movies/detail-view/?midx=87948"
											onclick="gaEventLog('PC_메인', '무비차트_영화상세', '쿵푸팬더4');"
											class="btn_movieChart_detail">상세보기</a> <a
											href="/ticket/?MOVIE_CD=20036058&MOVIE_CD_GROUP=20035291"
											onclick="gaEventLog('PC_메인', '무비차트_예매하기','쿵푸팬더4')"
											class='btn_movieChart_ticketing'>예매하기</a>


									</div>
								</div>
								<div class="movie_info_wrap">
									<strong class="movieName">웅찬팬더4</strong> <span>예매율 9.0%</span>
								</div>
							</div>

							<div class="swiper-slide swiper-slide-movie">
								<div class="img_wrap" data-scale="false">
									<img src="../images/KakaoTalk_20240419_162826511.jpg"
										alt="슈가│어거스트 디 투어 ‘디-데이’ 더 무비" onerror="errorImage(this)">
									<div class="movieAgeLimit_wrap">
										<!-- 영상물 등급 노출 변경 2022.08.24 -->
										<i class="cgvIcon etc ageAll">All</i> <i
											class="cgvIcon etc age12">12</i> <i class="cgvIcon etc age15">15</i>
										<i class="cgvIcon etc age18">18</i>
										<!-- <img src="https://img.cgv.co.kr/R2014/images/common/flag/age/12.png" alt="12세"> -->
										<!-- -->
										<i class='cgvIcon etc ageDay' data-before-text='D - 2'>D
											Day</i>


									</div>
									<div class="movieChart_btn_wrap">
										<a href="/movies/detail-view/?midx=88110"
											onclick="gaEventLog('PC_메인', '무비차트_영화상세', '슈가│어거스트 디 투어 ‘디-데이’ 더 무비');"
											class="btn_movieChart_detail">상세보기</a> <a
											href="/ticket/?MOVIE_CD=20036129&MOVIE_CD_GROUP=20035956"
											onclick="gaEventLog('PC_메인', '무비차트_예매하기','슈가│어거스트 디 투어 ‘디-데이’ 더 무비')"
											class='btn_movieChart_ticketing'>예매하기</a>


									</div>
								</div>
								<div class="movie_info_wrap">
									<strong class="movieName">웅찬│어거스트 디 투어 ‘디-데이’ 더 무비</strong> <span>예매율
										4.7%</span>
								</div>
							</div>

							<div class="swiper-slide swiper-slide-movie">
								<div class="img_wrap" data-scale="false">
									<img src="../images/KakaoTalk_20240419_162826511.jpg"
										alt="듄-파트2" onerror="errorImage(this)">
									<div class="movieAgeLimit_wrap">
										<!-- 영상물 등급 노출 변경 2022.08.24 -->
										<i class="cgvIcon etc ageAll">All</i> <i
											class="cgvIcon etc age12">12</i> <i class="cgvIcon etc age15">15</i>
										<i class="cgvIcon etc age18">18</i>
										<!-- <img src="https://img.cgv.co.kr/R2014/images/common/flag/age/12.png" alt="12세"> -->
										<!-- -->
										<i class='cgvIcon etc ageDay' data-before-text='D - 1'>D
											Day</i>


									</div>

									<div class="movieChart_btn_wrap">
										<a href="/movies/detail-view/?midx=87947"
											onclick="gaEventLog('PC_메인', '무비차트_영화상세', '듄-파트2');"
											class="btn_movieChart_detail">상세보기</a> <a
											href="/ticket/?MOVIE_CD=20035290&MOVIE_CD_GROUP=20035290"
											onclick="gaEventLog('PC_메인', '무비차트_예매하기','듄-파트2')"
											class='btn_movieChart_ticketing'>예매하기</a>


									</div>
								</div>
								<div class="movie_info_wrap">
									<strong class="movieName">웅찬-파트2</strong> <span>예매율 3.4%</span>
								</div>
							</div>

							<div class="swiper-slide swiper-slide-movie">
								<div class="img_wrap" data-scale="false">
									<img src="../images/KakaoTalk_20240419_162826511.jpg" alt="파묘"
										onerror="errorImage(this)">
									<div class="movieAgeLimit_wrap">
										<!-- 영상물 등급 노출 변경 2022.08.24 -->
										<i class="cgvIcon etc ageAll">All</i> <i
											class="cgvIcon etc age12">12</i> <i class="cgvIcon etc age15">15</i>
										<i class="cgvIcon etc age18">18</i>
										<!-- <img src="https://img.cgv.co.kr/R2014/images/common/flag/age/15.png" alt="15세"> -->
										<!-- -->
										<i class='cgvIcon etc ageDay' data-before-text='D - 0'>D
											Day</i>


									</div>

									<div class="movieChart_btn_wrap">
										<a href="/movies/detail-view/?midx=88012"
											onclick="gaEventLog('PC_메인', '무비차트_영화상세', '파묘');"
											class="btn_movieChart_detail">상세보기</a> <a
											href="/ticket/?MOVIE_CD=20035675&MOVIE_CD_GROUP=20035602"
											onclick="gaEventLog('PC_메인', '무비차트_예매하기','파묘')"
											class='btn_movieChart_ticketing'>예매하기</a>


									</div>
								</div>
								<div class="movie_info_wrap">
									<strong class="movieName">파묘</strong> <span>예매율 2.4%</span>
								</div>
							</div>

							<div class="swiper-slide swiper-slide-movie">
								<div class="img_wrap" data-scale="false">
									<img
										src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88103/88103_320.jpg"
										alt="고스트버스터즈: 오싹한 뉴욕" onerror="errorImage(this)">
									<div class="movieAgeLimit_wrap">
										<!-- 영상물 등급 노출 변경 2022.08.24 -->
										<i class="cgvIcon etc ageAll">All</i> <i
											class="cgvIcon etc age12">12</i> <i class="cgvIcon etc age15">15</i>
										<i class="cgvIcon etc age18">18</i>
										<!-- <img src="https://img.cgv.co.kr/R2014/images/common/flag/age/12.png" alt="12세"> -->
										<!-- -->



									</div>

									<div class="movieChart_btn_wrap">
										<a href="/movies/detail-view/?midx=88103"
											onclick="gaEventLog('PC_메인', '무비차트_영화상세', '고스트버스터즈: 오싹한 뉴욕');"
											class="btn_movieChart_detail">상세보기</a> <a
											href="/ticket/?MOVIE_CD=20036276&MOVIE_CD_GROUP=20035937"
											onclick="gaEventLog('PC_메인', '무비차트_예매하기','고스트버스터즈: 오싹한 뉴욕')"
											class='btn_movieChart_ticketing'>예매하기</a>


									</div>
								</div>
								<div class="movie_info_wrap">
									<strong class="movieName">고스트버스터즈: 오싹한 뉴욕</strong> <span>예매율
										1.5%</span>
								</div>
							</div>

							<div class="swiper-slide swiper-slide-movie">
								<div class="img_wrap" data-scale="false">
									<img
										src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88126/88126_320.jpg"
										alt="남은 인생 10년" onerror="errorImage(this)">
									<div class="movieAgeLimit_wrap">
										<!-- 영상물 등급 노출 변경 2022.08.24 -->
										<i class="cgvIcon etc age12">12</i>
										<!-- <img src="https://img.cgv.co.kr/R2014/images/common/flag/age/12.png" alt="12세"> -->
										<!-- -->


									</div>

									<div class="movieChart_btn_wrap">
										<a href="/movies/detail-view/?midx=88126"
											onclick="gaEventLog('PC_메인', '무비차트_영화상세', '남은 인생 10년');"
											class="btn_movieChart_detail">상세보기</a> <a
											href="/ticket/?MOVIE_CD=20036007&MOVIE_CD_GROUP=20036007"
											onclick="gaEventLog('PC_메인', '무비차트_예매하기','남은 인생 10년')"
											class='btn_movieChart_ticketing'>예매하기</a>


									</div>
								</div>
								<div class="movie_info_wrap">
									<strong class="movieName">남은 인생 10년</strong> <span>예매율
										1.3%</span>
								</div>
							</div>

							<div class="swiper-slide swiper-slide-movie">
								<div class="img_wrap" data-scale="false">
									<img
										src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88080/88080_320.jpg"
										alt="극장판 스파이 패밀리 코드-화이트" onerror="errorImage(this)">
									<div class="movieAgeLimit_wrap">
										<!-- 영상물 등급 노출 변경 2022.08.24 -->
										<i class="cgvIcon etc age12">12</i>
										<!-- <img src="https://img.cgv.co.kr/R2014/images/common/flag/age/12.png" alt="12세"> -->
										<!-- -->


									</div>

									<div class="movieChart_btn_wrap">
										<a href="/movies/detail-view/?midx=88080"
											onclick="gaEventLog('PC_메인', '무비차트_영화상세', '극장판 스파이 패밀리 코드-화이트');"
											class="btn_movieChart_detail">상세보기</a> <a
											href="/ticket/?MOVIE_CD=20035871&MOVIE_CD_GROUP=20035871"
											onclick="gaEventLog('PC_메인', '무비차트_예매하기','극장판 스파이 패밀리 코드-화이트')"
											class='btn_movieChart_ticketing'>예매하기</a>


									</div>
								</div>
								<div class="movie_info_wrap">
									<strong class="movieName">극장판 스파이 패밀리 코드-화이트</strong> <span>예매율
										0.9%</span>
								</div>
							</div>

							<div class="swiper-slide swiper-slide-movie">
								<div class="img_wrap" data-scale="false">
									<img
										src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88077/88077_320.jpg"
										alt="댓글부대" onerror="errorImage(this)">
									<div class="movieAgeLimit_wrap">
										<!-- 영상물 등급 노출 변경 2022.08.24 -->
										<i class="cgvIcon etc age15">15</i>
										<!-- <img src="https://img.cgv.co.kr/R2014/images/common/flag/age/15.png" alt="15세"> -->
										<!-- -->


									</div>

									<div class="movieChart_btn_wrap">
										<a href="/movies/detail-view/?midx=88077"
											onclick="gaEventLog('PC_메인', '무비차트_영화상세', '댓글부대');"
											class="btn_movieChart_detail">상세보기</a> <a
											href="/ticket/?MOVIE_CD=20035991&MOVIE_CD_GROUP=20035868"
											onclick="gaEventLog('PC_메인', '무비차트_예매하기','댓글부대')"
											class='btn_movieChart_ticketing'>예매하기</a>


									</div>
								</div>
								<div class="movie_info_wrap">
									<strong class="movieName">댓글부대</strong> <span>예매율 0.7%</span>
								</div>
							</div>

							<div class="swiper-slide swiper-slide-movie">
								<div class="img_wrap" data-scale="false">
									<img
										src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88086/88086_320.jpg"
										alt="기동전사 건담 시드 프리덤" onerror="errorImage(this)">
									<div class="movieAgeLimit_wrap">
										<!-- 영상물 등급 노출 변경 2022.08.24 -->
										<i class="cgvIcon etc age12">12</i>
										<!-- <img src="https://img.cgv.co.kr/R2014/images/common/flag/age/12.png" alt="12세"> -->
										<!-- -->


									</div>

									<div class="movieChart_btn_wrap">
										<a href="/movies/detail-view/?midx=88086"
											onclick="gaEventLog('PC_메인', '무비차트_영화상세', '기동전사 건담 시드 프리덤');"
											class="btn_movieChart_detail">상세보기</a> <a
											href="/ticket/?MOVIE_CD=20035904&MOVIE_CD_GROUP=20035904"
											onclick="gaEventLog('PC_메인', '무비차트_예매하기','기동전사 건담 시드 프리덤')"
											class='btn_movieChart_ticketing'>예매하기</a>


									</div>
								</div>
								<div class="movie_info_wrap">
									<strong class="movieName">기동전사 건담 시드 프리덤</strong> <span>
										<span>예매율 0.7%</span>
								</div>
							</div>

							<div class="swiper-slide swiper-slide-movie">
								<div class="img_wrap" data-scale="false">
									<img
										src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88043/88043_320.jpg"
										alt="오멘-저주의 시작" onerror="errorImage(this)">
									<div class="movieAgeLimit_wrap">
										<!-- 영상물 등급 노출 변경 2022.08.24 -->
										<i class="cgvIcon etc age15">15</i>
										<!-- <img src="https://img.cgv.co.kr/R2014/images/common/flag/age/15.png" alt="15세"> -->
										<!-- -->


									</div>

									<div class="movieChart_btn_wrap">
										<a href="/movies/detail-view/?midx=88043"
											onclick="gaEventLog('PC_메인', '무비차트_영화상세', '오멘-저주의 시작');"
											class="btn_movieChart_detail">상세보기</a> <a
											href="/ticket/?MOVIE_CD=20035783&MOVIE_CD_GROUP=20035783"
											onclick="gaEventLog('PC_메인', '무비차트_예매하기','오멘-저주의 시작')"
											class='btn_movieChart_ticketing'>예매하기</a>


									</div>
								</div>
								<div class="movie_info_wrap">
									<strong class="movieName">오멘-저주의 시작</strong> <span>예매율
										0.6%</span>
								</div>
							</div>

							<div class="swiper-slide swiper-slide-movie">
								<div class="img_wrap" data-scale="false">
									<img
										src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88203/88203_320.jpg"
										alt="성우 남도형 에세이-인생은 파랑 출간 기념회&생일 팬미팅"
										onerror="errorImage(this)">
									<div class="movieAgeLimit_wrap">
										<!-- 영상물 등급 노출 변경 2022.08.24 -->
										<i class="cgvIcon etc ageAll">All</i>
										<!-- <img src="https://img.cgv.co.kr/R2014/images/common/flag/age/All.png" alt="All세"> -->
										<!-- <div class='dDay_wrap'><span>1</span></div>-->
										<i class='cgvIcon etc ageDay' data-before-text='D - 1'>D
											Day</i>

									</div>

									<div class="movieChart_btn_wrap">
										<a href="/movies/detail-view/?midx=88203"
											onclick="gaEventLog('PC_메인', '무비차트_영화상세', '성우 남도형 에세이-인생은 파랑 출간 기념회&생일 팬미팅');"
											class="btn_movieChart_detail">상세보기</a> <a
											href="/ticket/?MOVIE_CD=20036330&MOVIE_CD_GROUP=20036330"
											onclick="gaEventLog('PC_메인', '무비차트_예매하기','성우 남도형 에세이-인생은 파랑 출간 기념회&생일 팬미팅')"
											class='btn_movieChart_ticketing'>예매하기</a>


									</div>
								</div>
								<div class="movie_info_wrap">
									<strong class="movieName">성우 남도형 에세이-인생은 파랑 출간 기념회&생일
										팬미팅</strong> <span>예매율 0.4%</span>
								</div>
							</div>

							<div class="swiper-slide swiper-slide-movie">
								<div class="img_wrap" data-scale="false">
									<img
										src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000078/78723/78723_320.jpg"
										alt="캐롤" onerror="errorImage(this)">
									<div class="movieAgeLimit_wrap">
										<!-- 영상물 등급 노출 변경 2022.08.24 -->
										<i class="cgvIcon etc age18">18</i>
										<!-- <img src="https://img.cgv.co.kr/R2014/images/common/flag/age/18.png" alt="18세"> -->
										<!-- -->


									</div>

									<div class="movieChart_btn_wrap">
										<a href="/movies/detail-view/?midx=78723"
											onclick="gaEventLog('PC_메인', '무비차트_영화상세', '캐롤');"
											class="btn_movieChart_detail">상세보기</a> <a
											href="/ticket/?MOVIE_CD=20036310&MOVIE_CD_GROUP=20009174"
											onclick="gaEventLog('PC_메인', '무비차트_예매하기','캐롤')"
											class='btn_movieChart_ticketing'>예매하기</a>


									</div>
								</div>
								<div class="movie_info_wrap">
									<strong class="movieName">캐롤</strong> <span>예매율 0.3%</span>
								</div>
							</div>

							<div class="swiper-slide swiper-slide-movie">
								<div class="img_wrap" data-scale="false">
									<img
										src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88179/88179_320.jpg"
										alt="챌린저스" onerror="errorImage(this)">
									<div class="movieAgeLimit_wrap">
										<!-- 영상물 등급 노출 변경 2022.08.24 -->
										<i class="cgvIcon etc age15">15</i>
										<!-- <img src="https://img.cgv.co.kr/R2014/images/common/flag/age/15.png" alt="15세"> -->
										<!-- <div class='dDay_wrap'><span>5</span></div>-->
										<i class='cgvIcon etc ageDay' data-before-text='D - 5'>D
											Day</i>

									</div>

									<div class="movieChart_btn_wrap">
										<a href="/movies/detail-view/?midx=88179"
											onclick="gaEventLog('PC_메인', '무비차트_영화상세', '챌린저스');"
											class="btn_movieChart_detail">상세보기</a> <a
											href="/ticket/?MOVIE_CD=20036262&MOVIE_CD_GROUP=20036262"
											onclick="gaEventLog('PC_메인', '무비차트_예매하기','챌린저스')"
											class='btn_movieChart_ticketing'>예매하기</a>


									</div>
								</div>
								<div class="movie_info_wrap">
									<strong class="movieName">챌린저스</strong> <span>예매율 0.3%</span>
								</div>
							</div>

							<div class="swiper-slide swiper-slide-movie">
								<div class="img_wrap" data-scale="false">
									<img
										src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88132/88132_320.jpg"
										alt="땅에 쓰는 시" onerror="errorImage(this)">
									<div class="movieAgeLimit_wrap">
										<!-- 영상물 등급 노출 변경 2022.08.24 -->
										<i class="cgvIcon etc ageAll">All</i>
										<!-- <img src="https://img.cgv.co.kr/R2014/images/common/flag/age/All.png" alt="All세"> -->
										<!-- -->


									</div>

									<div class="movieChart_btn_wrap">
										<a href="/movies/detail-view/?midx=88132"
											onclick="gaEventLog('PC_메인', '무비차트_영화상세', '땅에 쓰는 시');"
											class="btn_movieChart_detail">상세보기</a> <a
											href="/ticket/?MOVIE_CD=20036031&MOVIE_CD_GROUP=20036031"
											onclick="gaEventLog('PC_메인', '무비차트_예매하기','땅에 쓰는 시')"
											class='btn_movieChart_ticketing'>예매하기</a>


									</div>
								</div>
								<div class="movie_info_wrap">
									<strong class="movieName">땅에 쓰는 시</strong> <span>예매율
										0.2%</span>
								</div>
							</div>

							<div class="swiper-slide swiper-slide-movie">
								<div class="img_wrap" data-scale="false">
									<img
										src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88092/88092_320.jpg"
										alt="유미의 세포들 더 무비" onerror="errorImage(this)">
									<div class="movieAgeLimit_wrap">
										<!-- 영상물 등급 노출 변경 2022.08.24 -->
										<i class="cgvIcon etc ageAll">All</i>
										<!-- <img src="https://img.cgv.co.kr/R2014/images/common/flag/age/All.png" alt="All세"> -->
										<!-- -->


									</div>

									<div class="movieChart_btn_wrap">
										<a href="/movies/detail-view/?midx=88092"
											onclick="gaEventLog('PC_메인', '무비차트_영화상세', '유미의 세포들 더 무비');"
											class="btn_movieChart_detail">상세보기</a> <a
											href="/ticket/?MOVIE_CD=20036103&MOVIE_CD_GROUP=20035911"
											onclick="gaEventLog('PC_메인', '무비차트_예매하기','유미의 세포들 더 무비')"
											class='btn_movieChart_ticketing'>예매하기</a>


									</div>
								</div>
								<div class="movie_info_wrap">
									<strong class="movieName">유미의 세포들 더 무비</strong> <span>예매율
										0.2%</span>
								</div>
							</div>

							<div class="swiper-slide swiper-slide-movie">
								<div class="img_wrap" data-scale="false">
									<img
										src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000084/84945/84945_320.jpg"
										alt="듄" onerror="errorImage(this)">
									<div class="movieAgeLimit_wrap">
										<!-- 영상물 등급 노출 변경 2022.08.24 -->
										<i class="cgvIcon etc age12">12</i>
										<!-- <img src="https://img.cgv.co.kr/R2014/images/common/flag/age/12.png" alt="12세"> -->
										<!-- -->


									</div>

									<div class="movieChart_btn_wrap">
										<a href="/movies/detail-view/?midx=84945"
											onclick="gaEventLog('PC_메인', '무비차트_영화상세', '듄');"
											class="btn_movieChart_detail">상세보기</a> <a
											href="/ticket/?MOVIE_CD=20036355&MOVIE_CD_GROUP=20027588"
											onclick="gaEventLog('PC_메인', '무비차트_예매하기','듄')"
											class='btn_movieChart_ticketing'>예매하기</a>


									</div>
								</div>
								<div class="movie_info_wrap">
									<strong class="movieName">듄</strong> <span>예매율 0.2%</span>
								</div>
							</div>

							<div class="swiper-slide swiper-slide-movie">
								<div class="img_wrap" data-scale="false">
									<img
										src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88189/88189_320.jpg"
										alt="쇼잉 업(MCFF)" onerror="errorImage(this)">
									<div class="movieAgeLimit_wrap">
										<!-- 영상물 등급 노출 변경 2022.08.24 -->
										<i class="cgvIcon etc age12">12</i>
										<!-- <img src="https://img.cgv.co.kr/R2014/images/common/flag/age/12.png" alt="12세"> -->
										<!-- <div class='dDay_wrap'><span>7</span></div>-->
										<i class='cgvIcon etc ageDay' data-before-text='D - 7'>D
											Day</i>

									</div>

									<div class="movieChart_btn_wrap">
										<a href="/movies/detail-view/?midx=88189"
											onclick="gaEventLog('PC_메인', '무비차트_영화상세', '쇼잉 업(MCFF)');"
											class="btn_movieChart_detail">상세보기</a> <a
											href="/ticket/?MOVIE_CD=20036280&MOVIE_CD_GROUP=20036280"
											onclick="gaEventLog('PC_메인', '무비차트_예매하기','쇼잉 업(MCFF)')"
											class='btn_movieChart_ticketing'>예매하기</a>


									</div>
								</div>
								<div class="movie_info_wrap">
									<strong class="movieName">쇼잉 업(MCFF)</strong> <span>예매율
										0.2%</span>
								</div>
							</div>

							<div class="swiper-slide swiper-slide-movie">
								<div class="img_wrap" data-scale="false">
									<img
										src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88135/88135_320.jpg"
										alt="고질라 X 콩-뉴 엠파이어" onerror="errorImage(this)">
									<div class="movieAgeLimit_wrap">
										<!-- 영상물 등급 노출 변경 2022.08.24 -->
										<i class="cgvIcon etc age12">12</i>
										<!-- <img src="https://img.cgv.co.kr/R2014/images/common/flag/age/12.png" alt="12세"> -->
										<!-- -->


									</div>

									<div class="movieChart_btn_wrap">
										<a href="/movies/detail-view/?midx=88135"
											onclick="gaEventLog('PC_메인', '무비차트_영화상세', '고질라 X 콩-뉴 엠파이어');"
											class="btn_movieChart_detail">상세보기</a> <a
											href="/ticket/?MOVIE_CD=20036044&MOVIE_CD_GROUP=20036044"
											onclick="gaEventLog('PC_메인', '무비차트_예매하기','고질라 X 콩-뉴 엠파이어')"
											class='btn_movieChart_ticketing'>예매하기</a>


									</div>
								</div>
								<div class="movie_info_wrap">
									<strong class="movieName">고질라 X 콩-뉴 엠파이어</strong> <span>예매율
										0.2%</span>
								</div>
							</div>

							<div class="swiper-slide swiper-slide-movie">
								<div class="img_wrap" data-scale="false">
									<img
										src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88124/88124_320.jpg"
										alt="에스파: 월드 투어 인 시네마" onerror="errorImage(this)">
									<div class="movieAgeLimit_wrap">
										<!-- 영상물 등급 노출 변경 2022.08.24 -->
										<i class="cgvIcon etc ageAll">All</i>
										<!-- <img src="https://img.cgv.co.kr/R2014/images/common/flag/age/All.png" alt="All세"> -->
										<!-- -->


									</div>

									<div class="movieChart_btn_wrap">
										<a href="/movies/detail-view/?midx=88124"
											onclick="gaEventLog('PC_메인', '무비차트_영화상세', '에스파: 월드 투어 인 시네마');"
											class="btn_movieChart_detail">상세보기</a> <a
											href="/ticket/?MOVIE_CD=20036000&MOVIE_CD_GROUP=20036000"
											onclick="gaEventLog('PC_메인', '무비차트_예매하기','에스파: 월드 투어 인 시네마')"
											class='btn_movieChart_ticketing'>예매하기</a>


									</div>
								</div>
								<div class="movie_info_wrap">
									<strong class="movieName">에스파: 월드 투어 인 시네마</strong> <span>예매율
										0.2%</span>
								</div>
							</div>


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
				//<![CDATA[
				//CGV 공지 팝업 주석처리
				//function getCookie(name) {
				//    var nameOfCookie = name + "=";
				//    var x = 0;
				//    while (x <= document.cookie.length) {
				//        var y = (x + nameOfCookie.length);
				//        if (document.cookie.substring(x, y) == nameOfCookie) {
				//            if ((endOfCookie = document.cookie.indexOf(";", y)) == -1)
				//                endOfCookie = document.cookie.length;
				//            return unescape(document.cookie.substring(y, endOfCookie));
				//        }
				//        x = document.cookie.indexOf(" ", x) + 1;
				//        if (x == 0)
				//            break;
				//    }
				//    return "";
				//}    
				//if (getCookie("cgv_notice") != "done") {
				//    var spcwin = window.open('/popup/1411_personal_popup_1107_v2.html', 'cgv_notice', "height=414,width=280,menubar=no,scrollbars=no,resizeable=no,toolbar=no,left=355,top=100")
				//    spcwin.focus();        
				//}       

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
		<div class="fixedBtn_wrap">

			<a href="/ticket/" class="btn_fixedTicketing">예매하기</a> <a
				href="#none" class="btn_gotoTop"><img
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