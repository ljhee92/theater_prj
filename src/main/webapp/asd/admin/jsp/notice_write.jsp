<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info = "명화관 관리자 공지사항 글쓰기" %>
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
<!-- include summernote css/js -->
<link rel="stylesheet" href="../css/summernote/summernote-lite.css">
<script src="../js/summernote/summernote-lite.js"></script>
<!-- include summernote-ko-KR -->
<script src="../js/summernote/lang/summernote-ko-KR.js"></script>
<style type = "text/css">
	
</style>
<script type = "text/javascript">
	$(document).ready(function() {
	    $('#summernote').summernote({
	        lang: 'ko-KR',
	        width: 900,
	        height: 350,
	        focus: true,
	        popover: {
	            table: [
	                ['add', ['addRowDown', 'addRowUp', 'addColLeft', 'addColRight']],
	                ['delete', ['deleteRow', 'deleteCol', 'deleteTable']],
	            ]
	        }
	    }); // summernote
	    
	    $("#btnCancel").click(function(){
			location.href = "notice.jsp";
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
	                <div class="d-sm-flex align-items-center mb-4" style = "display: flex;">
	                    <h1 class="h3 mb-0 text-gray-800">공지사항관리&nbsp;</h1>
	                    <h5 class="h5 mb-0 text-gray-800"> - 글쓰기</h5>
	                </div>
	                
	                <div style = "height: 610px;">
	                	<div style = "display: inline-block; height: 50px;">
	                		<label style = "width: 150px; height: 30px; text-align: center;">번호</label>
	                		<input type = "text" style = "width: 370px; height: 30px; background-color: #E0E0E0; border: 1px solid #6e707e; border-radius: 3px;" value = "92" readonly = "readonly">
	                		<label style = "width: 150px; height: 30px; text-align: center; ">작성일</label>
	                		<input type = "text" style = "width: 370px; height: 30px; background-color: #E0E0E0; border: 1px solid #6e707e; border-radius: 3px;	" value = "2024.04.29" readonly = "readonly">
	                	</div>
	                	
	                	<div style = "display: inline-block; height: 50px;">
	                		<label style = "width: 150px; height: 30px; text-align: center;">제목</label>
	                		<input type = "text" style = "width: 900px; height: 30px;" placeholder = "제목을 입력하세요.">
	                	</div>

	                	<div style = "display: flex; height: 60px;">
	                		<label style = "width: 150px; height: 60px; text-align: center;">카테고리명</label>
	                		<select class = "form-control form-control-user" style = "width: 150px; height: 40px;">
		                		<option value = "N/A">구분 선택</option>
		                		<option value = "1">행사/이벤트</option>
		                		<option value = "2">극장</option>
		                		<option value = "3">시스템점검</option>
		                		<option value = "4">기타</option>
	                		</select>
	                	</div>
	                	
	                	<div style = "display: flex; height: 400px;">
	                		<label style = "width: 150px; text-align: center;">내용</label>
			            	<form method="post">
								<textarea id="summernote" name="textarea"></textarea>
							</form>
						</div>
	                </div>
	                
	                <div style = "display: flex; justify-content: center; width: 1200px;">
	                	<input type="button" class="btn btn-primary btn-user" style="width: 120px; margin-right: 20px;" value="작성완료" id = "btnSuccess">
	                	<input type="button" class="btn btn-secondary btn-user" style="width: 120px;" value="취소" id = "btnCancel">
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
</body>
</html>