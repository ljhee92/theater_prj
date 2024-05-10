
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info="마이페이지"%>

<!DOCTYPE html>
<html>
<head>

<link rel="icon" href="http://192.168.10.227/jsp_prj/common/favicon.ico" />
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
	href="http://192.168.10.227/jsp_prj/common/css/main.css">
<link rel="stylesheet"
	href="http://192.168.10.227/jsp_prj/common/css/board.css">
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
	background-color: #eacacb;
}

.right-div {
	width: 629px;
	height: 340px;
	float: left;
	background-color: white;
	overflow-y: auto; /* 세로 스크롤이 필요한 경우에만 스크롤이 표시됩니다. */
	max-height: 500px; /* 최대 높이를 설정하여 스크롤이 필요한 경우만 스크롤이 표시됩니다. */
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
        alert("선택된 메뉴: " + menuText);
        
        
        

         
     // 만약 MY 띵화관 HOME 메뉴가 클릭되었다면
        if(menuText.trim() == "MY 띵화관"){
        	  $(".right-div").empty();
            // MY 띵화관 HOME 내용 추가
            var userInformationHTML = `

            

            마이페이지 메인
            
            
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
            // 내가 본 영화 내용 추가
            var userInformationHTML = `

            

            	내가 본 영화 메인
            
            
            `;
            $(".right-div").html(userInformationHTML);
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




function selectReservation() {
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
                                        	'<div class="col text-end" style="margin-top: 10px;">' +
                                    		    '<strong style="font-size: 20px;">총 결제금액 : </strong>' +
                                  		  '</div>' +
                                  		  	'<div class="col text-start" style="margin-top: 10px;">' +
                                 			   '<strong style="font-size: 20px ;">' + groupedReservation.totalPrice + '</strong>' +
                                		'</div>' +
                                		'<div class="col text-end">' +
                                				'<button type="button" class="btn btn-info float-end">예매 취소</button>' +
                            				'</div>' +
                                        '</div>' +
                                    '</div>' +
                                '</div>' +
                            '</div>';
                    });

                    // 생성된 예매 내역 HTML을 .right-div 요소에 삽입
                    $(".right-div").html(reservationHTML);
                }
			
                  
                
            } else {
                alert("문제발생.");
            }
        }
    };

    // POST 요청의 파라미터를 설정하여 보냄
    request.send("id=" + encodeURIComponent(id));
}//end selectReservation
































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

						<div class="right-div">마이페이지 메인</div>














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
