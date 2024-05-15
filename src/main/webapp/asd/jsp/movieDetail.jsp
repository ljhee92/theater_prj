
<%@page import="java.util.ArrayList"%>
<%@page import="user.VO.ReviewVO"%>
<%@page import="java.util.List"%>
<%@page import="user.DAO.ReviewDAO"%>
<%@page import="VO.MovieVO"%>
<%@page import="user.DAO.MovieDetailDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta http-equiv="Expires" content="-1" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Cache-Control" content="No-Cache" />
<meta http-equiv="imagetoolbar" content="no" />
<meta name="viewport" content="width=1024" />
<meta name="keywords"
	content="CGV, 시지브이, 영화관, 극장, 영화, 티켓, 박스오피스, 극장, Movie, Theater, Cinema, Cgv, cgv, 예매, 상영작" />
<meta name="description"
	content="영화 그 이상의 다양하고 즐거운 몰입의 경험을 만듭니다. 라이프스타일 플랫폼 CGV" />
<meta property="og:site_name" content="영화 그 이상의 감동. CGV" />
<meta id="ctl00_og_title" property="og:title"
	content="범죄도시4 | 영화 그 이상의 감동. CGV"></meta>

<!-- 24.02 네이버 웹 검색 연관 채널 방식 수정 -->
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

<!-- 무비상세 css -->
<link rel="stylesheet" type="text/css" href="../css/movieDetail.css">
<meta id="ctl00_og_image" property="og:image" content="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88104/88104_185.jpg"></meta>
<link rel="alternate" href="http://m.cgv.co.kr" />
<link rel="shortcut icon" href="../favicon.ico" type="image/x-icon" />
<link rel="shortcut icon" href="https://img.cgv.co.kr/R2014/images/favicon.ico" />
<link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/webfont.css" />
<link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/reset.css" />
<link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/layout.css" />
<link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/module.css?20211209" />
<link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/content.css" />
<link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/common.css" />
<link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/eggupdate.css" />
<link rel="stylesheet" media="print" type="text/css" href="https://img.cgv.co.kr/R2014/css/print.css" />
<link rel="stylesheet" type="text/css" href="https://img.cgv.co.kr/R2014/js/jquery.ui/smoothness/jquery-ui-1.10.4.custom.min.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
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
<script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery.plugin/jquery.placeholder.js"></script>
<script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery.plugin/jquery.dotdotdot.min.js"></script>
<script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/silverlight_link.js"></script>
<script src="https://img.cgv.co.kr/R2014/js/slick/slick.js" type="text/javascript" charset="utf-8"></script>
<link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/phototicket/phototicket.css" />
<link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/slick.css" />
<link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/slick-theme-custom.css" />
<script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/icheck/login.timer.js"></script>
<script src="https://img.cgv.co.kr/R2014/js/icheck/icheck.min.js" type="text/javascript" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="https://img.cgv.co.kr/R2014/js/icheck/iCheck.css" />
<link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/preegg.css" />
<script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/giftstore/giftstore.js"></script>
<script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/giftstore/commonstore.js"></script>
<link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/giftstore/giftstore.css" />
<link rel="stylesheet" type="text/css" href="https://img.cgv.co.kr/resource_pc/css/cgv.min.css" />
<script type="text/javascript" src="https://img.cgv.co.kr/resource_pc/js/cgvUi.js"></script>
<link href="https://img.cgv.co.kr/R2014/js/jquery.plugin/jquery.jqplot/jquery.jqplot.min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery.plugin/jquery.jqplot/jquery.jqplot.min.js"></script>
<script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery.plugin/jquery.jqplot/jqplot.barRenderer.min.js"></script>
<script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery.plugin/jquery.jqplot/jqplot.pieRenderer.min.js"></script>
<script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery.plugin/jquery.jqplot/jqplot.donutRenderer.min.js"></script>
<script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery.plugin/jquery.jqplot/jqplot.categoryAxisRenderer.min.js"></script>
<script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery.plugin/jquery.jqplot/jqplot.pointLabels.min.js"></script>
<script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/Chart.custom.js"></script>
<script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/amcharts.js"></script>
<script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/radar.js"></script>

