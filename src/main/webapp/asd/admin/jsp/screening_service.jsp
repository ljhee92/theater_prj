<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@page import="admin.ScreeningDAO1"%>
<%@page import="admin.ScreeningVO"%>
<%@page import="admin.ScreeningVO.ScreeningVOBuilder"%>

<%
    // 클라이언트로부터 받은 검색 조건
    String theater = request.getParameter("theater");
    String screeningRoom = request.getParameter("screeningRoom");
    String date = request.getParameter("year") + request.getParameter("month") + request.getParameter("day");


    // 검색을 위한 DAO 객체 생성
    ScreeningDAO1 screeningDAO = ScreeningDAO1.getInstance();
    List<ScreeningVO> screeningList = null;

    try {
        // DAO를 사용하여 검색 실행
        // 여기에서는 검색 조건에 따라서 쿼리를 동적으로 생성하여 실행하는 예시를 제공합니다.
        // 실제로는 프로젝트의 요구사항에 맞게 쿼리를 작성하여 사용해야 합니다.
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
    out.println(jsonResponse.toString());
%>
