<%@page import="user.VO.UserVO"%>
<%@page import="admin.AdminVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8" 
 info="" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 등록</title>
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
.sect-login > .box-login fieldset {position:relative ;}


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


html{
     /* 웹페이지 드래그 및 커서 깜빡임 방지 */
     -ms-user-select: none;
     -moz-user-select: -moz-none;
     -webkit-user-select: none;
     -khtml-user-select: none;
     user-select: none;
}

.starScore{
	text-align: left;
}

.wrap_myReview{
	position: relative;
	width: 100%;
}

.wrapReviewContent{
	float: left;
	width: 50%;
}
</style>


<script type="text/javascript">

</script>
</head>



<body>
    <!-- Header -->
    <jsp:include page="header.jsp"></jsp:include>
    
    <!-- Content -->
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="wrap_myReview">
                    <div class="titleAndLine">
                        <!-- 제목 및 선 -->
                        <h1 class="display-6" style="margin-top: 30px; margin-bottom: 20px; font-weight: bold">My Review</h1>
                        <div style="background: #FFFFFF url('http://192.168.10.230/theater_prj/asd/images/line/line.png') repeat-x; height: 3px;"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <form>
                    <div class="reviewInfo">
                        <!-- 이미지 삽입 -->
                        <div style="float: left; margin-right: 20px;">
                            <img src="http://192.168.10.230/theater_prj/asd/images/movie/MOV001.jpg" style="width: 100px; height: auto;">
                        </div>
                        <div id="movielabel" style="margin-top: 20px; padding-top: 20px;">
                        <label style="font-size: 20px; font-weight: bold; margin-bottom: 15px;">영화제목</label><br>
                        <label style="font-size: 18px;">날짜</label><br>
                        <div id="scoreLabel" style="width: 800px; height: 60px;">
                            <label style="display: inline-block; margin-top: 15px; margin-right: 10px; font-size: 18px;">별점</label>
                            <select style="display: inline-block; width: 200px; height: 50px;" class="form-select" name="starScore">
                                <!-- 기본 선택 옵션 -->
                                <option selected="selected">별점 선택</option>
                                    <% for (int i = 1; i <= 5; i++) { %>
                                        <!-- 각 별점 옵션 -->
                                        <option value="<%=i%>">
                                            <% for (int j = 0; j < i; j++) { %>
                                                ⭐ <!-- 별표 표시 -->
                                            <% } %>
                                        </option>
                                    <% } %>
                            </select><br>
                        </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="wrapReviewContent">
                    <textarea class="form-control" id="reviewContent" name="reviewContent" style="width: 200%; height: 300px; margin-top:20px;"></textarea>
                </div>
            </div>
        </div>
        <div class="row" style="margin-top: 20px; margin-bottom: 20px; text-align: right;">
    		<div class="reviewButtons">
        		<button type="button" class="btn btn-primary" style="width: 80px; height: 50px; margin-right: 10px;">등록</button>
        		<button type="button" class="btn btn-secondary" style="width: 80px; height: 50px;">취소</button>
    		</div>
		</div>
    </div>

    <!-- Footer -->
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>