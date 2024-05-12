<%@page import="user.DAO.PaymentDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="user.DAO.ReservationDAO"%>
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

<style type = "text/css">
	
</style>
<script type = "text/javascript">
	$(function() {

	}); // ready
</script>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="rvtVO" class="user.VO.ReservationVO" scope="page"/>
<jsp:setProperty property="*" name="rvtVO"/>
<jsp:useBean id="pVO" class="user.VO.PaymentVO" scope="page"/>
<jsp:setProperty property="*" name="pVO"/>

<c:catch var="e">
<%
	// session에 정보 가져오기
	Map<String, String> params = (Map)session.getAttribute("params");
	String outputDate = (String)session.getAttribute("ouputDate");
	
	// 결제방법 parameter로 가져오기
	String payMethod = request.getParameter("payMethod");
	
	// 마지막 예매번호+1 가져오기
	ReservationDAO rvtDAO = ReservationDAO.getInstance();
	String maxReservationNumber = rvtDAO.selectMaxReservationNumber();
	
	// 넘어온 데이터 예약 VO에 넣기
	rvtVO.setReservationNumber(maxReservationNumber);
	rvtVO.setUserId((String)session.getAttribute("id"));
	rvtVO.setScreeningCode(params.get("screeningCode"));
	rvtVO.setSeat(params.get("checkedSeats"));
	rvtVO.setTheaterName(params.get("theaterName"));
	rvtVO.setTheaterNumber(params.get("theaterNumber"));
	
	rvtDAO.insertReservation(rvtVO);
	rvtDAO.insertSeats(rvtVO);
	
	// 마지막 결제번호+1 가져오기
	PaymentDAO pDAO = PaymentDAO.getInstance();
	String maxPaymentNumber = pDAO.selectMaxPaymentNumber();
	
	// 넘어온 데이터 결제 VO에 넣기
	pVO.setPaymentNumber(maxPaymentNumber);
	pVO.setReservationNumber(maxReservationNumber);
	pVO.setTotalPrice(params.get("price").replaceAll(",", ""));
	pVO.setPaymentMethod(payMethod);
	
	pDAO.insertPayment(pVO);
	
	response.sendRedirect("ticketReserved.jsp?payMethod="+payMethod+"&maxRsvNum="+maxReservationNumber);
%>
</c:catch>

	<div id="wrap">
		<!-- S Header -->
		<jsp:include page="header.jsp"></jsp:include>
		<!-- E Header -->
		
		<c:if test="${ not empty e }">
			alert("죄송합니다. 잠시 후 다시 시도해주시기 바랍니다.");
			<%
			response.sendRedirect("index.jsp");
			%>
		</c:if>
		
		<!-- S footer_area -->
		<jsp:include page="footer.jsp"></jsp:include>
		<!-- E footer_area -->
	</div>
</body>
</html>