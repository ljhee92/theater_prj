<%@page import="java.time.Year"%>
<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="admin.ScreeningDAO1, admin.ScreeningVO" %>
<%@ page import="java.util.List, java.sql.SQLException" %>

<%
    // 클라이언트로부터 받은 검색 조건
    String theater = request.getParameter("theater");
    String screeningRoom = request.getParameter("screeningRoom");
    String date = request.getParameter("year") + request.getParameter("month") + request.getParameter("day");
	System.out.println(theater + " " + screeningRoom + " " + date);
    // 검색을 위한 DAO 객체 생성
    ScreeningDAO1 screeningDAO = ScreeningDAO1.getInstance();
    List<ScreeningVO> screeningList = null;

    try {
        screeningList = screeningDAO.searchScreening(theater, screeningRoom, date);
    } catch (SQLException e) {
        e.printStackTrace();
    }

    // 검색 결과를 JSON 형식으로 반환
    response.setContentType("application/json");
    response.setCharacterEncoding("UTF-8");

    // JSON 형식으로 데이터 반환
    StringBuilder jsonResponse = new StringBuilder();
    jsonResponse.append("[");
    if (screeningList != null && !screeningList.isEmpty()) {
        for (int i = 0; i < screeningList.size(); i++) {
            ScreeningVO screening = screeningList.get(i);
            jsonResponse.append("{");
            jsonResponse.append("\"theaterName\": \"" + screening.getTheaterName() + "\",");
            jsonResponse.append("\"theaterNumber\": \"" + screening.getTheaterNumber() + "\",");
            jsonResponse.append("\"movieName\": \"" + screening.getMovieName() + "\",");
            jsonResponse.append("\"screeningDate\": \"" + screening.getScreeningDate() + "\",");
            jsonResponse.append("\"screeningRound\": \"" + screening.getScreeningRound() + "\"");
            jsonResponse.append("}");
            if (i < screeningList.size() - 1) {
                jsonResponse.append(",");
            }
        }
    }
    jsonResponse.append("]");
    System.out.println(jsonResponse.toString());
    out.println(jsonResponse.toString());
%>
