<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info="로그인 후 좌석 선택 페이지"%>
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
<title id="ctl00_headerTitle">예매 | 명화 그 이상의 감동. CGV</title>

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
<link rel="stylesheet"
	href="http://img.cgv.co.kr/CGV_RIA/Ticket/Common/css/2024/0325/FORM_TYPE/reservation_tnb.css">

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


<!-- 예매 CSS, JS -->
<link
	href="https://www.cineq.co.kr/bundles/css?v=oiZxrFB4-kROndwe9FLU4L2IiIJAaPO8AdRMkkO1wbE1"
	rel="stylesheet">
<script
	src="https://www.cineq.co.kr/bundles/script?v=BivSx9O848D5V0Qog32Mgvmnh92IWQV9phYbkYbZeJg1"></script>
<!-- 예매 CSS, JS -->

<!-- 로그인/로그아웃 script 시작 -->
<!-- <script type="text/javascript">
    $(function () {
        $(".nomemberloginpop").click(function () {
            if ($(this).prop("tagName") == "A") {
                var redirect = $(this).prop("href");
                $.desktop.login.openNoMember(function () {
                    window.location.href = redirect;
                });
            } else {
                window.location.reload(true);
            }
            return false;
        });

        $(".loginpop").click(function (e) {
            if ($("header").data("loginstatus") == 0) {
                e.preventDefault();
                var redirect = $(this).data("redirect"), reload = $(this).data("reload"), callback = $(this).data("callback");
                if (callback != null && callback != "") {
                    $.desktop.login.open(function (phoneStatus, isNomember) {
                        if (isNomember) {
                            window.location.reload(true);
                            return;
                        }
                        var _callback = eval(callback); _callback.apply();
                    });
                }
                else if (reload != null && reload != "") { $.desktop.login.open(function () { window.location.reload(true); }); }
                else if (redirect != null && redirect != "") {
                    $.desktop.login.open(function (phoneStatus, isNomember) {
                        if (isNomember) {
                            window.location.reload(true);
                            return;
                        }
                        window.location.href = redirect;
                    });
                }
                else if ($(this).prop("tagName") == "A") {
                    redirect = $(this).prop("href"); $.desktop.login.open(function (phoneStatus, isNomember) {
                        if (isNomember) {
                            window.location.reload(true);
                            return;
                        }
                        window.location.href = redirect;
                    });
                }
                return false;
            }
        });
    });
</script>
<script type="text/javascript">
    $(function () {
        $("header").on("click", ".logoutpop", function () {
            $.ajax({
                url: "/Member/LogoutPop",
                dataType: "json",
                method: "POST",
                success: function (data) {
                    if (data.ResultCode == 1) {
                        $.desktop.login.logout(
                            function () { window.location.href = "/"; }
                        )
                    }
                    else {
                        alert(data.Message);
                    }
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("로그아웃 시도중 오류가 발생하였습니다.");
                    console.log(errorThrown);
                }
            });
            return false;
        });
    });
</script> -->
<!-- 로그인/로그아웃 script 종료 -->

