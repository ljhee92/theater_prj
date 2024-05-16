package admin;

import java.sql.SQLException;
import java.util.List;


public class Main {
    public static void main(String[] args) {
    	DashboardDAO dashboardDAO = DashboardDAO.getInstance();
        try {
            int lastTotalAudience = dashboardDAO.selectLastMonthTotalAudience();
            int currentTotalAudience = dashboardDAO.selectCurrentMonthTotalAudience();
            int todayTotalAudience = dashboardDAO.selectTodayTotalAudience();
            List<MovieReservationVO> ranking = dashboardDAO.getMovieReservationRankingLastMonth();
            List<MovieReservationVO> ranking2 = dashboardDAO.getMovieReservationRankingCurrentMonth();
            System.out.println(dashboardDAO.selectVisitant());


			
			
		
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}