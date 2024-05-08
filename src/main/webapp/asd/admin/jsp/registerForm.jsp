
<%@page import="admin.AdminMovieDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="admin.ScreeningDAO1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script>
$(function(){
	$("#addNewMovie").click(function() {
		var param = {
	    		theaterName: $("#theaterName").val(),
	    		screeningRoom: $("#screeningRoom").val(),
	    		movieName: $("#movieName").val(),
	    		openDate: $("#openDate").val().replaceAll("-",""),
	    		screeningRound: $("#screeningRound").val()
	    };
	    
	    alert(JSON.stringify(param));
	
	    $.ajax({
	        url: "screening_register_service.jsp",
	        type: "post",
	        data: param,
	        success: function(response) {
	            alert("성공적으로 저장");
	        },
	        error: function(xhr, status, error) {
	            alert("오류 발생: " + error);
	        }
	    });
	});
	
})
</script>

<%
List<String> theaterList = new ArrayList<String>();
	List<String> movieList = null;//new ArrayList<String>();
    ScreeningDAO1 screeningDAO = ScreeningDAO1.getInstance();
    AdminMovieDAO movieDAO = AdminMovieDAO.getInstance();
    try {
        theaterList = screeningDAO.selectTheaterAll();
        movieList=movieDAO.movieNameList();
        
        request.setAttribute("theaterList", theaterList);
        request.setAttribute("movieList", movieList);
    } catch (SQLException e) {
        // 예외 처리
        e.printStackTrace();
    }
%>

<h1>상영 등록</h1>
<hr/>
<form id="addNewScreeningForm">
    지점 : 
    <select id="theaterName" name="theaterName">
        <c:forEach items="${theaterList}" var="theater">
            <option value="${theater}">${theater}</option>
        </c:forEach>
    </select><br/>
    상영관 : 
    <select id="screeningRoom" name="screeningRoom">
        <option value="1관">1관</option>
        <option value="2관">2관</option>
        <option value="3관">3관</option>
    </select><br/>
    영화명 : 
    <select id="movieName" name="movieName">
        <c:forEach items="${movieList}" var="movie">
            <option value="${movie}">${movie}</option>
        </c:forEach>
    </select> <br/>
    상영시작시간 : 
    <input type="date" id="openDate" name="openDate" /> 
    <select id="screeningRound" name="screeningRound">
    <option value="1">09:00 ~ 12:00</option>
    <option value="2">12:00 ~ 15:00</option>
    <option value="3">15:00 ~ 18:00</option>
    <option value="4">18:00 ~ 21:00</option>
    </select>
    
    <br/>
    <br/>
    <input type="button" id="addNewMovie" class="btn btn-info" value="상영 등록" />
</form>
</body>
</html>
