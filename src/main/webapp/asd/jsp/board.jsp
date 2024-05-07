<%@page import="java.io.Console"%>
<%@page import="oracle.net.aso.b"%>
<%@page import="oracle.net.aso.q"%>
<%@page import="VO.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="user.DAO.BoardDAO"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
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
<link rel="stylesheet" media="all" type="text/css"
	href="https://img.cgv.co.kr/R2014/css/layout.css" />
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

<link rel="stylesheet" media="all" type="text/css"
	href="http://img.cgv.co.kr/R2014/css/customer.css" />

</head>

<body class="">

	<div class="skipnaiv">
		<a href="#contents" id="skipHeader">메인 컨텐츠 바로가기</a>
	</div>
	<div id="cgvwrap">


		<!-- header start -->
		<jsp:include page="header.jsp" />
		<!-- header end -->

		<!-- SearchVO 빈에 등록 -->
		<jsp:useBean id="sVO" class="VO.SearchVO" scope="page" />
		<jsp:setProperty property="*" name="sVO" />
		<%
				String FAQS = request.getParameter("FAQS");
				String faqsNum = FAQS;		
				//FAQS에 따른 공지뉴스/자주찾는질문 변수설정
				FAQS = (FAQS.equals("0")) ? "N" : "Q";
				String qaChg =  FAQS.equals("Q") ? "on" : "";
				String  noticeChg = FAQS.equals("N") ? "on" : "";
				String faqsTitle = FAQS.equals("Q") ? "자주찾는 질문" : "공지/뉴스"; 
				
				BoardDAO bDAO = BoardDAO.getInstance();
				List<String> faqsList = bDAO.selectCategory(FAQS);
				
				////////페이지 수 설정////////////
				
				//1.총 레코드의 수 얻기
				int totalCount = bDAO.selectTotalCount(FAQS);
				//2.한 화면에 보여줄 게시물의 수
				int pageScale = 10;
				//3. 총 페이지수
				int totalPage =(int)Math.ceil((double)totalCount/pageScale);
				//4. 게시물의 시작 번호
				String tempPage = sVO.getCurrentPage();
				int currentPage = 1;
				if(tempPage != null){
					try{
					currentPage = Integer.parseInt(tempPage);			
					}catch(NumberFormatException nfe){
						
					}
				}//end if	
				int startNum = currentPage * pageScale - pageScale+1;
				//5.끝번호
				int endNum = startNum + pageScale - 1;
				
				//6.
				sVO.setStartNum(startNum);
				sVO.setEndNum(endNum);
				
				List<BoardVO> list = bDAO.selectBoard(sVO, FAQS);
				pageContext.setAttribute("list", list);	
				pageContext.setAttribute("FAQS", FAQS);
				%>
	
		<!-- Contaniner -->
		<div id="contaniner" class="">
			<!-- 벽돌 배경이미지 사용 시 class="bg-bricks" 적용 / 배경이미지가 없을 경우 class 삭제  -->
			<!-- Contents Area -->
			<div id="contents">
				<!-- Contents Start -->
				<div class="cols-content">
					<div class="col-aside">
						<h2>고객센터 메뉴</h2>
						<div class="snb">
							<ul>
								<li class='<%=qaChg %>'><a href="/support/faq/default.aspx"
									title="현재선택">자주찾는 질문<i></i></a></li>
								<li class='<%=noticeChg %>'><a
									href="/support/news/default.aspx">공지/뉴스<i></i></a></li>
							</ul>
						</div>
					</div>
					<div class="col-detail">
						<div class="customer_top">
							<h2 class="tit"><%=faqsTitle %></h2>
							<p class="stit">
								회원님들께서 가장 자주하시는 질문을 모았습니다. <br />궁금하신 내용에 대해 검색해보세요.
							</p>
						</div>
						<div class="search_area">
							<legend>
								<label for="searchtext">검색</label>
							</legend>
							<input id="searchtext" type="text" class="c_input" title="검색어 입력"
								placeholder="검색어를 입력해 주세요" value="" style="width: 275px;" />
							<button type="button" class="round inblack" title="검색하기"
								id="btn_search">
								<span>검색하기</span>
							</button>
							<div class="qu_txt">
								<em>추천검색어 :</em> <span class='first'> <a href="#none">현금영수증</a></span>

								<span class=''> <a href="#none">관람권</a></span> <span class=''>
									<a href="#none">예매</a>
								</span> <span class=''> <a href="#none">환불</a></span> <span class=''>
									<a href="#none">취소</a>
								</span> <span class=''> <a href="#none"></a></span>

							</div>
						</div>


						<script>
							function navigateWithFAQS(menu, value) {
								// FAQSInput 요소를 찾아 FAQS 값을 변경
								document.getElementById('FAQSInput').value = value;
						
								// 현재 위치로 이동
								window.location.href = '/board.jsp';
							}
						</script>

						<div class="c_tab_wrap">
							<ul class="c_tab type_free">
								<li class='on'><a
									href="/support/faq/default.aspx?type=0&searchtext="
									style="font-size: 11px;" title="선택된 탭메뉴">전체</a></li>
								<%
								for(String category : faqsList){%>
								<li id="<%=category%>"><a
									href="#void"
									style="font-size: 11px;"><%=category%></a></li>
								<%
								}
								%>
							</ul>
						</div>
						<div class="search_result">
							총<span class="num"><%=totalCount%>건</span>이 검색되었습니다.
						</div>
						<div class="tbl_area">
							<table cellspacing="0" cellpadding="0" class="tbl_notice_list">
								<caption>목록</caption>
								<colgroup>
									<col style="width: 40px;" />
									<col style="width: 120px;" />
									<col style="width: 560px;" />
									<col style="" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col">번호</th>
										<th scope="col">구분</th>
										<th scope="col" class="tit">제목</th>
										<th scope="col">조회수</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="board" items="${list}">
										<tr>
											<td><c:out value="${board.boardNumber}" /></td>
											<td>${board.categoryName}</td>
											<td id="title0" class="txt"><a
												href="/support/faq/detail-view.aspx?idx=951&type=245&searchtext=&page=1">
													${board.boardTitle}</a></td>
											<td class="num">${board.boardViews}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<?xml version="1.0" encoding="utf-8"?>
						<div class="paging">
							<ul>
								<%for(int i=1 ; i<=totalPage ; i++){%>
								<li class="on"><a href="board.jsp?FAQS=<%=faqsNum%>&currentPage=<%=i%>"><%=i%></a></li>
								<%}%>
							</ul>
							<button class="btn-paging end" type="button"
								onclick="location='/support/news/default.aspx?page=5&amp;type=&amp;searchtext=&amp;searchfield=0'">끝</button>
						</div>
					</div>
				</div>
				<!-- //Contents End -->
			</div>
		</div>


		<!-- S 예매하기 및 TOP Fixed 버튼 -->
		<div class="fixedBtn_wrap">

			<a href="/ticket/" class="btn_fixedTicketing">예매하기</a> <a
				href="#none" class="btn_gotoTop"><img
				src="https://img.cgv.co.kr/R2014/images/common/btn/gotoTop.png"
				alt="최상단으로 이동" /></a>
		</div>
		<!-- E 예매하기 및 TOP Fixed 버튼 -->



		<!-- S Footer -->
		<jsp:include page="footer.jsp" />
		<!-- S Footer -->
	</div>
