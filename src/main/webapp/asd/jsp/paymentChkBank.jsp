<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info="가상계좌 안내"%>
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

<script type="text/javascript" src="/common/js/extraTheaters.js"></script>
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
<link rel="stylesheet" href="http://img.cgv.co.kr/CGV_RIA/Ticket/Common/css/2024/0325/FORM_TYPE/reservation_popup.css">
<script src="https://www.cineq.co.kr/bundles/script?v=BivSx9O848D5V0Qog32Mgvmnh92IWQV9phYbkYbZeJg1"></script>
<!-- 예매 CSS, JS -->

<style type = "text/css">

</style>

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

				<!-- 결제 본문 -->
				<div class="popup payment" data-price="10000">
				    <div class="section-pop-top">
				        <h3 class="title">결제</h3>
				        <a href="#" class="btn-rsv-reset">다시 예매</a>
				    </div>
				
				    <div class="section-pop-movie">
				        <img src="https://file.cineq.co.kr/i.aspx?movieid=20249318&amp;size=210" class="poster" alt="포스터">
				
				        <div class="title">
				
				
				            <span class="rate-15">15</span>챌린저스
				        </div>
				        <table class="table-movie-info">
				            <tbody><tr>
				                <th>영화관</th>
				                <td><a href="#" onclick="$.desktop.payment.open(); return false;">신도림</a></td>
				            </tr>
				            <tr>
				                <th>상영관</th>
				                <td>10관</td>
				            </tr>
				            <tr>
				                <th>날짜</th>
				                <td>2024.05.03(금)</td>
				            </tr>
				            <tr>
				                <th>시간</th>
				                <td class="time">09:30</td>
				            </tr>
				            <tr>
				                <th>인원</th>
				                <td class="number">
				
				                    성인&nbsp;1
				                </td>
				            </tr>
				            <tr>
				                <th>좌석</th>
				                <td class="seats">
				
				                    B3
				                </td>
				            </tr>
				        </tbody></table>
				
				    </div><!--.section-pop-movie-->
				
				    <div class="section-pop-payment">
				        <div class="title-kind" style="margin-left: 40px;">결제 수단 선택</div>
				        <ul class="tab-discount">
				            <!--탭을 좁게 만들려면 tab-payment로 수정-->
				            <li class="on">
				                <!--a href="#" class="tab">신용카드/간편결제</a-->
				
				                <div class="tab-content on">
				
				                    <ul class="list-method">
				                            <!-- <li><input type="radio" name="point" id="radio_m8" value="CCPT"><label for="radio_m8" style="width:185px;height: 36px;"><img title="payco결제하기" style="padding: 11px 60px; width: 60px; height: auto;border:0" alt="payco" src="/images/card/payco_cineq_60x13.png"></label></li>
				                            <li><input type="radio" name="point" id="radio_m9" value="CARD"><label for="radio_m9" style="width:185px;height: 36px;">신용카드</label></li>
				                            <li><input type="radio" name="point" id="radio_m10" value="MOBX"><label for="radio_m10" style="width:185px;height: 36px;">휴대폰</label></li>
				                            <li><input type="radio" name="point" id="radio_m11" value="PACA"><label for="radio_m11" style="width:185px;height: 36px;">카카오페이</label></li>
				                            <li><input type="radio" name="point" id="radio_m13" value="NAVER"><label for="radio_m13" style="width:185px;height: 36px;">네이버페이</label></li> -->
				                    	<input type="radio" name = "pay" class="pay_method" value="bank" checked = "checked"> 무통장입금
				                    	<input type="radio" name = "pay" class="pay_method" value="card" style = "margin-left: 10px;"> 신용카드 
				                    </ul>
				
				                </div><!--.tab-content-->
				                
				            </li>
				        </ul>
				        <div class="title-kind" style="margin-left: 40px;">은행선택</div>
			        	<div>
				        	<form name = "bank_form">
					        <select name = "bank" style="margin-left: 40px;">
					        	<option value = "bankKB">KB국민은행</option>
					        	<option value = "bankSH">신한은행</option>
					        	<option value = "bankNH">NH농협은행</option>
					        </select>
				        	</form>
			        	</div>
				
				    </div>
				    <!--.section-pop-payment-->
				
				    <div class="section-pop-bottom2">
				        <div class="wrap-1">
				            <span class="title">결제금액</span>
				            <span class="total-price"><span>10,000</span> 원</span>
				        </div>
				        
				        <div class="wrap-3" style="margin-left: 600px;">
				            <span class="title">총 결제금액</span>
				            <span class="final-price"><span>10,000</span> 원</span>
				            <a href="#" class="btn-rsv-payment">결제</a>
				        </div>
				    </div><!--.section-pop-bottom2-->
				    <input type="hidden" name="open_print" value="10000">
				    <a class="close-modal " href="#close-modal" rel="modal:close">Close</a>
				</div>

				<!--/ Contents End -->
			</div>
			<!-- /Contents Area -->
		</div>
		<!-- E Contaniner -->
		
		<!-- 예매 확인 팝업 시작 -->
		<div class="ft_layer_popup popup_reservation_check " style="display: block;">
		    <div class="bd">
		        <div class="article desc" style="border-bottom: none; background: none;">
		            <ol>
		                <li style="display: list-item;">감사합니다. 무통장입금 안내로 주문이 완료되었습니다.</li>
		                <li style="display: list-item;">아래 지정된 계좌번호로 입금기한 내에 반드시 입금하셔야 합니다.</li>
		            </ol>
		        </div>
		        
		        <div class="article desc" style="border-bottom: none; background: none;">
		        	<table id="test_table" style="border-collapse: separate; border-spacing: 0 10px;">
		        		<tr>
			        		<th>은행명</th>
			        		<td style="background: transparent;">KB국민은행</td>
		        		</tr>
		        		<tr>
			        		<th>계좌번호</th>
			        		<td style="background: transparent;">873801-01-3452123</td>
		        		</tr>
		        		<tr>
			        		<th>예금주</th>
			        		<td style="background: transparent;">(주)명화관</td>
		        		</tr>
		        		<tr>
			        		<th>입금기한</th>
			        		<td style="background: transparent;">2024-05-13</td>
		        		</tr>
		        	</table>
		        </div>
		    </div><!-- //bd -->
		    
		    <div class="ft">
		        <input type="button" onclick="return false;" value="확인" style="display: inline-block; position: relative; background-color: #C62424; width:130px; height:45px; border: 0px; color: #fff; border-radius: 5px;"><span class="sreader"></span>
		    </div><!-- //ft -->
		
		</div>
		<!-- 예매 확인 팝업 끝  -->

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