</head>
<body class="">

	<div class="skipnaiv">
		<a href="#contents" id="skipHeader">메인 컨텐츠 바로가기</a>
	</div>

	<div id="wrap">
		<!-- S Header -->
		<jsp:include page="header.jsp"></jsp:include>
		<!-- E Header -->

		<!-- Contaniner -->
		<div id="container" class>
			<!-- Contents Area -->
			<div id="contents" class style="padding-bottom: 0px;">
				<!-- Contents Start -->
				<input type="hidden" id="isOpenUserEmailYNPopup"
					name="isOpenUserEmailYNPopup" value="False" />

				<!-- 좌석 선택 본문 -->
				<div class="popup seatChoice" data-theatercode="1001"
					data-moviecode="20249318" data-playdate="20240502"
					data-screenplanid="792105">
					<div class="section-pop-top">
						<h3 class="title">인원/좌석선택</h3>
						<a href="#" class="btn-rsv-reset">다시 예매</a>
					</div>

					<div class="section-pop-movie">
						<img
							src="https://file.cineq.co.kr/i.aspx?movieid=20249318&amp;size=210"
							class="poster" alt="포스터">

						<div class="title">
							<span class="rate-15">15</span>챌린저스
						</div>
						<table class="table-movie-info">
							<tbody>
								<tr>
									<th>영화관</th>
									<td>신도림</td>
								</tr>
								<tr>
									<th>상영관</th>
									<td>8관</td>
								</tr>
								<tr>
									<th>날짜</th>
									<td>2024.05.02(목)</td>
								</tr>
								<tr>
									<th>시간</th>
									<td class="time">18:25</td>
								</tr>
								<tr>
									<th>인원</th>
									<td class="number"></td>
								</tr>
								<tr>
									<th>좌석</th>
									<td class="seats"></td>
								</tr>
							</tbody>
						</table>

						<span class="total-price"><span>0</span> 원</span>

					</div>
					<!--.section-pop-movie-->

					<div class="section-pop-theater">
						<div class="wrap-number-info">
							<span class="kind">인원</span>
							<select class="input-select id_2780"
								data-salepriceid="2780" data-price="13000"
								data-salepricename="성인" data-salepricecode="106">
								<option value="0">0 명</option>
								<option value="1">1 명</option>
								<option value="2">2 명</option>
								<option value="3">3 명</option>
								<option value="4">4 명</option>
								<option value="5">5 명</option>
								<option value="6">6 명</option>
								<option value="7">7 명</option>
								<option value="8">8 명</option>
							</select>

						</div>
						<!--.number-info-->

						<div class="wrap-seats">
							<div class="title-head">
								<span class="title-time">18:25</span>
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

								<ul class="row" data-rowname="A">
									<li class="head">A</li>
									<li></li>
									<li></li>
									<li></li>
									<li><input type="checkbox" class="choose-seat disabled"
										id="A3" value="A3" data-seatgroup="2" data-rowname="A"
										data-colnumber="3" data-seatmapid="8001" data-screenid="66"
										data-screenplanid="792105" disabled=""><label for="A3"
										class="mini">3</label></li>
									<li><input type="checkbox" class="choose-seat " id="A4"
										value="A4" data-seatgroup="2" data-rowname="A"
										data-colnumber="4" data-seatmapid="8002" data-screenid="66"
										data-screenplanid="792105"><label for="A4"
										class="mini">4</label></li>
									<li><input type="checkbox" class="choose-seat " id="A5"
										value="A5" data-seatgroup="2" data-rowname="A"
										data-colnumber="5" data-seatmapid="8003" data-screenid="66"
										data-screenplanid="792105"><label for="A5"
										class="mini">5</label></li>
									<li><input type="checkbox" class="choose-seat " id="A6"
										value="A6" data-seatgroup="2" data-rowname="A"
										data-colnumber="6" data-seatmapid="8004" data-screenid="66"
										data-screenplanid="792105"><label for="A6"
										class="mini">6</label></li>
									<li><input type="checkbox" class="choose-seat " id="A7"
										value="A7" data-seatgroup="2" data-rowname="A"
										data-colnumber="7" data-seatmapid="8005" data-screenid="66"
										data-screenplanid="792105"><label for="A7"
										class="mini">7</label></li>
									<li><input type="checkbox" class="choose-seat " id="A8"
										value="A8" data-seatgroup="2" data-rowname="A"
										data-colnumber="8" data-seatmapid="8006" data-screenid="66"
										data-screenplanid="792105"><label for="A8"
										class="mini">8</label></li>
									<li><input type="checkbox" class="choose-seat " id="A9"
										value="A9" data-seatgroup="2" data-rowname="A"
										data-colnumber="9" data-seatmapid="8007" data-screenid="66"
										data-screenplanid="792105"><label for="A9"
										class="mini">9</label></li>
									<li></li>
									<li></li>
									<li></li>
								</ul>
								<ul class="row" data-rowname="B">
									<li class="head">B</li>
									<li><input type="checkbox" class="choose-seat " id="B1"
										value="B1" data-seatgroup="1" data-rowname="B"
										data-colnumber="1" data-seatmapid="8010" data-screenid="66"
										data-screenplanid="792105"><label for="B1"
										class="mini">1</label></li>
									<li><input type="checkbox" class="choose-seat " id="B2"
										value="B2" data-seatgroup="1" data-rowname="B"
										data-colnumber="2" data-seatmapid="8011" data-screenid="66"
										data-screenplanid="792105"><label for="B2"
										class="mini">2</label></li>
									<li></li>
									<li><input type="checkbox" class="choose-seat " id="B3"
										value="B3" data-seatgroup="2" data-rowname="B"
										data-colnumber="3" data-seatmapid="8012" data-screenid="66"
										data-screenplanid="792105"><label for="B3"
										class="mini">3</label></li>
									<li><input type="checkbox" class="choose-seat " id="B4"
										value="B4" data-seatgroup="2" data-rowname="B"
										data-colnumber="4" data-seatmapid="8013" data-screenid="66"
										data-screenplanid="792105"><label for="B4"
										class="mini">4</label></li>
									<li><input type="checkbox" class="choose-seat " id="B5"
										value="B5" data-seatgroup="2" data-rowname="B"
										data-colnumber="5" data-seatmapid="8014" data-screenid="66"
										data-screenplanid="792105"><label for="B5"
										class="mini">5</label></li>
									<li><input type="checkbox" class="choose-seat " id="B6"
										value="B6" data-seatgroup="2" data-rowname="B"
										data-colnumber="6" data-seatmapid="8015" data-screenid="66"
										data-screenplanid="792105"><label for="B6"
										class="mini">6</label></li>
									<li><input type="checkbox" class="choose-seat " id="B7"
										value="B7" data-seatgroup="2" data-rowname="B"
										data-colnumber="7" data-seatmapid="8016" data-screenid="66"
										data-screenplanid="792105"><label for="B7"
										class="mini">7</label></li>
									<li><input type="checkbox" class="choose-seat " id="B8"
										value="B8" data-seatgroup="2" data-rowname="B"
										data-colnumber="8" data-seatmapid="8017" data-screenid="66"
										data-screenplanid="792105"><label for="B8"
										class="mini">8</label></li>
									<li><input type="checkbox" class="choose-seat " id="B9"
										value="B9" data-seatgroup="2" data-rowname="B"
										data-colnumber="9" data-seatmapid="8018" data-screenid="66"
										data-screenplanid="792105"><label for="B9"
										class="mini">9</label></li>
									<li></li>
									<li><input type="checkbox" class="choose-seat " id="B10"
										value="B10" data-seatgroup="3" data-rowname="B"
										data-colnumber="10" data-seatmapid="8019" data-screenid="66"
										data-screenplanid="792105"><label for="B10"
										class="mini">10</label></li>
									<li><input type="checkbox" class="choose-seat " id="B11"
										value="B11" data-seatgroup="3" data-rowname="B"
										data-colnumber="11" data-seatmapid="8020" data-screenid="66"
										data-screenplanid="792105"><label for="B11"
										class="mini">11</label></li>
								</ul>
								<ul class="row" data-rowname="C">
									<li class="head">C</li>
									<li><input type="checkbox" class="choose-seat " id="C1"
										value="C1" data-seatgroup="1" data-rowname="C"
										data-colnumber="1" data-seatmapid="8021" data-screenid="66"
										data-screenplanid="792105"><label for="C1"
										class="mini">1</label></li>
									<li><input type="checkbox" class="choose-seat " id="C2"
										value="C2" data-seatgroup="1" data-rowname="C"
										data-colnumber="2" data-seatmapid="8022" data-screenid="66"
										data-screenplanid="792105"><label for="C2"
										class="mini">2</label></li>
									<li></li>
									<li><input type="checkbox" class="choose-seat " id="C3"
										value="C3" data-seatgroup="2" data-rowname="C"
										data-colnumber="3" data-seatmapid="8023" data-screenid="66"
										data-screenplanid="792105"><label for="C3"
										class="mini">3</label></li>
									<li><input type="checkbox" class="choose-seat " id="C4"
										value="C4" data-seatgroup="2" data-rowname="C"
										data-colnumber="4" data-seatmapid="8024" data-screenid="66"
										data-screenplanid="792105"><label for="C4"
										class="mini">4</label></li>
									<li><input type="checkbox" class="choose-seat " id="C5"
										value="C5" data-seatgroup="2" data-rowname="C"
										data-colnumber="5" data-seatmapid="8025" data-screenid="66"
										data-screenplanid="792105"><label for="C5"
										class="mini">5</label></li>
									<li><input type="checkbox" class="choose-seat " id="C6"
										value="C6" data-seatgroup="2" data-rowname="C"
										data-colnumber="6" data-seatmapid="8026" data-screenid="66"
										data-screenplanid="792105"><label for="C6"
										class="mini">6</label></li>
									<li><input type="checkbox" class="choose-seat " id="C7"
										value="C7" data-seatgroup="2" data-rowname="C"
										data-colnumber="7" data-seatmapid="8027" data-screenid="66"
										data-screenplanid="792105"><label for="C7"
										class="mini">7</label></li>
									<li><input type="checkbox" class="choose-seat " id="C8"
										value="C8" data-seatgroup="2" data-rowname="C"
										data-colnumber="8" data-seatmapid="8028" data-screenid="66"
										data-screenplanid="792105"><label for="C8"
										class="mini">8</label></li>
									<li><input type="checkbox" class="choose-seat " id="C9"
										value="C9" data-seatgroup="2" data-rowname="C"
										data-colnumber="9" data-seatmapid="8029" data-screenid="66"
										data-screenplanid="792105"><label for="C9"
										class="mini">9</label></li>
									<li></li>
									<li><input type="checkbox" class="choose-seat " id="C10"
										value="C10" data-seatgroup="3" data-rowname="C"
										data-colnumber="10" data-seatmapid="8030" data-screenid="66"
										data-screenplanid="792105"><label for="C10"
										class="mini">10</label></li>
									<li><input type="checkbox" class="choose-seat " id="C11"
										value="C11" data-seatgroup="3" data-rowname="C"
										data-colnumber="11" data-seatmapid="8031" data-screenid="66"
										data-screenplanid="792105"><label for="C11"
										class="mini">11</label></li>
								</ul>
								<ul class="row" data-rowname="D">
									<li class="head">D</li>
									<li><input type="checkbox" class="choose-seat " id="D1"
										value="D1" data-seatgroup="1" data-rowname="D"
										data-colnumber="1" data-seatmapid="8032" data-screenid="66"
										data-screenplanid="792105"><label for="D1"
										class="mini">1</label></li>
									<li><input type="checkbox" class="choose-seat " id="D2"
										value="D2" data-seatgroup="1" data-rowname="D"
										data-colnumber="2" data-seatmapid="8033" data-screenid="66"
										data-screenplanid="792105"><label for="D2"
										class="mini">2</label></li>
									<li></li>
									<li><input type="checkbox" class="choose-seat " id="D3"
										value="D3" data-seatgroup="2" data-rowname="D"
										data-colnumber="3" data-seatmapid="8034" data-screenid="66"
										data-screenplanid="792105"><label for="D3"
										class="mini">3</label></li>
									<li><input type="checkbox" class="choose-seat " id="D4"
										value="D4" data-seatgroup="2" data-rowname="D"
										data-colnumber="4" data-seatmapid="8035" data-screenid="66"
										data-screenplanid="792105"><label for="D4"
										class="mini">4</label></li>
									<li><input type="checkbox" class="choose-seat disabled"
										id="D5" value="D5" data-seatgroup="2" data-rowname="D"
										data-colnumber="5" data-seatmapid="8036" data-screenid="66"
										data-screenplanid="792105" disabled=""><label for="D5"
										class="mini">5</label></li>
									<li><input type="checkbox" class="choose-seat disabled"
										id="D6" value="D6" data-seatgroup="2" data-rowname="D"
										data-colnumber="6" data-seatmapid="8037" data-screenid="66"
										data-screenplanid="792105" disabled=""><label for="D6"
										class="mini">6</label></li>
									<li><input type="checkbox" class="choose-seat " id="D7"
										value="D7" data-seatgroup="2" data-rowname="D"
										data-colnumber="7" data-seatmapid="8038" data-screenid="66"
										data-screenplanid="792105"><label for="D7"
										class="mini">7</label></li>
									<li><input type="checkbox" class="choose-seat " id="D8"
										value="D8" data-seatgroup="2" data-rowname="D"
										data-colnumber="8" data-seatmapid="8039" data-screenid="66"
										data-screenplanid="792105"><label for="D8"
										class="mini">8</label></li>
									<li><input type="checkbox" class="choose-seat " id="D9"
										value="D9" data-seatgroup="2" data-rowname="D"
										data-colnumber="9" data-seatmapid="8040" data-screenid="66"
										data-screenplanid="792105"><label for="D9"
										class="mini">9</label></li>
									<li></li>
									<li><input type="checkbox" class="choose-seat " id="D10"
										value="D10" data-seatgroup="3" data-rowname="D"
										data-colnumber="10" data-seatmapid="8041" data-screenid="66"
										data-screenplanid="792105"><label for="D10"
										class="mini">10</label></li>
									<li><input type="checkbox" class="choose-seat " id="D11"
										value="D11" data-seatgroup="3" data-rowname="D"
										data-colnumber="11" data-seatmapid="8042" data-screenid="66"
										data-screenplanid="792105"><label for="D11"
										class="mini">11</label></li>
								</ul>
								<ul class="row" data-rowname="E">
									<li class="head">E</li>
									<li><input type="checkbox" class="choose-seat " id="E1"
										value="E1" data-seatgroup="1" data-rowname="E"
										data-colnumber="1" data-seatmapid="8043" data-screenid="66"
										data-screenplanid="792105"><label for="E1"
										class="mini">1</label></li>
									<li><input type="checkbox" class="choose-seat " id="E2"
										value="E2" data-seatgroup="1" data-rowname="E"
										data-colnumber="2" data-seatmapid="8044" data-screenid="66"
										data-screenplanid="792105"><label for="E2"
										class="mini">2</label></li>
									<li></li>
									<li><input type="checkbox" class="choose-seat " id="E3"
										value="E3" data-seatgroup="2" data-rowname="E"
										data-colnumber="3" data-seatmapid="8045" data-screenid="66"
										data-screenplanid="792105"><label for="E3"
										class="mini">3</label></li>
									<li><input type="checkbox" class="choose-seat " id="E4"
										value="E4" data-seatgroup="2" data-rowname="E"
										data-colnumber="4" data-seatmapid="8046" data-screenid="66"
										data-screenplanid="792105"><label for="E4"
										class="mini">4</label></li>
									<li><input type="checkbox" class="choose-seat disabled"
										id="E5" value="E5" data-seatgroup="2" data-rowname="E"
										data-colnumber="5" data-seatmapid="8047" data-screenid="66"
										data-screenplanid="792105" disabled=""><label for="E5"
										class="mini">5</label></li>
									<li><input type="checkbox" class="choose-seat " id="E6"
										value="E6" data-seatgroup="2" data-rowname="E"
										data-colnumber="6" data-seatmapid="8048" data-screenid="66"
										data-screenplanid="792105"><label for="E6"
										class="mini">6</label></li>
									<li><input type="checkbox" class="choose-seat " id="E7"
										value="E7" data-seatgroup="2" data-rowname="E"
										data-colnumber="7" data-seatmapid="8049" data-screenid="66"
										data-screenplanid="792105"><label for="E7"
										class="mini">7</label></li>
									<li><input type="checkbox" class="choose-seat " id="E8"
										value="E8" data-seatgroup="2" data-rowname="E"
										data-colnumber="8" data-seatmapid="8050" data-screenid="66"
										data-screenplanid="792105"><label for="E8"
										class="mini">8</label></li>
									<li><input type="checkbox" class="choose-seat " id="E9"
										value="E9" data-seatgroup="2" data-rowname="E"
										data-colnumber="9" data-seatmapid="8051" data-screenid="66"
										data-screenplanid="792105"><label for="E9"
										class="mini">9</label></li>
									<li></li>
									<li><input type="checkbox" class="choose-seat"
										id="E10" value="E10" data-seatgroup="3" data-rowname="E"
										data-colnumber="10" data-seatmapid="8052" data-screenid="66"
										data-screenplanid="792105" accessible=""><label
										for="E10" class="mini">10</label></li>
									<li></li>
								</ul>
								<ul class="row">
									<li class="head">&nbsp;</li>
								</ul>
								<ul class="row" data-rowname="F">
									<li class="head">F</li>
									<li></li>
									<li><input type="checkbox" class="choose-seat "
										id="F2" value="F2" data-seatgroup="1" data-rowname="F"
										data-colnumber="2" data-seatmapid="8055" data-screenid="66"
										data-screenplanid="792105" accessible=""><label
										for="F2" class="mini">2</label></li>
									<li></li>
									<li><input type="checkbox" class="choose-seat " id="F3"
										value="F3" data-seatgroup="2" data-rowname="F"
										data-colnumber="3" data-seatmapid="8056" data-screenid="66"
										data-screenplanid="792105"><label for="F3"
										class="mini">3</label></li>
									<li><input type="checkbox" class="choose-seat " id="F4"
										value="F4" data-seatgroup="2" data-rowname="F"
										data-colnumber="4" data-seatmapid="8057" data-screenid="66"
										data-screenplanid="792105"><label for="F4"
										class="mini">4</label></li>
									<li><input type="checkbox" class="choose-seat disabled"
										id="F5" value="F5" data-seatgroup="2" data-rowname="F"
										data-colnumber="5" data-seatmapid="8058" data-screenid="66"
										data-screenplanid="792105" disabled=""><label for="F5"
										class="mini">5</label></li>
									<li><input type="checkbox" class="choose-seat disabled"
										id="F6" value="F6" data-seatgroup="2" data-rowname="F"
										data-colnumber="6" data-seatmapid="8059" data-screenid="66"
										data-screenplanid="792105" disabled=""><label for="F6"
										class="mini">6</label></li>
									<li><input type="checkbox" class="choose-seat " id="F7"
										value="F7" data-seatgroup="2" data-rowname="F"
										data-colnumber="7" data-seatmapid="8060" data-screenid="66"
										data-screenplanid="792105"><label for="F7"
										class="mini">7</label></li>
									<li><input type="checkbox" class="choose-seat " id="F8"
										value="F8" data-seatgroup="2" data-rowname="F"
										data-colnumber="8" data-seatmapid="8061" data-screenid="66"
										data-screenplanid="792105"><label for="F8"
										class="mini">8</label></li>
									<li></li>
									<li></li>
									<li></li>
									<li></li>
								</ul>
								<ul class="row" data-rowname="G">
									<li class="head">G</li>
									<li><input type="checkbox" class="choose-seat " id="G1"
										value="G1" data-seatgroup="1" data-rowname="G"
										data-colnumber="1" data-seatmapid="8062" data-screenid="66"
										data-screenplanid="792105"><label for="G1"
										class="mini">1</label></li>
									<li><input type="checkbox" class="choose-seat " id="G2"
										value="G2" data-seatgroup="1" data-rowname="G"
										data-colnumber="2" data-seatmapid="8101" data-screenid="66"
										data-screenplanid="792105"><label for="G2"
										class="mini">2</label></li>
									<li></li>
									<li><input type="checkbox" class="choose-seat " id="G3"
										value="G3" data-seatgroup="2" data-rowname="G"
										data-colnumber="3" data-seatmapid="8063" data-screenid="66"
										data-screenplanid="792105"><label for="G3"
										class="mini">3</label></li>
									<li><input type="checkbox" class="choose-seat " id="G4"
										value="G4" data-seatgroup="2" data-rowname="G"
										data-colnumber="4" data-seatmapid="8064" data-screenid="66"
										data-screenplanid="792105"><label for="G4"
										class="mini">4</label></li>
									<li><input type="checkbox" class="choose-seat " id="G5"
										value="G5" data-seatgroup="2" data-rowname="G"
										data-colnumber="5" data-seatmapid="8065" data-screenid="66"
										data-screenplanid="792105"><label for="G5"
										class="mini">5</label></li>
									<li><input type="checkbox" class="choose-seat " id="G6"
										value="G6" data-seatgroup="2" data-rowname="G"
										data-colnumber="6" data-seatmapid="8066" data-screenid="66"
										data-screenplanid="792105"><label for="G6"
										class="mini">6</label></li>
									<li><input type="checkbox" class="choose-seat " id="G7"
										value="G7" data-seatgroup="2" data-rowname="G"
										data-colnumber="7" data-seatmapid="8067" data-screenid="66"
										data-screenplanid="792105"><label for="G7"
										class="mini">7</label></li>
									<li><input type="checkbox" class="choose-seat disabled"
										id="G8" value="G8" data-seatgroup="2" data-rowname="G"
										data-colnumber="8" data-seatmapid="8068" data-screenid="66"
										data-screenplanid="792105" disabled=""><label for="G8"
										class="mini">8</label></li>
									<li></li>
									<li></li>
									<li></li>
									<li></li>
								</ul>
								<ul class="row" data-rowname="H">
									<li class="head">H</li>
									<li><input type="checkbox" class="choose-seat " id="H1"
										value="H1" data-seatgroup="1" data-rowname="H"
										data-colnumber="1" data-seatmapid="8069" data-screenid="66"
										data-screenplanid="792105"><label for="H1"
										class="mini">1</label></li>
									<li><input type="checkbox" class="choose-seat " id="H2"
										value="H2" data-seatgroup="1" data-rowname="H"
										data-colnumber="2" data-seatmapid="8070" data-screenid="66"
										data-screenplanid="792105"><label for="H2"
										class="mini">2</label></li>
									<li></li>
									<li><input type="checkbox" class="choose-seat " id="H3"
										value="H3" data-seatgroup="2" data-rowname="H"
										data-colnumber="3" data-seatmapid="8071" data-screenid="66"
										data-screenplanid="792105"><label for="H3"
										class="mini">3</label></li>
									<li><input type="checkbox" class="choose-seat " id="H4"
										value="H4" data-seatgroup="2" data-rowname="H"
										data-colnumber="4" data-seatmapid="8072" data-screenid="66"
										data-screenplanid="792105"><label for="H4"
										class="mini">4</label></li>
									<li><input type="checkbox" class="choose-seat disabled"
										id="H5" value="H5" data-seatgroup="2" data-rowname="H"
										data-colnumber="5" data-seatmapid="8073" data-screenid="66"
										data-screenplanid="792105" disabled=""><label for="H5"
										class="mini">5</label></li>
									<li><input type="checkbox" class="choose-seat " id="H6"
										value="H6" data-seatgroup="2" data-rowname="H"
										data-colnumber="6" data-seatmapid="8074" data-screenid="66"
										data-screenplanid="792105"><label for="H6"
										class="mini">6</label></li>
									<li><input type="checkbox" class="choose-seat " id="H7"
										value="H7" data-seatgroup="2" data-rowname="H"
										data-colnumber="7" data-seatmapid="8075" data-screenid="66"
										data-screenplanid="792105"><label for="H7"
										class="mini">7</label></li>
									<li><input type="checkbox" class="choose-seat " id="H8"
										value="H8" data-seatgroup="2" data-rowname="H"
										data-colnumber="8" data-seatmapid="8076" data-screenid="66"
										data-screenplanid="792105"><label for="H8"
										class="mini">8</label></li>
									<li></li>
									<li></li>
									<li></li>
									<li></li>
								</ul>
								<ul class="row" data-rowname="I">
									<li class="head">I</li>
									<li><input type="checkbox" class="choose-seat " id="I1"
										value="I1" data-seatgroup="1" data-rowname="I"
										data-colnumber="1" data-seatmapid="8077" data-screenid="66"
										data-screenplanid="792105"><label for="I1"
										class="mini">1</label></li>
									<li><input type="checkbox" class="choose-seat " id="I2"
										value="I2" data-seatgroup="1" data-rowname="I"
										data-colnumber="2" data-seatmapid="8078" data-screenid="66"
										data-screenplanid="792105"><label for="I2"
										class="mini">2</label></li>
									<li></li>
									<li><input type="checkbox" class="choose-seat " id="I3"
										value="I3" data-seatgroup="2" data-rowname="I"
										data-colnumber="3" data-seatmapid="8079" data-screenid="66"
										data-screenplanid="792105"><label for="I3"
										class="mini">3</label></li>
									<li><input type="checkbox" class="choose-seat " id="I4"
										value="I4" data-seatgroup="2" data-rowname="I"
										data-colnumber="4" data-seatmapid="8080" data-screenid="66"
										data-screenplanid="792105"><label for="I4"
										class="mini">4</label></li>
									<li><input type="checkbox" class="choose-seat disabled"
										id="I5" value="I5" data-seatgroup="2" data-rowname="I"
										data-colnumber="5" data-seatmapid="8081" data-screenid="66"
										data-screenplanid="792105" disabled=""><label for="I5"
										class="mini">5</label></li>
									<li><input type="checkbox" class="choose-seat disabled"
										id="I6" value="I6" data-seatgroup="2" data-rowname="I"
										data-colnumber="6" data-seatmapid="8082" data-screenid="66"
										data-screenplanid="792105" disabled=""><label for="I6"
										class="mini">6</label></li>
									<li><input type="checkbox" class="choose-seat " id="I7"
										value="I7" data-seatgroup="2" data-rowname="I"
										data-colnumber="7" data-seatmapid="8083" data-screenid="66"
										data-screenplanid="792105"><label for="I7"
										class="mini">7</label></li>
									<li><input type="checkbox" class="choose-seat " id="I8"
										value="I8" data-seatgroup="2" data-rowname="I"
										data-colnumber="8" data-seatmapid="8084" data-screenid="66"
										data-screenplanid="792105"><label for="I8"
										class="mini">8</label></li>
									<li></li>
									<li></li>
									<li></li>
									<li></li>
								</ul>
								<ul class="row" data-rowname="J">
									<li class="head">J</li>
									<li><input type="checkbox" class="choose-seat " id="J1"
										value="J1" data-seatgroup="1" data-rowname="J"
										data-colnumber="1" data-seatmapid="8085" data-screenid="66"
										data-screenplanid="792105"><label for="J1"
										class="mini">1</label></li>
									<li><input type="checkbox" class="choose-seat " id="J2"
										value="J2" data-seatgroup="1" data-rowname="J"
										data-colnumber="2" data-seatmapid="8086" data-screenid="66"
										data-screenplanid="792105"><label for="J2"
										class="mini">2</label></li>
									<li></li>
									<li><input type="checkbox" class="choose-seat " id="J3"
										value="J3" data-seatgroup="2" data-rowname="J"
										data-colnumber="3" data-seatmapid="8087" data-screenid="66"
										data-screenplanid="792105"><label for="J3"
										class="mini">3</label></li>
									<li><input type="checkbox" class="choose-seat " id="J4"
										value="J4" data-seatgroup="2" data-rowname="J"
										data-colnumber="4" data-seatmapid="8088" data-screenid="66"
										data-screenplanid="792105"><label for="J4"
										class="mini">4</label></li>
									<li><input type="checkbox" class="choose-seat disabled"
										id="J5" value="J5" data-seatgroup="2" data-rowname="J"
										data-colnumber="5" data-seatmapid="8089" data-screenid="66"
										data-screenplanid="792105" disabled=""><label for="J5"
										class="mini">5</label></li>
									<li><input type="checkbox" class="choose-seat " id="J6"
										value="J6" data-seatgroup="2" data-rowname="J"
										data-colnumber="6" data-seatmapid="8090" data-screenid="66"
										data-screenplanid="792105"><label for="J6"
										class="mini">6</label></li>
									<li><input type="checkbox" class="choose-seat " id="J7"
										value="J7" data-seatgroup="2" data-rowname="J"
										data-colnumber="7" data-seatmapid="8091" data-screenid="66"
										data-screenplanid="792105"><label for="J7"
										class="mini">7</label></li>
									<li><input type="checkbox" class="choose-seat " id="J8"
										value="J8" data-seatgroup="2" data-rowname="J"
										data-colnumber="8" data-seatmapid="8092" data-screenid="66"
										data-screenplanid="792105"><label for="J8"
										class="mini">8</label></li>
									<li></li>
									<li></li>
									<li></li>
									<li></li>
								</ul>
								<ul class="row" data-rowname="K">
									<li class="head">K</li>
									<li><input type="checkbox" class="choose-seat " id="K1"
										value="K1" data-seatgroup="1" data-rowname="K"
										data-colnumber="1" data-seatmapid="8093" data-screenid="66"
										data-screenplanid="792105"><label for="K1"
										class="mini">1</label></li>
									<li><input type="checkbox" class="choose-seat " id="K2"
										value="K2" data-seatgroup="1" data-rowname="K"
										data-colnumber="2" data-seatmapid="8094" data-screenid="66"
										data-screenplanid="792105"><label for="K2"
										class="mini">2</label></li>
									<li></li>
									<li></li>
									<li></li>
									<li></li>
									<li></li>
									<li></li>
									<li></li>
									<li></li>
									<li></li>
									<li></li>
									<li></li>
								</ul>
							</div>

						</div>
						<!--.wrap-seats-->

						<div class="seats-control">

							<div class="right">
								<a href="#" class="btn-reset-seats">다시선택</a> <span
									class="status">선택인원 <span class="number-chosen">0</span>
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
							<a href="#" class="btn-rsv-cancel2">이전</a>
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
		
