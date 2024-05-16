<%@page import="java.text.ParseException"%>
<%@page import="admin.AdminMovieDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="VO.AdminMovieVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    // 파라미터 값 가져오기
    String movieCode = request.getParameter("movieCode");
    String movieTitle = request.getParameter("movieTitle");
    String movieGenre = request.getParameter("movieGenre");
    String movieDirector = request.getParameter("movieDirector");
    String movieMainActor = request.getParameter("movieMainActor");
    String movieSubActor = request.getParameter("movieSubActor");
    String addMovieReleaseDateStr = request.getParameter("movieReleaseDate");
    String movieRating = request.getParameter("movieRating");
    String movieDistributor = request.getParameter("movieDistributor");
    String movieRunningTime = request.getParameter("movieRunningTime");
    String movieDescription = request.getParameter("movieDescription");
    String moviePosterPath = request.getParameter("moviePosterPath");
    String movieScreeningStatus = request.getParameter("movieScreeningStatus");

    // 현재 날짜 가져오기
    // 현재 날짜 가져오기
Date currentDate = new Date();
SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
String movieInputDateStr = dateFormat.format(currentDate);
Date addMovieReleaseDate = null;

try {
    addMovieReleaseDate = new java.sql.Date(dateFormat.parse(addMovieReleaseDateStr).getTime());
    java.sql.Date movieInputDate = new java.sql.Date(dateFormat.parse(movieInputDateStr).getTime());

    // AdminMovieVO 객체 생성하여 값 설정
    AdminMovieVO resultMovieVO = AdminMovieVO.builder()
            .movieInputDate(movieInputDate)
            .movieTitle(movieTitle)
            .movieCode(movieCode)
            .movieGenre(movieGenre)
            .movieDirector(movieDirector)
            .movieMainActor(movieMainActor)
            .movieSubActor(movieSubActor)
            .movieReleaseDate(addMovieReleaseDate)
            .movieRating(movieRating)
            .movieDistributor(movieDistributor)
            .movieRunningTime(movieRunningTime)
            .movieDescription(movieDescription)
            .moviePosterPath(moviePosterPath)
            .movieScreeningStatus(movieScreeningStatus)
            .build();

    // AdminMovieDAO 객체 생성
    AdminMovieDAO movieDAO = new AdminMovieDAO();

    try {
        // 영화 등록 메서드 호출
        movieDAO.insertMovie(resultMovieVO);
        // 성공적으로 등록되었음을 클라이언트에 응답
        response.getWriter().write("영화 등록이 성공적으로 완료되었습니다.");
    } catch (Exception e) {
        // 등록 중 오류 발생 시 오류 메시지를 클라이언트에 응답
        response.getWriter().write("영화 등록 중 오류가 발생했습니다: " + e.getMessage());
    }
} catch (ParseException e) {
    e.printStackTrace();
    response.getWriter().write("날짜 파싱 오류가 발생했습니다: " + e.getMessage());
}
%>
