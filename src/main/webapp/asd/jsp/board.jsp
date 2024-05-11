<%@page import="java.io.Console"%>
<%@page import="oracle.net.aso.b"%>
<%@page import="oracle.net.aso.q"%>
<%@page import="VO.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="user.DAO.BoardDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
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
<script type="text/javascript">
</script>
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
		//FAQS에 따른 공지뉴스/자주찾는질문 변수설정
		String qaChg = FAQS.equals("Q") ? "on" : "";
		String noticeChg = FAQS.equals("N") ? "on" : "";
		String faqsTitle = FAQS.equals("Q") ? "자주찾는 질문" : "공지/뉴스";

		BoardDAO bDAO = BoardDAO.getInstance();

		//카테고리의 리스트
		List<String> faqsList = bDAO.selectCategory(FAQS);

		////////페이지 수 설정////////////

		//1.총 레코드의 수 얻기
		int totalCount = bDAO.selectTotalCount(FAQS);
		//2.한 화면에 보여줄 게시물의 수
		int pageScale = 10;
		//3. 총 페이지수
		int totalPage = (int) Math.ceil((double) totalCount / pageScale);
		//4. 게시물의 시작 번호
		String tempPage = sVO.getCurrentPage();
		int currentPage = 1;
		if (tempPage != null) {
			try {
				currentPage = Integer.parseInt(tempPage);
			} catch (NumberFormatException nfe) {

			}
		} //end if	
		int startNum = currentPage * pageScale - pageScale + 1;
		//5.끝번호
		int endNum = startNum + pageScale - 1;

		//6.
		sVO.setStartNum(startNum);
		sVO.setEndNum(endNum);

		List<BoardVO> list = bDAO.selectBoard(startNum, endNum, FAQS);
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
							<h2 class="tit"><%=faqsTitle%></h2>
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
								id="btn_search" onclick="searchContent(<%=startNum%>,<%=endNum%>,'<%=FAQS%>')">
								<span>검색하기</span>
							</button>
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
								<li class='on' id="allcategory"><a
									href="javascript:void(0);" style="font-size: 11px;"
									title="선택된 탭메뉴"
									onclick="selectCategory(<%=startNum%>, <%=endNum%>,'<%=FAQS%>')">전체</a></li>
								<%
								for (String category : faqsList) {
								%>
								<li id="<%=category%>"><a href="javascript:void(0);"
									style="font-size: 11px;"
									onclick="selectCategory(<%=startNum%>,<%=endNum%>,'<%=FAQS%>','<%=category%>')">
										<%=category%>
								</a></li>
								<%
								}
								%>
							</ul>
						</div>
						<div class="search_result">
							<span id="totalSearchCnt" class="num"><%=totalCount%>건 이
								검색되었습니다.</span>
						</div>
						<div class="tbl_area">
							<table cellspacing="0" cellpadding="0" class="tbl_notice_list">
								<caption>목록</caption>
								<colgroup>
									<col style="width: 70px;" />
									<col style="width: 160px;" />
									<col style="" />
									<col style="width: 140px;" />
									<col style="width: 120px" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col">번호</th>
										<th scope="col">구분</th>
										<th scope="col" class="tit">제목</th>
										<th scope="col">등록일</th>
										<th scope="col">조회수</th>
									</tr>
								</thead>
								<tbody id="boardTable">
									<c:forEach var="board" items="${list}">
										<tr>
											<td><c:out value="${board.boardNumber}" /></td>
											<td>${board.categoryName}</td>
											<td id="title0" class="txt"><a href="#">${board.boardTitle }</a></td>
											<td>${board.boardInputDate}</td>
											<td class="num">${board.boardViews}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<?xml version="1.0" encoding="utf-8"?>
						<div class="paging" id="paging">
							<ul>
								<%
								for (int i = 1; i <= totalPage; i++) {
								%>
								<li><a href="board.jsp?FAQS=<%=FAQS%>&currentPage=<%=i%>"><%=i%></a></li>
								<%
								}
								%>

							</ul>
							<button class="btn-paging end" type="button" onclick="">끝</button>
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

