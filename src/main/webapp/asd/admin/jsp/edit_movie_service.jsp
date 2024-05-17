<%@page import="com.google.gson.Gson"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="admin.AdminMovieDAO"%>
<%@page import="VO.AdminMovieVO"%>
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
        String movieCode = request.getParameter("movieCode");
        String movieGenre = request.getParameter("movieGenre");
        String movieDirector = request.getParameter("movieDirector");
        String movieMainActor = request.getParameter("movieMainActor");
        String movieSubActor = request.getParameter("movieSubActor");
        String movieReleaseDateStr = request.getParameter("movieReleaseDate");
        String movieRating = request.getParameter("movieRating");
        String movieDistributor = request.getParameter("movieDistributor");
        String movieRunningTime = request.getParameter("movieRunningTime");
        String movieDescription = request.getParameter("movieDescription");
        String moviePosterPath = request.getParameter("moviePosterPath");
        String movieScreeningStatus = request.getParameter("movieScreeningStatus");
        
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date editMovieReleaseDate = null;
        
        try {
        	editMovieReleaseDate = new java.sql.Date(dateFormat.parse(movieReleaseDateStr).getTime());
        } catch (ParseException e) {
            e.printStackTrace();
        }
        Date currentDate = new Date();
        // ScreeningDAO1 객체 생성
        AdminMovieDAO movieDAO = AdminMovieDAO.getInstance();
        
        // ScreeningVO 객체 생성하여 업데이트할 정보 설정
        AdminMovieVO resultMovieVO = AdminMovieVO.builder()
        		.movieCode(movieCode)
                .movieGenre(movieGenre)
                .movieDirector(movieDirector)
                .movieMainActor(movieMainActor)
                .movieSubActor(movieSubActor)
                .movieReleaseDate(editMovieReleaseDate)
                .movieRating(movieRating)
                .movieDistributor(movieDistributor)
                .movieRunningTime(movieRunningTime)
                .movieDescription(movieDescription)
                .moviePosterPath(moviePosterPath)
                .movieScreeningStatus(movieScreeningStatus)
                .build();

        try {
            // 상영 정보 업데이트
            movieDAO.updateMovie(resultMovieVO);

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
    } else if("table".equals(action)){
        // 해당 영화 코드로 영화 정보를 가져와서 JSON 형식으로 응답
        String tableMovieCode = request.getParameter("tableMovieCode");
        // AdminMovieDAO 객체 생성
        AdminMovieDAO movieDAO = AdminMovieDAO.getInstance();
        
        try {
            // 해당 영화 코드로 영화 정보 가져오기
            AdminMovieVO movieVO = movieDAO.getMovieByCode(tableMovieCode);
            // JSON 형식으로 응답을 준비
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            
            // 영화 정보를 JSON 형식으로 변환하여 응답
            response.getWriter().write(new Gson().toJson(movieVO));
        } catch (SQLException e) {
            // 에러가 발생한 경우 JSON 형식으로 에러 응답 전송
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