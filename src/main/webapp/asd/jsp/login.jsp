<%@page import="VO.UserVO"%>
<%@page import="VO.AdminVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8" 
 info="" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--bootstrap 시작-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<!--bootstrap 끝-->
<!--jQeury CDN 시작-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!--jQeury CDN 끝-->
    <meta id="ctl00_og_image" property="og:image" content="https://img.cgv.co.kr/WebApp/images/common/logo_new_kakao_prevw.png"></meta>
    <link rel="alternate" href="http://m.cgv.co.kr" />
    <link rel="shortcut icon" href="https://img.cgv.co.kr/theater_img/favicon.ico" type="image/x-icon" />
    <title id="ctl00_headerTitle">로그인 &lt; 회원서비스 | 영화 그 이상의 감동. CGV</title>
    <link rel="shortcut icon" type="image/x-icon" href="https://img.cgv.co.kr/R2014/images/favicon.ico" />
    <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/webfont.css" />
	<link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/reset.css" />
    <link rel="stylesheet" media="all" type="text/css" href="../css/layout.css" />
     <link rel="stylesheet" media="all" type="text/css" href="../css/module.css" /> 
    <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/content.css" />
    <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/common.css" />
    
    <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/eggupdate.css" />
    <link rel="stylesheet" media="print" type="text/css" href="https://img.cgv.co.kr/R2014/css/print.css" />    
    <link rel="stylesheet" type="text/css" href="https://img.cgv.co.kr/R2014/js/jquery.ui/smoothness/jquery-ui-1.10.4.custom.min.css" />
    
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

    <!--[if lte IE 9]><script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery.plugin/jquery.placeholder.js"></script><![endif]-->
    <script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery.plugin/jquery.dotdotdot.min.js"></script>
    <script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/silverlight_link.js"></script>
	<script src="https://img.cgv.co.kr/R2014/js/slick/slick.js" type="text/javascript" charset="utf-8"></script>

    <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/phototicket/phototicket.css" />
    <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/slick.css" />
	<link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/slick-theme-custom.css" />

    <script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/icheck/login.timer.js"></script>
    <script src="https://img.cgv.co.kr/R2014/js/icheck/icheck.min.js" type="text/javascript" charset="utf-8"></script>
    <link rel="stylesheet" type="text/css" href="https://img.cgv.co.kr/R2014/js/icheck/iCheck.css" />

	<!-- 2020.05.07 감정지수/프리에그 프로젝트 추가 -->
    <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/preegg.css" />



    <!-- 홈페이지 CSS 일원화로 인한 반영 20220721 -->
    <link rel="stylesheet" type="text/css" href="https://img.cgv.co.kr/resource_pc/css/cgv.min.css" />
    <script type="text/javascript" src="https://img.cgv.co.kr/resource_pc/js/cgvUi.js"></script>


<style type="text/css">