///////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////< BoardCategoryServlet ajax연결 >//////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////
/*
    카테고리를 클릭했을 때 해당 카테고리의 게시물을 로드하는 함수
    */
    function selectCategory(startNum, endNum ,FAQS,categoryId) {
    	var textField = document.getElementById("searchtext");
    	textField.value="";
    	
    	//카테고리 색상변경 함수 	
    	changColorCategory(categoryId);
    	
        //ajax에서 json처리할 데이터 모음
    	var param={
                startNum: 1, // 시작 번호
                endNum: 10, // 종료 번호
                FAQS: FAQS,
                category: categoryId, // 카테고리 ID를 서버에 전달
            };
        $.ajax({
            type: 'POST',
            url: '/theater_prj/BoardCategoryServlet', // 해당 카테고리 게시물을 가져오는 서블릿 URL
            data : param ,
            success: function(response) {
            	
                //  테이블에 데이터를 표시하는 함수
                displayData(response);
                //  카테고리 클릭시 페이지 비동기 함수
                displayPagination(response);
		    	//총 검색 count 비동기 함수
    			searchTotalBoard(response);
                                
            },
            error: function(xhr, status, error) {
                console.error('Error:', error);
            }
        });//end ajax
    }

    /*
    테이블에 데이터를 표시하는 함수
    */
    function displayData(response) {
    	var table = document.getElementById("boardTable");
		table.innerHTML= "";	
		
		var object = JSON.parse(response);

		var result = object.result;
		for(var i=0 ; i < result.length; i++){
			   var row = table.insertRow(i); // 행 추가

		        // 각 속성에 대한 열 추가
		        var cell1 = row.insertCell(0);
		        var cell2 = row.insertCell(1);
		        var cell3 = row.insertCell(2);
		        var cell4 = row.insertCell(3);
		        var cell5 = row.insertCell(4);

		        // 각 열에 데이터 입력
		        cell1.innerHTML = result[i].boardNumber;
		        cell2.innerHTML = result[i].categoryName;
		        cell3.innerHTML = '<a href="#">' + result[i].boardTitle + '</a>';
		        cell4.innerHTML = result[i].boardInputDate;
		        cell5.innerHTML = result[i].boardViews;
			
		}
		
  		
    }
    
    /*
    카테고리 클릭시 페이지네이션 비동기 처리
    */ 
    function displayPagination(response) {
    	var paging = document.getElementById("paging");
        paging.innerHTML= "";	
      	
        
        var object = JSON.parse(response);
		var totalPage = object.totalPage;
		var categoryId = object.category;
		var FAQS = object.FAQS;
		
		var paginationList = document.createElement("ul");
		    for (var i = 1; i <= totalPage; i++) {
		        var listItem = document.createElement("li");
		        var link = document.createElement("a");
		     	link.href = "javascript:void(0);";     
		     	 link.textContent = i;
		         link.onclick = function () {
		         var pageNumber = this.textContent;
		         selectPagingCategory(FAQS, categoryId, pageNumber);
		         };
		        listItem.appendChild(link);
		        paginationList.appendChild(listItem);
		    }
		    // 페이지네이션 요소에 추가
		    paging.appendChild(paginationList);

		    var endButton = document.createElement("button");
		    endButton.classList.add("btn-paging", "end");
		    endButton.type = "button";
		    endButton.textContent = "끝";
		    paging.appendChild(endButton);
		
    }

    
  	/*
  	카테고리 선택 후 로딩된 페이지 클릭 시 처리 함수
  	*/
  	function selectPagingCategory(FAQS, categoryId, pageNumber) {
  		
		var	startNum = (pageNumber - 1) * 10 + 1;
		var	endNum = pageNumber * 10; 
  		
  		
  	    //ajax에서 json처리할 데이터 모음
  	    var param = {
  	    	startNum: startNum,
  	    	endNum: endNum,
  	        FAQS: FAQS,
  	        category: categoryId, 
  	    }
  	   
		$.ajax({
  	        type: 'POST',
  	        url: '/theater_prj/BoardCategoryServlet', // 해당 카테고리 게시물을 가져오는 서블릿 URL
  	        data: param,
  	        success: function (response) {
  	            // 받은 JSON 데이터를 파싱하여 테이블에 표시
  	            var data = JSON.parse(response);
  	            //  테이블에 데이터를 표시하는 함수
  	            displayData(response);
  	            
  	           
  	        },
  	        error: function (xhr, status, error) {
  	            console.error('Error:', error);
  	        }
  	    });//end ajax
  	}
  	
  	
    /*
    카테고리 클릭시 색상 변경 함수
    */
    function changColorCategory(categoryId){
    	
	if(categoryId == null){
    var clickedElement = document.getElementById("allcategory");
	clickedElement.className = 'on';
    var allCategoryElements = document.querySelectorAll('.c_tab.type_free li');
    for (var i = 0; i < allCategoryElements.length; i++) {
        if (allCategoryElements[i] !== clickedElement) {
        	allCategoryElements[i].classList.remove('on');
        }
    }
	}else{
	var clickedElement = document.getElementById(categoryId);
	clickedElement.className = 'on';
	 // 나머지 카테고리의 클래스 제거
    var allCategoryElements = document.querySelectorAll('.c_tab.type_free li');
    for (var i = 0; i < allCategoryElements.length; i++) {
        if (allCategoryElements[i] !== clickedElement) {
        	allCategoryElements[i].classList.remove('on');
        	}
    	}
	}	
	}
    
 	/*
 	게시물 검색 수 비동기 처리
 	*/
  	function searchTotalBoard(response){
 		var countLable = document.getElementById("totalSearchCnt");
 		countLable.innerHTML="";
 		
        var object = JSON.parse(response);
		var count = object.Categorycount;
		
		countLable.innerHTML = count + '건 이 검색되었습니다.';
		
 	}
    
