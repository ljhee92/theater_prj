<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info="결제 페이지" trimDirectiveWhitespaces="true" %>
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
.section-pop-bottom2 .wrap-3 .btn-rsv-cancel {
	position: absolute;
	bottom: 3px;
	left: 13px;
    background-color: #efefef;
    border: 1px solid #b7b7b7;
    color: #666;
    box-sizing: border-box;
    display: block;
    width: 80px;
    height: 27px;
    line-height: 25px;
    text-align: center;
    border-radius: 2px;
}

.title-select  {
	margin: 29px 0 10px 40px;
}
</style>

<script type="text/javascript">
	$(function() {
		// 다시예매 버튼 클릭 시
		$(".btn-rsv-reset").click(function() {
			if(confirm('모든 선택정보가 사라집니다. 계속하시겠습니까?')) {
				location.href="ticket.jsp";
			} // end if
		});
		
		// 결제 수단 선택 변경 시
		$(".pay_method").change(function(){
			// 무통장입금 선택
			if($(this).val() == "bank") {
				$(".section-pop-method").remove();
				$(".section-pop-method").remove();
				
				var divSectionPopMethod = $("<div>").addClass("section-pop-method");
				
				var divTitle = $("<div>").addClass("title-select");
				divTitle.text("은행선택");

				var divContent = $("<div>").addClass("content-select");
				var select = $("<select>");
				var options = ["KB국민은행", "신한은행", "NH농협은행"];
				options.forEach(function(optionText) {
					var option = $("<option>", {
						value : optionText,
						text: optionText
					});
					select.append(option);
				})
				
				select.attr("name", "bank");
				select.css("margin-left", "40px");
				
				divContent.append(select);
				
				$(divSectionPopMethod).append(divTitle);
				$(divSectionPopMethod).append(divContent);
				$(".section-pop-payment").append(divSectionPopMethod);
			} else { // 카드 선택
				$(".section-pop-method").remove();
				$(".section-pop-method").remove();
				
				var divSectionPopMethod = $("<div>").addClass("section-pop-method");
				
				var divSelectTitle = $("<div>").addClass("title-select");
				divSelectTitle.text("카드 선택");

				var divSelectContent = $("<div>").addClass("content-select");
				var select = $("<select>");
				var options = ["BC카드", "신한카드", "현대카드"];
				options.forEach(function(optionText) {
					var option = $("<option>", {
						value : optionText,
						text: optionText
					});
					select.append(option);
				});
				
				select.attr("name", "bank");
				select.css("margin-left", "40px");
				
				divSelectContent.append(select);
				
				var divCardNumTitle = $("<div>").addClass("title-card-num");
				divCardNumTitle.text("카드 번호").css("margin", "29px 0 10px 40px");
				
				var divCardNumContent = $("<div>").addClass("content-card-num");
				
				for(var i=0; i<4; i++) {
					var inputCardNumText = $("<input>", {
					    type: "text",
					    class: "inputCardNum"
					}).attr({
					    size: "4",
					    maxlength: "4"
					}).css("margin-right", "20px").css("outline", "none");
					
					if(i==0) {
						inputCardNumText.css("margin-left", "40px");
					} else {
						inputCardNumText.css("margin-left", "20px");
					} // end else
					
					divCardNumContent.append(inputCardNumText);
					if(i!==3) {
						divCardNumContent.append("-");	
					} // end if
				} // end for
				
				var divPeriodTitle = $("<div>").addClass("title-card-period");
				divPeriodTitle.text("유효 기간").css("margin", "29px 0 10px 40px");
				
				var divPeriodContent = $("<div>").addClass("content-card-periond");
				var inputPeriodText1 = $("<input>", {
					type: "text",
					class: "inputPeriod"
				}).attr({
					size: "4",
					maxlength: "2"
				}).css("margin-left", "40px").css("margin-right", "20px").css("outline", "none");
				
				divPeriodContent.append(inputPeriodText1);
				divPeriodContent.append("월");
				
				var inputPeriodText2 = $("<input>", {
					type: "text",
					class: "inputPeriod"
				}).attr({
					size: "4",
					maxlength: "2"
				}).css("margin-left", "20px").css("margin-right", "20px").css("outline", "none");
				
				divPeriodContent.append(inputPeriodText2);
				divPeriodContent.append("년");
				divPeriodContent.append($("<label>").css("margin-left", "20px").text("예) 2015년 9월 -> 09월 15년"));
				
				var divPassTitle = $("<div>").addClass("title-card-pass");
				divPassTitle.text("비밀번호").css("margin", "29px 0 10px 40px");
		
				var divPassContent = $("<div>").addClass("content-card-pass");
				var inputPass = $("<input>", {
					type: "password",
					class: "inputPass"
				}).attr({
					size: "4",
					maxlength: "2"
				}).css("margin-left", "40px").css("margin-right", "10px").css("outline", "none");
				divPassContent.append(inputPass).append("**");

				$(divSectionPopMethod).append(divSelectTitle);
				$(divSectionPopMethod).append(divSelectContent);
				$(divSectionPopMethod).append(divCardNumTitle);
				$(divSectionPopMethod).append(divCardNumContent);
				$(divSectionPopMethod).append(divPeriodTitle);
				$(divSectionPopMethod).append(divPeriodContent);
				$(divSectionPopMethod).append(divPassTitle);
				$(divSectionPopMethod).append(divPassContent);
				$(".section-pop-payment").append(divSectionPopMethod);
			} // end else
		});
	})
