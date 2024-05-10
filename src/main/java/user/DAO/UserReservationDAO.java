package user.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import VO.BoardVO;
import VO.SearchVO;
import user.VO.UserReservationVO;
import util.DbConnection;

public class UserReservationDAO {
		// -------- Singleton start---------
	private static UserReservationDAO urDAO;

	private UserReservationDAO() {

	}

	public static UserReservationDAO getInstance() {
		if (urDAO == null) {
			urDAO = new UserReservationDAO();
		}
		return urDAO;
	}// getInstance
		// --------Singleton end-----------
	

	/**
	 * 마이페이지에서 나의예매내역에 들어가면 호출될 메서드
	 * 
	 * @param 유저 id
	 * @return 유저예매정보가 담긴 리스트
	 * @throws SQLException
	 */
	public List<UserReservationVO> selectUserReservation(String userId) throws SQLException{
		List<UserReservationVO> list = new ArrayList<UserReservationVO>();
		DbConnection dbcon = DbConnection.getInstance();
		UserReservationVO urVO= null;
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
	        String selectQuery = "	SELECT  r.RESERVATION_NUMBER, r.RESERVATION_DATE, m.MOVIE_TITLE, m.MOVIE_POSTER_PATH, s.THEATER_NAME,to_date(s.SCREENING_DATE,'yyyy-mm-dd') SCREENING_DATE, re.SEAT_LOWNUMBER , re.SEAT_COLNUMBER, p.TOTAL_PRICE	"
	        		+ "	FROM RESERVATION r	"
	        		+ "	INNER JOIN SCREENING s ON r.SCREENING_CODE = s.SCREENING_CODE	"
	        		+ "	INNER JOIN MOVIE m ON s.MOVIE_CODE = m.MOVIE_CODE	"
	        		+ "	INNER JOIN RESERVED_SEAT re ON r.RESERVATION_NUMBER = re.RESERVATION_NUMBER	"
	        		+ "	INNER JOIN PAYMENT p ON r.RESERVATION_NUMBER = p.RESERVATION_NUMBER	"
	        		+ "	WHERE r.USER_ID = ?	"
	        		+ "	order by RESERVATION_DATE desc	 ";
			pstmt = con.prepareStatement(selectQuery);
			pstmt.setString(1, userId);

			// 4. 쿼리 실행 및 결과 처리
			rs = pstmt.executeQuery();
		
			while (rs.next()) {
				urVO = null;
				urVO = UserReservationVO.builder()
					   .reservationNumber(rs.getString("RESERVATION_NUMBER"))
					   .reservationDate(rs.getDate("RESERVATION_DATE"))
					   .movieTitle(rs.getString("MOVIE_TITLE"))
					   .moviePosterPath(rs.getString("MOVIE_POSTER_PATH"))
					   .theaterName(rs.getString("THEATER_NAME"))
					   .screeningDate(rs.getDate("SCREENING_DATE"))
					   .seatLownumber(rs.getString("SEAT_LOWNUMBER"))
					   .seatColnumber(rs.getString("SEAT_COLNUMBER"))
					   .totalPrice(rs.getInt("TOTAL_PRICE"))
					   .build();
				
				
				
				list.add(urVO);
				
				
			}
		} finally {
			// 6. 리소스 해제
			dbcon.dbClose(rs, pstmt, con);
		}

