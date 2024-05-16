<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // 파라미터 값 받기
    String theater = request.getParameter("theaterDropdown");
    String screeningRoom = request.getParameter("screeningRoomDropdown");
    String year = request.getParameter("yearDropdown");
    String month = request.getParameter("monthDropdown");
    String day = request.getParameter("dayDropdown");
    String reservationNumber = request.getParameter("reservationNumber");
    
    System.out.println(theater);
    System.out.println(screeningRoom);
    System.out.println(year);
    System.out.println(month);
    System.out.println(day);
    System.out.println(reservationNumber);

    // 날짜 포맷 설정
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    Date date = sdf.parse(year + "-" + month + "-" + day);
    String formattedDate = sdf.format(date);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예매 서비스</title>
</head>
<body>
    <h1>예매 서비스</h1>
    <p>예매 서비스를 처리하는 페이지입니다.</p>
    <p>선택된 영화관: <%= theater %></p>
    <p>선택된 상영관: <%= screeningRoom %></p>
    <p>선택된 날짜: <%= formattedDate %></p>
    <p>예매번호: <%= reservationNumber %></p>
</body>
</html>
