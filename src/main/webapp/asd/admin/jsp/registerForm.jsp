<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<body>
 
<h1>영화 등록</h1>
<hr/>
<form id="addNewMovieForm">
	영화명 : <input type="text" id="movieTitle" name="movieTitle" /><br/>
	평점 : <input type="text" id="rate" name="rate" /><br/>
	상영시간 : <input type="text" id="runningTime" name="runningTime"/> <br/>
	개봉일 : <input type="date" id="openDate" name="openDate" /><br/>
	상영등급 : 
	
	<c:forEach items="${ gradeList }" var="grade">
	<input type="radio" class="grade" name="grade" value="${ grade.gradeId }" /> ${ grade.gradeTitle }
	</c:forEach>
	<br/>
	감독 : 
	<select id ="directors" name="directors" multiple="multiple">
		<c:forEach items="${ directorList }" var="director">
			<option value="${ director.directorId }">${ director.directorName }</option>
		</c:forEach>
	</select>
	<span id="directorsName"></span>
	
	<br/>
	출연진 :
	<select id ="actors" name="actors" multiple="multiple">
		<c:forEach items="${ actorList }" var="actor">
			<option value="${ actor.actorId }">${ actor.actorName }</option>
		</c:forEach>
	</select>
	<br/>
	장르 :
	<c:forEach items="${ genreList }" var="genre">
		<input type="checkbox" class="genres" name="genres" value="${ genre.genreId }" />${ genre.genreTitle }
	</c:forEach>
	<br/>
	<input type="button" id="addNewMovie" value="영화 등록" />
</form>
</body>
</html>