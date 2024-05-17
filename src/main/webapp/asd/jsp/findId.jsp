<%@page import="user.VO.UserVO"%>
<%@page import="admin.AdminVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8" 
 info="" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
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

	
.wrap_findId {
    display: flex;
    flex-direction: column;
    align-items: center;
    text-align: center;
    padding: 100px;
}

.form-control::placeholder {
    color: gray;
}

#findId_name, #findId_birth, #findId_tel, #findId_btn {
    height: 50px;
    width: 400px;
}

#findId_btn {
	margin-top: 40px;
}


</style>


<script type="text/javascript">
	$(document).ready(function() {
    	$("#findId_btn").click(function() {
    		var userName = document.findIdFrm.userName.value;
    		var userBirthday = convertToDate();
    		var userPhone = document.findIdFrm.userPhone.value;
        	// 모든 요소 입력되었는지 확인 함수
        	if (chkInputAll()) {
        		var url = "findIdResult.jsp?userName="+userName+"&userBirthday="+userBirthday+"&userPhone="+userPhone;
            	// 팝업 창 크기 설정
            	var popupWidth = 600;
            	var popupHeight = 400;
            	// 팝업 창 가운데로 띄우기
            	var left = (window.innerWidth - popupWidth) / 2;
            	var top = (window.innerHeight - popupHeight) / 2;
            	// 새로운 창 열기
            	window.open(url,"_blank", "width=600,height=400,left=" + left + ",top=" + top);
            	submit();
        	}
    	});
	});
    

	// 모든 요소 필수 입력 함수
	function chkInputAll() {
	    let flagInputArrAll = true;
	    let arrEssential = [$("#findId_name"), $("#findId_birth"), $("#findId_tel")];
	    let arrLabel = ['이름', '생년월일', '전화번호'];

	    for (let i = 0; i < arrEssential.length; i++) {
	        if (!arrEssential[i].val()) {
	            flagInputArrAll = false;
	            alert(arrLabel[i] + "을(를) 입력하세요.");
	            arrEssential[i].focus();
	            break;
	        }
	        // 생년월일이 숫자로만 6자리인지 확인
	        if (i === 1) {
	            let birthValue = arrEssential[i].val();
	            if (!/^\d{6}$/.test(birthValue)) {
	                flagInputArrAll = false;
	                alert("생년월일은 숫자 6자리로만 입력해주세요.");
	                arrEssential[i].val(""); // 입력 필드를 비움
	                arrEssential[i].focus();
	                break;
	            }
	        }
	        // 전화번호가 숫자로만 11자리인지 확인
	        if (i === 2) {
	            let telValue = arrEssential[i].val();
	            if (!/^\d{11}$/.test(telValue)) {
	                flagInputArrAll = false;
	                alert("전화번호는 숫자 11자리로만 입력해주세요.");
	                arrEssential[i].val(""); // 입력 필드를 비움
	                arrEssential[i].focus();
	                break;
	            }
	        }
	    }
	    return flagInputArrAll;
	}
	
	//날짜 형식 바꾸기 함수
	function convertToDate(userBirthday) {
		var userBirthday = document.findIdFrm.userBirthday.value;
		
	    // 6자리 숫자로부터 연, 월, 일을 추출
	    var year = userBirthday.substring(0, 2);
	    var month = userBirthday.substring(2, 4);
	    var day = userBirthday.substring(4, 6);

	    // 현재 연도를 기준으로 2000년 이후와 2000년 이전의 구분
	    var currentYear = new Date().getFullYear();
	    //var century = currentYear < 2000 ? "19" : "20";
	    var century = year > 21 ? "19" : "20";

	    // YY 형식의 연도를 YYYY 형식으로 변환
	    year = century + year;

	    // 월과 일이 한 자리 숫자인 경우 앞에 0을 붙여줌
	    if (month.charAt(0) === "0") {
	        month = month.charAt(1);
	    }
	    if (day.charAt(0) === "0") {
	        day = day.charAt(1);
	    }

	    // YYYY-MM-DD 형식으로 반환
	    return year + "-" + month + "-" + day;
	}


	
</script>
</head>



<body>
	<!-- Header -->
	<jsp:include page="header.jsp"></jsp:include>

<div class="wrap_findId">
    <h2 style="font-size: 24px; font-weight: bold; margin-bottom: 20px;">아이디 찾기</h2>
    <form name="findIdFrm" id="findIdFrm" action="findIdResult.jsp" method="post">
        <div class="input-group mb-3 input-group-lg">
            <input type="text" class="form-control" id="findId_name" name="userName" placeholder="이름을 입력하세요.">
        </div>
        <div class="input-group mb-3 input-group-lg">
            <input type="text" class="form-control" id="findId_birth" name="userBirthday" placeholder="생년월일 6자리를 입력하세요.">
        </div>
        <div class="input-group mb-3 input-group-lg">
            <input type="text" class="form-control" id="findId_tel" name="userPhone" placeholder="전화번호 11자리를 입력하세요. (숫자만)">
        </div>
        
        <button type="button" class="btn btn-primary" id="findId_btn"
        style="font-size: 20px;">아이디 찾기</button>
        
    </form>
</div>

	<!-- footer -->
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>