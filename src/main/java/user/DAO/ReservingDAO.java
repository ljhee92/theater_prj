package user.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import VO.ReservingVO;
import user.VO.UserSeatVO;
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
	
	/**
	 * 선택한 날짜의 영화관의 영화의 상영시간 가져오기
	 * @return
	 * @throws SQLException
	 */
	public List<ReservingVO> selectMovieTime(String screeningDate, String theaterName, String movieCode) throws SQLException {
		List<ReservingVO> theaters = new ArrayList<ReservingVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DbConnection dbCon = DbConnection.getInstance();
		
		try {
			String id = "son";
			String pass = "jimin";
			
			con = dbCon.getConnection(id, pass);
			
			StringBuilder selectMovieTime = new StringBuilder();
			selectMovieTime.append("select m.movie_title, m.movie_rating, s.theater_number, s.screening_code, st.screening_time ")
			.append("from screening s ")
			.append("inner join screening_time st ")
			.append("on s.screening_round = st.screening_round ")
			.append("inner join movie m ")
			.append("on s.movie_code = m.movie_code ")
			.append("where s.movie_code = ? and s.screening_date = ? and s.theater_name = ? ")
			.append("order by theater_number, screening_time ");

			pstmt = con.prepareStatement(selectMovieTime.toString());
			pstmt.setString(1, movieCode);
			pstmt.setString(2, screeningDate);
			pstmt.setString(3, theaterName);
			
			rs = pstmt.executeQuery();
			ReservingVO rsVO = null;
			while(rs.next()) {
				rsVO = ReservingVO.builder()
						.movieTitle(rs.getString("movie_title"))
						.movieRating(rs.getString("movie_rating"))
						.theaterNumber(rs.getString("theater_number"))
						.screeningCode(rs.getString("screening_code"))
						.screeningTime(rs.getString("screening_time"))
						.build();
				theaters.add(rsVO);
			} // end while
		} finally {
			dbCon.dbClose(rs, pstmt, con);
		} // end finally

		return theaters;
	} // selectTheater
	
	/**
	 * 선택한 영화관, 상영관의 좌석 구하기
	 * @param theaterName
	 * @param theaterNumber
	 * @return
	 * @throws SQLException
	 */
	public List<UserSeatVO> selectSeat(String theaterName, String theaterNumber) throws SQLException {
		List<UserSeatVO> seats = new ArrayList<>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DbConnection dbCon = DbConnection.getInstance();
		
		try {
			String id = "son";
			String pass = "jimin";
			
			con = dbCon.getConnection(id, pass);
			
			StringBuilder selectAbleSeat = new StringBuilder();
			selectAbleSeat.append("select seat_lownumber, seat_colnumber, reservation_status ")
			.append("from seat ")
			.append("where theater_name = ? and theater_number = ? ")
			.append("order by seat_lownumber, to_number(seat_colnumber) ");
			
			pstmt = con.prepareStatement(selectAbleSeat.toString());
			pstmt.setString(1, theaterName);
			pstmt.setString(2, theaterNumber);
			
			rs = pstmt.executeQuery();
			UserSeatVO usVO = null;
			while(rs.next()) {
				usVO = UserSeatVO.builder()
								.seatLowNumber(rs.getString("seat_lownumber"))
								.seatColNumber(rs.getString("seat_colnumber"))
								.theaterName(theaterName)
								.theaterNumber(theaterNumber)
								.reservationStatus(rs.getString("reservation_status"))
								.build();
				seats.add(usVO);
			} // end while
		} finally {
			dbCon.dbClose(rs, pstmt, con);
		} // end finally
		return seats;
	} // selectSeat
	
	/**
	 * 영화관, 상영관별 예약되어있는 좌석 가져오기
	 * @param screeningCode
	 * @param theaterName
	 * @param theaterNumber
	 * @return
	 * @throws SQLException
	 */
	public List<UserSeatVO> selectReservatedSeats(String screeningCode, String theaterName, String theaterNumber) throws SQLException {
		List<UserSeatVO> reservatedSeats = new ArrayList<UserSeatVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DbConnection dbCon = DbConnection.getInstance();
		
		try {
			String id = "son";
			String pass = "jimin";
			
			con = dbCon.getConnection(id, pass);
			
			StringBuilder selectReservatedSeats = new StringBuilder();
			selectReservatedSeats.append("select rs.seat_lownumber, rs.seat_colnumber ")
			.append("from reserved_seat rs ")
			.append("join reservation r ")
			.append("on r.reservation_number = rs.reservation_number ")
			.append("join screening s ")
			.append("on s.screening_code = r.screening_code ")
			.append("where s.screening_code = ? and rs.theater_name = ? and rs.theater_number = ? ");
			
			pstmt = con.prepareStatement(selectReservatedSeats.toString());

			pstmt.setString(1, screeningCode);
			pstmt.setString(2, theaterName);
			pstmt.setString(3, theaterNumber);
			
			rs = pstmt.executeQuery();
			
			UserSeatVO usVO = null;
			while(rs.next()) {
				usVO = UserSeatVO.builder()
					.seatLowNumber(rs.getString("seat_lownumber"))
					.seatColNumber(rs.getString("seat_colnumber"))
					.build();
				reservatedSeats.add(usVO);
			} // end while
			
		} finally {
			dbCon.dbClose(rs, pstmt, con);
		} // end finally
		return reservatedSeats;
	} // selectReservatedSeats

} // class