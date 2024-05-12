<%@page import="user.VO.UserVO"%>
<%@page import="admin.AdminVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8" 
 info="" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!--bootstrap 시작-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<!--bootstrap 끝-->
<!--jQeury CDN 시작-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!--jQeury CDN 끝-->
    <meta id="ctl00_og_image" property="og:image" content="https://img.cgv.co.kr/WebApp/images/common/logo_new_kakao_prevw.png"></meta>
    <link rel="alternate" href="http://m.cgv.co.kr" />
    <link rel="shortcut icon" href="../favicon.ico" type="image/x-icon" />
    <title id="ctl00_headerTitle">회원가입 | 명화 그 이상의 감동. 띵화관</title>
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

	<!-- datepicker -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>


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

	
.wrap_join {
    display: flex;
    flex-direction: column;
    align-items: center;
    text-align: center;
    padding: 70px;
}

#wrap_id {
    margin-bottom: 20px; /* 원하는 간격 값으로 조절합니다. */
}

#wrap_password {
    margin-bottom: 20px;
}

#wrap_re_password {
    margin-bottom: 20px;
}

#wrap_name {
    margin-bottom: 20px;
}

#wrap_birth {
    margin-bottom: 20px;
}

#wrap_tel {
    margin-bottom: 20px;
}

#wrap_terms {
  display: flex;
  flex-direction: column;
  margin-top: 30px;
  margin-bottom: 50px;
}

#term_label {
  margin-bottom: 10px; /* 라벨과 첫 번째 항목 사이의 간격 조정 */
}

#term1, #term2 {
  display: flex;
  align-items: center;
  margin-bottom: 5px; /* 각 항목 사이의 간격 조정 */
}

#term1 input[type="checkbox"], #term2 input[type="checkbox"] {
  margin-right: 10px; /* 체크박스와 텍스트 사이의 간격 조정 */
}

#term1 a, #term2 a {
  margin-left: auto; /* 텍스트를 오른쪽으로 이동하여 내용보기 링크를 오른쪽으로 정렬 */
  color: blue;
  text-decoration: underline;
}

.input-group-text {
    width: 100px;
    height: 70px;
    text-align: center;
    display: flex; /* 플렉스 컨테이너로 설정 */
    justify-content: center; /* 수평 가운데 정렬 */
}

.form-select{
	width: 100px;
    height: 70px;
}

#term1, #term2 {
    font-size: 17px;
}
	
</style>


<script type="text/javascript">

	//datepicker 사용
	$(function() {
		// 기본 사용
		//$( "#datepicker" ).datepicker();

		// 옵션 부여
		$("#datepicker").datepicker(
				{
					dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토" ],
					dateFormat : "yy-mm-dd",
					monthNames : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월",
							"8월", "9월", "10월", "11월", "12월" ],
					showMonthAfterYear : true
				});
	});
	
    // 팝업 창 가운데로 띄우는 함수
    function openPopup(url) {
        var popupWidth = 800;
        var popupHeight = 600;
        var left = (window.innerWidth - popupWidth) / 2;
        var top = (window.innerHeight - popupHeight) / 2;
        window.open(url, '_blank', 'width=800, height=600, left=' + left + ', top=' + top);
    }
	
	document.addEventListener('DOMContentLoaded', function() {
	    //idChk버튼이 클릭되면 idChkDupWin 함수 호출
	    document.getElementById('idChk').addEventListener('click', idChkDupWin);
	    
	    // 회원 이용약관 내용 보기 링크
	    document.getElementById("term1_link").addEventListener("click",
	            function(event) {
	                event.preventDefault(); // 링크의 기본 동작 중지
	                openPopup("join_term1.jsp");
	            });
	    
	    // 개인정보처리방침 내용 보기 링크
	    document.getElementById("term2_link").addEventListener("click",
	            function(event) {
	                event.preventDefault(); // 링크의 기본 동작 중지
	                openPopup("join_term2.jsp");
	    });
	});
	
	// 중복확인 버튼 클릭 시 실행되는 함수
	function idChkDupWin() {
	    // 입력된 아이디 가져오기
	    var userId = document.getElementById('userId').value;
	    
	    // 팝업창 열기
	    var popupUrl = 'idChk_dup.jsp?userId=' + userId;
	    var popupWidth = 1000;
		var popupHeight = 600;
		var left = (window.innerWidth - popupWidth) / 2;
		var top = (window.innerHeight - popupHeight) / 2;
	    var popupOptions = 'width=600, height=400, left=' + left
		+ ', top=' + top;
	    window.open(popupUrl, 'idChkDup', popupOptions);
	}
	
	$(function() {
	    $("#reUserPassword").focusout(function() {
	        //비밀번호 확인 함수 호출
	        chkCorrectPw();
	    }); // focusout

	    $("#btnSubmit").click(function() {
	        //모든 요소 입력되었는지 확인 함수
	        chkInputAll();
	    }); // click
	});

	//비밀번호 확인 함수
	function chkCorrectPw() {
	    if($("#userPassword").val() != $("#reUserPassword").val()) {
	        alert('비밀번호가 다릅니다');
	        $("#userPassword").val('');
	        $("#reUserPassword").val('');
	        $("#userPassword").focus();
	    } // end if
	} // chkCorrectPw
	
	//모든 요소 필수 입력 함수
	function chkInputAll() {
    let flagInputArrAll = true;
    let arrEssential = [ $("#userId"), $("#userPassword"), $("#reUserPassword"), $("#userName"), $("#datepicker"),
            $("#userPhone"), $("[name='terms'][value='회원 이용약관']"),
            $("[name='terms'][value='개인정보처리방침']") ];
    let arrLabel = [ '아이디', '비밀번호', '비밀번호 확인', '이름', '생년월일', '전화번호', '회원 이용약관',
            '개인정보처리방침' ];

    // 폼 객체 가져오기
    let joinForm = document.forms["joinFrm"];

    $.each(arrEssential, function(index, value) {
        if (index < 6 && $(value).val() == "") {
            alert(arrLabel[index] + '는 필수 입력입니다');
            flagInputArrAll = false;
            return false;
        } else if (index >= 6 && !$(value).is(":checked")) {
            alert(arrLabel[index] + '는 필수 동의사항입니다');
            flagInputArrAll = false;
            return false;
        }
    });

    if (flagInputArrAll) {
        joinForm.submit();
    }
}
	
	
	
