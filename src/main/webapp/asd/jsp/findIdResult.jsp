<%@page import="admin.UserVO"%>
<%@page import="admin.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 확인</title>
<link rel="icon" href="http://192.168.10.230/jsp_prj/common/favicon.ico"/>
<!--bootstrap 시작-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<!--bootstrap 끝-->
<!--sist스타일시트 시작--> 
<link rel="stylesheet" href="http://192.168.10.230/jsp_prj/common/css/main.css" type="text/css" media="all" /> 
<link rel="stylesheet" href="http://192.168.10.230/jsp_prj/common/css/board.css" type="text/css" media="all" /> 
<!--sist스타일시트 끝-->

<!--jQuery CDN 시작-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!--jQuery CDN 끝-->

<style type="text/css">

.wrap {
    text-align: center; /* 가운데 정렬 */
    margin-top: 5%;
}

.labelId {
    font-size: 30px;
}

#labelId1{
	margin-top: 5%;
}

#labelId2{
    margin-bottom: 5%;
}

.findResultBtn button {
    font-size: 18px; /* 버튼 안의 폰트 크기 */
}

.findResultBtn button {
    width: 150px;
    height: 50px;
    margin-right: 10px; /* 버튼 사이의 오른쪽 여백 */
}

.findResultBtn button:last-child {
    margin-right: 0; /* 마지막 버튼의 오른쪽 여백 제거 */
}
  

</style>

<script type="text/javascript">

//팝업 창 닫고 비밀번호 찾기 화면으로
function closePopupAndMoveFindPw() {
    // 팝업 창 닫기
    window.close();
    
    // 부모창으로부터 자식창으로의 접근
    window.opener.location.href = 'findPw.jsp';
}

//팝업 창 닫고 로그인 화면으로
function closePopupAndMoveLogin() {
    window.close();
    window.opener.location.href = 'login.jsp';
}

//팝업 창 닫고 다시 아이디찾기 화면으로
function closePopupAndReturn() {
    window.close();
    window.opener.location.href = 'findId.jsp';
}

</script>

</head>
<body>

<div class="wrap">
	<div>
		<%
		request.setCharacterEncoding("UTF-8");
		%>
		<jsp:useBean id="uVO" class="admin.UserVO" scope="page" />
		<jsp:setProperty property="*" name="uVO" />

		<c:catch var="e">
		
		<%
		//DB Table 추가
		UserDAO uDAO = UserDAO.getInstance();
		
		String existingUserId = uDAO.selectUserId((uVO));
		

		if(existingUserId == null || existingUserId.equals("")) {
		%>
		<div class="title">
			<h2 style="font-weight: bold;">아이디 확인</h2>
		</div>
	
			<div class="wrap_findIdResult">
				<hr>
				<label style="font-size: 20px; font-weight: bold; color: red; margin-top: 70px;">입력하신 정보와 일치하는 아이디가 없습니다.</label>
				<div class="returnBtn">
					<button type="button" class="btn btn-primary btn-lg" onclick="closePopupAndReturn()" style="margin-top: 80px;">돌아가기</button>
				</div>
			</div>
		<% } else { %>
		
		
	<div class="title">
		<h2 style="font-weight: bold;">아이디 확인</h2>
	</div>
	
		<div class="wrap_findIdResult">
			<label>입력하신 정보와 일치하는 아이디는 다음과 같습니다.</label>
			<hr>
			<div class="findResultLabel">
				<label class="labelId" id="labelId1"><strong>${param.userName}</strong>님의 아이디는</label><br>
				<label class="labelId" id="labelId2"><strong><%=uDAO.selectUserId(uVO) %></strong>입니다.</label><br>
			</div>
			<div class="findResultBtn">
				<button type="button" class="btn btn-primary" onclick="closePopupAndMoveFindPw()">비밀번호 찾기</button>
				<button type="button" class="btn btn-secondary" onclick="closePopupAndMoveLogin()">로그인</button>
			</div>
		</div>
		
		<%
		}
		%>
		
		</c:catch>
				<!-- 에러상황 테스트 
		<c:set var="errorOccurred" value="${1/0}" />
		-->
		<c:if test="${ not empty e }">
			<!-- 다양한 경우의 문제의 에러상황 -->
			<div id="resultFailContent" style="display: flex; flex-direction: column; align-items: center;">
				<h2 style="font-size: 25px; font-weight: bold; margin-bottom: 50px; margin-top: 100px; color: red">
					죄송합니다. 잠시 후 다시 시도해주세요.<br />
				</h2>
				<div style="display: flex; flex-direction: row; margin-bottom: 80px;">
					<a href="index.jsp" class="btn btn-danger btn-lg" style="margin-right: 10px;">메인으로</a>
					<button class="btn btn-primary btn-lg" onclick="history.back()">뒤로</button>
				</div>
			</div>
		</c:if>

	</div>
</div>
</body>
</html>