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

<head>
    <meta charset="UTF-8">
    <title>영화 등록</title>
    <!-- CSS -->
    <style>
        .container {
            display: flex;
            justify-content: space-between;
        }

        .left,
        .right {
            width: 45%;
        }

        .form-group {
            margin-bottom: 15px;
        }
    </style>
</head>

<body>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script>
        $(function () {
            $("#addNewMovie").click(function () {
            	var posterPath = $("#movie_poster_add").val().replace(/^.*[\\\/]/, '');
                var param = {
                		movieTitle: $("#movie_title_add").val(),
                        movieGenre: $("#movie_genre_add").val(),
                        movieDirector: $("#movie_director_add").val(),
                        movieMainActor: $("#movie_main_actor_add").val(),
                        movieSubActor: $("#movie_sub_actor_add").val(),
                        movieReleaseDate: $("#movie_release_date_add").val(), // 개봉일자
                        movieRating: $("#movie_rating_add").val(), // 관람등급
                        movieDistributor: $("#movie_distributor_add").val(), // 배급사
                        movieRunningTime: $("#movie_running_time_add").val(), // 러닝타임
                        movieDescription: $("#movie_description_add").val(), // 줄거리
                        moviePosterPath: posterPath, // 포스터
                        movieScreeningStatus: $("#movie_status_add").val() // 상영상태
                    
                };

                alert(JSON.stringify(param));

                $.ajax({
                    url: "movie_register_service.jsp",
                    type: "post",
                    data: param,
                    success: function (response) {
                        alert("영화저장 성공");
                    },
                    error: function (xhr, status, error) {
                        alert("오류 발생: " + error);
                    }
                });
            });

        })
    </script>


    <h1>영화 등록</h1>
    <hr />
    <div class="container">
        <!-- 왼쪽 영역 -->
        <div class="left">
            <form id="addNewMomieForm" class="pt-3" style="max-width: 90%;">
                <div class="form-group">
                    영화명 : <input type="text" id="movie_title_add">
                </div>

                <div class="form-group">
                    장르 : <input type="text" id="movie_genre_add">
                </div>

                <div class="form-group">
                    감독 : <input type="text" id="movie_director_add">
                </div>

                <div class="form-group">
                    주연 : <input type="text" id="movie_main_actor_add">
                </div>

                <div class="form-group">
                    조연 : <input type="text" id="movie_sub_actor_add">
                </div>

                <div class="form-group">
                    개봉일자 : <input type="text" id="movie_release_date_add" placeholder="YYYY-MM-DD">
                </div>
            </form>
        </div>

        <!-- 오른쪽 영역 -->
        <div class="right">
            <div class="form-group">
                    관람등급 : <select id="movie_rating_add" >
                    	<option value="All">전체관람가</option>
                    	<option value="12">12세관람가</option>
                    	<option value="15">15세관람가</option>
                    	<option value="18">청소년관람불가</option>
                    </select>
                </div>
                <div class="form-group">
                    배급사 : <input type="text" id="movie_distributor_add">
                </div>

                <div class="form-group">
                    러닝타임 : <input type="text" id="movie_running_time_add" placeholder="mm분">
                </div>

                <div class="form-group">
                    줄거리 : <textarea id="movie_description_add" class="form-control" rows="5"></textarea>
                </div>

                <div class="form-group">
                    포스터 : <input type="file" class="form-control" id="movie_poster_add" aria-describedby="inputGroupFileAddon03">
                </div>

                <div class="form-group">
                    상영상태 : <select id="movie_status_add">
                    	<option value="Y">상영가능</option>
                    	<option value="N">상영불가</option>
                    </select>
                </div>
        </div>
    </div>
	<input type="button" id="addNewMovie" class="btn btn-info" value="상영 등록" />
</body>

</html>