<script type="text/javascript">
    var currentTheaterCode = "1001";

    
    $(function () {
        function SalePriceEntity(salePriceId, price, salePriceName, salePriceCode, count) {
                this.SalePriceId = salePriceId;
                this.Price = price;
                this.SalePriceName = salePriceName;
                this.SalePriceCode = salePriceCode;
                this.Count = count;
            }

        $.desktop.seatchoicepop = {}
        $.desktop.seatchoicepop = {
            salePrice: null,
            init: function () {
                $.desktop.reserveData.theaterCode = $("div.seatChoice").data("theatercode");
                $.desktop.reserveData.screenPlanId = $("div.seatChoice").data("screenplanid");
                $.desktop.reserveData.movieCode = $("div.seatChoice").data("moviecode");
                $.desktop.reserveData.playDate = $("div.seatChoice").data("playdate");


                $.desktop.seatchoicepop.salePrice = {};
                $.desktop.seatchoicepop.loadSeatmap();

                $.desktop.seatchoicepop._initEvent();
                $.desktop.seatchoicepop.viewSalePrice();

                $.desktop.seatchoicepop.hideSelectSeat();
            },

            _initData: function () {
                for (key in $.desktop.seatchoicepop.salePrice) {
                    $("select.input-select id_" + key, "div.seatChoice").val($.desktop.seatchoicepop.salePrice[key].Count).change();
                }
            },

            _initEvent: function () {
                $("div.section-pop-top", "div.seatChoice").on("click", "a.btn-rsv-reset", function (event) {
                if (confirm("모든 선택정보가 사라집니다. 계속하시겠습니까?") == false) {
                    return false;
                }
                    /* $.desktop.seatchoicepop.clearSeatmap(function () {
                        $.desktop.reserve.openPrev(
                            {
                    playDate: $.desktop.reserveData.playDate,
                                theaterCode: $.desktop.reserveData.theaterCode,
                                movieCode: "",
                                screenPlanId: ""
                            }
                        );
                });

                    event.preventDefault();
                    return false; */
                location.href = "ticket.jsp";
                });

                $("a.close-modal", "div.seatChoice").click(function () {
            if (confirm("모든 선택정보가 사라집니다. 계속하시겠습니까?") == false) {
                return false;
            }
                    /* $.desktop.seatchoicepop.clearSeatmap(function () {
                        $.modal.close();
            }); */
            location.href = "ticket.jsp";
            return false;
        });

                $("div.section-pop-bottom", "div.seatChoice").on("click", "a.btn-rsv-cancel2", function (event) {
            if (confirm("모든 선택정보가 사라집니다. 계속하시겠습니까?") == false) {
                return false;
            }

                    /* $.desktop.seatchoicepop.clearSeatmap(function () {
                        $.desktop.reserve.openPrev(
                            {
                playDate: $.desktop.reserveData.playDate,
                                theaterCode: $.desktop.reserveData.theaterCode,
                                movieCode: $.desktop.reserveData.movieCode,
                                screenPlanId: $.desktop.reserveData.screenPlanId
                            }
                        );
            });

                    event.preventDefault(); */
                    location.href = "ticket.jsp";
            return false;
        });

                $("div.wrap-number-info", "div.seatChoice").on("change", "select.input-select", function () {
            var salepriceid = $(this).data("salepriceid");
            var price = $(this).data("price");
            var salepricename = $(this).data("salepricename");
            var salepricecode = $(this).data("salepricecode");
            var count = $(this).val();

            var saleCount = {};
            var totalSum = 0;
            var seatChoiceCount = $.desktop.seatchoicepop.countChoiceSeat();
            for (key in $.desktop.seatchoicepop.salePrice) {
                saleCount[key] = $.desktop.seatchoicepop.salePrice[key].Count;
            }
            saleCount[salepriceid] = count;
            for (key in saleCount) {
                totalSum += parseInt(saleCount[key]);
            }
            if (totalSum > 8) {
                alert("동시 예약 가능 인원은 8  명입니다.");
                        $(this).val(($.desktop.seatchoicepop.salePrice[salepriceid] != undefined ? $.desktop.seatchoicepop.salePrice[salepriceid].Count : 0) + "");
                return false;
            }

            if (seatChoiceCount > totalSum) {
                alert("선택한 좌석보다 인원수가 적습니다.");
                if ($.desktop.seatchoicepop.salePrice[salepriceid] != undefined)
                            $(this).val($.desktop.seatchoicepop.salePrice[salepriceid].Count);
                        else
                            $(this).val("0");
                return false;
            }

            if (count > 0) {
                        $.desktop.seatchoicepop.salePrice[salepriceid] = new SalePriceEntity(salepriceid, price, salepricename, salepricecode, count);
            } else {
                if ($.desktop.seatchoicepop.salePrice[salepriceid] != undefined) {
                    delete $.desktop.seatchoicepop.salePrice[salepriceid];
                }
            }
            if (totalSum >= 8) {
                        $("div.seats-control input[value=8]", "div.seatChoice").prop("checked", true);
            } else {
                        $("div.seats-control input[value=" + totalSum + "]", "div.seatChoice").prop("checked", true);
            }
                    $.desktop.seatchoicepop.viewSalePrice();
                    $.desktop.seatchoicepop.hideSelectSeat();
        });

                $("div.wrap-seats>div.title-head", "div.seatChoice").on("click", "a.btn-time", function (event) {
            var playdate = $(this).data("playdate");
            var theaterCode = $("div.seatChoice").data("theatercode");
            var screenplanid = $(this).data("screenplanid");

                    $.desktop.seatchoicepop.clearSeatmap(function () {
                        $.desktop.seatchoice.open(
                            {
                playDate: playdate,
                                theaterCode: theaterCode,
                                screenPlanId: screenplanid
                            });

                        $.desktop.seatchoicepop.viewSelectedSeat();
                        $.desktop.seatchoicepop.hideSelectSeat();
            });

                    event.preventDefault();
            return false;
        });

                $("div.seats-control", "div.seatChoice").on("click", "a.btn-reset-seats", function (event) {
                    $.desktop.seatchoicepop.clearSeatmap(function () {
                        $.desktop.seatchoicepop.loadSeatmap();
            });
                    event.preventDefault();
            return false;
        });


                $("div.seatmap", "div.seatChoice").on("click", "input.choose-seat", function () {
            var seatMapId = $(this).data("seatmapid");
            var url = "";

            if ($(this).hasClass("disabled") == true) {
                        $(this).removeProp("checked");
                return false;
            }

            if ($(this).prop("checked") == true) {
                if ($("div.seats-control input:checked", "div.seatChoice").val() > 1) {
                            $.desktop.seatchoicepop.selectGroupSeat($(this), $("div.seats-control input:checked", "div.seatChoice").val());
                    return;
                }

                var seatCount = $.desktop.seatchoicepop.countChoiceSeat();

                if ($.desktop.seatchoicepop.countSalePrice() == 0) {
                    alert("상단 메뉴에서 인원을 선택해 주세요");
                    return false;
                }

                if ($.desktop.seatchoicepop.countSalePrice() < seatCount) {
                            $(this).prop("checked", false);
                    alert("선택한 인원수보다 좌석을 많이 선택하셨습니다.");
                    return false;
                }
                url = "/popup/AddSeatGrap";
            } else {
                url = "/popup/RemoveSeatGrap"
                    }
                    $.ajax({
            url: url,
                        dataType: "json",
                        data: {
                    "screenPlanId": $.desktop.reserveData.screenPlanId,
                            "seatMapId": seatMapId
                        },
                        method: "POST",
                        success: function (result) {
                    if (result.ErrorCode != 0) {
                        alert(result.ErrorMessage);
                        if (url == "/popup/AddSeatGrap")
                                    $("input[data-seatmapid=" + seatMapId + "]", "div.seatChoice").prop("checked", false).removeProp("checked");
                                else
                                    $("input[data-seatmapid=" + seatMapId + "]", "div.seatChoice").prop("checked", true);
                        return false;
                    }

                            $.desktop.seatchoicepop.viewSelectedSeat();
                            $.desktop.seatchoicepop.hideSelectSeat();
                },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("에러가 발생하였습니다. \r\n 잠시후 다시 시도 부탁드립니다.");
                    return false;
                }
            });
        });


                $("div.seatmap", "div.seatChoice").on("click", "input.choose-seat_large", function () {
            var seatMapId = $(this).data("seatmapid");
            var url = "";

            if ($(this).hasClass("disabled") == true) {
                        $(this).removeProp("checked");
                return false;
            }

            if ($(this).prop("checked") == true) {
                if ($("div.seats-control input:checked", "div.seatChoice").val() > 1) {
                            $.desktop.seatchoicepop.selectGroupSeat($(this), $("div.seats-control input:checked", "div.seatChoice").val());
                    return;
                }

                var seatCount = $.desktop.seatchoicepop.countChoiceSeat();
                if ($.desktop.seatchoicepop.countSalePrice() < seatCount) {
                            $(this).prop("checked", false);
                    alert("선택한 인원수보다 좌석을 많이 선택하셨습니다.");
                    return false;
                }
                url = "/popup/AddSeatGrap";
            } else {
                url = "/popup/RemoveSeatGrap"
                    }
                    $.ajax({
            url: url,
                        dataType: "json",
                        data: {
                    "screenPlanId": $.desktop.reserveData.screenPlanId,
                            "seatMapId": seatMapId
                        },
                        method: "POST",
                        success: function (result) {
                    if (result.ErrorCode != 0) {
                        alert(result.ErrorMessage);
                        if (url == "/popup/AddSeatGrap")
                                    $("input[data-seatmapid=" + seatMapId + "]", "div.seatChoice").prop("checked", false).removeProp("checked");
                                else
                                    $("input[data-seatmapid=" + seatMapId + "]", "div.seatChoice").prop("checked", true);
                        return false;
                    }

                            $.desktop.seatchoicepop.viewSelectedSeat();
                            $.desktop.seatchoicepop.hideSelectSeat();
                },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("에러가 발생하였습니다. \r\n 잠시후 다시 시도 부탁드립니다.");
                    return false;
                }
            });
        });

                $("div.wrap-rsv-select", "div.seatChoice").on("click", "a.btn-rsv-next2", function () {
            var seatChoiceCount = $.desktop.seatchoicepop.countChoiceSeat();
            var salePriceCount = $.desktop.seatchoicepop.countSalePrice();

            if (seatChoiceCount == 0 || salePriceCount == 0) {
                alert("좌석선택을 완료해주세요.");
                return false;
            }

            if (seatChoiceCount != salePriceCount) {
                alert("좌석선택을 완료해주세요.");
                return false;
            }

                    $.desktop.reserveData.salePrice = new Array();
            var data = {
                        salePrice: new Array(),
                        screenPlanId: $.desktop.reserveData.screenPlanId
                    };
                    for (key in $.desktop.seatchoicepop.salePrice) {
                        $.desktop.reserveData.salePrice.push(new SalePriceEntity(
                            $.desktop.seatchoicepop.salePrice[key].SalePriceId,
                            $.desktop.seatchoicepop.salePrice[key].Price,
                            $.desktop.seatchoicepop.salePrice[key].SalePriceName,
                            $.desktop.seatchoicepop.salePrice[key].SalePriceCode,
                            $.desktop.seatchoicepop.salePrice[key].Count
                        ));

                        data.salePrice.push($.desktop.reserveData.screenPlanId + ":" + $.desktop.seatchoicepop.salePrice[key].SalePriceId + ":" + $.desktop.seatchoicepop.salePrice[key].Count);
                    }

                    $.ajax({
    url: "/Popup/SeatChoiceConfirm",
                        dataType: "json",
                        data: {
        screenPlanId: $.desktop.reserveData.screenPlanId,
                            salePrice: data.salePrice.toString()
                        },
                        method: "POST",
                        success: function (result) {
            // 정상여부 check!
            console.log(result);
            if (result.ErrorCode != 0) {
                // 실패일경우
                alert(result.ErrorMessage);
                return false;
            } else {
                                $.desktop.payment.open();
            }
        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert("에러가 발생하였습니다. \r\n 잠시후 다시 시도 부탁드립니다.");
            return false;
        }
    });

                    return false;
                });
            },

            selectGroupSeat: function ($obj, selectSeatCount) {
        var arrSeatMapId = new Array();

        var rowName = $obj.data("rowname");
        var colNumber = $obj.data("colnumber");
        var group = $obj.data("seatgroup");
        var checked_seat = $.desktop.seatchoicepop.countChoiceSeat();
        var no_all = $.desktop.seatchoicepop.countSalePrice();


                $obj.prop("checked", false).removeProp("checked");
        if (no_all < checked_seat)
            return;

        var groupColMin = $("input[data-seatgroup=" + group + "][data-rowname=" + rowName + "]").first().data("colnumber");
        var groupColMax = $("input[data-seatgroup=" + group + "][data-rowname=" + rowName + "]").last().data("colnumber");

        console.log("groupColMin " + groupColMin);
        console.log("groupColMax " + groupColMax);

        var groupMinCount = 0;
        var groupMaxCount = 0;

        for (var i = colNumber; i <= groupColMax; i++) {
            var $seat = $("input[data-seatgroup=" + group + "][data-rowname=" + rowName + "][data-colnumber=" + i + "]");
            console.log($seat.is(":disabled"));
            if ($seat.is(":disabled") || $seat.is(":checked") || $seat.hasClass("disabled"))
                        break;
        if ($seat[0] == undefined)
                        break;
        groupMaxCount++;
    }

            for (var i = colNumber; i >= groupColMin; i--) {
                var $seat = $("input[data-seatgroup=" + group + "][data-rowname=" + rowName + "][data-colnumber=" + i + "]");
                if ($seat.is(":disabled") || $seat.is(":checked") || $seat.hasClass("disabled"))
                    break;
                if ($seat[0] == undefined)
                    break;

                groupMinCount++;
            }

            var $start = $("input[data-seatgroup=" + group + "][data-rowname=" + rowName + "][data-colnumber=" + colNumber + "]");
            var isLeft = false;
            if (groupMinCount != 0 && groupMaxCount != 0) {
                if (groupMaxCount >= groupMinCount) {
                    if (groupMinCount % 2 == 0) {
                        $start = $start.closest("li").prev().find("input[type=checkbox]");
                    }
                    isLeft = false;
                } else {
                    if (groupMaxCount % 2 == 0) {
                        $start = $start.closest("li").next().find("input[type=checkbox]");
                    }
                    isLeft = true;
                }
            }

            console.log("isLeft : " + isLeft)

            var selectCount = 0;
            var startColNumber = $start.data("colnumber");
            for (var loop = 0; loop < 2; loop++) {
                if (selectCount >= selectSeatCount) {
                    console.log("MAIN BREAK ");
                    break;
                }
                console.log("startColNumber : " + startColNumber)
                if (isLeft == true) {
                    for (var i = startColNumber; i >= groupColMin; i--) {
                        var $seat = $("input[data-seatgroup=" + group + "][data-rowname=" + rowName + "][data-colnumber=" + i + "]");

                        if ($seat[0] == undefined) {
                            console.log("undefined ");
                            break;
                        }

                        if ($seat.is(":disabled") || $seat.hasClass("disabled") == true) {
                            console.log("disabled ");
                            break;
                        }

                        if (selectCount >= selectSeatCount) {
                            console.log("selectSeatCount ");
                            break;
                        }

                        if ((checked_seat + selectCount - 1) >= no_all) {
                            console.log("no_all ");
                            break;
                        }

                        if ($seat.is(":checked")) {
                            console.log("checked ");
                            continue;
                        }
                        $seat.prop("checked", true);
                        arrSeatMapId.push($seat.data("seatmapid"));
                        selectCount++;
                    }
                    isLeft = !isLeft;
                    continue;
                }

                if (isLeft == false) {
                    for (var i = startColNumber; i <= groupColMax; i++) {
                        var $seat = $("input[data-seatgroup=" + group + "][data-rowname=" + rowName + "][data-colnumber=" + i + "]");
                        if ($seat[0] == undefined)
                            break;
                        if ($seat.is(":disabled") || $seat.hasClass("disabled") == true)
                            break;

                        if (selectCount >= selectSeatCount)
                            break;

                        if ((checked_seat + selectCount - 1) >= no_all)
                            break;

                        if ($seat.is(":checked")) {
                            break;
                        }

                        $seat.prop("checked", true);
                        arrSeatMapId.push($seat.data("seatmapid"));
                        selectCount++;
                    }
                    isLeft = !isLeft;
                    continue;
                }
            }

            $.ajax({
                url: "/popup/AddSeatGrap",
                dataType: "json",
                data: {
                    "screenPlanId": $.desktop.reserveData.screenPlanId,
                    "seatMapId": arrSeatMapId.toString()
                },
                method: "POST",
                success: function (result) {
                    if (result.ErrorCode != 0) {
                        alert(result.ErrorMessage);
                        for (seatid in arrSeatMapId) {
                            $("input[data-seatmapid=" + arrSeatMapId[seatid] + "]", "div.seatChoice").prop("checked", false).removeProp("checked");
                        }

                        return false;
                    }

                    $.desktop.seatchoicepop.viewSelectedSeat();
                    $.desktop.seatchoicepop.hideSelectSeat();
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("에러가 발생하였습니다. \r\n 잠시후 다시 시도 부탁드립니다.");
                    return false;
                }
            });
        },

        countSalePrice: function () {
            var sum = 0;
            for (key in $.desktop.seatchoicepop.salePrice) {
                sum += parseInt($.desktop.seatchoicepop.salePrice[key].Count);
            }
            return sum;
        },

        viewSalePrice: function () {
            var view = "";
            var sum = 0;
            var price = 0;
            for (key in $.desktop.seatchoicepop.salePrice) {
                view += view == "" ? "" : ", ";
                if ($.desktop.seatchoicepop.salePrice[key].SalePriceName == "자동차")
                    view += ($.desktop.seatchoicepop.salePrice[key].SalePriceName + " " + $.desktop.seatchoicepop.salePrice[key].Count + "대");
                else 
                    view += ($.desktop.seatchoicepop.salePrice[key].SalePriceName + " " + $.desktop.seatchoicepop.salePrice[key].Count + "명");
                sum += parseInt($.desktop.seatchoicepop.salePrice[key].Count);
                price += (parseInt($.desktop.seatchoicepop.salePrice[key].Price) * parseInt($.desktop.seatchoicepop.salePrice[key].Count));
            }

            $("table.table-movie-info td.number", "div.seatChoice").text(view);
            $("div.section-pop-movie span.total-price>span", "div.seatChoice").text(numberWithCommas(price));
            $("div.seats-control span.number-want", "div.seatChoice").text(sum);
        },

        countChoiceSeat: function () {
            return $("div.seatmap input.choose-seat:checked", "div.seatChoice").size() + $("div.seatmap input.choose-seat_large:checked", "div.seatChoice").size();
        },

        countHandicapSeat: function () {
            return $("div.seatmap input.choose-seat.accessible:checked", "div.seatChoice").size() + $("div.seatmap input.choose-seat_large.accessible:checked", "div.seatChoice").size();
        },

        viewSelectedSeat: function () {
            var view = "";
            var count = 0;
            $("div.seatmap input.choose-seat:checked", "div.seatChoice").each(function () {
                view += view == "" ? "" : ", ";
                view += $(this).val();
                count++;
            })

            $("div.seatmap input.choose-seat_large:checked", "div.seatChoice").each(function () {
                view += view == "" ? "" : ", ";
                view += $(this).val();
                count++;
            })


            $("div.seats-control span.number-chosen", "div.seatChoice").text(count);
            $("table.table-movie-info td.seats", "div.seatChoice").text(view);
        },

        hideSelectSeat: function () {
            var countChoiceSeat = $.desktop.seatchoicepop.countChoiceSeat();
            var countSalePrice = $.desktop.seatchoicepop.countSalePrice();

            var calc = countSalePrice - countChoiceSeat;

            $("div.seats-control label.input-seat", "div.seatChoice").hide();
            if (calc > 4) {
                $("div.seats-control label.input-seat", "div.seatChoice").show();
            } else {
                for (var i = calc; i > 0; i--) {
                    $("div.seats-control label.input-seat:eq(" + (i - 1) + ")", "div.seatChoice").show();
                }
                var selCount = $("div.seats-control label.input-seat input:checked", "div.seatChoice").val();
                if (calc <= 0) {
                    $("div.seats-control label.input-seat input:eq(0)", "div.seatChoice").click();
                } else {
                    $("div.seats-control label.input-seat input:eq(" + (calc - 1) + ")", "div.seatChoice").click();
                }
            }
        },

            loadSeatmap: function () {
            $.post("/Popup/SeatChoiceSeatMap", { "screenPlanId": $.desktop.reserveData.screenPlanId }, function (data) {
                $("div.seatmap", "div.seatChoice").html(data);
                $.desktop.seatchoicepop.viewSelectedSeat();
                $.desktop.seatchoicepop.hideSelectSeat();
                ;
            });
        },

        clearSeatmap: function (func) {
            // 좌석 리셋 하는 API 호출 //
            $.ajax({
                url: "/popup/RemoveAllSeatGrap",
                dataType: "json",
                data: {},
                method: "POST",
                success: function (result) {
                    if (result.ErrorCode != 0) {
                        alert(result.ErrorMessage);
                        return false;
                    }
                    if ($.isFunction(func) == true) {
                        func.apply();
                    }
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("에러가 발생하였습니다. \r\n 잠시후 다시 시도 부탁드립니다.");
                    return false;
                }
            });
        }
    }


        $.desktop.seatchoicepop.init();
    });
</script>
</body>
</html>