/* 로그인 */
.wrap-login{ width: 980px; position:relative;padding:30px 30px 0;}
.wrap-login h3{height:auto;margin:0;background:none;line-height:1.2;text-align:left; color:#222222; font-size:15px;}
.wrap-login h3 >  strong{ color:#fb4357;}
.sect-login{ width:541px; }
.wrap-login .tab-menu-round > li{ width:100px;}
.wrap-login p{width: 264px; font-size: 30px;font-weight: 500;text-align: center;}
.wrap-login .fieldset{width: 264px}
.wrap-login #form1{width: 264px}
.wrap-login .box-login{width: 264px}
.wrap-login .sect-login{width: 264px}
.wrap-login .sect-login .login-option{width: 264px}


/* S [U20201223] 네이버 로그인 버튼추가
	Description:
	- 기존코드
	.box-login{padding:70px 0 0 132px; border-bottom:2px solid #898987;padding-top:50px;height: 246px;}
	- 추가
	.btn_loginNaver{display:inline-block; margin-top:35px;}
*/
/*.box-login{padding:30px 0 0 132px; border-bottom:2px solid #898987; height: 266px;}*/
.btn_loginNaver{display:inline-block; margin-top:35px;}

/* E [U20201223] 네이버 로그인 버튼추가 */
.box-login > p{ font-size:11px;}
.box-login .login{ position:relative;margin-top:15px}
/* S [U20201223] 네이버 로그인 버튼추가
	Description:
	- 퍼블시 시스템팝업 안나오고 class 'error' 부분이 생성되면서 화면 깨짐
	- 개발시 시스템팝업 나오고 class 'error' 부분이 생성안되면 추가하지 않아도됨
*/
/* E [U20201223] 네이버 로그인 버튼추가 */

.box-login .login input[type="text"], .box-login .login input[type="password"]{ display:block; width:135px; height:35px; padding:0 5px 0 40px; border:2px solid #b5b5b5; line-height:33px;}
.box-login .login input[type="text"]{ margin-bottom:5px; background:url('../images/sprite_icon.png') 12px -230px no-repeat;}
.box-login .login input[type="password"]{ background:url('../images/sprite_icon.png') 12px -261px no-repeat;}

/* 로그인 최종버전 */
.box-login button[type="submit"] > span {display:block;width:258px;height:36px; border:1px solid #ffff; color:#f8f8f8; font-size:15px; font-weight:500;}
.box-login .login > button[type="submit"] {position:absolute; top:0; left:198px; display:block; width:100px; height:86px; padding:2px; background:#fb4357; line-height:78px; text-align:center;}
.sect-login > .box-login fieldset {position:relative;}


/*140804 로그인 UI 수정 및 캡챠 시작 */
.box-login .login input[type="text"], .box-login .login input[type="password"] {width:264px}
.box-login button[type="submit"] {width:264px;height:42px;line-height:37px;left:0;position: static;margin-top: 5px;padding:2px;background:#fb4357;text-align:center;}

/* S [U20201223] 네이버 로그인 버튼추가
	Description:
	- 기존코드
	.box-login fieldset > .login-option {margin-top: 10px!important;text-align: right;width: 264px;padding-left: 0!important;}
*/
.box-login fieldset > .login-option {position:absolute; bottom:-24px; left:55px;/*top:169px; right:145px;*/ padding-left: 0!important;}
/* E [U20201223] 네이버 로그인 버튼추가 */

.box-login fieldset > .login-option a {background-position:right 4px !important;}
.sect-login > .box-login fieldset .save-id {position:absolute; top:166px; left:-3px}
/* S [U20201223] 네이버 로그인 버튼추가
	Description:
	- 아이디 저장 마우스 오버시 손가락모양으로 변경
*/
.sect-login > .box-login fieldset .save-id input[type="checkbox"],
.sect-login > .box-login fieldset .save-id label{cursor:pointer}


/*140804 로그인 UI 수정 및 캡챠 끝 */

/* 로그인 최종배포 후 삭제 */
.box-login fieldset > .login-option label {margin-right:20px; font-size:11px;}
.box-login fieldset > .login-option a {display:inline-block; margin-left:5px; padding-right:8px; background:url('../images/common/bg/bg_arrow03.png') right 1px no-repeat; font-size:12px; text-decoration:underline;}

.box-login.nomember{ height:265px; padding:30px 0 0 0;}
.box-login.nomember .box-btn{ margin-bottom:30px;}
.box-login.nomember .box-btn > strong{ display:inline-block; margin-right:20px; color:#222222; font-size:15px; font-weight:300;}
.box-login.nomember .box-operationguide{ padding:20px 0 20px 40px; border:none; border-top:2px solid #e9e9de; background:none;}
.box-login.nomember .box-operationguide dt{ text-align:right;}
.box-login.nomember .box-operationguide dd{ padding:5px 0 0 0; border-left:none; background:url('../images/common/bg/dot_horizontal.gif') 0 0 repeat-x;}
.box-login.nomember .box-operationguide dt + dd{ padding-top:0; background:none;}
	
	
	
	
	
	

</style>
<script type="text/javascript">
	
	$(function(){
		
		$("#submit").click(function(){
			alert("로그인버튼 클릭");
			
			
			
			
			
			
			
		})

		
	})//ready
	
	
	
	
	
	
	
</script>
</head>



<body>



<!-- 실컨텐츠 시작 -->
		<!-- S Header
        Description
        - class 'nav' 에 class 'active' 추가시 서브메뉴노출
        - class 'nav' 에 class 'fixed' 추가시 상단고정되며 스타일 변경됨
     -->
		<div class="header">
			<!-- 서비스 메뉴 -->

			<div class="header_content">
				<div class="contents">
					<h1 onclick=""><a href="main.jsp"><img src="https://img.cgv.co.kr/R2014/images/common/logo/logoRed.png"
								alt="CGV" /></a><span>CULTUREPLEX</span></h1>
					<ul class="memberInfo_wrap">



						<li><a href="login.jsp"><img
									src="https://img.cgv.co.kr/R2014/images/common/ico/loginPassword.png"
									alt="로그인" /><span>로그인</span></a></li>
						<li><a href="/user/join/"><img src="https://img.cgv.co.kr/R2014/images/common/ico/loginJoin.png"
									alt="회원가입" /><span>회원가입</span></a></li>
						<li><a href="/user/mycgv/"><img
									src="https://img.cgv.co.kr/R2014/images/common/ico/loginMember.png"
									alt="MY CGV" /><span>MY CGV</span></a></li>
					</ul>
				</div>
			</div>

			<script>
				//GA Analytics TopMenu 영역 LOG
				//빨강 CGV클릭
				$('.header_content > .contents > h1 > a').on({
					click: function (e) {
						gaEventLog('PC_GNB', '홈', '');
					}
				});
				//서비스 메뉴
				$('.header_content > .contents > ul > li > a').on({
					click: function (e) {
						gaEventLog('PC_GNB', '서비스메뉴_' + this.text, '');
					}
				});



			</script>
			<!-- 서비스 메뉴 -->

			<!-- 서브 메뉴 -->

			<script type="text/javascript">
				$(document).ready(function () {
					$('.nav_menu > li > h2 > a').on({
						mouseenter: function (e) {
							var target = e.target;
							$(target).parents('.nav_menu').find('.nav_overMenu').slideDown(function () {
								$('.nav').addClass('active');
							});
						},
						click: function (e) {
							var target = e.target;
							if (!$('.nav').hasClass('active')) {
								$(this).trigger('mouseenter');
							} else {
								$('.nav').trigger('mouseleave');
							}
						}
					});

					/********************************************************
					//서브메뉴 구글 GA Analytics 로그 처리 - 2022.01.12 myilsan
					********************************************************/
					//cgv화이트 메뉴클릭
					$('.nav > .contents > h1 > a').on({
						click: function (e) {
							gaEventLog('PC_GNB', '홈', '');
						}
					});

					//주메뉴 클릭
					$('.nav_menu > li > h2 > a').on({
						click: function (e) {
							gaEventLog('PC_GNB', '주메뉴_' + this.text, '');
						}
					});

					//주메뉴 하위메뉴 클릭
					$('.nav_overMenu > dd > h3 > a').on({
						click: function (e) {
							var target = e.target;
							var parText = $(target).parents('.nav_overMenu').find('dt')[0].innerText;
							gaEventLog('PC_GNB', parText + '_' + this.text, '');
						}
					});

					//하위메뉴 최상위 클릭
					$(".nav_overMenu > dt > h2 > a").on({
						click: function (e) {
							gaEventLog('PC_GNB', this.text + '_' + this.text, '');
						}
					});

					//------------------end----------------------- [@,.o]>

					$('.nav').on({
						mouseleave: function (e) {
							$(this).find('.nav_overMenu').slideUp(200, function () {
								$('.nav').removeClass('active');
							});
						}
					});



					$(this).on({
						scroll: function (e) {
							/* S GNB fixed */
							var headerOffsetT = $('.header').offset().top;
							var headerOuterH = $('.header').outerHeight(true);
							var fixedHeaderPosY = headerOffsetT + headerOuterH;
							var scrollT = $(this).scrollTop();
							var scrollL = $(this).scrollLeft();

							if (scrollT >= fixedHeaderPosY) {
								$('.nav').addClass('fixed');
								$('.fixedBtn_wrap').addClass('topBtn');
							} else {
								$('.nav').removeClass('fixed');
								$('.fixedBtn_wrap').removeClass('topBtn');
							}

							/* S > GNB fixed 좌우 스크롤
							Description
							- GNB가 fixed 되었을때 좌우 스크롤 되게 처리
							*/
							if ($('.nav').hasClass('fixed')) {
								$('.nav').css({'left': -1 * scrollL})
							} else {
								$('.nav').css({'left': 0})
							}
							/* E > GNB fixed 좌우 스크롤 */
							/* S GNB fixed */
						}
					});

					$('.btn_gotoTop').on({
						click: function () {
							$('html, body').stop().animate({
								scrollTop: '0'
							}, 400);
						}
					});




				});








			</script>
			<div class="nav">
				<div class="contents">
					<h1><a href="/" tabindex="-1"><img
								src="https://img.cgv.co.kr/R2014/images/common/logo/logoWhite.png" alt="CGV" /></a></h1>
					<ul class="nav_menu">
						<li>
							<h2><a href="/movies/?lt=1&ft=0">영화</a></h2>
							<dl class="nav_overMenu">
								<dt>
									<h2><a href="/movies/?lt=1&ft=0" tabindex="-1">영화</a></h2>
								</dt>

								<dd>
									<h3><a href="/movies/?lt=1&ft=0">무비차트</a></h3>
								</dd>
							</dl>
						</li>

						<li>
							<h2><a href="/ticket/"><strong>예매</strong></a></h2>

							<dl class="nav_overMenu">
								<dt>
									<h2><a href="/ticket/" tabindex="-1">예매</a></h2>
								</dt>

								<dd>
									<h3><a href="/ticket/">빠른예매</a></h3>
								</dd>

							</dl>
						</li>

						<li>
							<h2><a href="/culture-event/popcorn-store/">스토어</a></h2>

							<dl class="nav_overMenu">
								<dt>
									<h2><a href="/culture-event/popcorn-store/" tabindex="-1">스토어</a></h2>
								</dt>

								<dd>
									<h3><a
											href="/culture-event/popcorn-store/store-category.aspx?CategoryIdx=2">영화관람권</a>
									</h3>
								</dd>

								<dd>
									<h3><a href="/culture-event/popcorn-store/store-category.aspx?CategoryIdx=4">콤보</a>
									</h3>
								</dd>

								<dd>
									<h3><a href="/culture-event/popcorn-store/store-category.aspx?CategoryIdx=5">팝콘</a>
									</h3>
								</dd>

								<dd>
									<h3><a href="/culture-event/popcorn-store/store-category.aspx?CategoryIdx=6">음료</a>
									</h3>
								</dd>

								<dd>
									<h3><a href="/culture-event/popcorn-store/store-category.aspx?CategoryIdx=7">스낵</a>
									</h3>
								</dd>


							</dl>
						</li>

						<li>
							<h2><a href="/culture-event/event/defaultNew.aspx">커뮤니티</a>
							</h2>
							<dl class="nav_overMenu">
								<dt>
									<h2><a href="/culture-event/event/defaultNew.aspx?mCode=001" tabindex="-1">커뮤니티</a>
									</h2>
								</dt>

								<dd>
									<h3><a href="/culture-event/event/defaultNew.aspx?mCode=001">영화게시판</a></h3>
								</dd>

								<dd>
									<h3><a href="/culture-event/event/defaultNew.aspx?mCode=004">영화리뷰</a></h3>
								</dd>

							</dl>
						</li>

						<li>
							<h2 onclick="gaEventLog('PC_GNB','주메뉴_해택','')"><a
									href="/discount/discountlist.aspx">공지사항</a></h2>

							<dl class="nav_overMenu">

								<dt>
									<h2><a href="/discount/discountlist.aspx" tabindex="-1">공지사항</a></h2>
								</dt>

							</dl>
						</li>

						<li>
							<h2 onclick="gaEventLog('PC_GNB','주메뉴_해택','')"><a href="/discount/discountlist.aspx">자주찾는
									질문</a></h2>

							<dl class="nav_overMenu">

								<dt>
									<h2><a href="/discount/discountlist.aspx" tabindex="-1">자주찾는 질문</a></h2>
								</dt>

							</dl>
						</li>
					</ul>
				</div>
			</div>
			<!-- 서브 메뉴 -->
		</div>
		<!-- E Header -->



<div class="wrap-login">
    <div class="sect-login">
        <ul class="tab-menu-round">


        </ul>
        <div class="box-login">
            <h3 class="hidden">회원 로그인</h3>
            <form id="form1" method="post" action="#" novalidate="novalidate" onsubmit="return false">
            <fieldset>
                <legend>회원 로그인</legend>
                <p>로그인</p>
                <div class="login">
                    <input type="text" title="아이디" id="txtUserId" name="txtUserId" data-title="아이디를 " data-message="입력하세요." required="required" />
                    <input type="password" title="패스워드" id="txtPassword" name="txtPassword" data-title="패스워드를 " data-message="입력하세요." required="required" />
                </div>

              
                <button type="submit" id="submit" title="로그인"><span>로그인</span></button>
                <div class="login-option">
                     
                    <a style="cursor:pointer;" onclick="alert('아이디 찾기 클릭')"  target="_blank">아이디 찾기</a>
                    <a style="cursor:pointer;" onclick="alert('비번 찾기 클릭')" target="_blank">비밀번호 찾기</a>
                   
                </div>
            </fieldset>
            </form>  
        </div>
    </div>    
    <div class="sect-loginguide">

    </div>

	









</div>
<!-- 실컨텐츠 끝 --> 

<footer>
			<!-- footer_area (s) -->

			<div id="BottomWrapper" class="sect-ad">
				<iframe src="https://ad.cgv.co.kr/NetInsight/html/CGV/CGV_201401/main@Bottom" width="100%" height="240"
					title="" frameborder="0" scrolling="no" marginwidth="0" marginheight="0" name="Bottom"
					id="Bottom"></iframe>
			</div>
			<ul class="policy_list">
				<li><a href="http://corp.cgv.co.kr/company/" target="_blank">회사소개</a></li>
				<li><a href="http://www.cgv.co.kr/rules/service.aspx">이용약관</a></li>
				<li><a href="http://www.cgv.co.kr/rules/privacy.aspx"><strong>개인정보처리방침</strong></a></li>
				<li><a href="http://www.cgv.co.kr/rules/disclaimer.aspx">법적고지</a></li>
				<li><a href="http://www.cgv.co.kr/rules/emreject.aspx">이메일주소무단수집거부</a></li>
			</ul>
			<article class="company_info_wrap">
				<section class="company_info">

					<address>(16293)경기도 수원시 장안구 조원동 광교산 임광그대가 101동 1002호</address>

					<dl class="company_info_list">
						<dt>대표이사</dt>
						<dd>윤웅찬</dd>
						<dt>사업자등록번호</dt>
						<dd>010-8623-5905</dd>
						<dt>통신판매업신고번호</dt>
						<dd>1998-경기수원-0513 <a href="#none" onclick="goFtc()" class="btn_goFtc">사업자정보확인<a></a></a></dd>
					</dl>

					<dl class="company_info_list">
						<dt>호스팅사업자</dt>
						<dd>CJ올리브네트웍스</dd>
						<dt>개인정보보호 책임자</dt>
						<dd>도형구</dd>
						<dt>대표이메일</dt>
						<dd>cjcgvmaster@cj.net</dd>

					</dl>

					<p class="copyright">&copy; 예찬,주희,지민,무영,웅찬 LET'S GO</p>
				</section>
			</article>
			<script>
				//footer GA Analytics 영역 LOG
				$('.policy_list > li > a').on({
					click: function (e) {
						gaEventLog('PC_footer', this.text, '');
					}
				});
			</script>

		</footer>
		<!-- E Footer -->


</body>
</html>