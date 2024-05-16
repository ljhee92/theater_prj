<%@page import="java.util.Date"%>
<%@page import="java.sql.SQLException"%>
<%@page import="VO.AdminMovieVO"%>
<%@page import="java.util.List"%>
<%@page import="admin.ScreeningDAO1"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info = "명화관 관리자 회원관리" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>명화관 관리자 페이지</title>
<link rel = "icon" href = "http://localhost/theater_prj/asd/favicon.ico">
<!--bootstrap 시작-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<!--bootstrap 끝-->
<!--jQuery CDN 시작-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!--jQuery CDN 끝-->
<!-- Custom fonts for this template-->
<link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
    rel="stylesheet">
<!-- Custom styles for this template-->
<link href="../css/sb-admin-2.css" rel="stylesheet">
<style type = "text/css">
	
</style>
<script>

    $(document).ready(function() {
    	

        // 검색 버튼 클릭 이벤트 핸들러
        $("#searchButton").click(searchButtonClick);

        // 엔터키 입력 이벤트 핸들러
        $("#searchText").keypress(function(event) {
            if (event.which === 13) {
                searchButtonClick();
            }
        });

        function searchButtonClick() {
            var param = {
                searchType: $("#searchType").val(),
                searchText: $("#searchText").val()
            };

            $.ajax({
                url: "movie_service.jsp",
                type: "get",
                data: param,
                dataType: "JSON",
                success: function(jsonArr) {
                    // 검색 결과를 테이블에 반영
                    updateTable(jsonArr);
                },
                error: function(xhr) {
                    alert(xhr.statusText);
                }
            });
        }
        
        //$("#contentBoard").on("click", "tr", clickTable);
        
         
        $("#registerButton").click(function() {
            $("#registerForm").show();
            $("#table-content").hide();
            $("#editForm").hide();
        });
        
        
        
        $("#toBack").click(function() {
            $("#registerForm").hide();
            $("#editForm").hide();
            $("#table-content").show();
        });

 
            
           
            });

        function clickTable(mCode, poster, rDate,rTime) {
            // 클릭한 테이블의 정보를 가져오는 코드
            $("#registerForm").hide();
            $("#table-content").hide();
            $("#editForm").show();
            
            var param = {
                    tableMovieCode: mCode,
                    action: "table"
                };

                $.ajax({
                    url: "edit_movie_service.jsp",
                    type: "get",
                    data: param,
                    dataType: "JSON",
                    success: function(jsonArr) {
                        // 검색 결과를 테이블에 반영
                    	$("#eMovieCode").val(jsonArr.movieCode);
                    	$("#movie_title_edit").val(jsonArr.movieTitle);
                    	$("#movie_genre_edit").val(jsonArr.movieGenre);
                    	$("#movie_director_edit").val(jsonArr.movieDirector);
                    	$("#movie_main_actor_edit").val(jsonArr.movieMainActor);
                    	$("#movie_sub_actor_edit").val(jsonArr.movieSubActor);
                    	//$("#movie_release_date_edit").val(jsonArr.editMovieReleaseDate);
                    	$("#movie_release_date_edit").val(rDate);
                    	$("#movie_rating_edit").val(jsonArr.movieRating);
                    	$("#movie_distributor_edit").val(jsonArr.movieDistributor);
                    	$("#movie_running_time_edit").val(jsonArr.movieRunningTime);
                    	$("#movie_description_edit").val(jsonArr.movieDescription);
                    	//$("#movie_poster_edit").val(jsonArr.moviePosterPath);
                    	$("#movie_poster_edit").val(poster);
                    	$("#movie_status_edit").val(jsonArr.movieScreeningStatus);
                    	/* if (jsonArr.movieScreeningStatus === "Y") {
		                    $("#movie_status_edit").val("Y");
		                } else {
		                    $("#movie_status_edit").val("N");
		                } */
                        console.log(jsonArr.movieTitle);
                        console.log(jsonArr.editMovieReleaseDate);
                        console.log(jsonArr.moviePosterPath);
                        console.log(jsonArr.moviePosterPath);
                        
                    },
                    error: function(xhr) {
                        alert(xhr.statusText);
                    }
                });
        }
           
           
        function updateTable(jsonArr) {
            // id="content"를 삭제하고
            $("#contentBoard").empty();
            // jsonArr를 반복하고, jsonObject을 parsing하여
            jsonArr.forEach(function(movie) {
                var status = "";
                if (movie.movieScreeningStatus === "Y") {
                    if (new Date(movie.movieReleaseDate) > new Date()) {
                        status = "<span style=\"color: red;\">상영예정</span>";
                    } else {
                        status = "상영중"; 
                    }
                } else {
                    status = "<span style=\"color: blue;\">상영완료</span>";
                }
                var newRow = "<tr onclick=\"clickTable('" + movie.movieCode + "', '" + movie.movieTitle + "','" + movie.movieGenre + "','" + movie.movieDistributor + "', '" + movie.movieDirector + "','" + movie.movieRunningTime + "','" + movie.movieMainActor + "','" + movie.movieSubActor + "','" + movie.movieDescription + "','" + movie.moviePosterPath + "','" + movie.movieReleaseDate + "','" + movie.movieRating + "','" + movie.movieScreeningStatus + "')\">" +
                    "<td>" + movie.movieCode + "</td>" + // 결과 번호를 표시합니다.
                    "<td>" + movie.movieTitle + "</td>" +
                    "<td>" + status + "</td>" +
                    "<td>" + movie.movieGenre + "</td>" +
                    "</tr>";
                // id="content"에 붙입니다.
                $("#contentBoard").append(newRow);
            });
        }
        
       

  //  });
