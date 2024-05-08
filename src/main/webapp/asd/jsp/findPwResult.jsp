<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 확인</title>
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

.findPwResultBtn button {
	width: 150px;
    height: 50px;
    font-size: 18px; /* 버튼 안의 폰트 크기 */
}


</style>


<script>
function closePopupAndRedirect() {
    // 팝업 창 닫기
    window.close();
    
    // 부모창으로부터 자식창으로의 접근
    window.opener.location.href = 'login.jsp';
}
</script>


</head>
<body>
<div class="wrap">
	<div class="title">
		<h2>비밀번호 확인</h2>
	</div>
	
	<form>
		<div class="wrap_findPwResult">
			<label>누구님의 임시 비밀번호 발급이 완료되었습니다.</label>
			<hr>
			<div class="findPwResultLabel">
				<label class="labelId" id="labelId1">일단 누구님의 임시 비밀번호는</label><br>
				<label class="labelId" id="labelId2">nuguseyo 입니다.</label><br>
			</div>
			<div class="findPwResultBtn">
				<button type="button" class="btn btn-secondary" onclick="closePopupAndRedirect()">로그인</button>
			</div>
		</div>
	</form>
</div>
</body>
</html>