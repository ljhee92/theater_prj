<%@page import="admin.AdminReserveManageVO"%>
<%@page import="admin.AdminReserveManageDAO"%>
<%@page import="java.time.Year"%>
<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="admin.ScreeningDAO1, admin.ScreeningVO" %>
<%@ page import="java.util.List, java.sql.SQLException" %>

<%
    // 클라이언트로부터 받은 검색 조건
    String theater = request.getParameter("theater");
    String screeningRoom = request.getParameter("screeningRoom");
    String date = request.getParameter("year") + request.getParameter("month") + request.getParameter("day");
    String reserveNum = request.getParameter("reservationNumber");
	System.out.println(theater + " " + screeningRoom + " " + date + " " + reserveNum);
    // 검색을 위한 DAO 객체 생성
    AdminReserveManageDAO armDAO = AdminReserveManageDAO.getInstance();
    List<AdminReserveManageVO> reserveList = null;

    try {
    	reserveList = armDAO.searchReserve(theater, screeningRoom, date, reserveNum);
    } catch (SQLException e) {
        e.printStackTrace();
    }

    // 검색 결과를 JSON 형식으로 반환
    response.setContentType("application/json");
    response.setCharacterEncoding("UTF-8");

    // JSON 형식으로 데이터 반환
    StringBuilder jsonResponse = new StringBuilder();
    jsonResponse.append("[");
    if (reserveList != null && !reserveList.isEmpty()) {
        for (int i = 0; i < reserveList.size(); i++) {
            AdminReserveManageVO reserve = reserveList.get(i);
            jsonResponse.append("{");
            jsonResponse.append("\"reservationNumber\": \"" + reserve.getReservationNumber() + "\",");
            jsonResponse.append("\"userId\": \"" + reserve.getUserId() + "\",");
            jsonResponse.append("\"movieTitle\": \"" + reserve.getMovieTitle() + "\",");
            jsonResponse.append("\"theaterName\": \"" + reserve.getTheaterName() + "\",");
            jsonResponse.append("\"theaterNumber\": \"" + reserve.getTheaterNumber() + "\",");
            jsonResponse.append("\"screeningDate\": \"" + reserve.getScreeningDate() + "\"");
            jsonResponse.append("\"screeningTime\": \"" + reserve.getScreeningTime() + "\"");
            jsonResponse.append("}");
            if (i < reserveList.size() - 1) {
                jsonResponse.append(",");
            }
        }
    }
    jsonResponse.append("]");
    System.out.println(jsonResponse.toString());
    out.println(jsonResponse.toString());
%>