<style>
/* 별점 아이콘 스타일링 */
.star-rating::before {
	content: '★★★★★';
	letter-spacing: 0.1em;
	color: #ccc; /* 별점의 기본 색상 */
}

/* 실제 별점에 따라 색상을 변경하는 스타일 */
.review-item .star-rating::before {
	content: '★★★★★';
	letter-spacing: 0.1em;
	color: #f7d51d; /* 별점의 색상을 변경하려면 원하는 색상으로 변경 */
}

/* 리뷰 리스트 스타일 */
.review-list {
	margin-top: 20px;
}

.review-item {
	margin-bottom: 10px;
}

.user-id {
	font-weight: bold;
	margin-right: 10px;
}

.review-content {
	margin-top: 5px;
}

/* 별점에 따라 별이 채워지도록 수정 */
.star-rating[data-rating="1"]::before {
	content: '★☆☆☆☆'; /* 1점일 때 */
}

.star-rating[data-rating="2"]::before {
	content: '★★☆☆☆'; /* 2점일 때 */
}

.star-rating[data-rating="3"]::before {
	content: '★★★☆☆'; /* 3점일 때 */
}

.star-rating[data-rating="4"]::before {
	content: '★★★★☆'; /* 4점일 때 */
}

.star-rating[data-rating="5"]::before {
	content: '★★★★★'; /* 5점일 때 */
}
</style>


<script type="text/javascript">
    $(function() {
    	//스틸컷 버튼 클릭시 스크롤 이동
		$("#focuseStillCut").click(function(){
			var offset = $("#focuseStillCut").offset();
			$("html, body").animate({scrollTop: offset.top},400); 
		})
		
    	//평점/리뷰 버튼 클릭시 스크롤 이동
		$("#focuseStillCut").click(function(){
			var offset = $("#focuseStillCut").offset();
			$("html, body").animate({scrollTop: offset.top},400); 
		})
		$("#focuseReview").click(function(){
			var offset = $("#reviewTime").offset();
			$("html, body").animate({scrollTop: offset.top},400); 
		})
    }); // ready
</script>



</head>
<body class="">
	<div class="skipnaiv">
		<a href="#contents" id="skipHeader">메인 컨텐츠 바로가기</a>
	</div>
	<div id="cgvwrap">
		<!-- header start-->
		<jsp:include page="header.jsp" />
		<!--header end-->


<%
//받은 영화코드 파라미터 저장
String movieCode = request.getParameter("midx");
MovieDetailDAO mdDAO = MovieDetailDAO.getInstance();

MovieVO mVO = mdDAO.selectMovieDetail(movieCode);

String rating = mVO.getMovieRating();
String statusClass = null;
String screeningStatus = mVO.getMovieScreeningStatus();
String description = mVO.getMovieDescription();
//관람 등급 설정

//상영 상태 설정
rating = rating.equals("All") ? "전체 관람가" : rating + "이상 관람가";
if(screeningStatus.equals("Y")){
	screeningStatus = "현재상영중";
    statusClass = "round lightblue";
}else{
	screeningStatus = "미상영작";
    statusClass = "round red";
}
pageContext.setAttribute("movieVO", mVO);

