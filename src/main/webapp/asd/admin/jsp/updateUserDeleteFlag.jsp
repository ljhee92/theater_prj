<%@page import="admin.AdminUserManageDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="명화관 관리자 회원 정보 삭제" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 삭제</title>
</head>
<body>
<%
    String userId = request.getParameter("userId");

    AdminUserManageDAO aumDAO = AdminUserManageDAO.getInstance();
    int result = 0;
    String message = "";

    try {
        result = aumDAO.updateUserDeleteFlag(userId);
        if(result > 0) {
            message = "삭제가 완료되었습니다.";
        } else {
            message = "삭제에 실패했습니다.";
        }
    } catch (Exception e) {
        message = "오류가 발생했습니다: " + e.getMessage();
        e.printStackTrace(); // 예외 발생 시 스택 트레이스 출력
    }
%>
<script>
    alert('<%= message %>');
    <% if(result > 0) { %>
        location.href='member.jsp';
    <% } else { %>
        history.go(-1);
    <% } %>
</script>
</body>
</html>