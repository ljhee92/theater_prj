<%@page import="java.time.temporal.ChronoUnit"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="javax.swing.text.DateFormatter"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.time.LocalDate"%>
<%@page import="javax.xml.crypto.Data"%>
<%@page import="VO.MovieVO"%>
<%@page import="java.util.List"%>
<%@page import="user.DAO.MovieChartDAO"%>
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
<meta name="viewport" content="width=1024" />
<meta name="keywords" content="CGV, 시지브이, 영화관, 극장, 영화, 티켓, 박스오피스, 극장, Movie, Theater, Cinema, Cgv, cgv, 예매, 상영작" />
<meta name="description" content="영화 그 이상의 다양하고 즐거운 몰입의 경험을 만듭니다. 라이프스타일 플랫폼 CGV" />
<meta property="og:site_name" content="영화 그 이상의 감동. CGV" />
<meta id="ctl00_og_title" property="og:title" content="무비차트 &lt; 무비차트 | 영화 그 이상의 감동. CGV">
<meta id="ctl00_og_image" property="og:image" content="https://img.cgv.co.kr/WebApp/images/common/logo_new_kakao_prevw.png">
<link rel="alternate" href="http://m.cgv.co.kr" />
<link rel="shortcut icon" href="../favicon.ico" type="image/x-icon" />
<title id="ctl00_headerTitle">무비차트 | 명화 그 이상의 감동. 띵화관</title>
<link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/webfont.css" />
<link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/reset.css" />
<link rel="stylesheet" media="all" type="text/css" href="../css/layout.css" />
<link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/module.css?20211209" />
<link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/content.css" />
<link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/common.css" />
<link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/eggupdate.css" />
<link rel="stylesheet" media="print" type="text/css" href="https://img.cgv.co.kr/R2014/css/print.css" />
<link rel="stylesheet" type="text/css" href="https://img.cgv.co.kr/R2014/js/jquery.ui/smoothness/jquery-ui-1.10.4.custom.min.css" />
<link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/phototicket/phototicket.css" />
<link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/slick.css" />
<link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/slick-theme-custom.css" />
<link rel="stylesheet" type="text/css" href="https://img.cgv.co.kr/R2014/js/icheck/iCheck.css" />
<link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/preegg.css" />
<link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/giftstore/giftstore.css" />
<link rel="stylesheet" type="text/css" href="https://img.cgv.co.kr/resource_pc/css/cgv.min.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery.plugin/jquery.tmpl.min.js"></script>
<script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery.plugin/jquery.validate.js"></script>
<script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery.plugin/jquery.paging.min.js"></script>
<script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery.ui/jquery-ui-1.10.4.custom.min.js"></script>
<script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery.utils.js"></script>
<script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/app.utils.js"></script>
<script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery.utils.pageing.js"></script>
<script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/app.init.js"></script>
<script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery.plugin/jquery.dotdotdot.min.js"></script>
<script src="https://img.cgv.co.kr/R2014/js/slick/slick.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/app.config.js"></script>
<script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/icheck/login.timer.js"></script>
<script src="https://img.cgv.co.kr/R2014/js/icheck/icheck.min.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/silverlight_link.js"></script>
<script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/giftstore/giftstore.js"></script>
<script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/giftstore/commonstore.js"></script>
<script type="text/javascript" src="https://img.cgv.co.kr/resource_pc/js/cgvUi.js"></script>

<script type="text/javascript">
$(function(){
    // 현재 상영중 영화 체크박스 클릭시
    $("#chk_nowshow").click(function(){
        var isChecked = $(this).prop("checked"); // 체크박스의 상태 확인
  		if(isChecked == true){
  			 $.ajax({
  	            url: "/theater_prj/MovieChartSerlvet",
  	            type: "POST",
  	            data: {
  	                checkStauts: "Y"
  	            },
  	            success: function(response) {
  	            	updateMovieChart(response);
  	            },
  	            error: function(xhr, status, error) {
  	            }
  	        });
  			 
  		}else{
  			 $.ajax({
  	            url: "/theater_prj/MovieChartSerlvet",
  	            type: "POST",
  	          success: function(response) {
	            	updateMovieChart(response);
	            },
	            error: function(xhr, status, error) {
	            }
  	        });
  		}
        
    });
    
    
});

