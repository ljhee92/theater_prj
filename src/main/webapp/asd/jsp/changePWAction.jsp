<%@page import="java.sql.SQLException"%>
<%@page import="user.VO.UserVO"%>
<%@page import="user.DAO.LoginDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8" 
 info="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="http://192.168.10.227/jsp_prj/common/favicon.ico"/>
<!--bootstrap 시작-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<!--bootstrap 끝-->
<link rel="stylesheet" href="http://192.168.10.227/jsp_prj/common/css/main.css">
<link rel="stylesheet" href="http://192.168.10.227/jsp_prj/common/css/board.css">
<!--jQeury CDN 시작-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
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
        String id = request.getParameter("id");
        String pw = request.getParameter("pw");


        try {

            LoginDAO lDAO = LoginDAO.getInstance();
            UserVO uVO = UserVO.builder()
            		.userId(id)
            		.userPassword(pw)
            		.build();
            
            boolean result = lDAO.updatePW(uVO);

            
        	 
            if (result) { // result가 true라면 변경 성공
            	

        %>
        <script type="text/javascript">
            alert("비밀번호가 성공적으로 변경되었습니다.");
            window.close();
        </script>
        <%}else{%> 
        
            <script type="text/javascript">


            alert("로그인 변경에 실패하였습니다 다시 확인해주세요.");
            window.history.back();
        </script>
        
        <%}


        }catch (SQLException e) {
        	e.printStackTrace();
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