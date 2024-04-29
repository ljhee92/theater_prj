<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.util.*" %>
<%
    // 여기서 필요한 데이터를 생성하거나 가져오는 코드 작성
    Map<String, String> data = new HashMap<>();
    data.put("key1", "value1");
    data.put("key2", "value2");
    
    // 데이터를 JSON 형식으로 변환하여 응답
    response.setContentType("application/json");
    response.setCharacterEncoding("UTF-8");
    PrintWriter out = response.getWriter();
    out.print(new Gson().toJson(data)); // Gson 라이브러리를 사용하여 JSON으로 변환
    out.flush();
    out.close();
%>