function updateMovieChart(response) {
	
    // 서버로부터 받은 JSON 데이터 파싱
    var data = JSON.parse(response);

    // 영화 목록이 담긴 배열 가져오기
    var movieList = data.movieList;

    // 영화 목록을 기존의 DOM 요소에서 제거
    $('.sect-movie-chart ol').empty();

    var rank = 0;
    // 각 영화 정보를 순회하면서 화면에 표시
    movieList.forEach(function(movie) {
    	// 오늘 날짜를 가져옴
    	var today = new Date();

    	// 영화 개봉일을 yyyy-mm-dd 형식으로 변환하여 가져옴
    	var movieReleaseDate = new Date(movie.movieReleaseDate);

    	// 오늘부터 영화 개봉일까지의 차이를 계산하여 일 수로 반환
    	var dDay = 0;
    	
    	if(today.getTime() < movieReleaseDate.getTime()){
    	var timeDiff = Math.abs(movieReleaseDate.getTime() - today.getTime());
    	var dDay = Math.ceil(timeDiff / (1000 * 3600 * 24));
    	}
    	
    	
        var listItem = $('<li>');
		rank++;
        // 영화 정보를 이용하여 DOM 생성
        listItem.append($('<div>').addClass('box-image').append(
            $('<strong>').addClass('rank').text('No.' + rank),
            $('<form>').attr('action', 'movieDetail.jsp').attr('method', 'get').append(
                $('<input>').attr('type', 'hidden').attr('name', 'midx').val(movie.movieCode),
                $('<button>').attr('type', 'submit').addClass('image-button').append(
                    $('<span>').addClass('thumb-image').append(
                        $('<img>').attr('src', '../images/movie/' + movie.moviePosterPath),
                        $('<i>').addClass('cgvIcon etc age' + movie.movieRating).text(movie.movieRating)
                    )
                )
            ),
            $('<span>').addClass('screentype').append(
                $('<a>').addClass('imax').attr('href', '#').attr('title', 'IMAX 상세정보 바로가기').attr('data-regioncode', '07').text('IMAX'),
                $('<a>').addClass('forDX').attr('href', '#').attr('title', '4DX 상세정보 바로가기').attr('data-regioncode', '4D14').text('4DX')
            )
        ));

        listItem.append($('<div>').addClass('box-contents').append(
            $('<a>').attr('href', '/movies/detail-view/?midx=' + movie.movieCode).append(
                $('<strong>').addClass('title').text(movie.movieTitle)
            ),
            $('<span>').addClass('txt-info').append(
                $('<strong>').text(movie.movieReleaseDate + ' 개봉'),
                $('<em>').addClass('dday').append(
                		dDay === 0 ?
                                $('<i>').addClass('cgvIcon etc ageDay').text('DDay') :
                                $('<i>').addClass('cgvIcon etc ageDay').attr('data-before-text', 'D - ' + dDay).text('DDay')
                )
            ),
            $('<span>').addClass('like').append(
                $('<a>').addClass('link-reservation').attr('href', '/ticket/?MOVIE_CD=' + movie.movieCode + '&MOVIE_CD_GROUP=' + movie.movieCode).text('예매')
            )
        ));

        // 생성한 DOM 요소를 영화 목록에 추가
        $('.sect-movie-chart ol').append(listItem);
        // rank 증가
    });
}
 

  </script>

</head>


<body class="">

	<div id="cgvwrap">
		<!-- header start -->
		<jsp:include page="header.jsp" />
		<!-- header end -->

		<!-- Contaniner -->
		<div id="contaniner" class="">
			<!-- 벽돌 배경이미지 사용 시 class="bg-bricks" 적용 / 배경이미지가 없을 경우 class 삭제  -->
			<!-- Contents Area -->
			<div id="contents" class="">
				<!-- Contents Start -->
				<!-- 실컨텐츠 시작 -->
				<div class="wrap-movie-chart">
					<!-- Heading Map Multi -->
					<div class="tit-heading-wrap">
						<h3>무비차트</h3>

						<div class="submenu">
							<ul>
								<li class="on"><a href="movieChart.jsp" title="선택">무비차트</a></li>
							</ul>
						</div>
					</div>
					<!-- //Heading Map Multi -->
					<!-- Sorting -->
					<div class="sect-sorting">
						<div class="nowshow">
							<input type="checkbox" id="chk_nowshow" /> <label
								for="chk_nowshow">현재 상영작만 보기</label>
						</div>
						<label id="order_type" name="order-type">평점순</label>
					</div>
					<!-- //Sorting -->



					<div class="sect-movie-chart">
						<h4 class="hidden">무비차트 - 평점순</h4>
						<ol>
							<%
							//MovieChartDAO 객체 생성
							int rank = 1;
							MovieChartDAO mcDAO = MovieChartDAO.getInstance();
							List<MovieVO> mcVO = mcDAO.selectMovieList();
							for (MovieVO tempMovie : mcVO) {
								String code = tempMovie.getMovieCode();
								String title = tempMovie.getMovieTitle();
								String date = tempMovie.getMovieReleaseDate();
								String posterPath = tempMovie.getMoviePosterPath();
								String rating = tempMovie.getMovieRating();
								String score = tempMovie.getMovieScore();

								// 문자열을 LocalDate로 변환
								LocalDate specifiedDate = LocalDate.parse(date);

								// 현재 날짜
								LocalDate today = LocalDate.now();

								// 두 날짜의 차이 계산
								long dDay = ChronoUnit.DAYS.between(today, specifiedDate);
							%>

							<li>
								<div class="box-image">

									<strong class="rank">No.<%=rank%></strong>
									<form action="movieDetail.jsp" method="get">
										<input type="hidden" name="midx" value="<%=code%>">
										<button type="submit" class="image-button">
											<span class="thumb-image"> <img
												src="../images/movie/<%=posterPath%>"> <!-- 영상물 등급 노출 변경 2022.08.24 -->
												<i class="cgvIcon etc age<%=rating%>"><%=rating%></i>
											</span>
										</button>
									</form>
									<span class="screentype"> <a class="imax" href="#"
										title="IMAX 상세정보 바로가기" data-regioncode="07">IMAX</a> <a
										class="forDX" href="#" title="4DX 상세정보 바로가기"
										data-regioncode="4D14">4DX</a> </span>
								</div>
								<div class="box-contents">
									<a href="/movies/detail-view/?midx=88104"> <strong
										class="title"><%=title%></strong>
									</a> <span class="txt-info"> <strong> <%=date%> <span>개봉</span>
											<em class="dday"> <%
 											if (dDay > 0) {
 											%> <i
												class='cgvIcon etc ageDay'
												data-before-text='D - <%=dDay%>'>DDay</i> <%
 											}
 											%></em>
									</strong>
									</span> <span class="like"> <a class="link-reservation"
										href="ticket.jsp">예매</a>
									</span>
								</div>
							</li>
							<%
							rank++;
							}
							%>

						</ol>
					</div>
				</div>
				<!-- .sect-moviechart -->


				<!--/ Contents End -->
			</div>
			<!-- /Contents Area -->
		</div>
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
		<jsp:include page="footer.jsp" />
		<!-- S Footer -->

	</div>
</body>
</html>