		return list;
	}//selectUserReservation
	
	
	
	
	
	
	/**
	 * 마이페이지에서 나의예매내역에 들어가면 호출될 메서드
	 * 
	 * @param 유저 id
	 * @return 유저예매정보가 담긴 리스트
	 * @throws SQLException
	 */
	public List<UserReservationVO> selectUserReservationDetail(String reservationNumber) throws SQLException{
		List<UserReservationVO> list = new ArrayList<UserReservationVO>();
		DbConnection dbcon = DbConnection.getInstance();
		UserReservationVO urVO= null;
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
			StringBuilder queryBuilder = new StringBuilder();
			queryBuilder.append("SELECT ")
            .append("r.RESERVATION_NUMBER, ")
            .append("m.MOVIE_TITLE, ")
            .append("m.MOVIE_POSTER_PATH, ")
            .append("s.THEATER_NAME, ")
            .append("s.THEATER_NUMBER, ")
            .append("TO_DATE(s.SCREENING_DATE, 'yyyy-mm-dd') AS SCREENING_DATE, ")
            .append("st.SCREENING_TIME, ")
            .append("re.SEAT_LOWNUMBER, ")
            .append("re.SEAT_COLNUMBER, ")
            .append("p.TOTAL_PRICE, ")
            .append("pm.PAYMENT_METHOD ")
            .append("FROM ")
            .append("RESERVATION r ")
            .append("INNER JOIN ")
            .append("SCREENING s ON r.SCREENING_CODE = s.SCREENING_CODE ")
            .append("INNER JOIN ")
            .append("MOVIE m ON s.MOVIE_CODE = m.MOVIE_CODE ")
            .append("INNER JOIN ")
            .append("RESERVED_SEAT re ON r.RESERVATION_NUMBER = re.RESERVATION_NUMBER ")
            .append("INNER JOIN ")
            .append("PAYMENT p ON r.RESERVATION_NUMBER = p.RESERVATION_NUMBER ")
            .append("INNER JOIN ")
            .append("SCREENING_TIME st ON s.SCREENING_ROUND = st.SCREENING_ROUND ")
            .append("INNER JOIN ")
            .append("PAYMENT_METHOD pm ON p.PAYMENT_METHOD_NUMBER = pm.PAYMENT_METHOD_NUMBER ")
            .append("WHERE ")
            .append("r.RESERVATION_NUMBER = ?");

			String query = queryBuilder.toString();
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, reservationNumber);

			// 4. 쿼리 실행 및 결과 처리
			rs = pstmt.executeQuery();
		
			while (rs.next()) {
				urVO = null;
				urVO = UserReservationVO.builder()
					   .reservationNumber(rs.getString("RESERVATION_NUMBER"))
					   .movieTitle(rs.getString("MOVIE_TITLE"))
					   .moviePosterPath(rs.getString("MOVIE_POSTER_PATH"))
					   .theaterName(rs.getString("THEATER_NAME"))
					   .theaterNumber(rs.getString("THEATER_NUMBER"))
					   .screeningDate(rs.getDate("SCREENING_DATE"))
					   .screeningTime(rs.getString("SCREENING_TIME"))
					   .seatLownumber(rs.getString("SEAT_LOWNUMBER"))
					   .seatColnumber(rs.getString("SEAT_COLNUMBER"))
					   .totalPrice(rs.getInt("TOTAL_PRICE"))
					   .paymentMethod(rs.getString("PAYMENT_METHOD"))	
					   .build();

				list.add(urVO);
				
				
			}
		
		} finally {
			// 6. 리소스 해제
			dbcon.dbClose(rs, pstmt, con);
		}

		return list;
	}//selectUserReservation
	
	
	
	
	/**
	 * 예매한 영화의 상영시작시간과 현재 시간을 비교하는 메서드 
	 * 
	 * @param 예매번호
	 * @return 유저예매정보가 담긴 객체
	 * @throws SQLException
	 */
	public UserReservationVO checkReservationTime(String reservationNumber) throws SQLException{
		UserReservationVO urVO = null;
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
			StringBuilder queryBuilder = new StringBuilder();
			queryBuilder
			.append("SELECT TO_DATE(s.SCREENING_DATE, 'yyyy-mm-dd') AS SCREENING_DATE, st.SCREENING_TIME ")
			.append("FROM RESERVATION r ")
			.append("INNER JOIN SCREENING s ON r.SCREENING_CODE = s.SCREENING_CODE ")
			.append("INNER JOIN SCREENING_TIME st ON s.SCREENING_ROUND = st.SCREENING_ROUND ")
			.append("WHERE r.RESERVATION_NUMBER = ?");


			String query = queryBuilder.toString();
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, reservationNumber);

			// 4. 쿼리 실행 및 결과 처리
			rs = pstmt.executeQuery();
		
			if (rs.next()) {
				urVO = null;
				urVO = UserReservationVO.builder()
					   .screeningDate(rs.getDate("SCREENING_DATE"))
					   .screeningTime(rs.getString("SCREENING_TIME"))
					   .build();

				
				
			}
		
		} finally {
			// 6. 리소스 해제
			dbcon.dbClose(rs, pstmt, con);
		}
		
		return urVO;
	}//selectUserReservation
	
	
	
	
	
	
	
	/**
	 * 예매한 영화의 상영시작시간과 현재 시간을 비교하는 메서드 
	 * 
	 * @param 예매번호
	 * @return 삭제 성공유무 
	 * @throws SQLException
	 */
	public boolean deleteReservation(String reservationNumber) throws SQLException{
		boolean result = false;
		DbConnection dbcon = DbConnection.getInstance();

		Connection con = null;
		PreparedStatement pstmt = null;

		

		try {
			// 1. 데이터베이스 접속 정보
			String id = "son";
			String pass = "jimin";

			// 2. 데이터베이스 연결
			con = dbcon.getConnection(id, pass);

			// 3. SQL 쿼리 준비
			String query = "DELETE FROM RESERVATION WHERE RESERVATION_NUMBER = ?";

			pstmt = con.prepareStatement(query);
			pstmt.setString(1, reservationNumber);

			// 4. 쿼리 실행 및 결과 처리
			int resultInt = pstmt.executeUpdate();
			
			if(resultInt==1) {
				result = true;
				
			}
		
		} finally {
			// 6. 리소스 해제
			dbcon.dbClose(null, pstmt, con);
		}
		
		return result;
	}//selectUserReservation

	
}