%>
		<!-- Contaniner -->
		<div id="contaniner" class="">
			<!-- 벽돌 배경이미지 사용 시 class="bg-bricks" 적용 / 배경이미지가 없을 경우 class 삭제  -->
			<!-- Contents Area -->
			<div id="contents" class="">
				<!-- Contents Start -->
				<!-- 실컨텐츠 시작 -->
				<div class="wrap-movie-detail" id="select_main">

					<div class="sect-base-movie">
						<h3>
							<strong>${movieVO.movieTitle}</strong>기본정보
						</h3>
						<div class="box-image">
							<a href="#"title="포스터 크게 보기 새창" target="_blank"> <span
								class="thumb-image"> <img src="../images/movie/${movieVO.moviePosterPath}">
									<span class="ico-posterdetail">포스터 크게 보기</span> <!-- 영상물 등급 노출 변경 2022.08.24 -->
									<i class="cgvIcon etc age<%=rating%>"><%=rating %></i> <!--<span class="ico-grade 15"> 15</span> -->
							</span>
							</a>
						</div>
						<div class="box-contents">
							<div class="title">
								<strong>${movieVO.movieTitle}</strong> <em class="<%=statusClass %>"><span><%=screeningStatus %></span></em>
							</div>
							<div class="spec">
								<dl>
									<dt>
										감독 :${movieVO.movieTitle}</dt>
									<dt>
										/ 주연배우 :${movieVO.movieMainActor}
										/ 조연배우 :${movieVO.movieSubActor}
									</dt>
									<dt>
										장르 :${movieVO.movieGenre}</dt>
									<dd></dd>
									<dt>/ 기본 정보 :</dt>
									<dd class="on"><%=rating%>,${movieVO.movieRunningTime}</dd>
									<dt>개봉 :</dt>
									<dd class="on">${movieVO.movieReleaseDate}</dd>




								</dl>
							</div>
							<span class="like"> <!-- 예매하기 --> <a
								class="link-reservation" href="ticket.jsp">예매</a>
							</span>

						</div>
					</div>

					<div class="cols-content" id="menu">
						<div class="col-detail">
							<!-- 메뉴가 선택되면 a 에 title="선택" 이라고 넣는다 -->
							<ul class="tab-menu">
								<li><a
									href="#" id="focuseStillCut">스틸컷</a></li>
								<li><a href="#" id="focuseReview">평점/리뷰</a></li>
							</ul>
							<div class="sect-story-movie">
								<%
							    String[] descriptionLines = description.split("[!?\"\\.]");
								for (String line : descriptionLines) {
								%>
								<%=line.trim()%>.<br>
								<%
								}
								%>
							</div>


							<!-- .sect-trailer -->
							<div id="ctl00_PlaceHolderContent_Section_Still_Cut"
								class="sect-stillcut">
								<div class="heading">
									<h4>스틸컷</h4>
									<span class="count"><strong id="stillcut_current">1</strong>/2</span><a
										class="link-more" href="#">더보기</a>
								</div>
								<div class="slider-wrap">
									<div class="slider" id="still_motion">

										<div class="item-wrap">
											<div class="item">
												<img
													data-src="../images/movie/${movieVO.moviePosterPath}"
													alt="범죄도시4" onerror="errorImage(this)" />
											</div>
										</div>

										<div class="item-wrap">
											<div class="item">
												<img
													data-src="../images/movie/${movieVO.moviePosterPath}"
													alt="범죄도시4" onerror="errorImage(this)" />
											</div>
										</div>
										<button type="button" class="btn-prev">이전 페이지 이동</button>
										<button type="button" class="btn-next">다음 페이지 이동</button>
									</div>
								</div>
							</div>
							<div class="paging">
								<ul id="paging_point"></ul>
							</div>
						</div>
					</div>
				</div>
				<div id="reviewTime">
					<h1 class="rowLine">Review</h1>
					<ul class="sort" id="sortTab">
					
						<li class="sortTab${ empty param.type or param.type eq '1' ? ' on': '' }" id="test"><a
							href="#void" onclick="setReview('movieDetail.jsp',1,'${ param.midx }')" title="현재선택">최신순
							<span class="arrow-down"></span>
								</a></li>
						<li class="sortTab${  param.type eq '2' ? ' on': '' }"><a href="#void" onclick= "setReview('movieDetail.jsp',2,'${ param.midx }')">별점순
						<span class="arrow-down"></span>
						</a></li>
					</ul>
				</div>
				<script type="text/javascript">
				
				function setReview(url, type, midx) {
					location.href = url + "?type=" + type + "&midx=" + midx;
				}
