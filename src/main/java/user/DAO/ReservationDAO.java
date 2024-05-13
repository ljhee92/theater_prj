package user.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import user.VO.ReservationVO;
import util.DbConnection;

public class ReservationDAO {
	
	private static ReservationDAO rvtDAO;
	
	private ReservationDAO() {
	}
	
	public static ReservationDAO getInstance() {
		if(rvtDAO == null) {
			rvtDAO = new ReservationDAO();
		} // end if
		return rvtDAO;
	} // getInstance

	/**
	 * 가장 마지막 예약번호 가져오기
	 * @return
	 */
	public String selectMaxReservationNumber() throws SQLException {
		String maxReservationNumber = "";
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DbConnection dbCon = DbConnection.getInstance();
		
		try {
			String id = "son";
			String pass = "jimin";
			
			con = dbCon.getConnection(id, pass);
			
			String selectMaxReservationNumber = "select max(reservation_number) as max_reservation_number from reservation";
			
			pstmt = con.prepareStatement(selectMaxReservationNumber);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				maxReservationNumber = rs.getString("max_reservation_number");
			} // end if
			
			// DB의 가장 마지막 예매번호 + 1 구하기
			String character = maxReservationNumber.substring(0, 1);
			int number = Integer.parseInt(maxReservationNumber.substring(1))+1;
			String num = String.format("%010d", number);
					
			maxReservationNumber = character+num;
		} finally {
			dbCon.dbClose(rs, pstmt, con);
		} // end finally
		return maxReservationNumber;
	} // selectMaxReservationNumber
	
	/**
	 * 예약하기
	 * @param rvtVO
	 * @throws SQLException
	 */
	public void insertReservation(ReservationVO rvtVO) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DbConnection dbCon = DbConnection.getInstance();
		
		try {
			String id = "son";
			String pass = "jimin";
			
			con = dbCon.getConnection(id, pass);
			
			String insertReservation = "insert into reservation(reservation_number, user_id, screening_code) values(?, ?, ?)";
			
			pstmt = con.prepareStatement(insertReservation);
			pstmt.setString(1, rvtVO.getReservationNumber());
			pstmt.setString(2, rvtVO.getUserId());
			pstmt.setString(3, rvtVO.getScreeningCode());
			
			pstmt.executeUpdate();
		} finally {
			dbCon.dbClose(rs, pstmt, con);
		} // end finally
	} // insertReservation
	
	/**
	 * 예약 좌석 인서트
	 * @param rvtVO
	 * @throws SQLException
	 */
	public void insertSeats(ReservationVO rvtVO) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DbConnection dbCon = DbConnection.getInstance();
		
		try {
			String id = "son";
			String pass = "jimin";
			
			con = dbCon.getConnection(id, pass);
			
			String[] seats = rvtVO.getSeat().split(" ");
			for(int i = 0; i < seats.length; i++) {
				String lowNumber = seats[i].substring(0, 1);
				String colNumber = seats[i].substring(1);

				String insertSeats = "insert into reserved_seat values(?, ?, ?, ?, ?)";
				
				pstmt = con.prepareStatement(insertSeats);
				pstmt.setString(1, rvtVO.getReservationNumber());
				pstmt.setString(2, lowNumber);
				pstmt.setString(3, colNumber);
				pstmt.setString(4, rvtVO.getTheaterName());
				pstmt.setString(5, rvtVO.getTheaterNumber());
				
				pstmt.executeUpdate();
			} // end for
			
		} finally {
			dbCon.dbClose(rs, pstmt, con);
		} // end finally
	} // insertSeats
	
} // class