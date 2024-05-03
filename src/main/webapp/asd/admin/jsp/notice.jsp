<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info = "명화관 관리자 공지사항" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>명화관 관리자 페이지</title>
<link rel = "icon" href = "http://localhost/movie_admin/favicon.ico">
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
	table{
		margin: auto;
		margin-top: 150px;
	}
	th, td{
		text-align: center;
	}
</style>
<script type = "text/javascript">
	$(function() {
		$("#btnWrite").click(function(){
			location.href = "notice_write.jsp";
		}); // click
	}); // ready
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
	                    <h1 class="h3 mb-0 text-gray-800">공지사항관리</h1>
	                </div>
	                
	                <div style = "display: flex;">
	                	<select class = "form-control form-control-user" style = "width: 150px; margin-right: 20px;">
	                		<option value = "N/A">구분 선택</option>
	                		<option value = "1">행사/이벤트</option>
	                		<option value = "2">극장</option>
	                		<option value = "3">시스템점검</option>
	                		<option value = "4">기타</option>
	                	</select>
	                	<input type = "text" class = "form-control form-control-user" style = "width: 500px; margin-right: 20px;" placeholder = "검색할 내용을 입력해주세요."/>
	                	<input type = "button" class = "btn btn-primary btn-user btn-block" style = "width: 100px;" value = "검색">
	                </div>
	                
	                <div style = "height: 520px;">
		                <table class="table" style = "margin-top: 50px;">
		                <thead>
		                	<tr>
		                		<th style = "width: 100px;">번호</th>
		                		<th style = "width: 200px;">구분</th>
		                		<th style = "width: 500px;">제목</th>
		                		<th style = "width: 200px;">작성일</th>
		                		<th style = "width: 100px;">조회수</th>
		                	</tr>
		                </thead>
		                <tbody>
		                	<tr>
		                		<td>1</td>
		                		<td>행사/이벤트</td>
		                		<td>제목입니다</td>
		                		<td>2024.04.18</td>
		                		<td>12345</td>
	                		</tr>
		                	<tr>
		                		<td>2</td>
		                		<td>행사/이벤트</td>
		                		<td>제목입니다</td>
		                		<td>2024.04.29</td>
		                		<td>1230</td>
	                		</tr>
	                	</tbody>
		                </table>
	                </div>
	                
	                <div style="display: flex; justify-content: space-between;">
						<span style="display: flex; align-items: flex-end; margin: auto;">
							<input type="button" class="btn btn-primary btn-user btn-block" style="width: 40px; height: 40px; margin-right: 10px; margin-bottom: 10px;" value="1">
							<input type="button" class="btn btn-primary btn-user btn-block" style="width: 40px; height: 40px; margin-right: 10px; margin-bottom: 10px;" value="2">
							<input type="button" class="btn btn-primary btn-user btn-block" style="width: 40px; height: 40px; margin-right: 10px; margin-bottom: 10px;" value="3">
							<input type="button" class="btn btn-primary btn-user btn-block" style="width: 40px; height: 40px; margin-right: 10px; margin-bottom: 10px;" value="4">
							<input type="button" class="btn btn-primary btn-user btn-block" style="width: 40px; height: 40px; margin-bottom: 10px;" value=">">
						</span>
						<span style="align-self: flex-end;">
							<input type="button" class="btn btn-primary btn-user btn-block" style="width: 120px; margin-bottom: 10px;" value="글쓰기" id = "btnWrite">
						</span>
					</div>
	                
				</div>
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

    <!-- Custom scripts for all pages-->
    <script src="../js/sb-admin-2.min.js"></script>
</body>
</html>