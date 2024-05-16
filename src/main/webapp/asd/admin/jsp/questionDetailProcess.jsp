<%@page import="admin.DAO.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info = "자주찾는질문 상세보기에서 수정 또는 삭제를 위한 JSP" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="bVO" class="admin.BoardVO" scope="page"/>
<jsp:setProperty property="*" name="bVO"/>
<script type = "text/javascript">
	<%
	try {
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
		bVO.setAdminId(session.getAttribute("adminId").toString());
		
		bDAO.updateBoard(bVO);
		
		String currentPage = request.getParameter("hidden");
		request.setAttribute("currentPage", currentPage);
	%>
		alert("글 수정 성공");
		var currentPage = "<%= currentPage %>";
		location.href = "notice.jsp?currentPage="+currentPage;
	<%
	} catch (SQLException se) {
		se.printStackTrace();
	%>
		alert("죄송합니다. 잠시 후 다시 시도해주시기 바랍니다.");
		location.href = "question.jsp?currentPage="+currentPage;
	<%
	} // end catch
	%>
</script>