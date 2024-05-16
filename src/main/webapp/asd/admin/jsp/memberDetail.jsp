<%@page import="admin.AdminReserveManageVO"%>
<%@page import="admin.AdminUserManageDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="admin.UserVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info = "명화관 관리자 회원관리" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>명화관 관리자 페이지</title>
<link rel="icon" href="http://localhost/theater_prj/asd/favicon.ico">
<!--bootstrap 시작-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<!--bootstrap 끝-->
<!--jQuery CDN 시작-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!--jQuery CDN 끝-->
<!-- Custom fonts for this template-->
<link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<!-- Custom styles for this template-->
<link href="../css/sb-admin-2.css" rel="stylesheet">
<style type="text/css">

#memberDetailContent {
    display: flex;
    justify-content: center; /* 수평 가운데 정렬 */
    align-items: center; /* 수직 가운데 정렬 */
    height: 30vh; /* 화면 전체 높이만큼 컨테이너를 채움 */
}

#buttons {
    display: flex;
    justify-content: center; /* 수평 가운데 정렬 */
}

.group {
    width: 30%;
    padding: 20px; /* 그룹 내부 요소 간격을 조정하기 위한 여백 설정 */
}

.col-auto {
	margin-bottom: 20px;
}


</style>
<script type="text/javascript">
$(document).ready(function() {
	document.getElementById("btnDelete").addEventListener("click", function() {
	    if (chkInputAll()) {
	        if(confirm("정말 삭제하시겠습니까?")){
	        	document.memberUpdateFrm.action = "updateUserDeleteFlag.jsp";
		        document.memberUpdateFrm.method = "post";
		        document.memberUpdateFrm.submit();
	        } else {
	            return;
	        }
	    }
	});

	document.getElementById("btnModify").addEventListener("click", function() {
	    var userName = document.memberUpdateFrm.userName.value;
	    var userBirthday = convertToDate(document.memberUpdateFrm.userBirthday.value);
	    var userPhone = document.memberUpdateFrm.userPhone.value;
	    if (chkInputAll()) {
	        document.memberUpdateFrm.action = "updateUserDetail.jsp";
	        document.memberUpdateFrm.method = "post";
	        document.memberUpdateFrm.submit();
	    }
	});
});




//모든 요소 필수 입력 함수
function chkInputAll() {
    let flagInputArrAll = true;
    let arrEssential = [$("#userName"), $("#userBirthday"), $("#userPhone")];
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
}//chkInputAll

function convertToDate(userBirthday) {
    var userBirthday = document.memberUpdateFrm.userBirthday.value;
    
    // 6자리 숫자로부터 연, 월, 일을 추출
    var year = userBirthday.substring(0, 2);
    var month = userBirthday.substring(2, 4);
    var day = userBirthday.substring(4, 6);

    // 현재 연도를 기준으로 2000년 이후와 2000년 이전의 구분
    var currentYear = new Date().getFullYear();
    var century = currentYear < 2000 ? "19" : "20";

    // YY 형식의 연도를 YYYY 형식으로 변환
    year = century + year;

    // 월과 일이 한 자리 숫자인 경우 앞에 0을 붙여줌
    if (month.charAt(0) === "0") {
        month = month.charAt(1);
    }
    if (day.charAt(0) === "0") {
        day = day.charAt(1);
    }

    // 월에 1을 더하여 올바른 월로 변환
    month = parseInt(month) + 1;

    // YYYY-MM-DD 형식으로 반환
    return year + "-" + month + "-" + day;
}