$(function() {
    var sortTabs = $(".sortTab"); // 모든 정렬 탭을 선택합니다.

    // 각 탭에 대해 클릭 이벤트를 추가합니다.
    sortTabs.click(function() {
        // 모든 탭의 클래스를 제거합니다.
        sortTabs.removeClass("on");

        // 클릭된 탭에 클래스를 추가합니다.
        $(this).addClass("on");

        // 클릭된 탭의 화살표 요소를 찾습니다.
        var arrow = $(this).find(".arrow-down");

        // 다른 탭의 화살표를 숨깁니다.
        $(".arrow-down").hide();

        // 클릭된 탭의 화살표를 보여줍니다.
        if (arrow.length > 0) {
            arrow.show();
        }
    });
});
</script>
				<div class="review-list">
					<ul style="margin: 0 auto; width: fit-content;">
					</ul>
				</div>
				<!-- //end review-list-->
			</div>
			<!-- 별점 리뷰함수 -->
			<script>
    $(document).ready(function() {
    	// 페이지 로드 시 별점 데이터를 가져와서 HTML에 채워넣음
    	function fetchStarRatings() {
    	    // 서버로부터 별점 데이터를 가져와서 처리하는 코드
    	    // 예: $.ajax 를 사용하여 API 호출
    	    // 별점 데이터를 가져온 후 아래의 함수 호출: displayStarRatings(starData);

    	    <%
    	    	ReviewDAO rvDAO = ReviewDAO.getInstance();
    	    	List<ReviewVO> reviewList = null;
    	    	
    	    	String type = request.getParameter("type");
    	    	if(type == null) {
    	    		type = "1";
    	    	}//end if
    	    	
    	    	if("1".equals(type)) {
    	    		reviewList =rvDAO.selectRecentReviewList(movieCode);
    	    	}else{
    	    		reviewList =rvDAO.selectScoreReviewList(movieCode);
    	    	}//end else
    	    	
    	    	
    	    	ReviewVO rvVO = null;
    	    %>
    	    var starData = [
    	    <%
    	    for(int i = 0; i < reviewList.size(); i++ ){%>
    	    <%rvVO = reviewList.get(i);%>
    	    	{ userId: "<%= rvVO.getUserId()%>", rating: <%= rvVO.getReviewScore()%>, reviewContent: "<%= rvVO.getReviewContent() %>" },
    	   <%}%>
    	    ];
    	    
    	    /*
    	    // 가상의 별점 데이터 (예시)
    	    var starData = [
    	        { userId: "사용자1", rating: 5, reviewContent: "리뷰 내용1" },
    	        { userId: "사용자2", rating: 4, reviewContent: "리뷰 내용2" },
    	        { userId: "사용자3", rating: 1, reviewContent: "리뷰 내용3" },
    	        { userId: "사용자4", rating: 5, reviewContent: "리뷰 내용4" },
    	        { userId: "사용자5", rating: 5, reviewContent: "리뷰 내용5" },
    	        { userId: "사용자6", rating: 3, reviewContent: "리뷰 내용6" },
    	        { userId: "사용자7", rating: 5, reviewContent: "리뷰 내용7" },
    	        { userId: "사용자8", rating: 2, reviewContent: "리뷰 내용8" },
    	        { userId: "사용자9", rating: 3, reviewContent: "리뷰 내용9" },
    	        { userId: "사용자10", rating: 1, reviewContent: "리뷰 내용10" },
    	        // 여기에 별점 데이터 추가
    	    ];
    	    */

    	    // 별점 데이터를 가져온 후 아래의 함수 호출
    	    displayStarRatings(starData);
    	}

    	// 별점을 HTML에 채워넣는 함수
    	function displayStarRatings(starData) {
    	    var $reviewList = $('.review-list ul');
    	    $reviewList.empty(); // 기존의 리뷰 리스트를 비움

    	    // 가져온 별점 데이터를 기반으로 리뷰 아이템을 생성하여 추가
    	    for (var i = 0; i < starData.length; i++) {
    	        var starRating = starData[i];
    	        var $reviewItem = $('<li><div class="review-item"><span class="user-id">' + starRating.userId + '</span><span class="star-rating" data-rating="' + starRating.rating + '"></span><div class="review-content">' + starRating.reviewContent + '</div></div></li>');
    	        $reviewList.append($reviewItem);
    	    }
    	    // 별점 데이터를 가져와서 HTML에 채워넣은 후에 각 별점 아이콘에 적절한 색상을 적용하기 위해 별점 아이콘의 data-rating 속성을 설정
    	    $reviewList.find('.star-rating').each(function() {
    	        var rating = $(this).data('rating');
    	        $(this).attr('data-rating', rating); // data-rating 속성 설정
    	    });
    	}

    	// 페이지 로드 시 별점 데이터를 가져와서 HTML에 채워넣음
    	fetchStarRatings();

    });
</script>



			<script type="text/javascript">
