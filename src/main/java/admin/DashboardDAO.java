package admin;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.YearMonth;
import java.util.ArrayList;
import java.util.List;

import util.DbConnection;



public class DashboardDAO {
	private static DashboardDAO dDAO;
	public static DashboardDAO getInstance() {
		if (dDAO == null) {
			dDAO = new DashboardDAO();
		} // end if
		return dDAO;
	}
	
	
	public void updateVisitant() throws SQLException {
	    DbConnection dbcon = DbConnection.getInstance();
	    Connection con = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;

	    try {
	        // 1. 데이터베이스 접속 정보
	        String id = "son";
	        String pass = "jimin";

	        // 2. 데이터베이스 연결
	        con = dbcon.getConnection(id, pass);

	        // 3. SQL 쿼리 준비
	        String updateQuery = "UPDATE Visit SET Visit_count = Visit_count + 1";
	        pstmt = con.prepareStatement(updateQuery);

	        // 4. 쿼리 실행 및 결과 처리
	        pstmt.executeUpdate();

	    } finally {
	        // 5. 리소스 해제
	        dbcon.dbClose(rs, pstmt, con);
	    }

	}
	
	public int selectVisitant() throws SQLException {
	    DbConnection dbcon = DbConnection.getInstance();
	    Connection con = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    int visitant = 0;

	    try {
	        // 1. 데이터베이스 접속 정보
	        String id = "son";
	        String pass = "jimin";

	        // 2. 데이터베이스 연결
	        con = dbcon.getConnection(id, pass);

	        // 3. SQL 쿼리 준비
	        String selectQuery = "select Visit_count from Visit ";
	        pstmt = con.prepareStatement(selectQuery);

	        // 4. 쿼리 실행 및 결과 처리
	        rs = pstmt.executeQuery();
	        if (rs.next()) {
	            visitant = rs.getInt("visit_count");
	        }
	    } finally {
	        // 5. 리소스 해제
	        dbcon.dbClose(rs, pstmt, con);
	    }
	    return visitant;
	}
	
	
	
	public int selectLastMonthTotalAudience() throws SQLException {
	    int totalAudience = 0;
	    DbConnection dbcon = DbConnection.getInstance();
	    Connection con = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;

	    try {
	        // 1. 데이터베이스 접속 정보
	        String id = "son";
	        String pass = "jimin";

	        // 2. 데이터베이스 연결
	        con = dbcon.getConnection(id, pass);

	        // 3. SQL 쿼리 준비
	        String selectQuery = "SELECT COUNT(*) AS total_audience " +
	                             "FROM reservation rv " +
	                             "JOIN screening s ON rv.screening_code = s.screening_code " +
	                             "WHERE s.screening_date >= ? AND s.screening_date <= ?";
	        pstmt = con.prepareStatement(selectQuery);

	        // 현재 날짜를 기준으로 지난달의 첫째 날과 마지막 날을 계산
	        LocalDate currentDate = LocalDate.now();
	        YearMonth previousMonth = YearMonth.from(currentDate).minusMonths(1);
	        LocalDate startDate = previousMonth.atDay(1);
	        LocalDate endDate = previousMonth.atEndOfMonth();

	        // 4. 파라미터 설정
	        pstmt.setDate(1, Date.valueOf(startDate));
	        pstmt.setDate(2, Date.valueOf(endDate));

	        // 5. 쿼리 실행 및 결과 처리
	        rs = pstmt.executeQuery();
	        if (rs.next()) {
	            totalAudience = rs.getInt("total_audience");
	        }
	    } finally {
	        // 6. 리소스 해제
	        dbcon.dbClose(rs, pstmt, con);
	    }

	    return totalAudience;
	}
	
