<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%
	String sbid = (String)session.getAttribute("id");
%>
        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="http://localhost/theater_prj/asd/admin/jsp/dashboard.jsp">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3"><span><%=sbid%></span>님</div>
                <div class="sidebar-brand-text mx-3">로그인 중</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="http://localhost/theater_prj/asd/admin/jsp/dashboard.jsp">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>대시보드</span></a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="http://localhost/theater_prj/asd/admin/jsp/movie.jsp">
                    <i class="fas fa-fw fa-table"></i>
                    <span>영화관리</span></a>
            </li>
            
            <!-- Nav Item - 상영관리 -->
            <li class="nav-item">
                <a class="nav-link" href="http://localhost/theater_prj/asd/admin/jsp/screening.jsp">
                    <i class="fas fa-fw fa-table"></i>
                    <span>상영 관리</span></a>
            </li>
            
            <!-- Nav Item - 상영관관리 -->
            <li class="nav-item">
                <a class="nav-link" href="http://localhost/theater_prj/asd/admin/jsp/theater.jsp">
                    <i class="fas fa-fw fa-table"></i>
                    <span>상영관 관리</span></a>
            </li>
            
            <!-- Nav Item - 회원관리 -->
            <li class="nav-item">
                <a class="nav-link" href="http://localhost/theater_prj/asd/admin/jsp/member.jsp">
                    <i class="fas fa-fw fa-table"></i>
                    <span>회원 관리</span></a>
            </li>
            
            <!-- Nav Item - 예매관리 -->
            <li class="nav-item">
                <a class="nav-link" href="http://localhost/theater_prj/asd/admin/jsp/reservation.jsp">
                    <i class="fas fa-fw fa-table"></i>
                    <span>예매 관리</span></a>
            </li>

            <!-- Nav Item - 공지사항관리 -->
            <li class="nav-item">
                <a class="nav-link" href="http://localhost/theater_prj/asd/admin/jsp/notice.jsp">
                    <i class="fas fa-fw fa-table"></i>
                    <span>공지사항 관리</span></a>
            </li>
            
            <!-- Nav Item - 자주찾는질문 -->
            <li class="nav-item">
                <a class="nav-link" href="http://localhost/theater_prj/asd/admin/jsp/faq.jsp">
                    <i class="fas fa-fw fa-table"></i>
                    <span>자주찾는질문</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

        </ul>
        <!-- End of Sidebar -->