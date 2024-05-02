
<%@page import="java.sql.SQLException"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.Catch"%>
<%@page import="user.VO.UserVO"%>
<%@page import="user.DAO.LoginDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info=""%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="http://192.168.10.227/jsp_prj/common/favicon.ico" />
<!--bootstrap 시작-->
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
    crossorigin="anonymous">
<script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
    crossorigin="anonymous"></script>
<!--bootstrap 끝-->
<link rel="stylesheet"
    href="http://192.168.10.227/jsp_prj/common/css/main.css">
<link rel="stylesheet"
    href="http://192.168.10.227/jsp_prj/common/css/board.css">
<!--jQeury CDN 시작-->
<script
    src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!--jQeury CDN 끝-->
<style type="text/css">
</style>
<script type="text/javascript">
    $(function() {

    });//ready
</script>
</head>
<body>
    <div>
        <%
        String id = request.getParameter("txtUserId");
        String pw = request.getParameter("txtPassword");

        String prevPage = request.getParameter("prevPage");

        try {

            LoginDAO lDAO = LoginDAO.getInstance();
            UserVO uVO = UserVO.builder().userId(id).userPassword(pw).build();
            UserVO result = lDAO.Login(uVO);
            String checkTempFlag = result.getUserTemporaryFlag() + "";
            
        	 
            if (result != null) { // result가 null이 아니라면 로그인성공
            	
            	
        
        session.setAttribute("id", result.getUserId());// 세션 설정
 

         if (result.getUserTemporaryFlag() == 'Y') {// 비밀번호변경flag가 Y일 경우 알람창 출력
        %>
        <script type="text/javascript">
            alert("임시비밀번호로 로그인하셨습니다. \n마이페이지에서 비밀번호를 변경해주세요.");

        </script>
        <%}//endif%> 
        
            <script type="text/javascript">

            var prevPage = "<%= prevPage %>";
            var userName = "<%= result.getUserName()%>";
            alert(userName+"님 띵화관에 오신것을 환영합니다 ^o^");
            location.href=prevPage;
        </script>
        
       <% }

        

        } catch (NullPointerException e) {
        %>
        <!-- 로그인 실패 시 이전 페이지로 이동 -->
        <script type="text/javascript">
            alert("로그인 실패\n 아이디와 비밀번호를 확인해주세요.");
            window.history.back();
        </script>

        <%
        } catch (SQLException e) {
        %>
        <script type="text/javascript">
            alert("죄송합니다. 서버 오류가 발생했습니다.");
        </script>
        <%

        }
        %>
    </div>
</body>
</html>