	public List<MovieReservationVO> getMovieReservationRankingLastMonth() throws SQLException {
        List<MovieReservationVO> ranking = new ArrayList<>();
        DbConnection dbcon = DbConnection.getInstance();
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // 1. 데이터베이스 접속 정보
            String id = "son";
            String pass = "jimin";

            // 2. 데이터베이스 연결
            con = dbcon.getConnection(id, pass);

            // 3. SQL 쿼리 준비
            String selectQuery = "SELECT m.movie_title, COUNT(*) AS reservation_count " +
                    "FROM movie m " +
                    "JOIN screening s ON s.movie_code = m.movie_code " +
                    "JOIN reservation r ON r.screening_code = s.screening_code " +
                    "WHERE r.reservation_date >= ? AND r.reservation_date <= ? " +
                    "GROUP BY m.movie_title " +
                    "ORDER BY reservation_count DESC";
            pstmt = con.prepareStatement(selectQuery);

            // 현재 날짜를 기준으로 지난달의 첫째 날과 마지막 날을 계산
            LocalDate currentDate = LocalDate.now();
            YearMonth currentMonth = YearMonth.from(currentDate);
            YearMonth previousMonth = currentMonth.minusMonths(1);
            LocalDate startDate = previousMonth.atDay(1);
            LocalDate endDate = previousMonth.atEndOfMonth();

            // 4. 파라미터 설정
            pstmt.setDate(1, java.sql.Date.valueOf(startDate));
            pstmt.setDate(2, java.sql.Date.valueOf(endDate));

            // 5. 쿼리 실행 및 결과 처리
            rs = pstmt.executeQuery();
            int rank = 1;
            while (rs.next()) {
                String movieTitle = rs.getString("movie_title");
                int reservationCount = rs.getInt("reservation_count");
                ranking.add(new MovieReservationVO(rank, movieTitle, reservationCount));
                rank++;
            }
        } finally {
            // 6. 리소스 해제
            dbcon.dbClose(rs, pstmt, con);
        }
        
