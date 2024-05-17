
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info="마이페이지"%>

<!DOCTYPE html>
<html>
<head>

<link rel="icon" href="http://192.168.10.227/common/favicon.ico" />
<!--bootstrap 시작-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<!--bootstrap 끝-->
<link rel="stylesheet"
	href="http://192.168.10.227/common/css/main.css">
<link rel="stylesheet"
	href="http://192.168.10.227/common/css/board.css">
<!--jQeury CDN 시작-->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!--jQeury CDN 끝-->


<link rel="alternate" href="http://m.cgv.co.kr" />
<link rel="shortcut icon" href="../favicon.ico" type="image/x-icon" />
<title id="ctl00_headerTitle">명화 그 이상의 감동. 띵화관</title>

<link rel="shortcut icon" type="image/x-icon"
	href="https://img.cgv.co.kr/R2014/images/favicon.ico" />
<link rel="stylesheet" media="all" type="text/css"
	href="https://img.cgv.co.kr/R2014/css/webfont.css" />
<link rel="stylesheet" media="all" type="text/css"
	href="https://img.cgv.co.kr/R2014/css/reset.css" />
<link rel="stylesheet" media="all" type="text/css"
	href="../css/layout.css" />
<link rel="stylesheet" media="all" type="text/css"
	href="../css/module.css" />
<link rel="stylesheet" media="all" type="text/css"
	href="../css/content.css" />
<link rel="stylesheet" media="all" type="text/css"
	href="https://img.cgv.co.kr/R2014/css/common.css" />

<link rel="stylesheet" media="all" type="text/css"
	href="https://img.cgv.co.kr/R2014/css/eggupdate.css" />
<link rel="stylesheet" media="print" type="text/css"
	href="https://img.cgv.co.kr/R2014/css/print.css" />
<link rel="stylesheet" type="text/css"
	href="https://img.cgv.co.kr/R2014/js/jquery.ui/smoothness/jquery-ui-1.10.4.custom.min.css" />



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
	src="https://img.cgv.co.kr/R2014/js/jquery.utils.pageing.js"></script>



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


<script type="text/javascript"
	src="https://img.cgv.co.kr/R2014/js/swiper.min.js"></script>
<link rel="stylesheet" media="all" type="text/css"
	href="https://img.cgv.co.kr/R2014/css/swiper-bundle.min.css" />

<style type="text/css">
.left-div {
	width: 155px;
	height: 340px;
	float: left;
	/* background-color: #eacacb; */
}

.right-div {
	width: 629px;
	height: 340px;
	float: left;
	background-color: white;
	overflow-y: auto;
	max-height: 500px;
	/* 	 border: 2px solid #000; */
}

.user-information-box {
	width: 629px;
	height: 100px;
	margin-top: 100px;
	display: flex;
	justify-content: center; /* 가로 중앙 정렬 */
	align-items: center; /* 세로 중앙 정렬 */
}

#myPage-ok, #myPage-cancel {
	width: 150px;
	height: 30px;
}

.button-box {
	margin-left: 150px;
}

.snb ul li a:hover {
	cursor: pointer; /* 마우스 호버 시에 커서를 포인터로 변경 */
}

.password-confirmation {
	margin-top: 100px;
	display: flex;
	justify-content: center; /* 가로 중앙 정렬 */
	align-items: center; /* 세로 중앙 정렬 */
}
</style>



<style type="text/css">
.container2 {
	width: 629px;
	height: 340px;
	border: 2px solid #000;
	padding-left: 0; /* 왼쪽 여백 제거 */
	padding-right: 0; /* 오른쪽 여백 제거 */
}

.top-section {
	width: 625px;
	height: 30px;
	background-color: #ccc; /* 배경색은 회색 */
	display: flex; /* 가운데 정렬을 위한 Flexbox 사용 */
	justify-content: center; /* 가로 정렬 가운데로 설정 */
	align-items: center; /* 세로 정렬 가운데로 설정 */
}

.top-section div {
	font-weight: bold; /* 텍스트 진하게 설정 */
}

.bottom-section {
	width: 625px;
	height: 256px;
	/* background-color: #f0f0f0; */ /* 배경색은 연한 회색 */
	display: flex; /* 요소들을 가로로 배열하기 위해 Flexbox 사용 */
}

.buttom-section {
	width: 625px;
	height: 50px;
	/* background-color: #f0f0f0; */ /* 배경색은 연한 회색 */
	display: flex; /* 요소들을 가로로 배열하기 위해 Flexbox 사용 */
}

.image-div {
	margin-top: 20px;
}

.bottom-section .left-div {
	width: 150px;
	height: 256px;
	/* background-color: #f8d7da; */ /* 첫 번째 div 배경색 */
}

.bottom-section .middle-div {
	width: 475px;
	height: 256px;
	/* background-color: #d4edda; */ /* 두 번째 div 배경색 */
}

.buttom-section .bottom-div {
	width: 625px;
	height: 50px;
	/* background-color: #cce5ff; */ /* 세 번째 div 배경색 */
}

.inner-div {
	width: 450px;
	height: 210px;
	/*  background-color: #D6F793; */  /* 세 번째 div 배경색 */
	margin-left: 13px;
	margin-top: 20px;
}

.dynamic-value {
	height: 23px; /* 각 동적 값에 대한 높이를 조절할 수 있습니다. */
}

.dynamic-value p {
	font-weight: bold; /* 텍스트를 진하게 설정합니다. */
}

.dynamic-value span {
	font-weight: normal; /* span 태그의 텍스트를 표준으로 설정합니다. */
}

.no-review {
    color: red;
}
</style>

