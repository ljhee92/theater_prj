<%@page import="admin.ScreeningDAO1"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="admin.ScreeningVO" %>
<%@ page import="java.util.List" %>


<%
    // 클라이언트로부터 받은 상영 정보
    String theaterName = request.getParameter("theaterName");
    String screeningRoom = request.getParameter("screeningRoom");
    String movieName = request.getParameter("movieName");
    String openDate = request.getParameter("openDate");
    String screeningRound = request.getParameter("screeningRound");
  

    // 상영 정보를 등록하기 위해 DAO 객체 생성
    ScreeningDAO1 screeningDAO = ScreeningDAO1.getInstance();

    try {
        // 상영 정보 등록
        screeningDAO.insertScreening(theaterName, screeningRoom, movieName, openDate, screeningRound);

        // 등록이 성공했음을 응답으로 전송
        response.getWriter().write("success");
    } catch (SQLException e) {
        // 등록에 실패했을 경우 에러 응답 전송
        response.getWriter().write("fail");
        e.printStackTrace();
    }
%>
