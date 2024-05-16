<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <title>영화 수정</title>
    <!-- 필요한 CSS 및 JavaScript 라이브러리 링크 및 스타일 시트 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    <script>
    $(function(){
        $("#editMovie").click(function() {
        	var posterPath = $("#movie_poster_edit").val().replace(/^.*[\\\/]/, '');
            var param = {
            		movieCode : $("#eMovieCode").val(),
                    movieGenre: $("#movie_genre_edit").val(),
                    movieDirector: $("#movie_director_edit").val(),
                    movieMainActor: $("#movie_main_actor_edit").val(),
                    movieSubActor: $("#movie_sub_actor_edit").val(),
                    movieReleaseDate: $("#movie_release_date_edit").val(), // 개봉일자
                    movieRating: $("#movie_rating_edit").val(), // 관람등급
                    movieDistributor: $("#movie_distributor_edit").val(), // 배급사
                    movieRunningTime: $("#movie_running_time_edit").val(), // 러닝타임
                    movieDescription: $("#movie_description_edit").val(), // 줄거리
                    moviePosterPath: posterPath, // 포스터
                    movieScreeningStatus: $("#movie_status_edit").val(), // 상영상태
                    action: "update"
            };
    
            $.ajax({
                url: "edit_movie_service.jsp",
                type: "post",
                data: param,
                dataType: "JSON",
                success: function(result) {
                    alert("저장되었습니다");
                    location.reload(true);
                },
                error: function(xhr) {
                    alert(xhr.statusText);
                }
            });
        });
       
    });
    </script>
</head>
<body>
    

    <h1>영화 수정</h1>
    <hr />
            <form id="editMovieForm" class="pt-3" style="max-width: 90%;">
    <div class="container">
        <!-- 왼쪽 영역 -->
        <div class="left">
                <div class="form-group">
                    영화명 : <input type="text" id="movie_title_edit" disabled>
                </div>

                <div class="form-group">
                    장르 : <input type="text" id="movie_genre_edit">
                </div>

                <div class="form-group">
                    감독 : <input type="text" id="movie_director_edit">
                </div>

                <div class="form-group">
                    주연 : <input type="text" id="movie_main_actor_edit">
                </div>

                <div class="form-group">
                    조연 : <input type="text" id="movie_sub_actor_edit">
                </div>

                <div class="form-group">
                    <!-- 개봉일자 : <input type="text" id="movie_release_date_edit" placeholder="YYYY-MM-DD"> -->
                    개봉일자 : <input type="text" id="movie_release_date_edit">
                </div>
                <input type="hidden" id="eMovieCode" name="movieCode">
            
        </div>

        <!-- 오른쪽 영역 -->
        <div class="right">
            <div class="form-group">
                    관람등급 : <select id="movie_rating_edit" >
                    	<option value="All">전체관람가</option>
                    	<option value="12">12세관람가</option>
                    	<option value="15">15세관람가</option>
                    	<option value="18">청소년관람불가</option>
                    </select>
                </div>

                <div class="form-group">
                    배급사 : <input type="text" id="movie_distributor_edit">
                </div>

                <div class="form-group">
                    <!-- 러닝타임 : <input type="text" id="movie_running_time_edit" placeholder="mm분"> -->
                    러닝타임 : <input type="text" id="movie_running_time_edit">
                </div>

                <div class="form-group">
                    줄거리 : <textarea id="movie_description_edit" class="form-control" rows="5"></textarea>
                </div>

                <div class="form-group">
                    포스터 : <input type="file" class="form-control" id="movie_poster_edit" aria-describedby="inputGroupFileAddon03">
                </div>

                    <div class="form-group">
                    상영상태 : <select id="movie_status_edit">
                    	<option value="Y">상영가능</option>
                    	<option value="N">상영불가</option>
                    </select>
                </div>
        </div>
    </div>
        </form>
	<input type="button" id="editMovie" class="btn btn-info" value="영화 수정" />
</body>
</html>

