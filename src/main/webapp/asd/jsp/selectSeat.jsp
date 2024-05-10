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
	pageEncoding="UTF-8" info="로그인 후 좌석 선택 페이지"%>
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

<script type="text/javascript">
	$(function() {
		// 인원 선택이 변경되면
		$(".input-select").change(function(){
			var selectedPerson = $(".input-select").val();
			var price = (10000*selectedPerson).toLocaleString('ko-KR');
			
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
	});
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
	}
	
	// 날짜 형식 변환
	String inputDateStr = params.get("screeningDate");
	SimpleDateFormat inputSdf = new SimpleDateFormat("yyyyMMdd");
	SimpleDateFormat outputSdf = new SimpleDateFormat("yyyy-MM-dd");
	
	// 선택한 영화관의 좌석 가져오기
	ReservingDAO rsDAO = ReservingDAO.getInstance();
	List<SeatVO> seatsInfo = rsDAO.selectSeat(params.get("theaterName"), params.get("theaterNumber"));
	Map<String, List<String>> seatsMap = new HashMap<>();

	// seatsInfo에서 중복을 제거하여 seatLowNumber를 키로 사용하고, seatColNumber를 값으로 매핑
	for (SeatVO seat : seatsInfo) {
	    String seatLowNumber = seat.getSeatLowNumber();
	    String seatColNumber = seat.getSeatColNumber();
	    
	    // 중복을 제거하기 위해 해당 seatLowNumber에 대한 리스트 가져오기 또는 생성
	    List<String> seatColNumbers = seatsMap.getOrDefault(seatLowNumber, new ArrayList<>());
	    
	    // 새로운 seatColNumber를 리스트에 추가
	    seatColNumbers.add(seatColNumber);
	    
	    // 맵에 새로운 seatColNumbers 리스트 추가
	    seatsMap.put(seatLowNumber, seatColNumbers);
	} // end for

	try{
		Date inputDate = inputSdf.parse(inputDateStr);
		String outputDate = outputSdf.format(inputDate);
	
		request.setAttribute("params", params);
		request.setAttribute("outputDate", outputDate);
		request.setAttribute("seatsInfo", seatsInfo);
		request.setAttribute("seatsMap", seatsMap);
%>

	<div id="wrap">
		<!-- S Header -->
		<jsp:include page="header.jsp"></jsp:include>
		<!-- E Header -->
		
		<!-- Contaniner -->
		<div id="container" class>
			<!-- Contents Area -->
			<div id="contents" class style="padding-bottom: 0px;">
				<!-- Contents Start -->

				<!-- 좌석 선택 본문 -->
				<div class="popup seatChoice" data-theatercode="${ params['theaterName'] }"
					data-moviecode="${ params['movieCode'] }" data-playdate="${ params['screeningDate'] }"
					data-screenplanid="${ params['screeningCode'] }">
					<div class="section-pop-top">
						<h3 class="title">인원/좌석선택</h3>
						<a href="ticket.jsp" class="btn-rsv-reset" onclick="confirm('모든 선택정보가 사라집니다. 계속하시겠습니까?');">다시 예매</a>
					</div>

					<div class="section-pop-movie">
						<img src="../images/movie/${ params['movieCode'] }.jpg" class="poster" alt="포스터">

						<div class="title" style="white-space:normal; overflow:visible; margin-left:20px;">
							<span class="rate-${fn:toLowerCase(params['movieRate'])}">${ params['movieRate'] }</span>${ params['movieTitle'] }
						</div>
						<table class="table-movie-info" style="margin-left:15px; margin-top:40px;">
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
									<td class="seats"></td>
								</tr>
							</tbody>
						</table>

						<span class="total-price"><span class="price">0</span> 원</span>

					</div>
					<!--.section-pop-movie-->

					<div class="section-pop-theater">
						<div class="wrap-number-info">
							<span class="kind">인원</span>
							<select class="input-select id_2780" data-salepriceid="2780" data-price="13000"
								data-salepricename="성인" data-salepricecode="106">
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
								
								<c:forEach var="map" items="${ seatsMap }" varStatus="i">
									<ul class="row" data-rowname="${ map.key }">
										<li class="head">${ map.key }</li>
										<c:forEach var="value" items="${ map.value }" varStatus="i">
										<li><input type="checkbox" class="choose-seat" id="${ map.key }${ value }" 
											value="${ map.key }${ value }" data-seatgroup="" data-rowname="${ map.key }"
											data-colnumber="${ value }" data-seatmapid="" data-screenid=""
											data-screenplanid="" disabled="">
											<label for="${ map.key }${ value }" class="mini">${ value }</label>
										</li>
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
		
<!-- <script type="text/javascript">
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
</script> -->
<%
	} catch(Exception e) {
		out.println("에러 발생. 담당자에게 문의해주세요.");
		e.printStackTrace();
	}
%>
</body>
</html>