<%@page import="java.util.List"%>
<%@page import="admin.ScreeningVO"%>
<%@page import="admin.ScreeningDAO1" %>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <title>상영 수정</title>
    <!-- 필요한 CSS 및 JavaScript 라이브러리 링크 및 스타일 시트 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
    $(function(){
        $("#editScreening").click(function() {
            var param = {
                screeningCode: $("#eScreeningCode").val(),
                theaterName: $("#eTheaterName").val(),
                screeningRoom: $("#eTheaterNumber").val(),
                movieName: $("#eMovieName").val(),
                openDate: $("#eOpenDate").val().replaceAll("-",""),
                screeningRound: $("#eScreeningRound").val(),
                action: "update" // 업데이트 액션 지정
            };
            alert(JSON.stringify(param));
    
            $.ajax({
                url: "edit_screening_service.jsp",
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
        $("#deleteScreening").click(function() {
            var param = {
                screeningCode: $("#eScreeningCode").val(),
                action: "delete" // 삭제 액션 지정
            };
    
            $.ajax({
                url: "edit_screening_service.jsp",
                type: "post",
                data: param,
                dataType: "JSON",
                success: function(result) {
                    alert("삭제되었습니다");
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
<%


%>

<h1>상영 수정</h1>
<hr/>
<form id="editScreeningForm" class="pt-3" style="max-width:920px;">
    <div class="form-group">
        <label for="theaterName">지점:</label>
        <input type="text" id="eTheaterName" name="theaterName" class="form-control" value="" readonly>
    </div>
    
    <div class="form-group">
        <label for="TheaterNumber">상영관:</label>
        <input type="text" id="eTheaterNumber" name="theaterNumber" class="form-control" value="" readonly>
    </div>

    <div class="form-group">
        <label for="movieName">영화명:</label>
        <input type="text" id="eMovieName" name="movieName" class="form-control" value="" readonly>
    </div>

    <div class="form-group">
        <label for="openDate">상영 시작일:</label>
        <input type="date" id="eOpenDate" name="openDate" class="form-control" value="">
    </div>

    <div class="form-group">
        상영시작시간 : 
        <select id="eScreeningRound" name="screeningRound" class="form-select" aria-label="Default select example">
            <option value="1">09:00 ~ 12:00</option>
            <option value="2">12:00 ~ 15:00</option>
            <option value="3">15:00 ~ 18:00</option>
            <option value="4">18:00 ~ 21:00</option>
        </select>
    </div>
	<input type="hidden" id="eScreeningCode" name="screeningCode">
    <br/>
    <div>
        <!-- 수정 버튼 -->
        <input type="button" id="editScreening" class="btn btn-info" value="상영 수정">
        <!-- 삭제 버튼 -->
        <input type="button" id="deleteScreening" class="btn btn-warning" value="상영 삭제">
    </div>
</form>

<script>
$(function(){
	/*
    $("#editScreening").click(function() {
        // 수정할 상영 정보 가져오기
        var param = {
            theaterName: $("#theaterName").val(),
            screeningRoom: $("#screeningRoom").val(),
            movieName: $("#movieName").val(),
            openDate: $("#openDate").val().replaceAll("-",""),
            screeningRound: $("#screeningRound").val()
        };
        
        alert(JSON.stringify(param));

        $.ajax({
            url: "edit_screening_service.jsp", // 수정 요청을 처리할 서블릿 주소
            type: "post",
            data: param,
            success: function(response) {
                alert("성공적으로 수정");
            },
            error: function(xhr, status, error) {
                alert("오류 발생: " + error);
            }
        });
    });
	*/
});
</script>

</body>
</html>
