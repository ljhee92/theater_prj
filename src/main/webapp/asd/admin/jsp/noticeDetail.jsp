<%@page import="java.util.List"%>
<%@page import="admin.BoardVO"%>
<%@page import="admin.DAO.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info = "명화관 관리자 공지사항 상세보기" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%
	// 세션에 저장된 아이디가 없다면 login.jsp 페이지로 이동시키기
	if(session.getAttribute("id") == null) {
		response.sendRedirect("login.jsp");
		return;
	} // end if
%>
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
	                    <h1 class="h3 mb-0 text-gray-800">공지사항관리&nbsp;</h1>
	                    <h5 class="h5 mb-0 text-gray-800"> - 상세보기</h5>
	                </div>
	                
	                <%
	                request.setCharacterEncoding("UTF-8");
	                int boardNumber = Integer.parseInt(request.getParameter("num"));
	                
	                BoardDAO bDAO = BoardDAO.getInstance();
	                
	             	// 카테고리명 얻기
                	List<BoardVO> categories = bDAO.selectNoticeCategory();
                	pageContext.setAttribute("categories", categories);
	                
	                BoardVO selectedBVO = bDAO.selectOneBoard(boardNumber);
	                
	                // 조회수 +1
	                selectedBVO.setBoardViews(selectedBVO.getBoardViews()+1);
	                bDAO.updateBoardView(selectedBVO);
	                
	                pageContext.setAttribute("selectedBVO", selectedBVO);
	                %>
	                
	                <form name="frm" action="noticeDetailProcess.jsp" method="get">
	                <div style = "height: 610px;">
	                	<div style = "display: flex; height: 50px;">
	                		<label style = "width: 10%; height: 30px; text-align: center;">번호</label>
	                		<input type = "text" style = "width: 22%; height: 30px; background-color: #E0E0E0; border: 1px solid #6e707e; border-radius: 3px;" value = "<%= boardNumber %>" readonly = "readonly">
	                		<input type = "hidden" name = "num" value = "${ selectedBVO.boardNumber }">
	                		<label style = "width: 10%; height: 30px; text-align: center; ">작성일</label>
	                		<input type = "text" style = "width: 22%; height: 30px; background-color: #E0E0E0; border: 1px solid #6e707e; border-radius: 3px;" value = "${ selectedBVO.boardDate }" readonly = "readonly">
	                	</div>
	                	
	                	<div style = "display: flex; height: 50px;">
	                		<label style = "width: 10%; height: 30px; text-align: center;">제목</label>
	                		<input type = "text" name = "title" class = "necessary" style = "width: 22%; height: 30px;" value = "${ selectedBVO.boardTitle }">
	                		<label style = "width: 10%; height: 30px; text-align: center;">조회수</label>
	                		<input type = "text" name = "views" style = "width: 22%; height: 30px; background-color: #E0E0E0; border: 1px solid #6e707e; border-radius: 3px;" value = "${ selectedBVO.boardViews }" readonly = "readonly">
	                	</div>

	                	<div style = "display: flex; height: 60px;">
	                		<label style = "width: 10%; height: 60px; text-align: center;">카테고리명</label>
	                		<select class = "form-control form-control-user" name = "category" style = "width: 15%; height: 40px;">
		                		<option value = "N/A">구분 선택</option>
		                		<c:forEach var="bVO" items="${ categories }" varStatus="i">
	                			<option value="${ bVO.categoryNumber }" <c:if test="${ selectedBVO.categoryNumber eq bVO.categoryNumber }">selected</c:if>><c:out value="${ bVO.categoryName }"/></option>
		                		</c:forEach>
	                		</select>
	                	</div>
	                	
	                	<div style = "display: flex; height: 400px;">
	                		<label style = "width: 10%; text-align: center;">내용</label>
								<textarea id="summernote" name="textarea" class = "necessary"><c:out value="${ selectedBVO.boardContent }"/></textarea>
						</div>
	                </div>
	                </form>
	                
	                <div style = "display: flex; justify-content: center; width: 1200px;">
	                	<input type="button" class="btn btn-primary btn-user" style="width: 120px; margin-right: 20px;" value="수정" id = "btnEdit">
	                	<input type="button" class="btn btn-danger btn-user" style="width: 120px; margin-right: 20px;" value="삭제" id = "btnDelete">
	                	<input type="button" class="btn btn-secondary btn-user" style="width: 120px;" value="취소" id = "btnCancel">
	                </div>

				</div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <%@ include file = "footer.jsp" %>

        </div>
        <!-- End of Content Wrapper -->

    <!-- noticeDetail page css, script -->
	<style type = "text/css">
	
	</style>
	<script type = "text/javascript">
		$(document).ready(function() {
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
		    
		    $("#btnCancel").click(function(){
				location.href = "notice.jsp?currentPage=${ param.currentPage }";
			}); // click
			
			$("#btnDelete").click(function(){
				if(!confirm("정말 삭제하시겠습니까?")){
					return;
				} // end if
				location.href = "noticeDetailProcess.jsp?num="+${ selectedBVO.boardNumber }+"&flag=d";
				alert("삭제완료");
				location.href="notice.jsp?currentPage=${ param.currentPage }";
			}); // click
	
			$("#btnEdit").click(function(){
				if(!confirm("글을 수정하시겠습니까?")){
					return;
				} // end if
				chkNull();
			}); // click
			
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
					alert("글수정 성공");
					location.href="notice.jsp?currentPage=${ param.currentPage }";
				}; // end if
			} // chkNull
		}); // ready
	</script>
	<!-- noticeDetail page css, script -->
	
    </div>
    <!-- End of Page Wrapper -->
    
</body>
</html>