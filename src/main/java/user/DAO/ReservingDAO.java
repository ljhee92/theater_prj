package user.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import VO.ReservingVO;
import util.DbConnection;

public class ReservingDAO {
	
	private static ReservingDAO rDAO;
	
	private ReservingDAO() {
	} // TicketDAO
	
	public static ReservingDAO getInstance() {
		if(rDAO == null) {
			rDAO = new ReservingDAO();
		} // end if
		return rDAO;
	} // getInstance
	
	/**
	 * 영화의 상태가 상영 중인 상영일자만 가져오기
	 * @return
	 * @throws SQLException
	 */
	public List<ReservingVO> selectScreeningDate() throws SQLException {
		List<ReservingVO> screeningDates = new ArrayList<ReservingVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DbConnection dbCon = DbConnection.getInstance();
		
		try {
			String id = "son";
			String pass = "jimin";
			
			con = dbCon.getConnection(id, pass);
			
			StringBuilder selectScreeningDate = new StringBuilder();
			selectScreeningDate.append("select distinct s.screening_date ")
			.append("from screening s ")
			.append("inner join movie m ")
			.append("on s.movie_code = m.movie_code ")
			.append("where m.movie_screening_status = 'Y' ")
			.append("order by s.screening_date asc ");

			pstmt = con.prepareStatement(selectScreeningDate.toString());
			
			rs = pstmt.executeQuery();
			ReservingVO rsVO = null;
			while(rs.next()) {
				rsVO = ReservingVO.builder()
						.screeningDate(rs.getString("screening_date"))
						.build();
				screeningDates.add(rsVO);
			} // end while
		} finally {
			dbCon.dbClose(rs, pstmt, con);
		} // end finally

		return screeningDates;
	} // selectScreeningDate
	
	/**
	 * 등록되어있는 전체 상영관이름 가져오기
	 * @return
	 * @throws SQLException
	 */
	public List<ReservingVO> selectAllTheater() throws SQLException {
		List<ReservingVO> theaters = new ArrayList<ReservingVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DbConnection dbCon = DbConnection.getInstance();
		
		try {
			String id = "son";
			String pass = "jimin";
			
			con = dbCon.getConnection(id, pass);
			
			StringBuilder selectAllTheater = new StringBuilder();
			selectAllTheater.append("select distinct theater_name ")
			.append("from theater ");

			pstmt = con.prepareStatement(selectAllTheater.toString());
			
			rs = pstmt.executeQuery();
			ReservingVO rsVO = null;
			while(rs.next()) {
				rsVO = ReservingVO.builder()
						.theaterName(rs.getString("theater_name"))
						.build();
				theaters.add(rsVO);
			} // end while
		} finally {
			dbCon.dbClose(rs, pstmt, con);
		} // end finally

		return theaters;
	} // selectTheater
	
	/**
	 * 선택한 날짜에 선택한 상영관에서 상영 중인 영화명 가져오기
	 * @return
	 * @throws SQLException
	 */
	public List<ReservingVO> selectMovie(String screeningDate, String theaterName) throws SQLException {
		List<ReservingVO> theaters = new ArrayList<ReservingVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DbConnection dbCon = DbConnection.getInstance();
		
		try {
			String id = "son";
			String pass = "jimin";
			
			con = dbCon.getConnection(id, pass);
			
			StringBuilder selectMovie = new StringBuilder();
			selectMovie.append("select distinct m.movie_title, m.movie_rating, m.movie_code ")
			.append("from movie m ")
			.append("inner join screening s ")
			.append("on s.movie_code = m.movie_code ")
			.append("where m.movie_screening_status = 'Y' and s.screening_date = ? and s.theater_name = ? ");

			pstmt = con.prepareStatement(selectMovie.toString());
			pstmt.setString(1, screeningDate);
			pstmt.setString(2, theaterName);
			
			rs = pstmt.executeQuery();
			ReservingVO rsVO = null;
			while(rs.next()) {
				rsVO = ReservingVO.builder()
						.movieTitle(rs.getString("movie_title"))
						.movieRating(rs.getString("movie_rating"))
						.movieCode(rs.getString("movie_code"))
						.build();
				theaters.add(rsVO);
			} // end while
		} finally {
			dbCon.dbClose(rs, pstmt, con);
		} // end finally

		return theaters;
	} // selectTheater

} // class