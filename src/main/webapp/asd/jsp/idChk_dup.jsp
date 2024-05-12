<%@page import="admin.UserDAO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 검사</title>
<!--bootstrap 시작-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<!--bootstrap 끝-->

<!-- sist스타일시트 -->
<link rel="stylesheet" href="https://www.sist.co.kr/css/main.css" type="text/css" media="all" />
<link rel="stylesheet" href="https://www.sist.co.kr/css/board.css" type="text/css" media="all" />
<!-- sist스타일시트 -->

<style type="text/css">

html{
     /* 웹페이지 드래그 및 커서 깜빡임 방지 */
     -ms-user-select: none;
     -moz-user-select: -moz-none;
     -webkit-user-select: none;
     -khtml-user-select: none;
     user-select: none;
}

#idWrap {
    width: 468px; 
    height: 300px; 
    margin: 0 auto;
    position: relative; /* 부모 요소를 상대 위치로 설정 */
    display: flex;
    align-items: center; /* 수직 가운데 정렬 */
    justify-content: center; /* 수평 가운데 정렬 */
}

#inputWrap, #idChkTitleLabel, #idChkSubTitleLabel { 
    display: flex;
    flex-direction: row;
    align-items: center;
    justify-content: center; /* 수평 가운데 정렬 */
    text-align: center; /* 자식 요소를 수평 가운데 정렬 */
}
	
#userId, #btn {
    margin-right: 10px; /* 필요에 따라 간격 조절 */
    }
    
#dupResult{
	position: absolute;
	top: 280px;
	left: 50%;
    transform: translateX(-50%);
    white-space: nowrap; /* 텍스트가 한 줄로만 표시되도록 설정 */
	}
	
	
</style>
<script type="text/javascript">
	window.onload=function() {
		document.getElementById("btn").addEventListener("click", idNullChk); //버튼 클릭
		document.getElementById("userId").addEventListener("keydown", isEnter);
	}
	
	function isEnter( evt ) {
		if(evt.which == 13) { //엔터일 때
			idNullChk();
		}//end if
	}//isEndter
	
	
	function idNullChk() {
		var obj = document.subFrm;
		var userId = obj.userId.value;
		
		//if(userId.trim() == "") {
		if(userId.replace(/ /g,"") == "") {
			alert("중복확인할 아이디를 입력해주세요.");
			obj.userId.value="";
			obj.userId.focus();
			return;
		}//end if
		
		obj.submit();
	}//isNullchk
	
	
	function sendId(userId) {
		//2. 현재창에 입력된 id를 얻어와서 부모창(opener)에 전달
		//opener.window.document.frm.id.value=document.subFrm.id.value;
		opener.window.document.getElementById("userId").value=userId;
		//3. 자식창을 닫는다.
		self.close();
	}//sendId
	
	
</script>
</head>
<body>
<%
	//웹 파라미터를 받는다.
	String userId = request.getParameter("userId");
	boolean flag = false;

	if(userId!= null) { //parameter가 존재하면
		//DB에서 id를 검색한다.
		UserDAO uDAO = UserDAO.getInstance();
		try {
			String returnId = uDAO.selectDupId(userId);
			flag = !"".equals(returnId); 
			pageContext.setAttribute("flag", flag);
			
		} catch(SQLException se) {
			se.printStackTrace();
		}//end try
		
	}//end if
%>
<div id="idWrap">
	<div id="idChkDuoWrap">
		<div id="idChkTitleLabel">
			<label style="font-size: 30px; font-weight: bold; margin-bottom: 20px;">아이디 중복 확인</label>
		</div>
		<div id="idChkSubTitleLabel">
			<label style="text-align: center; margin-bottom: 20px;">
				사용하고자 하는 아이디를 입력해 주세요.<br>
				아이디 중복 확인 후 [사용]을 선택하시면 됩니다.
			</label>
		</div>
	<div id="inputWrap">
	<form name="subFrm"><!--  103,186 -->
	<!-- web browser에서 키 입력이 가능한 HTML Form Control이 하나인 경우
		엔터를 치면 자동으로 submit이 된다. (자바스크립트에서 유효성검증을 실패하더라도 submit이 된다
		이것을 막기 위해서 키 입력이 가능한 HTML Form Control을 하나 더 정의하고 숨기면
		웹 브라우저에서는 키 입력이 가능한 폼 컨트롤이 두개라고 판단하여 enter키가 눌려도
		submit을 하지 않는다.
	 -->
		<div id="textAndBtn" style="display: flex; flex-direction: row; text-align: center;">
		<input type="text" name="userId" id="userId" value="${ param.userId }" class="form-control form-control-lg"/> 
		<input type="text" style="display: none;"/> <!-- 숨겨진 텍스트 필드로, 자동 submit을 방지하기 위해 추가됨 -->
		<input type="button" value="중복확인" id="btn" class="btn btn-primary btn-lg"/>
		</div>
	</form>
	</div>
	
	<div id="dupResult">
	<c:if test="${ not empty param.userId }">
		입력하신 <strong style="font-size: 20px"> [ <c:out value="${ param.userId }"/> ]</strong>는
		<c:choose>
			<c:when test="${ pageScope.flag }">
			사용 <strong style="font-size: 20px; color:red;">사용 불가능</strong> 합니다.
			</c:when>
			<c:otherwise>
			<strong style="font-size: 20px; color:blue;">사용 가능</strong> 합니다.&nbsp;&nbsp;<a href="#void" onclick="sendId('${ param.userId }')" style="font-size: 20px;">사용하기</a>
			</c:otherwise>
		</c:choose>
		</c:if>
	</div>
	</div>
</div>
</body>
</html>