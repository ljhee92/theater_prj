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
				System.out.println("예매일 : "+urVO.getReservationDate());
				System.out.println("상영일 : "+urVO.getScreeningDate());
				
				
				list.add(urVO);
				
				
			}
		} finally {
			// 6. 리소스 해제
			dbcon.dbClose(rs, pstmt, con);
		}

		return list;
	}
	
	

	
}
