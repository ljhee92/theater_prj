<%@page import="admin.AdminReserveManageDAO"%>
<%@page import="admin.AdminUserManageDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="명화관 관리자 예매 삭제" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예매 삭제</title>
</head>
<body>
<%
    String reservationNumber = request.getParameter("reservationNumber");

    AdminReserveManageDAO armDAO = AdminReserveManageDAO.getInstance();
    int result = 0;
    String message = "";

    try {
        result = armDAO.deleteReserve(reservationNumber);
        if(result > 0) {
            message = "예매번호 [ " + reservationNumber + " ]의 예매취소가 완료되었습니다.";
        } else {
            message = "예매번호 [ " + reservationNumber + " ]의 예매취소에 실패하였습니다.";
        }
    } catch (Exception e) {
        message = "오류가 발생했습니다: " + e.getMessage();
        e.printStackTrace(); // 예외 발생 시 스택 트레이스 출력
    }
%>
<script>
    alert('<%= message %>');
    <% if(result > 0) { %>
        location.href='reservation.jsp';
    <% } else { %>
        history.go(-1);
    <% } %>
</script>
</body>
</html>