        return ranking;
    }
	
	public List<MovieReservationVO> getMovieReservationRankingCurrentMonth() throws SQLException {
        List<MovieReservationVO> ranking = new ArrayList<>();
        DbConnection dbcon = DbConnection.getInstance();
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // 1. 데이터베이스 접속 정보
            String id = "son";
            String pass = "jimin";

            // 2. 데이터베이스 연결
            con = dbcon.getConnection(id, pass);

            // 3. SQL 쿼리 준비
            String selectQuery = "SELECT m.movie_title, COUNT(*) AS reservation_count " +
                    "FROM movie m " +
                    "JOIN screening s ON s.movie_code = m.movie_code " +
                    "JOIN reservation r ON r.screening_code = s.screening_code " +
                    "WHERE r.reservation_date >= ? AND r.reservation_date <= ? " +
                    "GROUP BY m.movie_title " +
                    "ORDER BY reservation_count DESC";
            pstmt = con.prepareStatement(selectQuery);

            // 현재 날짜를 기준으로 지난달의 첫째 날과 마지막 날을 계산
            LocalDate currentDate = LocalDate.now();
            YearMonth currentMonth = YearMonth.from(currentDate);
            LocalDate startDate = currentMonth.atDay(1);
            LocalDate endDate = currentMonth.atEndOfMonth();
            // 4. 파라미터 설정
            pstmt.setDate(1, java.sql.Date.valueOf(startDate));
            pstmt.setDate(2, java.sql.Date.valueOf(endDate));
            // 5. 쿼리 실행 및 결과 처리
            rs = pstmt.executeQuery();
            int rank = 1;
            while (rs.next()) {
                String movieTitle = rs.getString("movie_title");
                int reservationCount = rs.getInt("reservation_count");
                ranking.add(new MovieReservationVO(rank, movieTitle, reservationCount));
                rank++;
            }
        } finally {
            // 6. 리소스 해제
            dbcon.dbClose(rs, pstmt, con);
        }
        
        return ranking;
    }
	
	public List<MovieReservationVO> getMovieReservationRankingToday() throws SQLException {
        List<MovieReservationVO> ranking = new ArrayList<>();
        DbConnection dbcon = DbConnection.getInstance();
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // 1. 데이터베이스 접속 정보
            String id = "son";
            String pass = "jimin";

            // 2. 데이터베이스 연결
            con = dbcon.getConnection(id, pass);

            // 3. SQL 쿼리 준비
            String selectQuery = "SELECT m.movie_title, COUNT(*) AS reservation_count " +
                    "FROM movie m " +
                    "JOIN screening s ON s.movie_code = m.movie_code " +
                    "JOIN reservation r ON r.screening_code = s.screening_code " +
                    "WHERE TRUNC(r.reservation_date) = TO_DATE(?, 'YYYY-MM-DD') " +
                    "GROUP BY m.movie_title " +
                    "ORDER BY reservation_count DESC";
            pstmt = con.prepareStatement(selectQuery);

            // 현재 날짜를 기준으로 지난달의 첫째 날과 마지막 날을 계산
            LocalDate currentDate = LocalDate.now();

            // 4. 파라미터 설정
            pstmt.setString(1, currentDate.toString());

            // 5. 쿼리 실행 및 결과 처리
            rs = pstmt.executeQuery();
            int rank = 1;
            while (rs.next()) {
                String movieTitle = rs.getString("movie_title");
                int reservationCount = rs.getInt("reservation_count");
                ranking.add(new MovieReservationVO(rank, movieTitle, reservationCount));
                rank++;
            }
        } finally {
            // 6. 리소스 해제
            dbcon.dbClose(rs, pstmt, con);
        }
        
        return ranking;
    }
	

	
	public int selectCurrentMonthTotalAudience() throws SQLException {
        int totalAudience = 0;
        DbConnection dbcon = DbConnection.getInstance();
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // 1. 데이터베이스 접속 정보
            String id = "son";
            String pass = "jimin";

            // 2. 데이터베이스 연결
            con = dbcon.getConnection(id, pass);

            // 3. SQL 쿼리 준비
            String selectQuery = "SELECT COUNT(*) AS total_audience " +
                    "FROM reservation rv " +
                    "JOIN screening s ON rv.screening_code = s.screening_code " +
                    "WHERE s.screening_date >= ? AND s.screening_date <= ?";
            pstmt = con.prepareStatement(selectQuery);

            // 현재 날짜를 기준으로 지난달의 첫째 날과 마지막 날을 계산
            LocalDate currentDate = LocalDate.now();
            YearMonth currentMonth = YearMonth.from(currentDate);
            LocalDate startDate = currentMonth.atDay(1);
            LocalDate endDate = currentMonth.atEndOfMonth();

            // 4. 파라미터 설정
            pstmt.setDate(1, Date.valueOf(startDate));
            pstmt.setDate(2, Date.valueOf(endDate));

            // 5. 쿼리 실행 및 결과 처리
            rs = pstmt.executeQuery();
            if (rs.next()) {
                totalAudience = rs.getInt("total_audience");
            }
        } finally {
            // 6. 리소스 해제
            dbcon.dbClose(rs, pstmt, con);
        }

        return totalAudience;
    }
	
	public int selectTotalAudience() throws SQLException {
		int totalAudience = 0;
		DbConnection dbcon = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			// 1. 데이터베이스 접속 정보
			String id = "son";
			String pass = "jimin";
			
			// 2. 데이터베이스 연결
			con = dbcon.getConnection(id, pass);
			
			// 3. SQL 쿼리 준비
			String selectQuery = "SELECT COUNT(*) AS total_audience " +
                    "FROM reservation ";
			pstmt = con.prepareStatement(selectQuery);
			
			// 현재 날짜를 기준으로 지난달의 첫째 날과 마지막 날을 계산
			LocalDate currentDate = LocalDate.now();

			
			// 4. 파라미터 설정
			
			// 5. 쿼리 실행 및 결과 처리
			rs = pstmt.executeQuery();
			if (rs.next()) {
				totalAudience = rs.getInt("total_audience");
			}
		} finally {
			// 6. 리소스 해제
			dbcon.dbClose(rs, pstmt, con);
		}
		
		return totalAudience;
	}
	
	public int selectTodayTotalAudience() throws SQLException {
		int totalAudience = 0;
		DbConnection dbcon = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			// 1. 데이터베이스 접속 정보
			String id = "son";
			String pass = "jimin";
			
			// 2. 데이터베이스 연결
			con = dbcon.getConnection(id, pass);
			
			// 3. SQL 쿼리 준비
			String selectQuery = "SELECT COUNT(*) AS total_audience " +
                    "FROM reservation rv " +
                    "JOIN screening s ON rv.screening_code = s.screening_code " +
                    "WHERE s.screening_date = ?";
			pstmt = con.prepareStatement(selectQuery);
			
			// 현재 날짜를 기준으로 지난달의 첫째 날과 마지막 날을 계산
			LocalDate currentDate = LocalDate.now();

			
			// 4. 파라미터 설정
			pstmt.setDate(1, Date.valueOf(currentDate));
			
			// 5. 쿼리 실행 및 결과 처리
			rs = pstmt.executeQuery();
			if (rs.next()) {
				totalAudience = rs.getInt("total_audience");
			}
		} finally {
			// 6. 리소스 해제
			dbcon.dbClose(rs, pstmt, con);
		}
		
		return totalAudience;
	}
	
	

	
	
	
	
	

}