<style>
    .update-container {
        width: 629px;
    }
    .sub-container {
        width: 100%;
        display: flex;
        flex-direction: column;
    }
    .sub-container{
        width: 100%;

    }
    .reviewInfo {
        height: 170px;
        display: flex;
        flex-direction: row;

        
    }
    .reviewContent {
        height: 120px;

    }
    .buttonList {
        height: 50px;

    }
    .Rating {
        height: 170px;
        display: flex;
        flex-direction: row;

        
    }
</style>










<%
String userId = (String) session.getAttribute("id");
pageContext.setAttribute("userId", userId);
%>



<script type="text/javascript">
$(document).ready(function(){
    // 각 링크에 대한 클릭 이벤트 리스너 추가
    $(".snb ul li a").click(function(){
        // 모든 링크의 부모 li 요소에서 'on' 클래스를 제거
        $(".snb ul li").removeClass("on");
        // 클릭된 링크의 부모 li 요소에 'on' 클래스 추가
        $(this).parent().addClass("on");
        // 모든 링크의 배경색과 글자색을 원래대로 되돌리기
        $(".snb ul li a").css({"background-color": "", "color": ""});
        // 클릭된 링크의 배경색과 글자색 변경
        $(this).css({"background-color": "#fb4357", "color": "#fdfcf0"});
        
        
        // 클릭된 메뉴의 텍스트 내용을 가져옴
        var menuText = $(this).text();
        // 가져온 메뉴 텍스트를 alert로 표시
        //alert("선택된 메뉴: " + menuText);
        
        
        

         
     // 만약 MY 띵화관 HOME 메뉴가 클릭되었다면
        if(menuText.trim() == "MY 띵화관"){
        	  $(".right-div").empty();
            // MY 띵화관 HOME 내용 추가
            var userInformationHTML = `

            

            마이페이지에 추가할거 추천받아엽;;;
            
            
            `;
            $(".right-div").html(userInformationHTML);
        }
     
        // 만약 나의 예매내역 메뉴가 클릭되었다면
        if(menuText.trim() == "나의 예매내역"){
        	  $(".right-div").empty();

        	  selectReservation()
        	  
        	  
        }
        
        
        
        
        // 만약 내가 본 영화 메뉴가 클릭되었다면
        if(menuText.trim() == "내가 본 영화"){
        	  $(".right-div").empty();
        	  
        	  myReview();

        }
     
     
     
     // 만약 개인 정보 변경 메뉴가 클릭되었다면
        if (menuText.trim() == "개인 정보 변경") {
            // 기존에 있는 내용을 삭제
            $(".right-div").empty();

            // 비밀번호 확인 폼 추가
            var passwordFormHTML = `
            <div class="password-confirmation">
                <form id="passwordConfirmationForm" class="mt-3 row g-3 align-items-center">
                    <div class="col-auto">
                        <label for="currentPassword" class="visually-hidden">현재 비밀번호</label>
                        <input type="password" id="currentPassword" name="currentPassword" class="form-control" placeholder="현재 비밀번호" required>
                    </div>
                    <div class="col-auto">
                        <button type="button" id="checkButton" class="btn btn-success">확인</button>
                    </div>
                </form>
            </div>`;

            $(".right-div").append(passwordFormHTML);

            // input 요소에 이벤트 리스너를 추가하여 엔터 키 이벤트를 감지합니다.
            document.getElementById("currentPassword").addEventListener("keypress", handleKeyPress);

            // 비밀번호 확인 폼 제출 이벤트 처리
            $("#checkButton").click(function(event) {
                event.preventDefault(); // 기본 동작 중단
                checkNull();
            });
        } //end if
     
     
     
     
    });
         
         
 

    
    

    
    
    
 // 비밀번호 변경 버튼 클릭 이벤트 리스너 추가
    $("#changePasswordButton").click(function() {
        // 비밀번호 변경 다이얼로그 열기
        $("#changePasswordDialog").dialog("open");
    });
    
    // jQuery UI 다이얼로그 초기화
    $("#changePasswordDialog").dialog({
        autoOpen: false, // 초기에 자동으로 열리지 않도록 설정
        modal: true, // 모달 형태로 표시
        buttons: {
            "확인": function() {
                // 비밀번호 변경 로직을 처리하는 함수 호출
                // 여기에 비밀번호 변경 처리 로직을 추가하세요
                alert("비밀번호 변경 로직을 처리합니다.");
                
                // 다이얼로그 닫기
                $(this).dialog("close");
            },
            "취소": function() {
                // 다이얼로그 닫기
                $(this).dialog("close");
            }
        }
    });

    


    
});//ready


	function myReview() {
	    $(".right-div").empty();
	    var id = "<%=userId%>";
	    var request = new XMLHttpRequest(); // request 변수를 선언

	    request.open(
	        "POST",
	        "http://localhost/theater_prj/SelectReviewServlet",
	        true
	    );
	    request.setRequestHeader(
	        "Content-Type",
	        "application/x-www-form-urlencoded; charset=UTF-8"
	    );

	    // 에러 핸들링
	    request.onerror = function() {
	        alert("요청을 보낼 때 오류가 발생했습니다.");
	    };

	    request.onreadystatechange = function() {
	        if (request.readyState == 4) {
	            if (request.status == 200) {
	                // 응답을 받으면 처리
	                var jsonResponse = request.responseText;
	                var responseObject = JSON.parse(jsonResponse);

	                if (responseObject.success) {


	                    // 예매 내역을 담을 변수
	                    var reservationHTML = '';

	                    // 예매 내역 데이터
	                    var reservationData = responseObject.result;

	                    if (reservationData.length > 0) {
	                        // 각 예약 정보에 대해 HTML 생성
	                        reservationData.forEach(function (reservation) {

	                            // 평가 점수를 받아서 별을 생성하는 함수
	                            function createStars(rating) {
	                                var stars = '';
	                                for (var i = 0; i < rating; i++) {
	                                    stars += '★';
	                                }
	                                for (var i = rating; i < 5; i++) {
	                                    stars += '☆';
	                                }
	                                return stars;
	                            }

	                            // 평가 점수
	                            var rating = reservation.reviewScore || 0; // rating 값이 없으면 0으로 설정
	                            var starsHTML = createStars(rating);
	                            
	                            // 리뷰 내용 자르기
 								var reviewContent = reservation.reviewContent
								
	                            var reviewClass = '';
	                            var buttonHTML = '';
	                            
	                            var reviewInputDate = reservation.reviewInputDate;

	                            
	                            
	                            

	                            if (reviewContent === 'null') {
	                                reviewContent = '리뷰를 입력해주세요!';
	                                reviewClass = 'no-review';
	                                buttonHTML = '<button type="button" class="btn btn-danger float-end" onclick="writeReview(\''+ reservation.movieTitle + '\', \''  + reservation.reservationNumber + '\', \'' + reservation.movieCode +  '\', \'' + reservation.moviePosterPath +'\')">리뷰 작성</button>';
	                            } else {
	                                if (reviewContent.length > 20) {
	                                    reviewContent = reviewContent.substring(0, 20) + '....';
	                                }
	                                buttonHTML = '<button type="button" class="btn btn-secondary float-end" onclick="selectReviewDetail(\''+ reservation.reviewNumber + '\', \'' + reservation.movieTitle + '\', \'' + reservation.reviewContent + '\', \'' + reservation.reviewScore + '\', \'' + reservation.moviePosterPath + '\')">상세보기</button>';
	                            }
	                          		
	                            // 문자열 연결 연산자를 사용하여 HTML 조립
	                            reservationHTML +=
	                                '<div class="container mt-5">' +
	                                '<div class="card">' +
	                                '<div class="card-body">' +
	                                '<div class="row" >' +
	                                '<div class="col-4">' +
	                                '<div class="d-flex justify-content-center justify-content-md-start">' +
	                                '<div class="aaaa">' +
	                                '<img src="../images/movie/' + reservation.moviePosterPath + '" alt="영화 포스터" width="160" height="160">' +
	                                '</div>' +
	                                '</div>' +
	                                '</div>' +
	                                '<div class="col">' +
	                                '<p style="margin-top: 5px;"><strong>영화제목  </strong></p>' +
	                                '<div> ' + reservation.movieTitle + '</div>' +
	                                '<p style="margin-top: 5px;"><strong>관람극장  </strong></p>' +
	                                '<div> ' + reservation.theaterName + ' ' + reservation.theaterNumber + '</div>' +
	                                '<p style="margin-top: 5px;"><strong>관람일시  </strong></p>' +
	                                '<div> ' + reservation.screeningDate + ' ' +  reservation.screeningTime + '</div>' +
	                                '<p style="margin-top: 5px;"><strong>평점  </strong></p>' +
	                                '<div> ' + starsHTML + '</div>' +
	                                '</div>' +
	                                '</div>' +
	                                '<div class="row">' +
	                                '<div class="col text-start">' +
	                                '<div style="margin-top: 15px; font-weight: bolder;" class="' + reviewClass + '"> ' + reviewContent + '</div>' + // 리뷰 내용 추가
	                                '</div>' +
	                                '<div class="col text-end">' +
	                                buttonHTML +
	                                '</div>' +
	                                '</div>' +
	                                '</div>' +
	                                '</div>' +
	                                '</div>';
	                        });
	                    } else {
	                        reservationHTML =
	                            '<img src="../images/myPage/noReservation.png" style="width: 330px; height: 330px; margin-left:100px;">';
	                    }

	                    // 생성된 예매 내역 HTML을 .right-div 요소에 삽입
	                    $(".right-div").html(reservationHTML);
	                } else {
	                    reservationHTML =
	                        '<img src="../images/myPage/noReservation.png" style="width: 330px; height: 330px; margin-left:100px;">';
	                    $(".right-div").html(reservationHTML);
	                }
	            } else {
	                alert("문제발생.");
	            }
	        }
	    };

	    // POST 요청의 파라미터를 설정하여 보냄
	    request.send("id=" + encodeURIComponent(id));
	}//end myReview

