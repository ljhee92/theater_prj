<%@page import="java.io.Console"%>
<%@page import="VO.SearchVO"%>
<%@page import="user.DAO.BoardDAO"%>
<%@page import="VO.BoardVO"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    
<%
BoardDAO bDAO = BoardDAO.getInstance();
String category = request.getParameter("category");
String FAQS = request.getParameter("FAQS");
String startNum = request.getParameter("startNum");
String endNum = request.getParameter("endNum");

List<BoardVO> postList = bDAO.selectOneCategory(startNum, endNum, FAQS, category);

//콘솔에 값 출력
System.out.println("Category: " + category);
System.out.println("FAQS: " + FAQS);
System.out.println("StartNum: " + startNum);
System.out.println("EndNum: " + endNum);
System.out.println("Post List: " + postList);
%>