</script>
</head>



<body>
	<!-- Header -->
	<jsp:include page="header.jsp"></jsp:include>

	<div class="wrap_join">
	
		<h2 style="font-size: 28px; font-weight: bold; margin-bottom: 40px;">회원가입</h2>
	
		<form name="joinFrm" id="joinFrm" action="join_process.jsp" method="post">
			<div id="wrap_id">
				<div class="input-group mb-3">
					<span class="input-group-text">아이디</span>
					<div class="form-floating">
						<input type="text" class="form-control" id="userId" name="userId" placeholder="아이디" required="required" style="height:70px;"> 
						<label for="id">아이디</label>
					</div>
				<button type="button" class="btn btn-outline-primary" id="idChk" style="width: 100px; height: 70px; font-size : 20px;">중복확인</button>
				</div>
			
			</div>
			
			<div id="wrap_password">
				<div class="input-group mb-3">
					<span class="input-group-text">비밀번호</span>
					<div class="form-floating" style="height: 70px;">
						<input type="password" class="form-control" id="userPassword" name="userPassword" placeholder="비밀번호" required="required" style="height:70px;"> 
						<label for="userPassword">비밀번호</label>
					</div>
				</div>
			</div>
			
			<div id="wrap_re_password">
				<div class="input-group mb-3">
					<span class="input-group-text">비밀번호<br>확인</span>
					<div class="form-floating">
						<input type="password" class="form-control" id="reUserPassword" name="reUserPassword" placeholder="비밀번호확인" required="required" style="height:70px;"> 
						<label for="reUserPassword">비밀번호 확인</label>
					</div>
				</div>
			</div>
			
			<div id="wrap_name">
				<div class="input-group mb-3">
					<span class="input-group-text">이름</span>
					<div class="form-floating">
						<input type="text" class="form-control" id="userName" name="userName" placeholder="이름" required="required" style="height:70px;"> 
						<label for="userName">이름</label>
					</div>
				</div>
			</div>
			
			<div id="wrap_birth">
				<div class="input-group mb-3">
					<span class="input-group-text">생년월일</span>
					<div class="form-floating">
						<input type="text" class="form-control" name="userBirthday" id="datepicker" placeholder="생년월일" required="required" style="height:70px;">
						<span id="CalregistdateIcon">
						</span>
						<label for="userBirthday">생년월일</label>
					</div>
				</div>
			</div>
			
			<!-- 생년월일 ver1.
			<div id="wrap_birth" style="margin-left: 5px">
			<div style="display: flex;">
				<label style="align-self: center; margin-right: 10px; font-size: 20px; font-weight: bold;">생년월일</label>
				<select class="form-select" name="year" id="year">
					<option selected="selected">선택</option>
					<% for (int i = 2024; i > 1953; i--) { %>
					<option value="<%=i%>"><%=i%></option>
					<% } %>
				</select> 
				<label for="year" style="align-self: center; margin-right: 15px; font-size: 20px;">년</label>
			
				 
				<select class="form-select" name="month">
					<option selected="selected">선택</option>
					<% for (int i = 1; i < 13; i++) { %>
					<option value="<%=i%>"><%=i%></option>
					<% } %>
				</select> 
				<label style="align-self: center; margin-right: 15px; font-size: 20px;">월</label> 
				
				<select class="form-select" name="day">
					<option selected="selected">선택</option>
					<% for (int i = 1; i < 32; i++) { %>
					<option value="<%=i%>"><%=i%></option>
					<% } %>
				</select> 
				<label style="align-self: center; margin-right: 15px; font-size: 20px;">일</label><br>
			</div>
			</div>
			-->
			
			<div id="wrap_tel">
				<div class="input-group mb-3">
					<span class="input-group-text">전화번호</span>
					<div class="form-floating">
						<input type="text" class="form-control" id="userPhone" name="userPhone" placeholder="전화번호" required="required" style="height:70px;"> 
						<label for="id">전화번호</label>
					</div>
				</div>
			</div>

			<div id="wrap_terms">
				<div id="term_label">
					<label style="font-size: 20px; font-weight: bold">약관 동의</label>
				</div>
				<div id="term1">
					<input class="form-check-input" type="checkbox" name="terms" value="회원 이용약관" style="font-size: 20px;">
					회원 이용약관 동의 
					<a id="term1_link" href="join_term1.jsp">내용보기</a>
				</div>
				<div id="term2">
					<input class="form-check-input" type="checkbox" name="terms" value="개인정보처리방침" style="font-size: 20px;">
					개인정보처리방침 동의 
					<a id="term2_link" href="join_term2.jsp">내용보기</a>
				</div>
			</div>
			
			<button type="button" class="btn btn-danger" id="btnSubmit" style="width: 130px; height: 50px; font-size : 20px;">회원가입</button>
			
		</form>
	
	
	</div>

	<!-- footer -->
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>