//<![CDATA[
var commentOptions;
    (function ($) {
        $(function () {

            var myPointPage = 0;    
            var mypointYN = false;    
            var mypointPaneltyYN = false;    
            var mypointShowViewYN = false;    

            // 성별/연령별 예매분포 차트 추가
            var data = {
                    
                    age: [
                ["10대", 2.2],["20대", 24.8],["30대", 32.6],["40대", 23.3],["50대", 17.1]
                    ],
                    sex: [
                 ["남 48.4%", 48.4],["여 51.6%", 51.6]
                    ]

                };
                            
            $('#jqplot_sex').graphChart({ 'type': 'donut', 'data': data.sex });
            $('#jqplot_age').graphChart({ 'type': 'bar', 'data': data.age });
            // 성별/연령별 예매분포 차트 추가

            //첫 로딩시 호출, 첫 로딩시는 "실관람객"탭이 디폴트여서 실관람객 평이 있냐 여부를 따져야 리스트 갯수가 맞게 나온다. "setMypointAttribute()"함수로 대처시 callback이 setMyPointBuild() 함수와 겹쳐 오락가락 하게 된다%>
            setMypointAttributeFirstLoding();
            searchPointList(1, true, 1, 0);              // 첫 로딩시 평점 조회    
   
            var $stillCut = $('#still_motion'),
                $stillCutCurrent = $('#stillcut_current'),
                stillOptions = { 'type': 'photo', 'onBeforeHandler': onBeforeHandler };

            function onBeforeHandler(_index) {
                $stillCutCurrent.text(_index + 1);
            }
            $stillCut.visualMotion(stillOptions);

                       
            
            // 평점 리스트 조회
            function searchPointList(page, isGetTotalCount, filterType, orderType) {
                myPointPage = page;
                
                filterType= 1;
                if(!orderType) {
                    orderType = $('.sort>li.on').data('order-type');
                }                

                // 첫로딩후 페이지 이동시 IsGetTotalCount = false 처리됨
                // 첫로딩시 setPointListBuild()에서 result.TotalCount:전체평점갯수, 페이지 이동시 result.TotalCount:0
                if(!isGetTotalCount) { isGetTotalCount = false; }

                var isMyPageIndex = 6;
                var isMyPoint = false;
                if(mypointYN) {        //내가 쓴 평점이 있다면(첫페이지만 5개 가져온다, 이후는 6개씩) 
                    if (filterType == "1" && mypointShowViewYN) {      //추가 : 실관람객탭이면서 실관람객인지
                        isMyPoint = true;
                    }else if (filterType == "2" && mypointPaneltyYN) {//추가 :  패널티탭이면서 패널티회원인지
                        isMyPoint = true;
                    }else if (filterType == "0") {                          //추가 :  전체탭
                        isMyPoint = true;
                    }
                }
                                
	            $.ajax({
	                type: "POST",
	                url: '/common/ajax/point.aspx/GetMoviePointVariableList',
	                data: "{ 'movieIdx': 88104, 'pageIndex': " + page + ", 'pageSize': " + isMyPageIndex + ", 'orderType': " + orderType + ", 'filterType': 1, 'isTotalCount' : " + isGetTotalCount + ", 'isMyPoint' : '" + isMyPoint + "' }",
	                contentType: "application/json; charset=utf-8",
	                dataType: 'json',
	                success: function (result) {
						setPointListBuild($.parseJSON(result.d));
	                }
	            });                                
            }


            /* 첫로딩시 1번만 호출, 내가 쓴평점이 있는지 전영변수 세팅 및 체크 하는 함수 */            
            function setMypointAttributeFirstLoding() {
                            
            } 
        });
    })(jQuery);
//]]>
</script>
		</div>




		<!-- /Contents Area -->

		<!-- E Contaniner -->

		<!-- S 예매하기 및 TOP Fixed 버튼 -->
		<div class="fixedBtn_wrap">

			<a href="ticket.jsp" class="btn_fixedTicketing">예매하기</a> <a
				href="#none" class="btn_gotoTop"><img
				src="https://img.cgv.co.kr/R2014/images/common/btn/gotoTop.png"
				alt="최상단으로 이동" /></a>
		</div>

		<!-- E 예매하기 및 TOP Fixed 버튼 -->

		<!-- S Footer -->


		<!-- S Footer -->
		<jsp:include page="footer.jsp" />
		<!-- S Footer -->

	</div>
</body>
</html>
