<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@page import="admin.DashboardDAO"%>
<%@page import="admin.MovieReservationVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info = "명화관 관리자 대시보드" %>
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
	
</style>
<script type = "text/javascript">
	$(function() {

	}); // ready
</script>
</head>
<body id="page-top">

	<!-- S 로그인 세션 확인  -->
	<%
	// 세션에서 로그인 여부 확인
	String id = (String) session.getAttribute("adminId");
	if (id == null) {// 로그인되지 않은 경우 로그인 페이지로 리디렉션
	%>
	<script type="text/javascript">
    window.location.href = "login.jsp?prevPage=dashboard.jsp";
    </script>
	<%
	}
	%>
	<!-- E 로그인 세션 확인  -->






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
                        <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
                    </div>

                    <!-- Content Row 1 -->
                    <div class="row">
                    <%
                            DashboardDAO dashboardDAO = DashboardDAO.getInstance();
		                    int lastMonthTotalAudience = 0;
		                    int currentMonthTotalAudience = 0;
		                    int todayTotalAudience = 0;
		                    int totalAudience = 0;
                            
                            try {
                                lastMonthTotalAudience = dashboardDAO.selectLastMonthTotalAudience();
                                currentMonthTotalAudience = dashboardDAO.selectCurrentMonthTotalAudience();
                                todayTotalAudience = dashboardDAO.selectTodayTotalAudience();
                                totalAudience = dashboardDAO.selectTotalAudience();
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                            
                            double ratio = ((double)currentMonthTotalAudience / lastMonthTotalAudience) * 100;
                        %>

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                지난달 총 관람객수</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">
												<%= lastMonthTotalAudience %>
											</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-success shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                이번달 총 관람객수</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">
                                            <%= currentMonthTotalAudience %>
											</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        

                        <!-- Pending Requests Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-warning shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                                오늘 총 관람객수</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">
                                            <%= todayTotalAudience %>
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-comments fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-info shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="row no-gutters align-items-center">
										    <div class="col mr-2">
										        <div class="text-xs font-weight-bold text-info text-uppercase mb-1">지난 달 대비</div>
										        <div class="row no-gutters align-items-center">
										            <div class="col-auto">
										                <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">
										                    <%= String.format("%.1f", ratio) + "%" %>
										                </div>
										            </div>
										            <div class="col">
										                <% double progressWidth = ((double) ratio / 100) * 100; %>
										                <div class="progress progress-sm mr-2">
										                    <div class="progress-bar bg-info" role="progressbar"
										                        style="width: <%= progressWidth %>%" aria-valuenow="<%= ratio %>" aria-valuemin="0"
										                        aria-valuemax="100"></div>
										                </div>
										            </div>
										        </div>
										    </div>
										    <div class="col-auto">
										        <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
										    </div>
										</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /Content Row 1 -->
                    
                    <!-- Content Row 2 -->
                    <div class="row">
					<%
					 List<MovieReservationVO> ranking = dashboardDAO.getMovieReservationRankingLastMonth();
					%>
                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
						    <div class="card border-left-primary shadow h-100 py-2">
						        <div class="card-body">
						            <div class="row no-gutters align-items-center">
						                <div class="col mr-2">
						                    <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
						                        지난달 예매순위</div>
						                    <div class="h6 mb-0 font-weight-bold text-gray-800">
						                        <%
						                        for (int i = 0; i < Math.min(3, ranking.size()); i++) {
						                            MovieReservationVO reservation = ranking.get(i);
						                        %>
						                            <div>
						                                <%= i+1 %>위 <%= reservation.getMovieTitle() %> <%= reservation.getReservationCount() %>건
						                            </div>
						                        <%
						                        }
						                        %>
						                    </div>
						                </div>
						                <div class="col-auto">
						                    <i class="fas fa-calendar fa-2x text-gray-300"></i>
						                </div>
						            </div>
						        </div>
						    </div>
						</div>

                        <!-- Earnings (Monthly) Card Example -->
                        <%
					 List<MovieReservationVO> ranking2 = dashboardDAO.getMovieReservationRankingCurrentMonth();
					%>
                        <div class="col-xl-3 col-md-6 mb-4">
						    <div class="card border-left-primary shadow h-100 py-2">
						        <div class="card-body">
						            <div class="row no-gutters align-items-center">
						                <div class="col mr-2">
						                    <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
						                        이번달 예매순위</div>
						                    <div class="h6 mb-0 font-weight-bold text-gray-800">
						                        <%
						                        for (int i = 0; i < Math.min(3, ranking2.size()); i++) {
						                            MovieReservationVO reservation = ranking2.get(i);
						                        %>
						                            <div>
						                                <%= i+1 %>위 <%= reservation.getMovieTitle() %> <%= reservation.getReservationCount() %>건
						                            </div>
						                        <%
						                        }
						                        %>
						                    </div>
						                </div>
						                <div class="col-auto">
						                    <i class="fas fa-calendar fa-2x text-gray-300"></i>
						                </div>
						            </div>
						        </div>
						    </div>
						</div>



                        

                        <!-- Pending Requests Card Example -->
                        <%
					 List<MovieReservationVO> ranking3 = dashboardDAO.getMovieReservationRankingToday();
					%>
                        <div class="col-xl-3 col-md-6 mb-4">
						    <div class="card border-left-primary shadow h-100 py-2">
						        <div class="card-body">
						            <div class="row no-gutters align-items-center">
						                <div class="col mr-2">
						                    <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
						                        오늘 예매순위</div>
						                    <div class="h6 mb-0 font-weight-bold text-gray-800">
						                        <%
						                        for (int i = 0; i < Math.min(3, ranking3.size()); i++) {
						                            MovieReservationVO reservation = ranking3.get(i);
						                        %>
						                            <div>
						                                 <%= i+1 %>위 <%= reservation.getMovieTitle() %> <%= reservation.getReservationCount() %>건
						                            </div>
						                        <%
						                        }
						                        %>
						                    </div>
						                </div>
						                <div class="col-auto">
						                    <i class="fas fa-calendar fa-2x text-gray-300"></i>
						                </div>
						            </div>
						        </div>
						    </div>
						</div>
                        
                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-info shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">준비중입니다
                                            </div>
                                            <!-- <div class="row no-gutters align-items-center">
                                                <div class="col-auto">
                                                    <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
                                                </div>
                                                <div class="col">
                                                    <div class="progress progress-sm mr-2">
                                                        <div class="progress-bar bg-info" role="progressbar"
                                                            style="width: 50%" aria-valuenow="50" aria-valuemin="0"
                                                            aria-valuemax="100"></div>
                                                    </div>
                                                </div>
                                            </div> -->
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /Content Row 2 -->
                    
                    <!-- Content Row 3 -->
                    <div class="row">

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                방문한 인원 수</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">
                                            <%=dashboardDAO.selectVisitant() %>
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-success shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                총 예매 수</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">
                                            <%=totalAudience %>
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-info shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">준비중입니다
                                            </div>
                                            <!-- <div class="row no-gutters align-items-center">
                                                <div class="col-auto">
                                                    <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
                                                </div>
                                                <div class="col">
                                                    <div class="progress progress-sm mr-2">
                                                        <div class="progress-bar bg-info" role="progressbar"
                                                            style="width: 50%" aria-valuenow="50" aria-valuemin="0"
                                                            aria-valuemax="100"></div>
                                                    </div>
                                                </div>
                                            </div> -->
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Pending Requests Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-warning shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                                준비중입니다</div>
                                            <!-- <div class="h5 mb-0 font-weight-bold text-gray-800">18</div> -->
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-comments fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /Content Row 3 -->
            </div>
            <!-- End of Main Content -->

            <%@ include file = "footer.jsp" %>

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->
</div>
    <!-- Bootstrap core JavaScript-->
    <script src="../vendor/jquery/jquery.js"></script>
    <script src="../vendor/bootstrap/js/bootstrap.bundle.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="../vendor/jquery-easing/jquery.easing.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="../js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="../vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="../js/demo/chart-area-demo.js"></script>
    <script src="../js/demo/chart-pie-demo.js"></script>
</body>
</html>