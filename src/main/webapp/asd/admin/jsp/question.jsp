<%@page import="admin.DAO.BoardDAO"%>
<%@page import="java.util.List"%>
<%@page import="admin.BoardVO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info = "명화관 관리자 자주찾는질문" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- S 로그인 세션 확인  -->
<%
// 세션에서 로그인 여부 확인
String id = (String) session.getAttribute("adminId");
if (id == null) {// 로그인되지 않은 경우 로그인 페이지로 리디렉션
%>
<script type="text/javascript">
window.location.href = "login.jsp?prevPage=question.jsp";
</script>
<%
}
%>
<!-- E 로그인 세션 확인  -->
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

                <%
                request.setCharacterEncoding("UTF-8");
                %>
                
                <jsp:useBean id="sVO" class="admin.SearchVO" scope="page"/>
                <jsp:setProperty property="*" name="sVO"/>
                
                <%
                try {
                	BoardDAO bDAO = BoardDAO.getInstance();
               		
                	// 1. 총 레코드의 수 얻기
                	int totalCnt = bDAO.selectQuestionTotalCount(sVO);
                	// 2. 한 화면에 보여줄 게시물의 수
                	int pageScale = 10;
                	
                	// 3. 총 페이지 수
                	int totalPage = (int)Math.ceil((double)totalCnt / pageScale);
                	
                	// 4. 게시물의 시작 번호
                	String tempPage = sVO.getCurrentPage();
                	int currentPage = 1;
                	if(tempPage != null) {
                		try {
                			currentPage = Integer.parseInt(tempPage);
                		} catch(NumberFormatException nfe) {
                		} // end catch
                	} // end if
                	
                	int startNum = currentPage * pageScale - pageScale + 1;
                	
                	// 5. 게시물의 끝 번호
                	int endNum = startNum + pageScale - 1;
                	
                	sVO.setStartNum(startNum);
                	sVO.setEndNum(endNum);
                	
                	// 시작 번호와 끝 번호 사이의 게시물 불러오기
                	List<BoardVO> boards = bDAO.selectQuestionBoard(sVO);
                	pageContext.setAttribute("boards", boards);
                	pageContext.setAttribute("totalCnt", totalCnt);
        			pageContext.setAttribute("pageScale", pageScale);
        			pageContext.setAttribute("currentPage", currentPage);
                	
                	// 카테고리명 얻기
                	List<BoardVO> categories = bDAO.selectQuestionCategory();
                	pageContext.setAttribute("categories", categories);
                %>
                
                <!-- Begin Page Content -->
                <div class="container-fluid">
	                <!-- Page Heading -->
	                <div class="d-sm-flex align-items-center justify-content-between mb-4">
	                    <h1 class="h3 mb-0 text-gray-800">자주찾는 질문</h1>
	                </div>
	                
	                <form action="question.jsp" name="frmSearch" id="frmSearch">
	                <div style = "display: flex;">
	                	<select name="field" id="field" class = "form-control form-control-user" style = "width: 150px; margin-right: 20px;">
	                		<option value = "NA">구분 선택</option>
	                		<c:forEach var="bVO" items="${ categories }" varStatus="i">
                			<option value = "${ bVO.categoryName }"${ param.field eq bVO.categoryName?" selected='selected'":"" }>
                				<c:out value="${ bVO.categoryName }"/></option>
	                		</c:forEach>
	                	</select>
	                	<input type = "text" name="keyword" id="keyword" value="${ param.keyword }" class = "form-control form-control-user"
	                		style = "width: 500px; margin-right: 20px;" placeholder = "검색할 내용을 입력해주세요."/>
	                	<input type="text" style="display: none;">
	                	<input type = "button" id="btnSearch" class = "btn btn-primary btn-user btn-block" style = "width: 100px;" value = "검색">
	                </div>
	                </form>
	                
	                <div style = "height: 520px;">
		                <table class="table" style = "margin-top: 25px;">
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
		                	<c:forEach var="bVO" items="${ boards }" varStatus="j">
		                	<tr>
	                		<td><c:out value="${ totalCnt - (currentPage - 1) * pageScale - j.index }"/></td>
	                		<td><c:out value="${ bVO.categoryName }"/></td>
	                		<td><a href="questionDetail.jsp?num=${ bVO.boardNumber }&currentPage=${ empty param.currentPage ?1:param.currentPage }">
	                			<c:out value="${ bVO.boardTitle }"/></a></td>
	                		<td><c:out value="${ bVO.boardDate }"/></td>
	                		<td><c:out value="${ bVO.boardViews }"/></td>
	                		</tr>
	                		</c:forEach>
	                	</tbody>
		                </table>
	                </div>
	                
	                <div style="display: flex; justify-content: space-between; margin-top: 30px;">
						<span style="display: flex; align-items: flex-end; margin: auto;">
							<c:choose>
							    <c:when test="${ param.field eq 'NA'}">
							        <c:set var="link" value=""/>
							    </c:when>
							    <c:otherwise>
							        <c:set var="link" value="&field=${ param.field }"/>
							    </c:otherwise>
							</c:choose>
							<c:if test ="${ not empty param.keyword }">
								<c:set var="link2" value="&keyword=${ param.keyword }"/>
							</c:if>
							<% for(int i = 1; i <= totalPage; i++) { %>
								<input type="button" class="btn btn-primary btn-user btn-block"
									style="width: 40px; height: 40px; margin-right: 10px; margin-bottom: 10px;"
									value="<%= i %>" onclick="location.href='question.jsp?currentPage=<%= i %>${ link }${ link2 }'">
							<% } // end for %>
						</span>
						<span style="align-self: flex-end;">
							<input type="button" class="btn btn-primary btn-user btn-block" style="width: 120px; margin-bottom: 10px;" value="글쓰기" id = "btnWrite">
						</span>
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

    <!-- notice page css, script -->
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
			$("#btnSearch").click(function() {
				$("#frmSearch").submit();
			}); // click
			
			$("#keyword").keydown(function(evt) {
				if(evt.which == 13) {
					$("#frmSearch").submit();
				} // end if
			}); // click
			
			$("#btnWrite").click(function(){
				location.href = "questionWrite.jsp";
			}); // click
		}); // ready
		
	</script>
	<!-- notice page css, script -->
    
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