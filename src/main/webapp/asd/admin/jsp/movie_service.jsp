<%@page import="admin.AdminMovieDAO"%>
<%@page import="VO.AdminMovieVO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    // 클라이언트로부터 받은 검색 조건
    String searchType = request.getParameter("searchType");
    String searchText = request.getParameter("searchText");
    
    // 검색을 위한 DAO 객체 생성
    AdminMovieDAO movieDAO = AdminMovieDAO.getInstance();
    List<AdminMovieVO> movieList = null;

    try {
        // 검색 수행
        movieList = movieDAO.searchMovies(searchType, searchText);
    } catch (SQLException e) {
        e.printStackTrace();
    }

    // 검색 결과를 JSON 형식으로 반환
    response.setContentType("application/json");
    response.setCharacterEncoding("UTF-8");

    // JSON 형식으로 데이터 반환
    StringBuilder jsonResponse = new StringBuilder();
    jsonResponse.append("[");
    if (movieList != null && !movieList.isEmpty()) {
        for (int i = 0; i < movieList.size(); i++) {
        	AdminMovieVO movie = movieList.get(i);
            jsonResponse.append("{");
            jsonResponse.append("\"movieCode\": \"" + movie.getMovieCode() + "\",");
            jsonResponse.append("\"movieTitle\": \"" + movie.getMovieTitle() + "\",");
            jsonResponse.append("\"movieGenre\": \"" + movie.getMovieGenre() + "\",");
            jsonResponse.append("\"movieDistributor\": \"" + movie.getMovieDistributor() + "\",");
            jsonResponse.append("\"movieDirector\": \"" + movie.getMovieDirector() + "\",");
            jsonResponse.append("\"movieRunningTime\": \"" + movie.getMovieRunningTime() + "\",");
            jsonResponse.append("\"movieMainActor\": \"" + movie.getMovieMainActor() + "\",");
            jsonResponse.append("\"movieSubActor\": \"" + movie.getMovieSubActor() + "\",");
            jsonResponse.append("\"movieDescription\": \"" + movie.getMovieDescription() + "\",");
            jsonResponse.append("\"moviePosterPath\": \"" + movie.getMoviePosterPath() + "\",");
            jsonResponse.append("\"movieReleaseDate\": \"" + movie.getMovieReleaseDate() + "\",");
            jsonResponse.append("\"movieRating\": \"" + movie.getMovieRating() + "\",");
            jsonResponse.append("\"movieScreeningStatus\": \"" + movie.getMovieScreeningStatus() + "\"");
            jsonResponse.append("}");
            if (i < movieList.size() - 1) {
                jsonResponse.append(",");
            }
        }
    }
    jsonResponse.append("]");
    out.println(jsonResponse.toString());
%>
