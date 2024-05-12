<%@page import="admin.AdminUserManageDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="admin.UserVO"%>
<%@page import="java.util.List"%>
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



.form-control::placeholder {
    color: gray;
}

.searchMember {
    display: flex; /* 부모 요소를 플렉스 컨테이너로 설정 */
    align-items: center; /* 수직 가운데 정렬 */
}

.input-group {
    flex: 1; /* 자식 요소가 남은 공간을 균등하게 차지하도록 설정 */
}

</style>
<script type = "text/javascript">
	$(function() {

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
	                    <h1 class="h3 mb-0 text-gray-800">회원관리</h1>
	                </div>
				</div>
                <!-- /.container-fluid -->
                
                
                
                
                
                <!-- 회원관리 밑 컨텐츠 -->
                <div id="memberTableContent">
                
                	<!-- 검색 폼 -->
                	<form id="searchMemberForm">
                	
                		<!-- 검색 inputText와 button을 감싸는 div -->
						<div class="searchMember" style="width:300px; margin-left: 25px;">
        						<!-- 입력란 -->
        						<div class="input-group mb-3">
        						<input type="text" class="form-control" id="searchMemberId" placeholder="회원 아이디 입력" />
        						
    						</div>
        						<div id="searchBtn" style="margin-left: 15px; margin-bottom: auto;">
        						<!-- 버튼 -->
        						<button type="button" class="btn btn-primary" id="searchMemberBtn">검색</button>
        						</div>
    						</div>
						</div>
						
						<!-- 테이블 -->
						<table class="table table-striped">
							<thead>
								<tr>
									<th>회원 아이디</th>
									<th>성명</th>
									<th>생년월일</th>
									<th>전화번호</th>
								</tr>
							</thead>
							<tbody id="memberTable">
							<!--  DB 값 가져오기 SelectAllUserList -->
								<%
									//1. List 값 가져오기 위한 리스트 생성
									List<UserVO> userList = new ArrayList<UserVO>();
									//2. DAO객체 생성
									AdminUserManageDAO aumDAO = AdminUserManageDAO.getInstance();
									//3. 반환형이 list인 selectAllUserList의 값을 userList에 저장
									userList = aumDAO.selectAllUserList();
									//4. userList에 존재하는 값을 UserVO로 가져오기 위해 UserVO를 초기화
									UserVO uVO = null;
								%>
								<%for(int i=0; i < userList.size(); i++){%>
								<tr>
								<!-- 5. uVO에 userList의 i 번째 인덱스에 해당하는 값을 저장 -->
								<% uVO = userList.get(i);%>
									<td><%= uVO.getUserId() %></td>
									<td><%= uVO.getUserName() %></td>
									<td><%= uVO.getUserBirthday() %></td>
									<td><%= uVO.getUserPhone() %></td>
								</tr>
								<%}%>
							</tbody>
						</table>
                	</form>
                </div>
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
    <script src="./"></script>
</body>
</html>