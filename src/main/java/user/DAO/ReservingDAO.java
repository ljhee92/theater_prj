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
	 * 해당 날짜에 상영중인 상영관이름 가져오기
	 * @return
	 * @throws SQLException
	 */
	public List<ReservingVO> selectTheater(String screeningDate) throws SQLException {
		List<ReservingVO> theaters = new ArrayList<ReservingVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DbConnection dbCon = DbConnection.getInstance();
		
		try {
			String id = "son";
			String pass = "jimin";
			
			con = dbCon.getConnection(id, pass);
			
			StringBuilder selectTheater = new StringBuilder();
			selectTheater.append("select distinct s.theater_name ")
			.append("from screening s ")
			.append("inner join movie m ")
			.append("on s.movie_code = m.movie_code ")
			.append("where m.movie_screening_status = 'Y' and s.screening_date = ? ");

			pstmt = con.prepareStatement(selectTheater.toString());
			pstmt.setString(1, screeningDate);
			
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

} // class