///////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////

	
	
// 리뷰 상세 조회
function selectReviewDetail(reviewNumber, movieTitle, reviewContent, reviewScore, moviePosterPath) {
   

    // 기존에 있는 내용을 삭제
    $(".right-div").empty();

    var year = new Date().getFullYear();
    var month = ("0" + (new Date().getMonth() + 1)).slice(-2); // 월을 두 자리로 표현
    var day = ("0" + new Date().getDate()).slice(-2); // 날짜를 두 자리로 표현

    var today = year + '-' + month + '-' + day;

    // 리뷰상세 디자인
var selectFormHTML =
    '<div class="update-container">' +
    '<div class="sub-container">' +
    '<div class="reviewInfo">' +
    '<div class="postBox" style="width: 150px; height: 170px;">' +
    '<div style="width: 130px; height: 150px; margin-left:15px;">' +
    '<img src="../images/movie/' + moviePosterPath + '" alt="영화 포스터" style="width: 130px; height: 150px; margin-top:10px;">' +
    '</div>' +
    '</div>' +
    '<div class="infoBox" style="width: 484px; height: 170px;">' +
    '<div class="movieTitle" style="width: 484px; height: 50px; margin-top:10px;">' +
    '<div id="movieTitle" style="width: 470px; margin-left:5px; margin-top:10px; font-size: 20px; font-weight: bold;">' + movieTitle + '</div>' +
    '</div>' +
    '<div class="reviewDate" style="width: 484px; height: 50px;">' +
    '<div id="reviewInputDate" style="width: 200px; margin-left:5px; margin-top:10px; font-size: 20px; font-weight: bold;">' + today + '</div>' +
    '</div>' +
    '<div class="Rating" style="width: 484px; height: 50px;">' +
    '<div style="width: 70px; height: 40px;">' +
    '<div style="width: 70px;">' +
    '<div id="reviewRating" style="margin-left:10px; margin-top:10px; font-size: 24px; font-weight: bold;"> 별점 : </div>' +
    '</div>' +
    '</div>' +
    '<div style="margin-left:5px; margin-top:5px;">' +
    '<select style="display: inline-block; width: 200px; height: 40px;" class="form-select" id="starScore">' +
    '<option value="0" ' + (reviewScore === 0 ? "selected" : "") + '>별점 선택</option>'; // reviewScore가 0이면 선택됨
for (var i = 1; i <= 5; i++) {
    var starText = '';
    for (var j = 0; j < i; j++) {
        starText += '⭐'; // 별점 개수에 따라 ⭐를 추가합니다.
    }
    selectFormHTML += '<option value="' + i + '" ' + (parseInt(reviewScore) === i ? "selected" : "") + '>' + starText + '</option>'; // reviewScore와 같은 수의 별점이 선택됨
}
selectFormHTML +=
    '</select>' +
    '</div>' + // 별점 표시
    '</div>' +
    '</div>' +
    '</div>' +
    '<div class="reviewContent">' +
    '<div style="margin-left: 15px;margin-top: 10px;">' +
    '<textarea id="reviewContent" class="form-control"  name="reviewContent" style="width: 600px; height: 100px;">' + reviewContent + '</textarea>' +
    '</div>' +
    '</div>' +
    '<div class="buttonList" style="margin-left:auto; margin-right: 15px;">' +
    '<div class="reviewButtons">' +
    '<button type="button" class="btn btn-primary" style="width: 80px; height: 50px; margin-right: 10px;" onclick="updateReview(\''+ reviewNumber + '\');">수정</button>' +
    '<button type="button" class="btn btn-danger" style="width: 80px; height: 50px; margin-right: 10px;" onclick="deleteReview(\''+ reviewNumber + '\')">삭제</button>' +
    '<button type="button" class="btn btn-secondary" style="width: 80px; height: 50px;" onclick="myReview();">취소</button>' +
    '</div>' +
    '</div>' +
    '</div>' +
    '</div>';

    $(".right-div").append(selectFormHTML);
}


	function updateReview(reviewNumber){//리뷰 수정

		var result = confirm("리뷰를 수정하시겠습니까?");
	
		var reviewContent = $("#reviewContent").val();
		var reviewScore = $("#starScore").val();
		
		if (reviewScore==0) {
		    alert("별점을 선택해주세요.");
		    return;
		}
		
		if(reviewContent==""){
			alert("내용을 입력해주세요.");
			return;
		}

	
		if (result) {

			
			var request = new XMLHttpRequest(); // request 변수를 선언

			request
					.open(
							"POST",
							"http://localhost/theater_prj/UpdateReviewServlet",
							true);
			request.setRequestHeader("Content-Type",
					"application/x-www-form-urlencoded; charset=UTF-8");

			// 에러 핸들링
			request.onerror = function() {
				alert("요청을 보낼 때 오류가 발생했습니다.");
			};

			request.onreadystatechange = function() {
				if (request.readyState == 4) {
					if (request.status == 200) {
						 // 응답을 받으면 처리
			            var jsonResponse = request.responseText;
			            var responseObject = JSON.parse(jsonResponse);
			            if (responseObject.success) {

			                alert("리뷰가 성공적으로 수정되었습니다.");
			                myReview();
			                

			            } else {
			                alert("리뷰수정에 실패했습니다.");
			                return;
			            }//end else
					} else {
						alert("문제가 발생했습니다.");
					}
				}
			};

			// POST 요청의 파라미터를 설정하여 보냄
			request.send(
		    		"reviewNumber=" + encodeURIComponent(reviewNumber)
		    		+ "&reviewContent=" + encodeURIComponent(reviewContent)
		    		+ "&reviewScore=" + encodeURIComponent(reviewScore)
		    		)
		    		
					
			
			
			
		
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
		}
		
	
	}
	
	
	function deleteReview(reviewNumber){//리뷰 삭제

		//alert(reviewNumber);

		var result = confirm("리뷰를 삭제하시겠습니까?");
		if (result) {
		    

		    
			
			var request = new XMLHttpRequest(); // request 변수를 선언

			request
					.open(
							"POST",
							"http://localhost/theater_prj/DeleteReviewServlet",
							true);
			request.setRequestHeader("Content-Type",
					"application/x-www-form-urlencoded; charset=UTF-8");

			// 에러 핸들링
			request.onerror = function() {
				alert("요청을 보낼 때 오류가 발생했습니다.");
			};

			request.onreadystatechange = function() {
				if (request.readyState == 4) {
					if (request.status == 200) {
						 // 응답을 받으면 처리
			            var jsonResponse = request.responseText;
			            var responseObject = JSON.parse(jsonResponse);
			            if (responseObject.success) {

			                alert("리뷰가 성공적으로 삭제되었습니다.");
			                myReview();
			                

			            } else {
			                alert("리뷰삭제에 실패했습니다.");
			                return;
			            }//end else
					} else {
						alert("문제가 발생했습니다.");
					}
				}
			};

			// POST 요청의 파라미터를 설정하여 보냄
			request.send("reviewNumber=" + encodeURIComponent(reviewNumber));
		    
		    
		    
	
		    
		}

		

	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	//리뷰 작성
function writeReview(movieTitle, reservationNumber, movieCode, moviePosterPath) {

    
    var year = new Date().getFullYear();
    var month = ("0" + (new Date().getMonth() + 1)).slice(-2); // 월을 두 자리로 표현
    var day = ("0" + new Date().getDate()).slice(-2); // 날짜를 두 자리로 표현

    var today = year + '-' + month + '-' + day;

    // 기존에 있는 내용을 삭제
    $(".right-div").empty();

    // 리뷰작성 디자인
    var insertFormHTML = 
        '<div class="update-container">' +
            '<div class="sub-container">' +
                '<div class="reviewInfo">' +
                    '<div class="postBox" style="width: 150px; height: 170px;">' +
                        '<div style="width: 130px; height: 150px; margin-left:15px;">' +
                        '<img src="../images/movie/' + moviePosterPath + '" alt="영화 포스터" style="width: 130px; height: 150px; margin-top:10px;">' +
                        '</div>' +
                    '</div>' +
                    '<div class="infoBox" style="width: 484px; height: 170px;">' +
                        '<div class="movieTitle" style="width: 484px; height: 50px; margin-top:10px;">' +
                            '<div id="movieTitle" style="width: 470px; margin-left:5px; margin-top:10px; font-size: 20px; font-weight: bold;">' + movieTitle + '</div>' +
                        '</div>' +
                        '<div class="reviewDate" style="width: 484px; height: 50px;">' +
                            '<div id="reviewInputDate" style="width: 200px; margin-left:5px; margin-top:10px; font-size: 20px; font-weight: bold;">' + today + '</div>' +
                        '</div>' +
                        '<div class="Rating" style="width: 484px; height: 50px;">' +
                            '<div style="width: 70px; height: 40px;">' +
                                '<div style="width: 70px;">' +
                                    '<div id="reviewRating" style="margin-left:10px; margin-top:10px; font-size: 24px; font-weight: bold;"> 별점 : </div>' +
                                '</div>' +
                            '</div>' +
                            '<div style="margin-left:5px; margin-top:5px;">' +
                                '<select style="display: inline-block; width: 200px; height: 40px;" class="form-select" id="starScore">' +
                                    '<option selected="selected">별점 선택</option>' +
                                    '<% for (int i = 1; i <= 5; i++) { %>' +
                                        '<option value="<%=i%>">' +
                                            '<% for (int j = 0; j < i; j++) { %>' +
                                                '⭐' +
                                            '<% } %>' +
                                        '</option>' +
                                    '<% } %>' +
                                '</select>' +
                            '</div>' +
                        '</div>' +
                    '</div>' +
                '</div>' +
                '<div class="reviewContent">' +
                    '<div style="margin-left: 15px;margin-top: 10px;">' +
                        '<textarea id="reviewContent" class="form-control"  name="reviewContent" style="width: 600px; height: 100px;"></textarea>' +
                    '</div>' +
                '</div>' +
                '<div class="buttonList" style="margin-left:auto; margin-right: 15px;">' +
                    '<div class="reviewButtons">' +
                        '<button type="button" class="btn btn-primary" style="width: 80px; height: 50px; margin-right: 10px;" onclick="insertReview(\''  + reservationNumber +  '\', \'' + movieCode  + '\')">등록</button>' +
                        '<button type="button" class="btn btn-secondary" style="width: 80px; height: 50px;" onclick="myReview()">취소</button>' +
                    '</div>' +
                '</div>' +
            '</div>' +
        '</div>';

    $(".right-div").append(insertFormHTML);
}


function insertReview(reservationNumber,movieCode) {//리뷰등록메서드

	var reviewContent = $("#reviewContent").val();
	var starScore = $("#starScore").val();
	
	if (isNaN(starScore)) {
	    alert("별점을 선택해주세요.");
	    return;
	}
	
	if(reviewContent==""){
		alert("내용을 입력해주세요.");
		return;
	}
	
	
	

    var request = new XMLHttpRequest(); // request 변수를 선언

    request.open(
        "POST",
        "http://localhost/theater_prj/InsertReviewServlet",
        true
    );
    request.setRequestHeader(
        "Content-Type",
        "application/x-www-form-urlencoded; charset=UTF-8"
    );

    // 에러 핸들링
    request.onerror = function() {
        alert("요청을 보낼 때 오류가 발생했습니다.");
    };

    request.onreadystatechange = function() {
    	var responseObject = JSON.parse(request.responseText);
        if (request.readyState == 4) {
            if (request.status == 200) {
				
            	if (responseObject.success) {
				alert("리뷰 등록을 완료했습니다.");
				myReview();
            	}else{
				alert("리뷰 등록을 실패했습니다.")
            	}

            } else {
                alert("문제발생.");
            }
        }
    };

    // POST 요청의 파라미터를 설정하여 보냄
    request.send(
    		"reservationNumber=" + encodeURIComponent(reservationNumber)
    		+ "&reviewContent=" + encodeURIComponent(reviewContent)
    		+ "&starScore=" + encodeURIComponent(starScore)
    		+ "&movieCode=" + encodeURIComponent(movieCode));
    
    
    
    
    
    
    
}

	
	
	
	
	
	










function selectReservation() {
	$(".right-div").empty();
    var id = "<%=userId%>";
    
    var request = new XMLHttpRequest(); // request 변수를 선언

    request.open(
        "POST",
        "http://localhost/theater_prj/SelectReservationServlet",
        true
    );
    request.setRequestHeader(
        "Content-Type",
        "application/x-www-form-urlencoded; charset=UTF-8"
    );

    // 에러 핸들링
    request.onerror = function() {
        alert("요청을 보낼 때 오류가 발생했습니다.");
    };

    request.onreadystatechange = function() {
        if (request.readyState == 4) {
            if (request.status == 200) {
                // 응답을 받으면 처리
                var jsonResponse = request.responseText;
                var responseObject = JSON.parse(jsonResponse);
			
                
                if (responseObject.success) {

                    // 예매 내역을 담을 변수
                    var reservationHTML = '';

                    // 예매 내역 데이터
                    var reservationData = responseObject.result;
                    
                    
                    if (reservationData.length > 0) {
                    
                  

                    // 예매 내역 데이터를 reservationNumber를 기준으로 그룹화
                    var groupedReservations = {};
                    reservationData.forEach(function (reservation) {
                        if (!groupedReservations.hasOwnProperty(reservation.reservationNumber)) {
                            groupedReservations[reservation.reservationNumber] = [];
                        }
                        groupedReservations[reservation.reservationNumber].push(reservation);
                    });

                    // 각 그룹별로 예매 내역 HTML 생성
                    Object.keys(groupedReservations).forEach(function (reservationNumber) {
                        var groupedReservation = groupedReservations[reservationNumber][0]; // 그룹 내 첫 번째 예매 내역 사용

                        var seatNumbersCombined = groupedReservations[reservationNumber].map(function (reservation) {
                            return reservation.seatLownumber  + reservation.seatColnumber;
                        }).join(', '); // seatNumbers 결합

                        // 문자열 연결 연산자를 사용하여 HTML 조립
                        reservationHTML += 
                            '<div class="container mt-5">' +
                                '<div class="card">' +
                                    '<div class="card-body">' +
                                        '<div class="row" >' +
                                       
                                            '<div class="col col-3">' +
                                                '<p style="margin-top: 5px;"><strong>예매번호  </strong></p>' +
                                                '<div>' + groupedReservation.reservationNumber + '</div>' +
                                                '<p style="margin-top: 5px;"><strong>결제날짜  </strong></p>' +
                                                '<div>' + groupedReservation.reservationDate + '</div>' +
                                            '</div>' +
                                            '<div class="col-4">' +
                                                '<div class="d-flex justify-content-center justify-content-md-start">' +
                                                    '<div class="aaaa">' +
                                                    '<img src="../images/movie/' + groupedReservation.moviePosterPath + '" alt="영화 포스터" width="160" height="160">' +
                                                    '</div>' +
                                                '</div>' +
                                            '</div>' +
                                            '<div class="col">' +
                                                '<p style="margin-top: 5px;"><strong>영화제목  </strong></p>' +
                                                '<div> ' + groupedReservation.movieTitle + '</div>' +
                                                '<p style="margin-top: 5px;"><strong>관람극장  </strong></p>' +
                                                '<div> ' + groupedReservation.theaterName + '</div>' +
                                                '<p style="margin-top: 5px;"><strong>관람일시  </strong></p>' +
                                                '<div> ' + groupedReservation.screeningDate + '</div>' +
                                                '<p style="margin-top: 5px;"><strong>관람좌석  </strong></p>' +
                                                '<div> ' + seatNumbersCombined + '</div>' +
                                            '</div>' +
                                        '</div>' +
                                        '<div class="row">' +
                                     // selectReservation 함수 내에서 예매내역을 생성하는 부분 수정
                                        '<div class="col text-end">' +
                                            '<p style="margin-top: 20px;"><strong>총 결제금액    : </strong></p>' +
                                        '</div>' +
                                        '<div  style="margin-top: 15px;" class="col text-start">' +
                                            '<strong style="font-size: 20px ;">' + groupedReservation.totalPrice +'원'+ '</strong>' +
                                        '</div>' +
                                        '<div class="col text-end">' +
                                            '<button type="button" class="btn btn-info float-end" onclick="reservationDetail(\'' + groupedReservation.reservationNumber + '\')">상세보기</button>' +
                                        '</div>' +
                                        '</div>' +
                                    '</div>' +
                                '</div>' +
                            '</div>';
                    });

                   
                    
                    
                    
                    
                    
                    }//end if
                    
                    
                    
                    
                    
                    
                }else{
                	reservationHTML = 
                		'<img src="../images/myPage/noReservation.png" style="width: 330px; height: 330px; margin-left:100px;">'
                
                }//end else
                
                // 생성된 예매 내역 HTML을 .right-div 요소에 삽입
                $(".right-div").html(reservationHTML);
			
                  
                
            } else {
                alert("문제발생.");
            }
        }
    };

    // POST 요청의 파라미터를 설정하여 보냄
    request.send("id=" + encodeURIComponent(id));
}//end selectReservation








//예약 상세 조회
function reservationDetail(reservationNumber) {
    var request = new XMLHttpRequest(); // request 변수를 선언

    request.open(
        "POST",
        "http://localhost/theater_prj/SelectReservationDetailServlet",
        true
    );
    request.setRequestHeader(
        "Content-Type",
        "application/x-www-form-urlencoded; charset=UTF-8"
    );

    // 에러 핸들링
    request.onerror = function() {
        alert("요청을 보낼 때 오류가 발생했습니다.");
    };

    request.onreadystatechange = function() {
        if (request.readyState == 4) {
            if (request.status == 200) {
                // 응답을 받으면 처리
                var jsonResponse = request.responseText;
                var responseObject = JSON.parse(jsonResponse);
                
                if (responseObject.success) {
                    // 예약 내역을 담을 변수
                    var reservationHTML = '';

                    // 예매 내역 데이터
                    var reservationData = responseObject.result;

                    // 예매 내역 데이터를 reservationNumber를 기준으로 그룹화
                    var groupedReservations = {};
                    reservationData.forEach(function (reservation) {
                        if (!groupedReservations.hasOwnProperty(reservation.reservationNumber)) {
                            groupedReservations[reservation.reservationNumber] = [];
                        }
                        groupedReservations[reservation.reservationNumber].push(reservation);
                    });

                 // 각 그룹별로 예매 내역 HTML 생성
                    Object.keys(groupedReservations).forEach(function (reservationNumber) {
                        var groupedReservation = groupedReservations[reservationNumber][0]; // 그룹 내 첫 번째 예매 내역 사용

                        var seatNumbersCombined = groupedReservations[reservationNumber].map(function (reservation) {
                            return reservation.seatLownumber + reservation.seatColnumber;
                        }).join(', '); // seatNumbers 결합

                        // 예매 내역 HTML 생성
                        var html = '<div class="container2">' +
                            '<div class="top-section">' +
                            '<div>예매 내역</div>' +
                            '</div>' +
                            '<div class="bottom-section">' +
                            '<div class="left-div">' +
                            '<div class="image-div">' +
                            '<img src="../images/movie/' + groupedReservation.moviePosterPath + '" alt="이미지_설명" style="width:150px">' +
                            '</div>' +
                            '</div>' +
                            '<div class="middle-div">' +
                            '<div class="inner-div">' +
                            '<div class="dynamic-value">' +
                            '<p>예매번호 : <span id="booking-number">' + groupedReservation.reservationNumber + '</span></p>' +
                            '</div>' +
                            '<div class="dynamic-value">' +
                            '<p>영화명 : <span id="movie-title">' + groupedReservation.movieTitle + '</span></p>' +
                            '</div>' +
                            '<div class="dynamic-value">' +
                            '<p>극장 : <span id="theater">' + groupedReservation.theaterName + '</span></p>' +
                            '</div>' +
                            '<div class="dynamic-value">' +
                            '<p>상영관 : <span id="theater-room">' + groupedReservation.theaterNumber + '</span></p>' +
                            '</div>' +
                            '<div class="dynamic-value">' +
                            '<p>일시 : <span id="datetime">' + groupedReservation.screeningDate + ' ' + groupedReservation.screeningTime + '</span></p>' +
                            '</div>' +
                            '<div class="dynamic-value">' +
                            '<p>인원 : <span id="people">' + groupedReservations[reservationNumber].length + '명</span></p>' +
                            '</div>' +
                            '<div class="dynamic-value">' +
                            '<p>좌석 : <span id="seats">' + seatNumbersCombined + '</span></p>' +
                            '</div>' +
                            '<div class="dynamic-value">' +
                            '<p>결제금액 : <span id="payment-amount">' + groupedReservation.totalPrice + '</span></p>' +
                            '</div>' +
                            '<div class="dynamic-value">' +
                            '<p>결제수단 : <span id="payment-method">' + groupedReservation.paymentMethod + '</span></p>' +
                            '</div>' +
                            '</div>' +
                            '</div>' +
                            '</div>' +
                            '<div class="buttom-section">' +
                            '<div class="bottom-div">' +
                            '<div class="bottom-div d-flex justify-content-center">' +
                            '<button type="button" class="btn btn-danger mx-2" onclick="checkReservationTime(\'' + groupedReservation.reservationNumber + '\')">예매취소</button>' +
                            '<button type="button" onclick="selectReservation()" class="btn btn-secondary mx-2">목록으로</button>' +
                            '</div>' +
                            '</div>' +
                            '</div>' +
                            '</div>';
                        reservationHTML += html;
                    });

                    // 생성된 예매 내역 HTML을 .right-div 요소에 삽입
                    $(".right-div").html(reservationHTML);
                } else {
                    alert("예약 상세 정보를 불러오는 데 실패했습니다.");
                }
            } else {
                alert("서버 오류로 인해 예약 상세 정보를 불러오지 못했습니다.");
            }
        }
    };

    // POST 요청의 파라미터를 설정하여 보냄
    request.send("reservationNumber=" + encodeURIComponent(reservationNumber));
}//reservationDetail





function checkReservationTime(reservationNumber){


	  // 알림창 생성
	  var confirmation = confirm("정말 취소하시겠습니까?\n신용카드 결제내역의 경우\n3~5 영업일 이내에 환불됩니다.");

	  // 확인 버튼이 눌렸을 때
	  if (confirmation) {//확인버튼 == 취소신청

			var request = new XMLHttpRequest(); // request 변수를 선언

			request
					.open(
							"POST",
							"http://localhost/theater_prj/CheckReservationTimeServlet",
							true);
			request.setRequestHeader("Content-Type",
					"application/x-www-form-urlencoded; charset=UTF-8");

			// 에러 핸들링
			request.onerror = function() {
				alert("요청을 보낼 때 오류가 발생했습니다.");
			};

			request.onreadystatechange = function() {
				if (request.readyState == 4) {
					if (request.status == 200) {
						 // 응답을 받으면 처리
			            var jsonResponse = request.responseText;
			            var responseObject = JSON.parse(jsonResponse);
			            if (responseObject.success) {

			                //취소메서드 있는곳
			            	deleteReservation(reservationNumber);
			                

			            } else {
			                alert("상영이 이미 시작된 영화는 예매를 취소할 수 없습니다.");
			                return;
			            }//end else
					} else {
						alert("문제가 발생했습니다.");
					}
				}
			};

			// POST 요청의 파라미터를 설정하여 보냄
			request.send("reservationNumber=" + encodeURIComponent(reservationNumber));


	  }
}//checkReservationTime



function deleteReservation(reservationNumber) {


    var request = new XMLHttpRequest();

    request.open(
        "POST",
        "http://localhost/theater_prj/DeleteReservationServlet",
        true
    );
    request.setRequestHeader(
        "Content-Type",
        "application/x-www-form-urlencoded; charset=UTF-8"
    );

    request.onerror = function() {
        alert("요청을 보낼 때 오류가 발생했습니다.");
    };

    request.onreadystatechange = function() {
        if (request.readyState == 4) {
            if (request.status == 200) {
                var jsonResponse = request.responseText;
                var responseObject = JSON.parse(jsonResponse);
                if (responseObject.success) {
                    alert("예매가 성공적으로 취소되었습니다.");
                    selectReservation();
                } else {
                    alert("예매 취소를 실패하였습니다.");
                }
            } else {
                alert("문제가 발생했습니다.");
            }
        }
    };

    request.send("reservationNumber=" + encodeURIComponent(reservationNumber));
}
















function handleKeyPress(event) {
    // 브라우저에 따라 이벤트 코드가 다르므로, 이벤트 코드를 통해 엔터 키를 감지합니다.
    var keycode = (event.keyCode ? event.keyCode : event.which);
    if (keycode == '13') { // 엔터 키의 키코드는 13입니다.
        event.preventDefault(); // 기본 동작 중단
        // 엔터 키가 눌렸을 때 checkNull() 함수 호출
        checkNull();
    }
}




function checkNull(){//비밀번호 확인 유효성 검사

    // 입력된 비밀번호 가져오기
    var currentPassword = $("#currentPassword").val();
    
  	//비밀번호 미입력시 return
    if (!currentPassword) {
	
        alert("비밀번호를 입력해주세요.");
        
        return;
	}
  	
    checkPassword(currentPassword);


}




function showMyInformation() {
    $(".right-div").empty();

    var userInformationHTML = `
        <div class="box-contents newtype">
            <div class="user-information-box">
                <table class="table table-striped">
                    <tr>
                        <td><span>아이디:</span></td>
                        <td><strong><%=session.getAttribute("id")%></strong></td>
                    </tr>
                    <tr>
                        <td><span>이름:</span></td>
                        <td><strong><%=session.getAttribute("userName")%></strong></td>
                    </tr>
                    <tr>
                        <td><span>생년월일:</span></td>
                        <td><strong><%=session.getAttribute("userBirthDay")%></strong></td>
                    </tr>
                    <tr>
                        <td><span>비밀번호:</span></td>
                        <td>
                            <button type="button" id="changePasswordButton" onclick="changePWWin()" class="btn btn-primary">비밀번호 변경</button>
                        </td>
                    </tr>
                </table>
            </div>
        </div>`;

    $(".right-div").html(userInformationHTML);
}








function checkPassword(currentPassword) {//비밀번호 확인 메서드

	
	
	var id = "<%=userId%>" ;
	var password = currentPassword;


	//alert("id : "+id + "pw : "+password);
		
		var request = new XMLHttpRequest(); // request 변수를 선언

		request
				.open(
						"POST",
						"http://localhost/theater_prj/CheckPasswordServlet",
						true);
		request.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded; charset=UTF-8");

		// 에러 핸들링
		request.onerror = function() {
			alert("요청을 보낼 때 오류가 발생했습니다.");
		};

		request.onreadystatechange = function() {
			if (request.readyState == 4) {
				if (request.status == 200) {
					 // 응답을 받으면 처리
		            var jsonResponse = request.responseText;
		            var responseObject = JSON.parse(jsonResponse);
		            if (responseObject.success) {
		                alert("비밀번호가 일치합니다.");
		                showMyInformation(); // 비밀번호가 일치할 때 실행할 함수 호출
		            } else {
		                alert("비밀번호가 일치하지 않습니다.");
		            }//end else
				} else {
					alert("비밀번호 확인중 문제가 발생했습니다.");
				}
			}
		};

		// POST 요청의 파라미터를 설정하여 보냄
		request.send("id=" + encodeURIComponent(id) + "&password=" + encodeURIComponent(password));


	

}//checkPassword








function changePWWin() {
    // 자식 창이 열릴 때 부모 창을 모달로 만듭니다.
    var parentWindow = window;
    var childWindow = window.open('changePWForm.jsp', 'changePWForm', 
        'width=472, height=340, top=' + (window.screenY + 100) + ', left=' + (window.screenX + 100)+', resizable=false');	
    

    
    // 자식 창이 닫힐 때 부모 창을 클릭 가능하도록 만듭니다.
    var checkChildInterval = setInterval(function() {
        if (childWindow.closed) {
            clearInterval(checkChildInterval); // Interval 종료
            parentWindow.focus(); // 부모 창을 활성화
        }
    }, 1000);
} //changePWForm.jsp



</script>





</head>
<body>


	<!-- S Header -->
	<jsp:include page="header.jsp"></jsp:include>
	<!-- E Header -->




	<!-- S 로그인 세션 확인  -->
	<%
	// 세션에서 로그인 여부 확인
	String id = (String) session.getAttribute("id");
	if (id == null) {// 로그인되지 않은 경우 로그인 페이지로 리디렉션
	%>
	<script type="text/javascript">
    window.location.href = "login.jsp?prevPage=myPage.jsp";
    </script>
	<%
	}
	%>
	<!-- E 로그인 세션 확인  -->


	<!-- Contaniner -->
	<div id="contaniner" class="">
		<!-- 벽돌 배경이미지 사용 시 class="bg-bricks" 적용 / 배경이미지가 없을 경우 class 삭제  -->


		<!-- Contents Area -->
		<div id="contents" class="">


			<!-- Contents Start -->

			<div class="sect-common">
				<div class="mycgv-info-wrap">
					<div class="side-menu">

						<div class="left-div">
							<div class="cols-content" id="menu">
								<div class="col-aside">

									<h2>MY CGV 서브메뉴</h2>
									<div class="snb">
										<ul>
											<li class="on"><a title="현재 선택">MY 띵화관<i></i></a></li>
											<li><a>나의 예매내역 <i></i></a></li>
											<li><a>내가 본 영화 <i></i></a></li>
											<li><a>개인 정보 변경 <i></i></a></li>
										</ul>

									</div>
								</div>

							</div>

						</div>

						<div class="right-div">마이페이지에 추가할거 추천받아엽;;;</div>



					

					</div>
				</div>




			</div>


			<!--/ Contents End -->
		</div>
		<!-- /Contents Area -->
	</div>
	<!-- E Contaniner -->

	<!-- S Footer -->
	<jsp:include page="footer.jsp"></jsp:include>
	<!-- E Footer -->



</body>
</html>
