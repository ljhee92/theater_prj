<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info="로그인 후 결제 페이지(신용카드)"%>
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

<title id="ctl00_headerTitle">예매 | 명화 그 이상의 감동. CGV</title>

<link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/webfont.css" />
<link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/reset.css" />
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
<script src="https://www.cineq.co.kr/bundles/script?v=BivSx9O848D5V0Qog32Mgvmnh92IWQV9phYbkYbZeJg1"></script>
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
				                    	<input type="radio" name = "pay" class="pay_method" value="bank"> 무통장입금
				                    	<input type="radio" name = "pay" class="pay_method" value="card" checked = "checked" style = "margin-left: 10px;"> 신용카드 
				                    </ul>
				
				                </div><!--.tab-content-->
				                
				            </li>
				        </ul>
				        <div class="title-kind" style="margin-left: 40px;">카드선택</div>
       				    <div id="hubCard">
				        <form name="card_form">
				            <select name="card" style="margin-left: 40px;">
				                <option value="cardBC">BC카드</option>
				                <option value="cardSH">신한카드</option>
				                <option value="cardHD">현대카드</option>
				            </select>
				
				           <!--  <input type="hidden" name="site_name" value="CINEQ">
				            <input type="hidden" name="req_tx" value="pay">
			                <input type="hidden" name="site_cd" value="A92EM">
				            
				            KCP 관련 셋팅
				            <input type="hidden" name="encoding_trans" value="UTF-8">
				            <input type="hidden" name="pay_method" value="100000000000">
				            <input type="hidden" name="ordr_idxx" value=""> settleId
				            <input type="hidden" name="good_name" value="챌린저스"> 이름
				            <input type="hidden" name="good_mny" value="">가격
				            <input type="hidden" name="buyr_name" value="CINEQ Customer">
				            <input type="hidden" name="buyr_mail" value="wngml4453@hanmail.net">
				            <input type="hidden" name="buyr_tel1" value="">
				            <input type="hidden" name="buyr_tel2" value="01039299258">
				            <input type="hidden" name="quotaopt" value="12">
				
				            <input type="hidden" name="currency" value="WON">
				            <input type="hidden" name="module_type" value="01">
				            <input type="hidden" name="res_cd" value="">
				            <input type="hidden" name="res_msg" value="">
				            <input type="hidden" name="enc_info" value="">
				            <input type="hidden" name="enc_data" value="">
				            <input type="hidden" name="ret_pay_method" value="">
				            <input type="hidden" name="tran_cd" value="">
				            <input type="hidden" name="use_pay_method" value="">
				            <input type="hidden" name="ordr_chk" value=""> -->
				        </form>
				    	</div>
				
						<div class="title-kind" style="margin-left: 40px;">카드 번호</div>
			        	<div>
				        	<form name = "card_form">
					        <input type="text" style="margin-left: 40px; margin-right: 20px; outline: none;" size="4" maxlength="4"> -
					        <input type="text" style="margin-left: 20px; margin-right: 20px; outline: none;" size="4" maxlength="4"> -
					        <input type="text" style="margin-left: 20px; margin-right: 20px; outline: none;" size="4" maxlength="4"> -
					        <input type="text" style="margin-left: 20px; outline: none;" size="4" maxlength="4">
				        	</form>
			        	</div>
			        	
			        	<div class="title-kind" style="margin-left: 40px;">유효 기간</div>
			        	<div>
				        	<form name = "period_form">
					        <input type="text" style="margin-left: 40px; margin-right: 20px; outline: none;" size="4" maxlength="2">월
					        <input type="text" style="margin-left: 20px; margin-right: 20px; outline: none;" size="4" maxlength="2">년
					        <label style="margin-left: 20px;">예) 2015년 9월 -> 09월 15년</label>
				        	</form>
			        	</div>
			        	
			        	<div class="title-kind" style="margin-left: 40px;">비밀번호</div>
			        	<div>
				        	<form name = "pass_form">
					        <input type="password" style="margin-left: 40px; margin-right: 20px; outline: none;" size="4" maxlength="2">**
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
    //관람권 -> 교환권 -> 할인권 -> okCashbag -> 결제