///////////////////////////////////////////////////////////////////////////////////////  
///////////////////////////////< BoardSearchServlet  ajax연결 >//////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////

    /*
	검색어 검색후 해당 게시물 로드한함수
	*/
	
	function searchContent(startNum,endNum,FAQS){
		var text = document.getElementById("searchtext").value;
		if(text===""){
			alert("검색어를 입력해 주십시오");
			return;
		}

		var param={
			startNum: 1,
			endNum: 10,
			text : text,
			FAQS : FAQS
		}
		
		$.ajax({
			type: 'POST',
			url: '/theater_prj/BoardSearchServlet',
			data : param,
			success: function(response){
				var object = JSON.parse(response);
				var isEmpty = object.searchTextExists;
				if(isEmpty){
					alert("해당하는 제목이 없습니다.")
					return;
				}
				
				//카테고리 색깔 제거
				var allCategoryElements = document.querySelectorAll('.c_tab.type_free li');
				allCategoryElements.forEach(function(element) {
   				 element.classList.remove('on');
				});
				
				//  테이블에 데이터를 표시하는 함수
                displayData(response);
                //  카테고리 클릭시 페이지 비동기 함수
                displaySearchPagination(response);
		    	//총 검색 count 비동기 함수
    			searchTotalBoard(response);
		    	
			},
			error: function(xhr, status, error){
				alert("오류발생");
				console.error('Error:', error);
			}
		})//end ajax
	}
	
	 /*
    검색후 페이지네이션 비동기 처리
    */ 
    function displaySearchPagination(response) {
    	var paging = document.getElementById("paging");
        paging.innerHTML= "";	
      	
        var object = JSON.parse(response);
		var totalPage = object.totalPage;
		var FAQS = object.FAQS;
        var searchText = object.searchText;
		var paginationList = document.createElement("ul");
		    for (var i = 1; i <= totalPage; i++) {
		        var listItem = document.createElement("li");
		        var link = document.createElement("a");
		     	link.href = "javascript:void(0);";     
		     	 link.textContent = i;
		         link.onclick = function () {
		         var pageNumber = this.textContent;
		         selectSearchPagingCategory(FAQS, searchText, pageNumber);
		         };
		        listItem.appendChild(link);
		        paginationList.appendChild(listItem);
		    }
		    // 페이지네이션 요소에 추가
		    paging.appendChild(paginationList);

		    var endButton = document.createElement("button");
		    endButton.classList.add("btn-paging", "end");
		    endButton.type = "button";
		    endButton.textContent = "끝";
		    // endButton.onclick에 필요한 동작을 추가하세요

		    paging.appendChild(endButton);
		
    }
    /*
    검색후 클릭시 페이지네이션 비동기 처리
    */ 	 
	function selectSearchPagingCategory(FAQS, searchText, pageNumber) {
  		
		var	startNum = (pageNumber - 1) * 10 + 1;
		var	endNum = pageNumber * 10; 
  		
  		
  	    //ajax에서 json처리할 데이터 모음
  	    var param = {
  	    	startNum: startNum,
  	    	endNum: endNum,
  	        FAQS: FAQS,
  	     	text: searchText, 
  	    }
  	   
		$.ajax({
  	        type: 'POST',
  	        url: '/theater_prj/BoardSearchServlet', // 해당 카테고리 게시물을 가져오는 서블릿 URL
  	        data: param,
  	        success: function (response) {
  	            // 받은 JSON 데이터를 파싱하여 테이블에 표시
  	            var data = JSON.parse(response);
  	            //  테이블에 데이터를 표시하는 함수
  	            displayData(response);
  	            
  	           
  	        },
  	        error: function (xhr, status, error) {
  	            console.error('Error:', error);
  	        }
  	    });//end ajax
  	}
    
    

</script>
</html>