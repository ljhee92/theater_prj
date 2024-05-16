<%@page import="admin.ScreeningDAO1"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="admin.ScreeningVO" %>
<%@ page import="java.util.List" %>

<%
    // 요청으로부터 받은 파라미터 가져오기
    String action = request.getParameter("action");
    
    if ("update".equals(action)) {
        // 업데이트 요청 처리
        String screeningCode = request.getParameter("screeningCode");
        String theaterName = request.getParameter("theaterName");
        String screeningRoom = request.getParameter("screeningRoom");
        String movieName = request.getParameter("movieName");
        String openDate = request.getParameter("openDate");
        String screeningRound = request.getParameter("screeningRound");
        
        // ScreeningDAO1 객체 생성
        ScreeningDAO1 screeningDAO = ScreeningDAO1.getInstance();
        
        // ScreeningVO 객체 생성하여 업데이트할 정보 설정
        ScreeningVO resultScreeningVO = ScreeningVO.builder()
                .screeningCode(screeningCode)
                .theaterName(theaterName)
                .theaterNumber(screeningRoom)
                .movieName(movieName)
                .screeningDate(openDate)
                .screeningRound(screeningRound)
                .build();

        try {
            // 상영 정보 업데이트
            screeningDAO.updateScreening(resultScreeningVO);

            // 등록이 성공했음을 JSON 형식으로 응답으로 전송
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("{\"result\": \"success\"}");
        } catch (SQLException e) {
            // 등록에 실패했을 경우 JSON 형식으로 에러 응답 전송
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("{\"result\": \"fail\", \"error\": \"" + e.getMessage() + "\"}");
            e.printStackTrace();
        }
    } else if ("delete".equals(action)) {
        // 삭제 요청 처리
        String screeningCode = request.getParameter("screeningCode");
        
        // ScreeningDAO1 객체 생성
        ScreeningDAO1 screeningDAO = ScreeningDAO1.getInstance();

        try {
            // 상영 정보 삭제
            screeningDAO.deleteScreening(screeningCode);

            // 삭제가 성공했음을 JSON 형식으로 응답으로 전송
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("{\"result\": \"success\"}");
        } catch (SQLException e) {
            // 삭제에 실패했을 경우 JSON 형식으로 에러 응답 전송
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("{\"result\": \"fail\", \"error\": \"" + e.getMessage() + "\"}");
            e.printStackTrace();
        }
    } else {
        // 잘못된 요청일 경우 에러 응답 전송
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("{\"result\": \"fail\", \"error\": \"Invalid action\"}");
    }
%>
