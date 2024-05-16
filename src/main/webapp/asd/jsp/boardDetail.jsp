<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="user.DAO.BoardDetailDAO"%>
<%@page import="user.DAO.BoardDAO"%>
<%@page import="VO.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info = "" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta http-equiv="Expires" content="-1" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Cache-Control" content="No-Cache" />
<meta http-equiv="imagetoolbar" content="no" />
<meta id="ctl00_og_title" property="og:title"
	content="무비차트 &lt; 무비차트 | 영화 그 이상의 감동. CGV"></meta>

<!-- 24.02 네이버 웹 검색 연관 채널 방식 수정 -->
<script type="text/javascript" nonce="098ccc562cfd47e3818f4632ea5"
	src="//local.adguard.org?ts=1713490445734&amp;type=content-script&amp;dmn=www.cgv.co.kr&amp;url=http%3A%2F%2Fwww.cgv.co.kr%2Fmovies%2F%3Flt%3D1%26ft%3D0&amp;app=chrome.exe&amp;css=3&amp;js=1&amp;rel=1&amp;rji=1&amp;sbe=1"></script>
<script type="text/javascript" nonce="098ccc562cfd47e3818f4632ea5"
	src="//local.adguard.org?ts=1713490445734&amp;name=AdGuard%20Extra&amp;name=AdGuard%20Popup%20Blocker&amp;type=user-script"></script>
<script type="application/ld+json">
    {
         "@context": "http://schema.org",
         "@type": "Organization",
         "name": "CGV",
         "url": "https://www.cgv.co.kr",
         "sameAs": [
           "https://www.instagram.com/cgv_korea/",
           "https://www.youtube.com/channel/UCmjUMtUw6wXLrsULdxuXWdg",
           "https://www.facebook.com/CJCGV",
           "https://play.google.com/store/apps/details?id=com.cgv.android.movieapp&pli=1" ]
    }
    </script>
    
<!-- 공지사항 css -->    
<link rel="stylesheet" type="text/css" href="../css/notice.css">


<meta id="ctl00_og_image" property="og:image"
	content="https://img.cgv.co.kr/WebApp/images/common/logo_new_kakao_prevw.png"></meta>
<link rel="alternate" href="http://m.cgv.co.kr" />
<link rel="shortcut icon" href="../favicon.ico" type="image/x-icon" />
<title id="ctl00_headerTitle">무비차트 &lt; 무비차트 | 영화 그 이상의 감동. CGV</title>
<link rel="shortcut icon" type="image/x-icon"
	href="https://img.cgv.co.kr/R2014/images/favicon.ico" />
<link rel="stylesheet" media="all" type="text/css"
	href="https://img.cgv.co.kr/R2014/css/webfont.css" />
<link rel="stylesheet" media="all" type="text/css"
	href="https://img.cgv.co.kr/R2014/css/reset.css" />
<link rel="stylesheet" media="all" type="text/css" href="../css/layout.css" />

<link rel="stylesheet" media="all" type="text/css"
	href="https://img.cgv.co.kr/R2014/css/module.css?20211209" />
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

<!--[if lte IE 9]><script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery.plugin/jquery.placeholder.js"></script><![endif]-->
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

<!--jQuery CDN ����-->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!--jQuery CDN ��-->
<style type="text/css">
</style>

<link rel="stylesheet" media="all" type="text/css" href="http://img.cgv.co.kr/R2014/css/customer.css" />

</head>
<body class="">
		
	<!-- header start -->
	 <jsp:include page="header.jsp" />
	<!-- header end -->

	<div id="cgvwrap">

		<%
		String FAQS = request.getParameter("FAQS");
		String bdNumber = request.getParameter("boardNumber");
		int intBdNumber = Integer.parseInt(bdNumber);
		
		BoardDetailDAO bdDAO = BoardDetailDAO.getInstance();
		
		//FAQS에 따른 공지뉴스/자주찾는질문 변수설정
		String qaChg = FAQS.equals("Q") ? "on" : "";
		String noticeChg = FAQS.equals("N") ? "on" : "";
		String faqsTitle = FAQS.equals("Q") ? "자주찾는 질문" : "공지/뉴스";
		String faqsContent = "";
		if(faqsTitle.equals("자주찾는 질문")){
			faqsContent = "회원님들께서 가장 자주하시는 질문입니다.";
		}else{
			faqsContent ="명화관의 공지사항입니다.";
		}
		
		
		int intBoardNumber = Integer.parseInt(bdNumber);
		
		// board상세 조회 
		BoardVO bVO = bdDAO.selectBoardInfo(FAQS, intBoardNumber, 0);
		// 조회수 1증가 
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	
		//pageContext 에 bVO 등록
		pageContext.setAttribute("bVO", bVO);
		%>
		

		<!-- BoardVO 빈에 등록 -->
		
		<!-- Contaniner -->
		<div id="contaniner" class="">
			<!-- 벽돌 배경이미지 사용 시 class="bg-bricks" 적용 / 배경이미지가 없을 경우 class 삭제  -->
			<!-- Contents Area -->
			<div id="contents" class="">
				<!-- Contents Start -->
				<!-- Contents Area -->
				<div id="contents">
					<!-- Contents Start -->
					<div class="cols-content">
						<div class="col-aside">
							<h2>고객센터 메뉴</h2>
							<div class="snb">
								<ul>
								<li class='<%=qaChg%>'><a
									href="http://localhost/theater_prj/asd/jsp/board.jsp?FAQS=Q">자주찾는
										질문<i></i>
								</a></li>
								<li class='<%=noticeChg%>'><a
									href="http://localhost/theater_prj/asd/jsp/board.jsp?FAQS=N">공지/뉴스<i></i></a></li>
							</ul>
							</div>
						</div>
						<div class="col-detail">
							<div class="customer_top">
								<h2 class="tit"><%=faqsTitle %></h2>
								<p class="stit"><%=faqsContent %></p>
							</div>
							<div class="board_view_area">
								<ul class="top_title_faq">
									<li class="title">${bVO.boardTitle }</li>
									<li class="stit_area"><span>등록일<em
											class="regist_day">${bVO.boardInputDate}</em></span> <span
										class="check_tit_area">조회수<em class="check_num">${bVO.boardViews}</em></span>
									</li>
								</ul>
								<div class="view_area">
									<p>${bVO.boardContent}</p>
								</div>
								<div class="customer_btn">
									<button type="button" class="round inblack" id="btn_list">
										<span>목록으로</span>
									</button>
								</div>
								<!-- 이전글,다음글 (s) -->
								
								<!-- 이전글,다음글 (e) -->
							</div>
						</div>
					</div>
					<!-- //Contents End -->
				</div>
				<!-- //Contents Area -->

				<!--/ Contents End -->
			</div>
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


	<!-- S Footer -->
	<jsp:include page="footer.jsp"/>
	<!-- S Footer -->

	</div>
</body>
		<!-- 목록으로 가는 함수 -->
		<script type="text/javascript">
   		 $(function() {
		$("#btn_list").click(function(){
			var FAQS = "<%=FAQS%>";
			location.href="board.jsp?FAQS="+FAQS;
		})
    }); // ready
</script>
</html>