<%@page import="admin.DAO.BoardDAO"%>
<%@page import="admin.BoardVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info = "명화관 관리자 공지사항 글쓰기" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- S 로그인 세션 확인  -->
<%
// 세션에서 로그인 여부 확인
String id = (String) session.getAttribute("adminId");
if (id == null) {// 로그인되지 않은 경우 로그인 페이지로 리디렉션
%>
<script type="text/javascript">
window.location.href = "login.jsp?prevPage=questionWrite.jsp";
</script>
<%
}
%>
<!-- E 로그인 세션 확인  -->%>
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
	                    <h1 class="h3 mb-0 text-gray-800">자주찾는 질문&nbsp;</h1>
	                    <h5 class="h5 mb-0 text-gray-800"> - 글쓰기</h5>
	                </div>
	                
	                <%
	                request.setCharacterEncoding("UTF-8");
	                // 작성일 : 현재 날짜로 설정
	                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	                String today = sdf.format(new Date());
	                
	                try {
	            	BoardDAO bDAO = BoardDAO.getInstance();

	            	// 카테고리명 얻기
                	List<BoardVO> categories = bDAO.selectQuestionCategory();
                	pageContext.setAttribute("categories", categories);
                	
                	// 게시판 중 가장 마지막 번호 얻고 그 다음 번호 지정
                	int newBoardNumber = bDAO.selectMaxBoardNumber()+1;
	                %>
	                
	                <form name="frm" action="questionWriteProcess.jsp" method="post">
	                <div style = "height: 610px;">
	                	<div style = "display: flex; height: 50px;">
	                		<label style = "width: 10%; height: 30px; text-align: center;">번호</label>
	                		<input type = "text" name = "number" style = "width: 22%; height: 30px; background-color: #E0E0E0; border: 1px solid #6e707e; border-radius: 3px;" value = "<%= newBoardNumber %>" readonly = "readonly">
	                		<label style = "width: 10%; height: 30px; text-align: center; ">작성일</label>
	                		<input type = "text" style = "width: 22%; height: 30px; background-color: #E0E0E0; border: 1px solid #6e707e; border-radius: 3px;" value = "<%= today %>" readonly = "readonly">
	                	</div>
	                	
	                	<div style = "display: flex; height: 50px;">
	                		<label style = "width: 10%; height: 30px; text-align: center;">제목</label>
	                		<input type = "text" id = "title" name = "title" class = "necessary" style = "width: 54%; height: 30px;" placeholder = "제목을 입력하세요.">
	                	</div>

	                	<div style = "display: flex; height: 60px;">
	                		<label style = "width: 10%; height: 60px; text-align: center;">카테고리명</label>
	                		<select class = "form-control form-control-user" id = "category" name = "category" style = "width: 15%; height: 40px;">
		                		<option value = "N/A">구분 선택</option>
		                		<c:forEach var="bVO" items="${ categories }" varStatus="i">
	                			<option value = "${ bVO.categoryNumber }"><c:out value="${ bVO.categoryName }"/></option>
		                		</c:forEach>
	                		</select>
	                	</div>
	                	
	                	<div style = "display: flex; height: 400px;">
	                		<label style = "width: 10%; text-align: center;">내용</label>
			            	
								<textarea id="summernote" name="textarea" class = "necessary"></textarea>
							
						</div>
	                </div>
	                </form>
	                
	                <div style = "display: flex; justify-content: center; width: 1200px;">
	                	<input type="button" class="btn btn-primary btn-user" style="width: 120px; margin-right: 20px;" value="작성완료" id="btnSubmit">
	                	<input type="button" class="btn btn-secondary btn-user" style="width: 120px;" value="취소" id = "btnCancel">
	                </div>
					
					<%
	                } catch (SQLException e) {
	                	out.println("오류가 발생했습니다. 잠시 후 다시 시도해주시기 바랍니다.");
	                	e.printStackTrace();
	                } // catch
	                %>
	                
				</div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <%@ include file = "footer.jsp" %>

        </div>
        <!-- End of Content Wrapper -->
       
	<script type = "text/javascript">
		$(document).ready(function() {
			$("#title").focus();
			
		    $('#summernote').summernote({
		        lang: 'ko-KR',
		        width: 900,
		        height: 350,
		        popover: {
		            table: [
		                ['add', ['addRowDown', 'addRowUp', 'addColLeft', 'addColRight']],
		                ['delete', ['deleteRow', 'deleteCol', 'deleteTable']],
		            ]
		        }
		    }); // summernote
		    
		    $("#btnSubmit").click(function(){
				chkNull();
		    }); // click
		    
		    $("#btnCancel").click(function(){
				location.href = "question.jsp";
			}); // click
		}); // ready
		
		function chkNull() {
			let flagInputAll = true;
			let arrNecessary = $(".necessary");
			let arrLabel = ['제목', '내용'];
			
			$.each(arrNecessary, function(index, value) {
				if($(value).val() == "") {
					alert(arrLabel[index] + '은 필수 입력사항입니다.');
					if(index == "제목") {
						$(value).focus();
					} else {
						$(value).summernote({
							focus: true
						});
					} // end else
					flagInputAll = false;
					return false;
				} // end if
			}); // each
			
			if(flagInputAll && $("#category").val()=='N/A') {
				alert('카테고리를 선택해주세요.');
				flagInputAll = false;
				return;
			}; // end if
			
			if(flagInputAll) {
				$("[name='frm']").submit();
				alert("글쓰기 성공");
			}; // end if
		} // chkNull
	</script>
    <!-- noticeWrite page css, script -->

    </div>
    <!-- End of Page Wrapper -->
    
	
</body>
</html>