</script>
</head>
<body id="page-top">
    <!-- Page Wrapper -->
    <div id="wrapper">

        <%@ include file = "sidebar.jsp" %>

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

               <%@ include file = "topbar.jsp" %>

                <!-- Begin Page Content -->
                <div class="container-fluid">
	                <!-- Page Heading -->
	                <div class="d-sm-flex align-items-center justify-content-between mb-4">
	                    <h1 class="h3 mb-0 text-gray-800">영화관리</h1>
	                </div>
	                <!-- 영화관리 밑 컨텐츠 -->
				    <div id="table-content" class="table-responsive">
				    <!-- 검색 폼 -->
                    <form id="searchForm" method="post" action="movie_service.jsp" class="row align-items-center">
					    <!-- 지점 드롭다운 메뉴 -->
					    <select id="searchType" class="form-select form-select-sm col-sm-1" aria-label="Large select example">
					        <option value="movie_title">영화명</option>
					        <option value="movie_genre">장르</option>
					    </select>
					    <input type="text" id="searchText" class="form-control col-sm-1">
					    <button type="button" id="searchButton" class="btn btn-info col-sm-1">검색</button>
					</form>


					
				    <button id="registerButton" class="btn btn-info float-right">등록</button>
				        <table class="table table-striped table-hover">
						    <thead>
						        <tr>
						            <th>코드</th>
						            <th>영화명</th>
						            <th>상영상태</th>
						            <th>장르</th>
						        </tr>
						    </thead>
						    <tbody id="contentBoard">
							   <%
							   try {
							       AdminMovieDAO movieDAO = AdminMovieDAO.getInstance();
							       List<AdminMovieVO> movieList = movieDAO.selectMovieList();
							       for (AdminMovieVO movie : movieList) {
							           String status = ""; // 상영 상태
							           if (movie.getMovieScreeningStatus().equals("Y")) {
							               if (movie.getMovieReleaseDate().compareTo(new Date()) > 0) {
							                   // 상영예정 releast날짜가 현재 날짜보다 뒤일 때
							                   status = "<span style=\"color: red;\">상영예정</span>";
							               } else {
							                   // 상영중 현재 날짜보다 앞일 때
							                   status = "상영중";
							               }
							           } else {
							               // 상영예정 'N'
							               status = "<span style=\"color: blue;\">상영완료</span>";
							           }
							   %>
							   <%-- <tr onClick="clickTable('<%=movie.getMovieCode()%>', '<%=movie.getMovieTitle()%>','<%=movie.getMovieGenre()%>', '<%=movie.getMovieDistributor()%>', '<%=movie.getMovieDirector()%>', '<%=movie.getMovieRunningTime()%>', '<%=movie.getMovieMainActor()%>', '<%=movie.getMovieSubActor()%>', '<%=movie.getMovieDescription()%>', '<%=movie.getMoviePosterPath()%>', '<%=movie.getMovieReleaseDate()%>', '<%=movie.getMovieRating()%>', '<%=movie.getMovieScreeningStatus()%>')"> --%>
							   <tr onClick="clickTable('<%=movie.getMovieCode()%>', '<%=movie.getMoviePosterPath()%>', '<%=movie.getMovieReleaseDate()%>','<%=movie.getMovieRunningTime()%>')">
							       <td><%=movie.getMovieCode()%></td>
							       <td><%=movie.getMovieTitle()%></td>
							       <td><%=status%></td>
							       <td><%=movie.getMovieGenre()%></td>
							   </tr>
							   <%
							       }
							   } catch (SQLException e) {
							       e.printStackTrace();
							   }
							   %>
							</tbody>

						</table>
				    </div>
				    <!-- 영화관리 밑 컨텐츠 -->
				    <div id="registerForm" style="display:none;">
				    <%@ include file = "movie_registerForm.jsp" %>
				    </div>
				    <div id="editForm" style="display:none;">
				    <%-- <%@ include file = "screening_edit_form.jsp" %> --%>
				    <c:import url="movie_edit_form.jsp"/>
				    </div>
				</div>
				
				<div></br><button id="toBack" class="btn btn-warning">뒤로</button></div>
                <!-- /.container-fluid -->
				
            </div>
            <!-- End of Main Content -->

            <%@ include file = "footer.jsp" %>

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Bootstrap core JavaScript-->
    <script src="../vendor/jquery/jquery.js"></script>
    <script src="../vendor/bootstrap/js/bootstrap.bundle.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="../vendor/jquery-easing/jquery.easing.js"></script>

<!--     Custom scripts for all pages
    <script src="./"></script> -->
</body>
</html>