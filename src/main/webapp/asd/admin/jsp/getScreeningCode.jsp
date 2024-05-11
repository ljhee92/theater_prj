<%@page import="admin.ScreeningDAO1"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="admin.ScreeningVO" %>
<%@ page import="java.util.List" %>

<%
    // 클라이언트로부터 받은 요청 파라미터 가져오기
    String theaterName = request.getParameter("theaterName");
    String theaterNumber = request.getParameter("screeningRoom");
    String movieName = request.getParameter("movieName");
    String screeningDate = request.getParameter("openDate");
    String screeningRound = request.getParameter("screeningRound");
    if(screeningRound == null) System.out.println("screeningRound가 null");
    if(screeningRound.equals("09:00 ~ 12:00")){
    	screeningRound="1";
    }else if(screeningRound.equals("12:00 ~ 15:00")){
    	screeningRound="2";
    }else if(screeningRound.equals("15:00 ~ 18:00")){
    	screeningRound="3";
    }else if(screeningRound.equals("18:00 ~ 21:00")){
    	screeningRound="4";
    }

    // ScreeningVO 객체 생성하여 요청 정보 설정
    ScreeningVO screeningVO = ScreeningVO.builder()
        .theaterName(theaterName)
        .theaterNumber(theaterNumber)
        .movieName(movieName)
        .screeningDate(screeningDate)
        .screeningRound(screeningRound)
        .build();
	System.out.println("getScreeningCode.jsp : screeningVO : " + screeningVO.toString());
    // ScreeningDAO1 객체 생성
    ScreeningDAO1 screeningDAO = ScreeningDAO1.getInstance();

    // 조회된 screeningCode를 담을 변수 초기화
    String screeningCode = null;

    try {
        // screeningCode 조회
        screeningCode = screeningDAO.selectScreeningCode(screeningVO);
        System.out.println("getScreeningCode.jsp : 받아온 screeningCode : " +screeningCode);
    } catch (SQLException e) {
        // 오류 발생 시 예외 처리
        e.printStackTrace();
        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        response.getWriter().write("Failed to retrieve screeningCode");
        return;
    }

    // 조회된 screeningCode를 클라이언트에 응답으로 전송
    response.setContentType("text/plain");
    response.setCharacterEncoding("UTF-8");
    response.getWriter().write(screeningCode);
%>