/* 
    var processPayment = false;
    var allsmartCon = new Array();

    var oPay = null; */

    $(function () {
        /* var SettleCode = {
            discount: 302,
            exchange: 301,
            pointChange: 303
        }

        function SalePriceEntity(salePriceId, price, salePriceName, salePriceCode, count) {
            this.SalePriceId = salePriceId;
            this.Price = price;
            this.SalePriceName = salePriceName;
            this.SalePriceCode = salePriceCode;
            this.Count = count;
            this.Coupon = new Array();
            this.SmartCon = new Array();
        }

        function CouponEntity(settleCode, key, name, price, constraints, realprice) {
            this.SettleCode = settleCode;
            this.Key = key;
            this.Name = name;
            this.Price = price;
            this.Constraints = constraints;
            this.RealPrice = realprice;
        }

        function smartConCalc() {
            var smartconArr = new Array();
            $(" table.bbs-list-smartcon tbody input.smartconkey:checked", "div.payment").each(function () {
                var $tr = $(this).closest("tr");
                smartconArr.push(
                    new CouponEntity(
                        $tr.data("settlecode"),
                        $tr.data("couponkey"),
                        $tr.data("couponname"),
                        $tr.data("price"),
                        $tr.data("constraints"),
                        $tr.data("realprice")
                    )
                );
                if ($tr.data("settlecode") == '309' || $tr.data("settlecode") == '322' || $tr.data("settlecode") == '333' || $tr.data("settlecode") == '337') {
                    smartconArr.push(
                        new CouponEntity(
                            $tr.data("settlecode"),
                            $tr.data("couponkey" + "_1"),
                            $tr.data("couponname"),
                            $tr.data("price"),
                            $tr.data("constraints"),
                            $tr.data("realprice")
                        )
                    );
                }

            });

            var couponArray = new Array();

            $.payment.data.salePrice.sort(function (obj1, obj2) {
                return obj2.Price - obj1.Price;
            });

            for (var key in $.payment.data.salePrice) {
                $.payment.data.salePrice[key].Coupon = new Array();
            }

            $(" table.bbs-list-coupon tbody input.couponkey:checked", "div.payment").each(function () {
                var $tr = $(this).closest("tr");
                couponArray.push(
                    new CouponEntity(
                        $tr.data("settlecode"),
                        $tr.data("couponkey"),
                        $tr.data("couponname"),
                        $tr.data("price"),
                        $tr.data("constraints"),
                        $tr.data("realprice")
                ));
            });

            var $opt = $("div.tab-point div.wrap-point-for-payment", "div.payment").find("select.select-point>option:selected");
            var price = $opt.data("unitprice");
            var constraints = $opt.data("constraints");
            var count = $opt.val();
            var realprice = $opt.data("realprice");

            for (var i = 0; i < count; i++) {
                couponArray.push(new CouponEntity(
                    SettleCode.pointChange,
                    "",
                    '평일교환권',
                    20000,
                    constraints,
                    realprice
                ));
            }

            for (var i = 0; i < smartconArr.length; i++) {
                couponArray.push(smartconArr[i]);
            }


            couponArray.sort(function (obj1, obj2) {
                if (obj2.SettleCode == '302' && obj1.SettleCode != '302') {
                    return 1;
                }
                else if (obj2.SettleCode != '302' && obj1.SettleCode == '302') {
                    return -1;
                }
                else {
                    return obj2.Price - obj1.Price;
                }
            });

            var totalCount = 0;
            var isDiscountCouponIn = false;


            if (smartconArr.length > 0) {
                var tempSalePrice = {};
                for (key in $.payment.data.salePrice) {
                    tempSalePrice[$.payment.data.salePrice[key].SalePriceId] = {
                        "SalePriceId": $.payment.data.salePrice[key].SalePriceId,
                        "Count": $.payment.data.salePrice[key].Count,
                        "Price": $.payment.data.salePrice[key].Price
                    };
                    if (('' + $.payment.data.salePrice[key].SalePriceCode).substring(0, 1) == '1') {
                        totalCount += parseInt($.payment.data.salePrice[key].Count);
                    }
                }

                for (var i = 0; i < couponArray.length; i++) {
                    b = false;
                    for (var key in tempSalePrice) {
                        if (tempSalePrice[key].Count > 0) {
                            if (tempSalePrice[key].Price <= couponArray[i].Price && (couponArray[i].SettleCode != '302')) {
                                tempSalePrice[key].Count--;
                                b = true;
                                break;
                            }
                            else if (tempSalePrice[key].Price >= couponArray[i].Price && couponArray[i].SettleCode == '302') {
                                tempSalePrice[key].Count--;
                                b = true;
                                isDiscountCouponIn = true;
                                break;
                            }
                        }
                    }

                    if (b == false) {
                        processPayment = false;
                        alert("스마트콘을 적용할 수 없는 요금제가 있거나, 스마트콘 수량이 더 많습니다.");
                        return false;
                    }
                }
            }


            if (totalCount < smartconArr.length && isDiscountCouponIn) {
                processPayment = false;
                alert("관람권/할인권(성인요금만사용가능)/멤버십 포인트는\r\n좌석당 1매를 사용할 수 있습니다.\r\n좌석 수에 맞게 다시 선택해주세요.");
                return false;
            }

            var bRet = $.payment.coupon.calcCoupon(couponArray);
            $.payment.view.show();
            return bRet;

        }


        $.payment = {};

        $.payment.data = {
            salePrice: new Array(),
            totalPrice: 0,
            exchangePrice: 0,
            exchangeCount: 0,
            discountPrice: 0,
            discountCount: 0,
            pointExchangePrice: 0,
            pointExchangeCount: 0,
            okCash: 0,
        };

        $.payment.coupon = {};
        $.payment.point = {};
        $.payment.creditCard = {};
        $.payment.smartcon = {};

        $.payment.view = {
            show: function () {
                console.log("show");
                var remainPrice = $.payment.data.totalPrice;
                var discountCouponPrice = 0;

                $("div.section-pop-bottom2 li.d1>span span.display", "div.payment").html("");
                $("div.section-pop-bottom2 li.d2>span span.display", "div.payment").html("")
                $("div.section-pop-bottom2 li.d3>span span.display", "div.payment").html("")

                if ($.payment.data.exchangePrice != 0)
                    $("div.section-pop-bottom2 li.d1>span span.display", "div.payment").html($("<p ></p>").text($.payment.data.exchangePrice));

                if ($.payment.data.discountPrice != 0)
                    $("div.section-pop-bottom2 li.d2>span span.display", "div.payment").html($("<p ></p>").text($.payment.data.discountPrice));

                if ($.payment.data.pointExchangePrice != 0)
                    $("div.section-pop-bottom2 li.d3>span span.display", "div.payment").html($("<p ></p>").text($.payment.data.pointExchangePrice));

                discountCouponPrice = $.payment.data.exchangePrice + $.payment.data.discountPrice + $.payment.data.pointExchangePrice + $.payment.data.okCash;

                remainPrice = $.payment.data.totalPrice - discountCouponPrice;
                $("div.section-pop-bottom2 span.total-price>span", "div.payment").text(numberWithCommas($.payment.data.totalPrice));

                $("div.section-pop-bottom2 span.discount-price>span", "div.payment").text(numberWithCommas(discountCouponPrice));
                $("div.section-pop-bottom2 span.final-price>span", "div.payment").text(numberWithCommas(remainPrice));
            }
        }

        $.payment.coupon = {
            init: function () {
                $("table.bbs-list-coupon tbody", "div.payment").on("click", "input.couponkey", $.payment.coupon.selected);
                $("div.tab-coupon", "div.payment").on("click", "a.btn-apply-coupon", function () {
                    smartConCalc();
                });

                $("div.tab-coupon", "div.payment").on("click", "a.btn-new-coupon", function () {
                    var key = $(this).closest("div.tab-coupon").find("input.input-coupon").val();
                    var screenPlanId = '792483';
                    if (key.length < 13) {
                        alert("쿠폰은 13자리 입니다.");
                        return false;
                    }
                    $.post("/popup/AddCoupon2", { couponKey: key, screenPlanId: screenPlanId }, function (data) {
                        if (data.ErrorCode == 0) {
                            var html = "";
                            html += "<tr data-couponname='" + data.CouponName + "' ";
                            html += "data-settlecode='" + data.SettleCode + "' ";
                            html += "data-couponkey='" + data.CouponKey + "' ";
                            html += "data-constraints='" + data.Constraints + "' ";
                            html += "data-realprice='" + data.RealPrice + "' ";
                            html += "data-price='" + data.Price + "'>"
                            html += "<td><span>" + data.SettleCodeName + "</span></td>";
                            html += "<td>" + data.CouponName + "</td>";
                            html += "<td>" + data.CouponKey + "</td>";
                            html += "<td>" + data.Valid + "</td>";
                            html += "<td>";
                            html += "<input id='check_" + data.Id + "' class='couponkey' value='" + data.CouponKey + "' type='checkbox'>";
                            html += "<label class='label-check' for='check_" + data.Id + "'></label>";
                            html += "</td>";
                            html += "</tr>";
                            $("table.bbs-list-coupon tbody", "div.payment").append($(html));
                            alert("등록되었습니다.");
                            $("div.tab-coupon input.input-coupon", "div.payment").val("");
                        } else {
                            alert(data.Message);
                        }
                    });

                    return false;
                });
            },

            selected: function () {
                var isDiscountCouponIn = false;
                var couponArray = new Array();
                $(" table.bbs-list-coupon tbody input.couponkey:checked", "div.payment").each(function () {
                    var $tr = $(this).closest("tr");
                    couponArray.push(
                        new CouponEntity(
                            $tr.data("settlecode"),
                            $tr.data("couponkey"),
                            $tr.data("couponname"),
                            $tr.data("price"),
                            $tr.data("constraints"),
                            $tr.data("realprice")
                        ));
                    if ('' + $tr.data("settlecode") == '302') {
                    }
                });

                $.payment.data.salePrice.sort(function (obj1, obj2) {
                    return obj2.Price - obj1.Price;
                });

                var totalCount = 0;
                var allCount = 0;

                for (var key in $.payment.data.salePrice) {
                    var coupon = new Array();
                    for (var i = 0; i < $.payment.data.salePrice[key].Coupon.length; i++) {
                        if ($.payment.data.salePrice[key].Coupon[i].SettleCode == SettleCode.pointChange ||
                            $.payment.data.salePrice[key].Coupon[i].SettleCode == '307' ||
                            $.payment.data.salePrice[key].Coupon[i].SettleCode == '308' ||
                            $.payment.data.salePrice[key].Coupon[i].SettleCode == '309'
                            ) {
                            couponArray.push(new CouponEntity(
                                $.payment.data.salePrice[key].Coupon[i].SettleCode,
                                $.payment.data.salePrice[key].Coupon[i].Key,
                                $.payment.data.salePrice[key].Coupon[i].Name,
                                $.payment.data.salePrice[key].Coupon[i].Price,
                                $.payment.data.salePrice[key].Coupon[i].Constraints,
                                $.payment.data.salePrice[key].Coupon[i].RealPrice
                            ));
                        }
                        else if ($.payment.data.salePrice[key].Coupon[i].SettleCode == SettleCode.discount) {
                            isDiscountCouponIn = true;
                        }
                    }
                }

                couponArray.sort(function (obj1, obj2) {
                    if (obj2.SettleCode == '302' && obj1.SettleCode != '302') {
                        return 1;
                    }
                    else if (obj2.SettleCode != '302' && obj1.SettleCode == '302') {
                        return -1;
                    }
                    else {
                        return obj2.Price - obj1.Price;
                    }
                });

                var tempSalePrice = {};
                for (key in $.payment.data.salePrice) {
                    tempSalePrice[$.payment.data.salePrice[key].SalePriceId] = {
                        "SalePriceId": $.payment.data.salePrice[key].SalePriceId,
                        "Count": $.payment.data.salePrice[key].Count,
                        "Price": $.payment.data.salePrice[key].Price
                    };
                    if (('' + $.payment.data.salePrice[key].SalePriceCode).substring(0, 1) == '1') {
                        totalCount += parseInt($.payment.data.salePrice[key].Count);
                    }
                    allCount += parseInt($.payment.data.salePrice[key].Count);
                }


                if ($(this).closest("tbody").find("input.couponkey:checked").size() + $.payment.data.pointExchangeCount > allCount) {
                    alert("티켓 수보다 많은 관람권/교환권/포인트를 사용할 수 없습니다.");
                    $(this).prop("checked", false);
                    return false;
                }


                if (totalCount == couponArray.length && isDiscountCouponIn) {
                    alert("관람권/할인권(성인요금만사용가능)/멤버십 포인트는\r\n좌석당 1매를 사용할 수 있습니다.\r\n좌석 수에 맞게 다시 선택해주세요.");
                    return false;
                }


                for (var i = 0; i < couponArray.length; i++) {
                    b = false;
                    for (var key in tempSalePrice) {
                        if (tempSalePrice[key].Count > 0) {
                            if (tempSalePrice[key].Price <= couponArray[i].Price) {
                                tempSalePrice[key].Count--;
                                b = true;
                                break;
                            }
                        }
                    }
                    if (b == false) {
                        if (couponArray[i].SettleCode == SettleCode.exchange) {
                            alert("관람권/교환권을 추가 할수 없습니다.");
                            $(this).prop("checked", false);
                            return false;
                        }
                    }
                }

                return;
            },

            remainCount: function () {
                var couponCount = 0;
                var totalCount = 0;
                for (key in $.payment.data.salePrice) {
                    totalCount += parseInt($.payment.data.salePrice[key].Count);
                    for (var i = 0; i < $.payment.data.salePrice[key].Coupon.length; i++) {
                        if ($.payment.data.salePrice[key].Coupon[i].SettleCode == SettleCode.discount ||
                            $.payment.data.salePrice[key].Coupon[i].SettleCode == SettleCode.exchange ||
                            $.payment.data.salePrice[key].Coupon[i].SettleCode == '307' ||
                            $.payment.data.salePrice[key].Coupon[i].SettleCode == '308' ||
                            $.payment.data.salePrice[key].Coupon[i].SettleCode == '309'
                        ) {
                            couponCount++;
                        }
                    }
                }
                return totalCount - couponCount - $.payment.data.pointExchangeCount;
            },

            paymentCouponCount: function () {
                var couponCount = 0;
                var totalCount = 0;
                for (key in $.payment.data.salePrice) {
                    totalCount += parseInt($.payment.data.salePrice[key].Count);
                    for (var i = 0; i < $.payment.data.salePrice[key].Coupon.length; i++) {
                        if ($.payment.data.salePrice[key].Coupon[i].SettleCode == SettleCode.discount ||
                            $.payment.data.salePrice[key].Coupon[i].SettleCode == SettleCode.exchange ||
                            $.payment.data.salePrice[key].Coupon[i].SettleCode == SettleCode.pointChange ||
                            $.payment.data.salePrice[key].Coupon[i].SettleCode == '307' ||
                            $.payment.data.salePrice[key].Coupon[i].SettleCode == '308' ||
                            $.payment.data.salePrice[key].Coupon[i].SettleCode == '309'

                        ) {
                            couponCount++;
                        }
                    }
                }

                return totalCount - $.payment.data.pointExchangeCount;
            },

            set: function () {
                console.log("set");
                var couponArray = new Array();
                for (var key in $.payment.data.salePrice) {
                    var coupon = new Array();
                    for (var i = 0; i < $.payment.data.salePrice[key].Coupon.length; i++) {
                        if ($.payment.data.salePrice[key].Coupon[i].SettleCode == SettleCode.pointChange ||
                            $.payment.data.salePrice[key].Coupon[i].SettleCode == SettleCode.exchange ||
                            $.payment.data.salePrice[key].Coupon[i].SettleCode == SettleCode.discount ||
                            $.payment.data.salePrice[key].Coupon[i].SettleCode == '307' ||
                            $.payment.data.salePrice[key].Coupon[i].SettleCode == '308' ||
                            $.payment.data.salePrice[key].Coupon[i].SettleCode == '309'
                        ) {
                            coupon.push(new CouponEntity(
                                $.payment.data.salePrice[key].Coupon[i].SettleCode,
                                $.payment.data.salePrice[key].Coupon[i].Key,
                                $.payment.data.salePrice[key].Coupon[i].Name,
                                $.payment.data.salePrice[key].Coupon[i].Price,
                                $.payment.data.salePrice[key].Coupon[i].Constraints,
                                $.payment.data.salePrice[key].Coupon[i].RealPrice
                            ));
                        }
                    }


                    for (var i = 0; i < coupon.length; i++) {
                        // 쿠폰이 들어 있지 않으면 추가한다.
                        couponArray.push(new CouponEntity(
                            coupon[i].SettleCode,
                            coupon[i].Key,
                            coupon[i].Name,
                            coupon[i].Price,
                            coupon[i].Constraints,
                            coupon[i].RealPrice

                        ));
                    }
                    delete $.payment.data.salePrice[key].Coupon;
                    $.payment.data.salePrice[key].Coupon = new Array();
                }


                $(" table.bbs-list-coupon tbody input.couponkey:checked", "div.payment").each(function () {
                    var $tr = $(this).closest("tr");


                    var isIn = false;

                    couponArray.forEach(function (item, index, arr2) {

                        if (item.Key == $tr.data("couponkey")) {
                            isIn = true;
                        }
                    });
                    if (!isIn) {
                        couponArray.push(
                            new CouponEntity(
                                $tr.data("settlecode"),
                                $tr.data("couponkey"),
                                $tr.data("couponname"),
                                $tr.data("price"),
                                $tr.data("constraints"),
                                $tr.data("realprice")
                            ));
                    }
                });
                console.log(couponArray)
                console.log($.payment.data.salePrice)
                var retB = $.payment.coupon.calcCoupon(couponArray);
                console.log($.payment.data.salePrice)
                return retB;
            },

            remove: function (settleCode) {
                var couponArray = new Array();
                for (var key in $.payment.data.salePrice) {
                    var coupon = new Array();
                    if (settleCode != "301") {
                        console.log('settlecode not 301');
                        for (var i = 0; i < $.payment.data.salePrice[key].Coupon.length; i++) {
                            if ($.payment.data.salePrice[key].Coupon[i].SettleCode != settleCode) {
                                coupon.push(new CouponEntity(
                                    $.payment.data.salePrice[key].Coupon[i].SettleCode,
                                    $.payment.data.salePrice[key].Coupon[i].Key,
                                    $.payment.data.salePrice[key].Coupon[i].Name,
                                    $.payment.data.salePrice[key].Coupon[i].Price,
                                    $.payment.data.salePrice[key].Coupon[i].Constraints,
                                    $.payment.data.salePrice[key].Coupon[i].RealPrice,
                                ));
                            }
                        }
                    }
                    else {
                        console.log('settlecode 301');
                        for (var i = 0; i < $.payment.data.salePrice[key].Coupon.length; i++) {
                            if (!($.payment.data.salePrice[key].Coupon[i].SettleCode == '301' ||
                                $.payment.data.salePrice[key].Coupon[i].SettleCode == '307' ||
                                $.payment.data.salePrice[key].Coupon[i].SettleCode == '308' ||
                                $.payment.data.salePrice[key].Coupon[i].SettleCode == '309'
                            )) {
                                coupon.push(new CouponEntity(
                                    $.payment.data.salePrice[key].Coupon[i].SettleCode,
                                    $.payment.data.salePrice[key].Coupon[i].Key,
                                    $.payment.data.salePrice[key].Coupon[i].Name,
                                    $.payment.data.salePrice[key].Coupon[i].Price,
                                    $.payment.data.salePrice[key].Coupon[i].Constraints,
                                    $.payment.data.salePrice[key].Coupon[i].RealPrice
                                ));
                            }
                        }

                    }
                    for (var i = 0; i < coupon.length; i++) {
                        couponArray.push(new CouponEntity(
                            coupon[i].SettleCode,
                            coupon[i].Key,
                            coupon[i].Name,
                            coupon[i].Price,
                            coupon[i].Constraints, 
                            coupon[i].RealPrice
                        ));
                    }
                    delete $.payment.data.salePrice[key].Coupon;
                    $.payment.data.salePrice[key].Coupon = new Array();
                }
                console.log(couponArray);
                $.payment.coupon.calcCoupon(couponArray);
                $.payment.view.show();
            },

            calcCoupon: function (couponArray) {
                $.payment.data.pointExchangeCount = 0;
                $.payment.data.pointExchangePrice = 0;
                $.payment.data.exchangeCount = 0;
                $.payment.data.discountCount = 0;
                $.payment.data.exchangePrice = 0;
                $.payment.data.discountPrice = 0;

                console.log(couponArray.length);
                $.payment.data.salePrice.sort(function (obj1, obj2) {
                    return obj2.Price - obj1.Price;
                });

                for (var salePriceLoop = 0; salePriceLoop < $.payment.data.salePrice.length; salePriceLoop++) {
                    console.log($.payment.data.salePrice[salePriceLoop].Price);
                }


                    couponArray.sort(function (obj1, obj2) {
                        if (obj2.SettleCode == '302' && obj1.SettleCode != '302') {
                            return 1;
                        }
                        else if (obj2.SettleCode != '302' && obj1.SettleCode == '302') {
                            return -1;
                        }
                        else {
                            return obj2.Price - obj1.Price;
                        }
                    });

                for (var i = 0; i < couponArray.length; i++) {
                    if (couponArray[i].SettleCode == SettleCode.discount) {
                        var b = false;

                        for (var salePriceLoop = 0; salePriceLoop < $.payment.data.salePrice.length; salePriceLoop++) {
                            if ($.payment.data.salePrice[salePriceLoop].Coupon.length < $.payment.data.salePrice[salePriceLoop].Count) {
                                console.log("discoubt : " + couponArray[i].SettleCode);
                                $.payment.data.salePrice[salePriceLoop].Coupon.push(new CouponEntity(
                                                                            couponArray[i].SettleCode,
                                                                            couponArray[i].Key,
                                                                            couponArray[i].Name,
                                                                            couponArray[i].Price,
                                                                            couponArray[i].Constraints,
                                                                            couponArray[i].RealPrice
                                                                        ));
                                if (couponArray[i].Price >= $.payment.data.salePrice[salePriceLoop].Price) {
                                    $.payment.data.discountPrice += $.payment.data.salePrice[salePriceLoop].Price;
                                } else {
                                    $.payment.data.discountPrice += couponArray[i].Price;
                                }
                                $.payment.data.discountCount++;
                                b = true;
                                break;
                            }
                        }
                    }
                }

                for (var i = 0; i < couponArray.length; i++) {
                    if (couponArray[i].SettleCode != SettleCode.pointChange) {
                            // 7000원 또는 8000원 쿠폰인지 확인
                            for (var salePriceLoop = 0; salePriceLoop < $.payment.data.salePrice.length; salePriceLoop++) {
                                if ($.payment.data.salePrice[salePriceLoop].Coupon.length < $.payment.data.salePrice[salePriceLoop].Count) {
                                    if ((couponArray[i].Constraints & 6144) == 0 && (couponArray[i].Constraints & 131072) == 0) {
                                        if (couponArray[i].Price >= $.payment.data.salePrice[salePriceLoop].Price) {
                                            console.log("exchange : " + couponArray[i].SettleCode);
                                            $.payment.data.salePrice[salePriceLoop].Coupon.push(new CouponEntity(
                                                couponArray[i].SettleCode,
                                                couponArray[i].Key,
                                                couponArray[i].Name,
                                                couponArray[i].Price,
                                                couponArray[i].Constraints,
                                                couponArray[i].RealPrice
                                            ));

                                            $.payment.data.exchangePrice += $.payment.data.salePrice[salePriceLoop].Price;
                                            $.payment.data.exchangeCount++;
                                            break;
                                        }
                                    }
                                    else {
                                        if (couponArray[i].Price >= $.payment.data.salePrice[salePriceLoop].Price &&
                                            ((couponArray[i].Constraints & 2048) == 2048 && $.payment.data.salePrice[salePriceLoop].Price > 7000) ||
                                            ((couponArray[i].Constraints & 4096) == 4096 && $.payment.data.salePrice[salePriceLoop].Price > 8000) ||
                                            ((couponArray[i].Constraints & 131072) == 131072 && $.payment.data.salePrice[salePriceLoop].Price > couponArray[i].RealPrice)
                                            ) {
                                            console.log("exchange : " + couponArray[i].SettleCode);
                                            $.payment.data.salePrice[salePriceLoop].Coupon.push(new CouponEntity(
                                                couponArray[i].SettleCode,
                                                couponArray[i].Key,
                                                couponArray[i].Name,
                                                couponArray[i].Price,
                                                couponArray[i].Constraints,
                                                couponArray[i].RealPrice
                                            ));
                                            if ((couponArray[i].Constraints & 2048) == 2048) {
                                                $.payment.data.exchangePrice += ($.payment.data.salePrice[salePriceLoop].Price - 7000);
                                            }
                                            else if ((couponArray[i].Constraints & 4096) == 4096) {
                                                $.payment.data.exchangePrice += ($.payment.data.salePrice[salePriceLoop].Price - 8000);
                                            }
                                            else if ((couponArray[i].Constraints & 131072) == 131072) {
                                                $.payment.data.exchangePrice += ($.payment.data.salePrice[salePriceLoop].Price - couponArray[i].RealPrice);
                                            }
                                            
                                            $.payment.data.exchangeCount++;
                                            break;
                                        }
                                    }
                                }
                            }
                    }
                    else if (couponArray[i].SettleCode == SettleCode.pointChange) {
                            for (var salePriceLoop = 0; salePriceLoop < $.payment.data.salePrice.length; salePriceLoop++) {
                                if ($.payment.data.salePrice[salePriceLoop].Coupon.length < $.payment.data.salePrice[salePriceLoop].Count) {
                                    console.log("pointChange : " + couponArray[i].SettleCode);
                                    $.payment.data.salePrice[salePriceLoop].Coupon.push(new CouponEntity(
                                                                                couponArray[i].SettleCode,
                                                                                couponArray[i].Key,
                                                                                couponArray[i].Name,
                                                                                couponArray[i].Price,
                                                                                couponArray[i].Constraints,
                                                                                couponArray[i].RealPrice
                                                                            ));
                                    if (couponArray[i].Price >= $.payment.data.salePrice[salePriceLoop].Price) {
                                        $.payment.data.pointExchangePrice += $.payment.data.salePrice[salePriceLoop].Price;
                                    } else {
                                        $.payment.data.pointExchangePrice += couponArray[i].Price;
                                    }
                                    $.payment.data.pointExchangeCount++;
                                    break;
                                }
                            }
                        }
                }


                //$.payment.point.reset($.payment.data.exchangeCount + $.payment.data.discountCount);
                return true;
            }
        };

        var lastType = 0;

        $.payment.smartcon = {
            init: function () {
                allsmartCon = new Array();
                $("#smartConItems").hide();
                $("#listCoupon").on("click", "input[name=couponList]", function () {
                    var type = $(this).data("type");
                    lastType = parseInt(type);
                    if (lastType == 2) {
                        $("#couponItems").hide();
                        $("#smartConItems").show();
                    }
                    else {
                        $("#couponItems").show();
                        $("#smartConItems").hide();
                    }
                });

                $("#btnSmartconSearch").click(function () {
                    var key = $("#smartconCode").val();
                    var screenPlanId = '792483';
                    if (key.length < 11) {
                        alert("스마트콘 바코드는 11자리 입니다.");
                        return false;
                    }
                    $.post("/popup/SearchSmartCon", { couponKey: key, screenPlanId: screenPlanId }, function (data) {
                        if (data.ErrorCode == 0) {
                            var isIn = false;
                            allsmartCon.forEach(smkey => {
                                if (smkey == data.CouponKey) {
                                    console.log(smkey);
                                    console.log(data.CouponKey);
                                    isIn = true;
                                }
                            });

                            if (!isIn) {
                                allsmartCon.push(data.CouponKey);

                                var html = "";
                                html += "<tr data-couponname='" + data.CouponName + "' ";
                                html += "data-settlecode='" + data.SettleCode + "' ";
                                html += "data-couponkey='" + data.CouponKey + "' ";
                                html += "data-constraints='" + data.Constraints + "' ";
                                html += "data-realprice='" + data.RealPrice + "' ";
                                html += "data-price='" + data.Price + "'>"
                                html += "<td>스마트콘</td>";
                                html += "<td>" + data.CouponName + "</td>";
                                html += "<td>";
                                html += "<input id='check_" + data.Id + "' class='smartconkey' value='" + data.CouponKey + "' type='checkbox' checked>";
                                html += "<label class='label-check' for='check_" + data.Id + "'></label>";
                                html += "</td>";
                                html += "</tr>";
                                $("table.bbs-list-smartcon tbody", "div.payment").append($(html));
                                $("#smartconCode").val("");
                            }
                        } else {
                            alert(data.Message);
                        }
                    });

                    return false;
                });

                $("#applySmartCon").click(function () {
                    smartConCalc();
                });

            }
        };

        $.payment.point = {
            init: function () {
                $("div.tab-point ul.list-point #radio_p3", "div.payment").prop("checked", true);
                $("div.tab-point ul.list-point", "div.payment").on("click", "input[name=point]", function () {
                    if ($(this).prop("disabled") == false) {
                        var type = $(this).data("type");
                        $(this).closest("div.tab-point").find("div.pointtype").hide();
                        $(this).closest("div.tab-point").find("div.pointtype_" + type).show();
                    }
                    else {
                        alert('show');
                    }
                });

                $("div.tab-point span.wrap-select-point", "div.payment").on("change", ".select-point", function () {
                    console.log($.payment.data.salePrice)
                    if ($(this).val() != "") {
                        if ($(this).val() > $.payment.point.remainCount()) {
                            processPayment = false;
                            alert("교환할 수 있는 교환권수를 초과 하였습니다.")
                            $(this).val("");
                            return false;
                        }
                    }
                });

                $("div.tab-point div.wrap-point-for-payment", "div.payment").on("click", "a.btn-apply-point", function () {
                    if ($("div.tab-point span.wrap-select-point .select-point", "div.payment").val() == "") {
                        processPayment = false;
                        alert("사용할 포인트를 선택하세요");
                        return false;
                    }
                    smartConCalc();
                });
            },

            reset: function (couponCount) {
                console.log("------ reset --------");
                console.log(size + ',' + couponCount)
                var size = $("div.wrap-point-for-payment select.select-point option", "div.payment").size();
                $("div.wrap-point-for-payment select.select-point option", "div.payment").prop("disabled", true);
                $("div.wrap-point-for-payment select.select-point option", "div.payment").each(function () {
                    console.log($(this).val() + ',' + 1 + ',' + couponCount)
                    if ($(this).val() <= (1 - couponCount)) {
                        $(this).prop("disabled", false).removeProp("disabled");
                    }
                });
                console.log("------ reset --------");
            },

            remainCount: function () {
                var couponCount = 0;
                var totalCount = 0;
                for (key in $.payment.data.salePrice) {
                    totalCount += parseInt($.payment.data.salePrice[key].Count);
                    for (var i = 0; i < $.payment.data.salePrice[key].Coupon.length; i++) {
                        if ($.payment.data.salePrice[key].Coupon[i].SettleCode == SettleCode.discount || $.payment.data.salePrice[key].SettleCode == SettleCode.exchange) {
                            couponCount++;
                        }
                    }
                }
                return totalCount - $.payment.data.exchangeCount - $.payment.data.discountCount;
            }
        };

        $.payment.creditCard = {
            _cardPaymethod : {
                "CCBC": "ISP", "CCKM": "ISP", "CCSU": "ISP", "CCJB": "ISP", "CCKJ": "ISP", "CCPH": "ISP", "CCSM": "ISP", "CCPB": "ISP", "CCSB": "ISP", "CCKD": "ISP", "CCCJ": "ISP", "CCCU": "ISP", "CCWR": "ISP",
                "CCLG": "V3D","CCDI": "V3D","CCSS": "V3D","CCKE": "V3D","CCLO": "V3D","CCCT": "V3D","CCNH": "V3D","CCHN": "V3D"
            },
            tno : null,

            init: function () {
                $("div.tab-content ul.list-method", "div.payment").on("click", "input[name=point]", function () {
                    $.payment.creditCard.setCard($(this).val());
                });
            },

            isCreditProcess: function() {
                if ($("#hubCard select[name=card_code]", "div.payment").val() == "") {
                    return false;
                }
                return true;
            },

            setCard: function(cardCode) {
                $("#hubCard select[name=card_code]", "div.payment").val(cardCode);
                $("#hubCard input[name=card_pay_method]", "div.payment").val($.payment.creditCard._cardPaymethod[cardCode]);
            },

            process: function (show) {
                if (show == true)
                    $("div.section-pop-bottom2 a.btn-rsv-payment", "div.payment").hide();
                else
                    $("div.section-pop-bottom2 a.btn-rsv-payment", "div.payment").show();
            },

            open: function (settleId, price) {
                console.log("$.payment.creditCard.open")

                if ($("#hubCard select[name=card_code]", "div.payment").val() != "NAVER") {
                    if ($("#hubCard select[name=card_code]", "div.payment").val() == "" || $("#hubCard select[name=card_code]", "div.payment").val() == null) {
                        alert("신용카드, 휴대폰, 간편결제(페이코) 중 하나를 선택해 주세요");
                        processPayment = false;
                        return false;
                    }

                    $("#hubCard input[name=ordr_idxx]", "div.payment").val(settleId);
                    $("#hubCard input[name=good_mny]", "div.payment").val(price);
                    //$("#hubCard input[name=card_mony]", "div.payment").val(price);
                    $.payment.creditCard.process(true);
                    authViewSelect("P");  //I=ifrmae, P=Popup

                    if ($("#hubCard select[name=card_code]", "div.payment").val() == "CCPT") {
                        $("#hubCard input[name=payco_direct]", "div.payment").val("Y");
                        $("#hubCard input[name=kakaopay_direct]", "div.payment").val("N");
                        $("#hubCard input[name=naverpay_direct]", "div.payment").val("N");
                    }
                    else if ($("#hubCard select[name=card_code]", "div.payment").val() == "MOBX") {
                        $("#hubCard input[name=payco_direct]", "div.payment").val("N");
                        $("#hubCard input[name=kakaopay_direct]", "div.payment").val("N");
                        $("#hubCard input[name=naverpay_direct]", "div.payment").val("N");
                        $("#hubCard input[name=pay_method]", "div.payment").val("000010000000");
                    }
                    else if ($("#hubCard select[name=card_code]", "div.payment").val() == "PACA") {
                        $("#hubCard input[name=payco_direct]", "div.payment").val("N");
                        $("#hubCard input[name=kakaopay_direct]", "div.payment").val("Y");
                        $("#hubCard input[name=naverpay_direct]", "div.payment").val("N");
                        $("#hubCard input[name=pay_method]", "div.payment").val("100000000000");
                    }
                    else if ($("#hubCard select[name=card_code]", "div.payment").val() == "SCNA") {
                        $("#hubCard input[name=payco_direct]", "div.payment").val("N");
                        $("#hubCard input[name=kakaopay_direct]", "div.payment").val("N");
                        $("#hubCard input[name=naverpay_direct]", "div.payment").val("Y");
                        $("#hubCard input[name=pay_method]", "div.payment").val("100000000000");
                    }
                    else {
                        $("#hubCard input[name=naverpay_direct]", "div.payment").val("N");
                        $("#hubCard input[name=payco_direct]", "div.payment").val("N");
                        $("#hubCard input[name=kakaopay_direct]", "div.payment").val("N");

                    }

                    KCP_Pay_Execute($("#hubCard form[name=v3d_form]", "div.payment")[0]);
                    $.payment.creditCard.process(false);
                }
                else {
                    // 네이버 페이 프로세스 시작

                    document.getElementById('blockSettle').style.visibility = 'visible';

                    oPay = Naver.Pay.create({ //SDK Parameters를 참고 바랍니다.
                        'mode': 'production',
                        'clientId': 'Dwzwl07QK3NJrrwLhEE9',
                        'chainId': 'c2ZHV3N5bTJ1Vm9',
                        'openType': 'popup',
                        'onAuthorize': function (oData) {
                            if (oData.resultCode === "Success") {
                                $.desktop.paymentpop._paymentData.NaverPaymentId = oData.paymentId;
                                $.desktop.paymentpop._payment();
                                document.getElementById('blockSettle').style.visibility = 'collapse';
                            } else {
                                alert(oData.resultMessage);
                                oPay.close();

                                document.getElementById('blockSettle').style.visibility = 'collapse';
                            }
                        }
                    });

                    oPay.open({
                            'merchantPayKey': settleId,
                            'productName': '챌린저스 신도림점 10관',
                            'totalPayAmount': price,
                            'extraDeduction': true,
                            'taxScopeAmount': price,
                            'taxExScopeAmount': 0,
                            'useCfmYmdt': '20240503',
                            'returnUrl': 'https://cineq.co.kr/popup/payment?settleId=' + settleId,
                            'productCount': 1,
                            'productItems': [{"categoryType":"MOVIE","categoryId":"TICKET","uid":"20249318","name":"챌린저스 신도림점 10관","startDate":"20240503","endDate":"20240503","count":1}]
                    });


                }
            },

            _order: function () {
                var getValue = function (name) {
                    var val = "";
                    if (name == "card_code") {
                        val = $("#hubCard select[name=card_code]", "div.payment").val();
                    } else {
                        val = $("#hubCard input[name="+ name + "]", "div.payment").val();
                    }

                    if (val == undefined || val == null)
                        return "";

                    return val;
                };

                return {
                    ordr_idxx: getValue("ordr_idxx"),
                    site_cd: getValue("site_cd"),
                    site_name: getValue("site_name"),
                    good_name: getValue("good_name"),
                    good_mny: getValue("good_mny"),
                    buyr_name: getValue("buyr_name"),
                    buyr_mail: getValue("buyr_mail"),
                    buyr_tel1: getValue("buyr_tel1"),
                    buyr_tel2: getValue("buyr_tel2"),
                    currency: getValue("currency"),
                    pay_method: getValue("pay_method"),
                    module_type: getValue("module_type"),
                    enc_info: getValue("enc_info"),
                    enc_data: getValue("enc_data"),
                    ret_pay_method: getValue("ret_pay_method"),
                    tran_cd: getValue("tran_cd"),
                    use_pay_method: getValue("use_pay_method"),
                    ordr_chk: getValue("ordr_chk"),
                    cash_yn: getValue("cash_yn"),
                    cash_tr_code: getValue("cash_tr_code"),
                    cash_id_info: getValue("cash_id_info"),
                    good_expr: getValue("good_expr"),
                    payco_direct: getValue("payco_direct"),
                    kakaopay_direct: getValue("kakaopay_direct"),
                    naverpay_direct: getValue("naverpay_direct"),
                    quotaopt: getValue("quotaopt"),
                    req_tx: getValue("req_tx")
                };
            },

            _cancel: function () {

                var getValue = function (name) {
                    var val = "";
                    if (name == "card_code") {
                        val = $("#hubCard select[name=card_code]", "div.payment").val();
                    } else {
                        val = $("#hubCard input[name=" + name + "]", "div.payment").val();
                    }

                    if (val == undefined || val == null) {
                        return "";
                    }

                    return val;
                };

                processPayment = false;

                return {
                    tno: $.payment.creditCard.tno,  //
                    mod_type: "STSC",     //
                    mod_desc: "거래취소",     //
                    mod_mny: "",
                    rem_mny: "",
                    mod_tax_mny: "",
                    mod_vat_mny: "",
                    mod_free_mny: "",
                    site_cd: getValue("site_cd")
                }
            },

            complete: function (frm_mpi) {
                GetField($("#hubCard form[name=v3d_form]", "div.payment")[0], frm_mpi);
                $.ajax({
                    url: "/StandardCredit/pp_cli_hub",
                    dataType: "json",
                    data: $.payment.creditCard._order(),
                    type: "POST",
                    success: function (response) {
                        $.desktop.paymentpop.addPayment("credit", response);
                    },
                    error: function (response) {
                        console.log(response);
                        processPayment = false;
                        alert("카드 결제 진행중 오류가 발생하였습니다(1). \r\n 다시 시도해주세요");
                    }
                });
            },

            cancel: function (func) {
                var arr = new Array();
                processPayment = false;
                arr.push("카드 결제 진행중 오류가 발생하였습니다(2). \r\n 다시 시도해주세요");
                if ($.payment.creditCard.tno == null || $.payment.creditCard.tno == "") {
                    func.apply(null, arr)
                } else {
                    $.ajax({
                        url: "/Credit/pp_cli_hub",
                        dataType: "json",
                        data: $.payment.creditCard._cancel(),
                        type: "POST",
                        success: function (data) {
                            console.log(data);
                            $.payment.creditCard.tno = null;
                            func.apply(null, arr);
                        },
                        error: function (data) {
                            console.log(data);
                            alert(null, arr);
                        }
                    });
                }
            }
        };

        $.desktop.paymentpop = {};
        $.desktop.paymentpop = {
            _isCreditProcess: false,
            _isOkCashBagProcess:false,
            _paymentData: {},

            init: function () {
                $.desktop.paymentpop._initData();
                $.desktop.paymentpop._initEvent();

                $.payment.coupon.init();
                $.payment.point.init();
                $.payment.creditCard.init();
                $.payment.smartcon.init();

                $.payment.view.show();
            },

            _initData: function () {
                $.payment.data.totalPrice = parseInt("10000");
                $.payment.data.count = 0;
                //$.desktop.reserveData.constraints = "";

                for (key in $.desktop.reserveData.salePrice) {
                    $.payment.data.salePrice.push(new SalePriceEntity(
                        $.desktop.reserveData.salePrice[key].SalePriceId,
                        $.desktop.reserveData.salePrice[key].Price,
                        $.desktop.reserveData.salePrice[key].SalePriceName,
                        $.desktop.reserveData.salePrice[key].SalePriceCode,
                        $.desktop.reserveData.salePrice[key].Count
                    ));

                    $.payment.data.count += parseInt($.desktop.reserveData.salePrice[key].Count);
                }
            },

            _recalc: function() {
                $("table.bbs-list-coupon tbody input.couponkey:checked", "div.payment").prop("checked", false).removeProp("checked");
                $("div.tab-point span.wrap-select-point .select-point", "div.payment").val($.payment.data.pointExchangeCount);
                var couponArray = new Array();
                for (var key in $.payment.data.salePrice) {
                    var coupon = new Array();
                    for (var i = 0; i < $.payment.data.salePrice[key].Coupon.length; i++) {
                        if ($.payment.data.salePrice[key].Coupon[i].SettleCode != SettleCode.pointChange) {
                            $("table.bbs-list-coupon tbody input.couponkey[value=" + $.payment.data.salePrice[key].Coupon[i].Key + "]", "div.payment").prop("checked", true);
                        }
                    }
                }
                $.payment.point.reset($.payment.data.exchangeCount + $.payment.data.discountCount);
            },

            _initEvent: function () {
                $("ul.tab-discount a.tab", "div.payment").click(function (event) {
                    $(this).closest("ul.tab-discount").find("li").removeClass("on");
                    $(this).closest("li").addClass("on");
                    if (document.getElementById("cp").className == "on") {
                        if (lastType == 2) {
                            $("#couponItems").hide();
                            $("#smartConItems").show();
                        }
                        else {
                            $("#couponItems").show();
                            $("#smartConItems").hide();
                        }
                    }
                    else if (document.getElementById("mb").className == "on") {
                        $("#couponItems").hide();
                        $("#smartConItems").hide();
                    }
                    $.desktop.paymentpop._recalc();
                    event.preventDefault();
                    return false;
                });

                $("div.section-pop-bottom2 ul.discount", "div.payment").on("click", "a", function () {
                    var settleCode = $(this).data("settlecode");
                    if (settleCode == "301") {
                        $.payment.coupon.remove(settleCode);
                    } else if (settleCode == "302") {
                        $.payment.coupon.remove(settleCode);
                    } else if (settleCode == "303") {
                        $.payment.coupon.remove(settleCode);
                    }


                    $.desktop.paymentpop._recalc();

                    event.preventDefault();
                    return false;
                }); */

                $("div.section-pop-top", "div.payment").on("click", "a.btn-rsv-reset", function (event) {
                    if (confirm("모든 선택정보가 사라집니다. 계속하시겠습니까?") == false) {
                        return false;
                    }
                   /*  $.desktop.seatchoicepop.clearSeatmap(function () {
                        $.desktop.reserve.openPrev(
                            {
                                playDate: $.desktop.reserveData.playDate,
                                theaterCode: $.desktop.reserveData.theaterCode,
                                movieCode: "",
                                screenPlanId: ""
                            }
                        );
                    });

                    event.preventDefault(); */
                    location.href = "ticket.jsp";
                    return false;
                });

                $("a.close-modal", "div.payment").click(function () {
                    if (confirm("모든 선택정보가 사라집니다. 계속하시겠습니까?") == false) {
                        return false;
                    }
                    /* $.desktop.seatchoicepop.clearSeatmap(function () {
                        $.modal.close();
                    });
                    return false; */
                    location.href = "ticket.jsp";
                });

                /* $("a.btn-rsv-payment", "div.payment").click(function () {
                    var res = {};
                    res.SalePrice = new Array();
                    res.CouponList = new Array();
                    res.PointTicket = $.payment.data.pointExchangeCount;

                    var couponArray = new Array();
                    var totalPrice = 0;
                    var couponPrice = 0;
                    for (var key in $.payment.data.salePrice) {
                        salePrice = {
                            SalePriceId: $.payment.data.salePrice[key].SalePriceId,
                            Price: $.payment.data.salePrice[key].Price,
                            Count: $.payment.data.salePrice[key].Count,
                            Coupon: new Array()
                        };
                        totalPrice += $.payment.data.salePrice[key].Price;
                        for (var i = 0; i < $.payment.data.salePrice[key].Coupon.length; i++) {
                                salePrice.Coupon.push({
                                    SettleCode: $.payment.data.salePrice[key].Coupon[i].SettleCode,
                                    Key: $.payment.data.salePrice[key].Coupon[i].Key,
                                    Price: $.payment.data.salePrice[key].Coupon[i].Price,
                                    Constraints: $.payment.data.salePrice[key].Coupon[i].Constraints,
                                });
                        }

                        for (var i = 0; i < salePrice.Coupon.length; i++) {
                            res.CouponList.push({
                                SettleCode: $.payment.data.salePrice[key].Coupon[i].SettleCode,
                                Key: $.payment.data.salePrice[key].Coupon[i].Key,
                                Price: $.payment.data.salePrice[key].Coupon[i].Price,
                                Constraints: $.payment.data.salePrice[key].Coupon[i].Constraints,
                            });
                            couponPrice += $.payment.data.salePrice[key].Coupon[i].Price;
                        }
                        res.SalePrice.push(salePrice);
                    }

                    if ((totalPrice - couponPrice) > 0) {
                        if ($.payment.creditCard.isCreditProcess() == false) {
                            alert("신용카드, 간편결제(페이코), 휴대폰 중 하나를 선택해 주세요");
                            processPayment = false;
                            return false;
                        }
                    }

                    if (processPayment) {
                        alert('결제진행중입니다.');
                        return false;
                    }

                    processPayment = true;

                    $.ajax({
                        url: "/popup/PaymentPointCheck",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ req: res }),
                        type: "POST",
                        success: function (data) {
                            if (data.ErrorCode == 0) {
                                if (data.KoficDiscount > 0 && data.RemainPrice != 0) {
                                    alert(data.KoficMessage + data.KoficDiscount + '원이 할인되었습니다!\r\n잔여금액 ' + data.RemainPrice + '원만 결제하시면 됩니다.\r\n(1인 2매까지 적용, 타 쿠폰 중복 적용 불가)');
                                }
                                else if (data.KoficDiscount > 0) {
                                    alert(data.KoficMessage + '\r\n전액이 결제되었습니다.');
                                }
                                else if (data.KoficMessage != null) {
                                    if (data.KoficMessage.length > 0) {
                                        //alert(data.KoficMessage);
                                    }
                                }

                                if ((data.ScreenPropertyCode & 524288) != 0 || (data.ScreenPropertyCode & 4)) {
                                    alert('특별상영, 무대인사 영화는 상영 당일 취소가 불가능합니다. 확인하시고 결제 부탁드리겠습니다.');
                                }


                                $.desktop.paymentpop._paymentData = {
                                    Ticket: data.Ticket,
                                    CreditCard: null,
                                    NaverPaymentId: null
                                };
                                $.payment.creditCard.tno = null;
                                $.desktop.paymentpop._isCreditProcess = false;
                                $.desktop.paymentpop._isOkCashBagProcess = false
                                if (data.RemainPrice == 0) {
                                    $.desktop.paymentpop._payment();
                                    processPayment = false;
                                } else {
                                    // 카드 결제 처리 진행 //
                                    $.desktop.paymentpop._isCreditProcess = true;
                                    $.payment.creditCard.open(data.SettleId, data.RemainPrice);
                                    processPayment = false;
                                }
                            } else {
                                processPayment = false;
                                alert(data.ErrorMessage);
                                $.desktop.reserve.openPrev(
                                    {
                                        playDate: $.desktop.reserveData.playDate,
                                        theaterCode: $.desktop.reserveData.theaterCode,
                                        movieCode: "",
                                        screenPlanId: ""
                                    }
                                );
                            }
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            processPayment = false;
                        }
                    });

                    return false;
                });
            },

            addPayment:function(type, data) {
                if (type == "credit") {
                    $.desktop.paymentpop._isCreditProcess = false;
                    $.desktop.paymentpop._paymentData.CreditCard = data;
                    console.log(data);
                    $.payment.creditCard.tno = data.tno;
                    console.log($.desktop.paymentpop._paymentData.CreditCard)
                }

                if ($.desktop.paymentpop._isCreditProcess == false && $.desktop.paymentpop._isOkCashBagProcess == false) {
                    $.desktop.paymentpop._payment();
                }
            },



            _payment: function () {
                $.ajax({
                    url: "/popup/PaymentConfirm",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ req: $.desktop.paymentpop._paymentData }),
                    type: "POST",
                    success: function (response) {
                        if (response.ErrorCode == 0) {
                            $.desktop.paymentPrint.open(response.SettleId);
                        }
                        else {
                            processPayment = false;
                            if ($.desktop.paymentpop._paymentData.CreditCard != null) {
                                $.payment.creditCard.cancel(function (message) {
                                    alert(message);
                                });
                            } else {
                                alert(response.ErrorMessage);
                            }
                        }
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        processPayment = false;
                    }
                });
            }
        } */
    });
</script>

<script type="text/javascript">
    $(function () {
        $.desktop.paymentpop.init();
    });

    $(function () {
        $("table.table-movie-info tr:eq(0) td", "div.payment").click(function () {
            $.desktop.payment.open();
        })
    })

</script>


</body>
</html>