</script>
</head>
<body id="page-top">
    <!-- Page Wrapper -->
    <div id="wrapper">
        <%@ include file = "sidebar.jsp" %>
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">
            <!-- Main Content -->
            <div id="content">
                <%@ include file = "topbar.jsp" %>
                <!-- Begin Page Content -->
                <div class="container-fluid">
                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">회원관리</h1>
                    </div>
                </div>
                <!-- /.container-fluid -->
                <!-- 회원관리 밑 컨텐츠 -->
                <form name="memberUpdateFrm" id="memberUpdateFrm" method="post">
                <div id="memberDetailContent">
                
                <%
                    String userId = request.getParameter("userId");
                    AdminUserManageDAO aumDAO = AdminUserManageDAO.getInstance();
                    UserVO uVO = new UserVO();
                    	
                    uVO = aumDAO.selectUserDetail(userId);
                %>
                <!-- 그룹1 -->
                <div id="group1" class="group" style="margin-left: 100px;">
                	<!-- 회원 아이디 -->
					<div class="row g-3 align-items-center">
						<div class="col-auto">
							<label for="userId" class="col-form-label">회원 아이디</label>
						</div>
						<div class="col-auto">
							<input type="text" class="form-control" id="userId" name="userId" value=${ param.userId } readonly="readonly">
						</div>
					</div>
					
					<!-- 회원 이름 -->
					<div class="row g-3 align-items-center">
						<div class="col-auto">
							<label for="userName" class="col-form-label" style="margin-right: 52px;">이름</label>
						</div>
						<div class="col-auto">
							<input type="text" class="form-control" id="userName" name="userName" value=<%= uVO.getUserName() %>>
						</div>
					</div>
					
					<!-- 회원 생년월일 -->
					<div class="row g-3 align-items-center">
						<div class="col-auto">
							<label for="userBirthday" class="col-form-label" style="margin-right: 21px;">생년월일</label>
						</div>
						<div class="col-auto">
							<%
    							String rawBirthday = uVO.getUserBirthday();
    							// 생년월일 형식을 변경 (YYYY-MM-DD -> YYMMdd)
    							String formattedBirthday = rawBirthday.substring(2, 4) + rawBirthday.substring(5, 7) + rawBirthday.substring(8, 10);
							%>
							<input type="text" class="form-control" id="userBirthday" name="userBirthday" value="<%= formattedBirthday %>">
						</div>
					</div>
				</div>
				
				<!-- 그룹2 -->
                <div id="group2" class="group">
					<!-- 회원 전화번호 -->
					<div class="row g-3 align-items-center">
						<div class="col-auto">
							<label for="userPhone" class="col-form-label">전화번호</label>
						</div>
						<div class="col-auto">
							<input type="text" class="form-control" id="userPhone" name="userPhone" value=<%= uVO.getUserPhone() %>>
						</div>
					</div>
					
					<!-- 회원 가입일자 -->
					<div class="row g-3 align-items-center">
						<div class="col-auto">
							<label for="userInputDate" class="col-form-label">가입일자</label>
						</div>
						<div class="col-auto">
							<input type="text" class="form-control" id="userInputDate" name="userInputDate" readonly="readonly" value=<%= uVO.getUserInputDate() %>>
						</div>
					</div>
				</div>
				</div>
				</form>
				<form id="deleteUserForm" method="post">
					<input type="hidden" id="userIdToDelete" name="userIdToDelete"
						value="<%= userId %>">
					<input type="hidden" id="userId" name="userId" value="<%= userId %>">
					<input type="hidden" id="userName" name="userName" value="<%= uVO.getUserName() %>">
					<input type="hidden" id="userBirthday" name="userBirthday" value="<%= uVO.getUserBirthday() %>">
					<input type="hidden" id="userPhone" name="userPhone" value="<%= uVO.getUserPhone() %>">
				</form>

				<div id="buttons">
					<button type="button" class="btn btn-primary" id="btnModify" style="width: 130px; height: 50px; font-size : 20px;">수정완료</button>
					<button type="button" class="btn btn-danger" id="btnDelete" style="width: 130px; height: 50px; font-size : 20px; margin-left: 50px;">
					삭제</button>
				</div>
					
			</div>
            <!-- End of Main Content -->
            <%@ include file = "footer.jsp" %>
        </div>
        <!-- End of Content Wrapper -->
    </div>
    <!-- End of Page Wrapper -->
    <!-- Bootstrap core JavaScript-->
    <script src="../vendor/jquery/jquery.js"></script>
    <script src="../vendor/bootstrap/js/bootstrap.bundle.js"></script>
    <!-- Core plugin JavaScript-->
    <script src="../vendor/jquery-easing/jquery.easing.js"></script>
    <!-- Custom scripts for all pages-->
    <script src="./"></script>
</body>
</html>