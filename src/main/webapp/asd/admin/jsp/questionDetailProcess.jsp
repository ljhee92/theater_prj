<%@page import="admin.DAO.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info = "공지사항 상세보기에서 수정 또는 삭제를 위한 JSP" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>명화관 관리자 페이지</title>
<link rel = "icon" href = "http://localhost/theater_prj/asd/favicon.ico">
<!--bootstrap 시작-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<!--bootstrap 끝-->
<!--jQuery CDN 시작-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!--jQuery CDN 끝-->
<style type = "text/css">
	
</style>
<script type = "text/javascript">
	$(function() {

	}); // ready
</script>
</head>
<body>
<div>
	<%
	request.setCharacterEncoding("UTF-8");
	%>
	
	<jsp:useBean id="bVO" class="admin.BoardVO" scope="page"/>
	<jsp:setProperty property="*" name="bVO"/>
	
	<c:catch var="e">
	<%
	// 수정/삭제 판단 파라미터
	String flag = request.getParameter("flag");
	
	BoardDAO bDAO = BoardDAO.getInstance();
	
	if("d".equals(flag)) { // 삭제라면 
		int boardNumber = Integer.parseInt(request.getParameter("num"));
		bDAO.deleteBoard(boardNumber);
		return;
	} // end if
	
	// flag가 없다면(수정이라면)
	bVO.setBoardNumber(Integer.parseInt(request.getParameter("num")));
	bVO.setBoardTitle(request.getParameter("title"));
	bVO.setBoardContent(request.getParameter("textarea"));
	bVO.setCategoryNumber(Integer.parseInt(request.getParameter("category")));
	bVO.setAdminId(session.getAttribute("id").toString());
	
	bDAO.updateBoard(bVO);
	response.sendRedirect("question.jsp");
	%>
	</c:catch>
	<c:if test="${ not empty e }">
		죄송합니다. 잠시 후 다시 시도해주시기 바랍니다.
		<%
		response.sendRedirect("question.jsp");
		%>
	</c:if>
</div>
</body>
</html>