</body>
</body>

<script type="text/javascript">
$(function() {
    $('.c_tab.type_free li a').click(function(e) {
        e.preventDefault(); // 기본 동작 중단
        var category = $(this).parent().attr('id'); // 선택된 카테고리 가져오기
        var faqs = '<%= FAQS %>'; // FAQS 값을 JavaScript 변수에 할당
        var startNum = '<%= sVO.getStartNum() %>'; // startNum을 Java 코드로부터 받아옴
        var endNum = '<%= sVO.getEndNum() %>'; // endNum을 Java 코드로부터 받아옴
        loadPosts(category); // 선택된 카테고리에 해당하는 게시글 로드
    });

    function loadPosts(category,faqs) {
        $.ajax({
            type: 'GET',
            url: 'getBoard.jsp', // getBoard.jsp 파일의 경로
            data: {
                category: category
                faqs: fqas
                startNum: startNum
                endNum: endNum
            },
            dataType: 'json',
            success: function(response) {
                // 서버에서 받은 JSON 데이터를 처리하여 화면에 출력
                var html = '';
                $.each(response, function(index, item) {
                    html += '<tr>';
                    html += '<td>' + item.boardNumber + '</td>';
                    html += '<td>' + item.categoryName + '</td>';
                    html += '<td><a href="/support/faq/detail-view.aspx?idx=951&type=245&searchtext=&page=1">' + item.boardTitle + '</a></td>';
                    html += '<td>' + item.boardViews + '</td>';
                    html += '</tr>';
                });
                $('.tbl_notice_list tbody').html(html);
            },
            error: function() {
                alert('게시물을 불러오는 도중 오류가 발생했습니다.');
            }
        });
    }
});

    
    
</script>
</html>
