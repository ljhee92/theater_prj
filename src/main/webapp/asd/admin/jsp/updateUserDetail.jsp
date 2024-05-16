<%@page import="admin.AdminUserManageDAO"%>
<%@page import="admin.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="명화관 관리자 회원 정보 수정" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
</head>
<body>
<%
    String userId = request.getParameter("userId");
    String userName = request.getParameter("userName");
    String userBirthday = request.getParameter("userBirthday");
    String userPhone = request.getParameter("userPhone");
    
 	// 한글 데이터를 UTF-8로 디코딩
    userName = new String(userName.getBytes("ISO-8859-1"), "UTF-8");
    
    UserVO uVO = new UserVO();
    uVO.setUserId(userId);
    uVO.setUserName(userName);
    uVO.setUserBirthday(userBirthday);
    uVO.setUserPhone(userPhone);
    
    AdminUserManageDAO aumDAO = AdminUserManageDAO.getInstance();
    int result = aumDAO.updateUserDetail(uVO);
    
    if(result > 0) {
        out.println("<script>alert('수정이 완료되었습니다.'); location.href='member.jsp';</script>");
    } else {
        out.println("<script>alert('수정에 실패했습니다.'); history.go(-1);</script>");
    }
%>
</body>
</html>