</script>
</head>
<body class="">
<%
	request.setCharacterEncoding("UTF-8");
	
	// 파라미터로 넘어온 JSON Parsing
	Map<String, String[]> requestParams = request.getParameterMap();
	Map<String, String> params = new HashMap<>();
	
	for(String key : requestParams.keySet()) {
		System.out.println("======================= "+key+":"+request.getParameter(key));
		params.put(key, request.getParameter(key));
	} // end for
	
	// 날짜 형식 변환
	String inputDateStr = params.get("screeningDate");
	SimpleDateFormat inputSdf = new SimpleDateFormat("yyyyMMdd");
	SimpleDateFormat outputSdf = new SimpleDateFormat("yyyy-MM-dd");
	
	try{
		Date inputDate = inputSdf.parse(inputDateStr);
		String outputDate = outputSdf.format(inputDate);
	
	request.setAttribute("params", params);
	request.setAttribute("outputDate", outputDate);
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
				<!-- 결제 본문 -->
				<div class="popup payment" data-price="${ params['price'] }">
				    <div class="section-pop-top">
				        <h3 class="title">결제</h3>
				        <a href="#" class="btn-rsv-reset">다시 예매</a>
				    </div>
				
				    <div class="section-pop-movie">
				        <img src="../images/movie/${ params['movieCode'] }.jpg" class="poster" alt="포스터">
				
				        <div class="title" style="white-space:normal; overflow:visible; margin:15px 20px 5px 20px;">
				            <span class="rate-${fn:toLowerCase(params['movieRate'] == '18' ? 'x' : params['movieRate'])}">
				            ${ params['movieRate'] }</span>${ params['movieTitle'] }
				        </div>
				        <table class="table-movie-info" style="margin-left:15px; margin-top:20px; width:220px;">
				            <tbody><tr>
				                <th>영화관</th>
				                <td>${ params['theaterName'] }</a></td>
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
				                <td class="number">${ params['selectedPerson'] }명</td>
				            </tr>
				            <tr>
				                <th>좌석</th>
				                <td class="seats">${ params['checkedSeats'] }</td>
				            </tr>
				        </tbody></table>
				
				    </div><!--.section-pop-movie-->
				
				    <div class="section-pop-payment">
				        <div class="title-kind" style="margin-left: 40px;">결제 수단 선택</div>
				        <ul class="tab-discount">
				            <!--탭을 좁게 만들려면 tab-payment로 수정-->
				            <li class="on">
				                <div class="tab-content on">
				                    <ul class="list-method">
				                    	<input type="radio" name = "pay" class="pay_method" value="bank" checked = "checked"> 무통장입금
				                    	<input type="radio" name = "pay" class="pay_method" value="card" style = "margin-left: 10px;"> 신용카드 
				                    </ul>
				                </div>
				            </li>
				        </ul>
				        
				        <div class="section-pop-method">
					        <div class="title-select"">은행선택</div>
				        	<div class="content-select">
						        <select name = "bank" style="margin-left: 40px;">
						        	<option value = "KB국민은행">KB국민은행</option>
						        	<option value = "신한은행">신한은행</option>
						        	<option value = "NH농협은행">NH농협은행</option>
						        </select>
				        	</div>
			        	</div>
				    </div>
				    <!--.section-pop-payment-->
				
				    <div class="section-pop-bottom2">
				        <div class="wrap-1">
				            <span class="title">결제금액</span>
				            <span class="total-price"><span>${ params['price'] }</span> 원</span>
				        </div>
				        
				        <div class="wrap-3" style="margin-left:550px">
				            <span class="title">총 결제금액</span>
				            <span class="final-price"><span>${ params['price'] }</span> 원</span>
				            <a href="#" class="btn-rsv-payment">결제</a>
				        </div>
				        
				    </div><!--.section-pop-bottom2-->
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