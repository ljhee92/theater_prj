<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info="예매완료 안내" trimDirectiveWhitespaces="true" %>
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
    $(function () {
        $("#confirmRes").click(function () {
            location.href="myPage.jsp";
        });
    })
</script>

</head>
<body class="">
<%
	request.setCharacterEncoding("UTF-8");
	
	// session에 정보 가져오기
	Map<String, String> params = (Map)session.getAttribute("params");
	String outputDate = (String)session.getAttribute("ouputDate");
	
	// 결제방법, 예매번호 parameter로 가져오기
	String payMethod = request.getParameter("payMethod");
	String maxRsvNum = request.getParameter("maxRsvNum");
	
	pageContext.setAttribute("payMethod", payMethod);
	pageContext.setAttribute("maxRsvNum", maxRsvNum);
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
				<!-- 예매 완료 본문 -->
				<div class="popup paymentPrint" data-settleid="97f8057ea8f9eceff5132fae6c7e8379aa834a32515c52e07177e1b08f44229f">
				    <div class="section-pop-top">
				        <h3 class="title">결제</h3>
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
				                <td class="number">${ params['selectedPerson'] }명</td>
				            </tr>
				            <tr>
				                <th>좌석</th>
				                <td class="seats">${ params['checkedSeats'] }</td>
				            </tr>
				        </tbody></table>
				    </div><!--.section-pop-movie-->
				
				    <div class="section-pop-payment-done">
				
				        <div class="desc" style="margin: 52px auto 24px;"><span>결제가 완료</span>되었습니다.</div>
				
				        <ul class="list-result">
				            <li><span class="head">예매번호</span> <span class="num rsv">${ maxRsvNum }</span></li>
				            <li><span class="head">결제수단</span> <span class="">${ payMethod == "bank" ? "무통장입금" : "카드결제" }</span></li>
				            <li><span class="head">결제금액</span> <span class="num total">${ params['price'] }</span> 원</li>
				        </ul>
				
				    </div><!--.section-pop-payment-->
				
				    <div class="section-pop-bottom white">
				        <a href="#" class="btn-rsv-done" id="confirmRes">확인</a>
				    </div><!--.section-pop-bottom3-->
				
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