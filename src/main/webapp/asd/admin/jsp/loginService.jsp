<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="admin.AdminLoginDao"%>
<%@ page import="admin.AdminVO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<style type="text/css">
</style>
<script type="text/javascript">
	$(function() {

	});//ready
</script>
</head>
<body>
	<div>
		<%
		String id = request.getParameter("inputId");
		String pw = request.getParameter("inputPassword");

		String prevPage = request.getParameter("prevPage");



		try {

			AdminLoginDao alDAO = AdminLoginDao.getInstance();
			AdminVO adminVO = new AdminVO(id, pw);
			AdminVO result = alDAO.adminLogin(adminVO);


			if (result != null) { // result가 null이 아니라면 로그인성공

				session.setAttribute("adminId", result.getAdminId());// 세션 설정
			%>
		<script type="text/javascript">

		var prevPage = "<%= prevPage %>";


            location.href=prevPage;

        </script>


			<%} else {%>

		<script type="text/javascript">
			alert("로그인 실패\n 아이디와 비밀번호를 확인해주세요.");
			window.history.back();
		</script>

		<%
		} //end else

		} catch (NullPointerException e) {
		%>
		<!-- 로그인 실패 시 이전 페이지로 이동 -->
		<script type="text/javascript">
			alert("로그인 실패\n 아이디와 비밀번호를 확인해주세요.");
			window.history.back();
		</script>

		<%
		} catch (SQLException e) {
		%>
		<script type="text/javascript">
			alert("죄송합니다. 서버 오류가 발생했습니다.");
		</script>
		<%
		}
		%>
	</div>
</body>
</html>
