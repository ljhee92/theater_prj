package admin.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import VO.SeatVO;
import VO.TheaterVO;
import util.DbConnection;



public class TheaterDAO {
	private static TheaterDAO tDAO;
	public static TheaterDAO getInstance() {
		if (tDAO == null) {
			tDAO = new TheaterDAO();
		} // end if
		return tDAO;
	}
	

	/**
	 * 
	 * 상영관에 등록된 상영관 N관 리스트 가져오는 메서드
	 * 
	 * 
	 * @param 상영관지점명
	 * @return 특정 영화관의 상영관이 담겨있는 리스트
	 * @throws SQLException
	 */
	public List<TheaterVO> selectTheaterNum(String theaterName) throws SQLException {
		//System.out.println("dao내부 들어온 극장명 : "+ theaterName);
		List<TheaterVO> tVOList = new ArrayList<TheaterVO>();
		TheaterVO tVO = null;
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
			String selectQuery = "	select THEATER_NUMBER from THEATER	"
								+ "	where THEATER_NAME = ?	";
			pstmt = con.prepareStatement(selectQuery);
			pstmt.setString(1, theaterName);

			// 4. 쿼리 실행 및 결과 처리
			rs = pstmt.executeQuery();


			
			
			while (rs.next()) {
				tVO = null;
				tVO = TheaterVO.builder()
						.theaterNumber(rs.getString("THEATER_NUMBER"))
                        .build();
				//System.out.println("rs내부 : "+tVO.getTheaterNumber());
				tVOList.add(tVO);

			}
		} finally {
			// 6. 리소스 해제
			dbcon.dbClose(rs, pstmt, con);
		}

		return tVOList;
	}// selectTheaterNum
	
	
	
	
	
	/**
	 * 상영관관리 페이지에 들어가면 최초로 상영관지점명호출 메서드
	 * 
	 * @return 상영관지점명이 담긴 리스트
	 * @throws SQLException
	 */
	public List<TheaterVO> selectTheaterName() throws SQLException {
		List<TheaterVO> tVOList = new ArrayList<TheaterVO>();
		TheaterVO tVO = null;
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
			String selectQuery = "select distinct THEATER_NAME from THEATER	";
			pstmt = con.prepareStatement(selectQuery);

			// 4. 쿼리 실행 및 결과 처리
			rs = pstmt.executeQuery();


			
			
			while (rs.next()) {
				tVO = null;
				tVO = TheaterVO.builder()
						.theaterName(rs.getString("THEATER_NAME"))
                        .build();
				
				tVOList.add(tVO);

			}
		} finally {
			// 6. 리소스 해제
			dbcon.dbClose(rs, pstmt, con);
		}

		return tVOList;
	}// selectTheaterName
	
	


	/**
	 * 상영관명과 상영관 정보가 담긴 VO를 통해 
	 * 좌석정보, 상영관지점명, 상영관, 좌석 상태의 정보가 담긴 sVOList를 반환하는 메서드
	 * 
	 * @param tVO 상영관명과 상영관의 정보가 담겨있는 VO
	 * @return 좌석정보, 상영관지점명, 상영관, 좌석 상태의 정보가 담긴 sVOList
	 * @throws SQLException
	 */
	public List<SeatVO> selectTheaterSeat(TheaterVO tVO) throws SQLException {
		//System.out.println("dao내부 들어온 극장명 : "+ theaterName);
		List<SeatVO> sVOList = new ArrayList<SeatVO>();
		SeatVO sVO = null;
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
			String selectQuery = "	select SEAT_LOWNUMBER, SEAT_COLNUMBER, THEATER_NAME, THEATER_NUMBER, RESERVATION_STATUS from SEAT		"
					+ "	where THEATER_NAME = ? and		"
					+ "	THEATER_NUMBER=  ?				"
					+ "	order by SEAT_LOWNUMBER asc , TO_NUMBER(SEAT_COLNUMBER) ";
			pstmt = con.prepareStatement(selectQuery);
			pstmt.setString(1, tVO.getTheaterName());
			pstmt.setString(2, tVO.getTheaterNumber());

			// 4. 쿼리 실행 및 결과 처리
			rs = pstmt.executeQuery();


			
			
			while (rs.next()) {
				sVO = null;
				sVO = SeatVO.builder()
						.seatLowNumber(rs.getString("SEAT_LOWNUMBER"))
						.seatColNumber(rs.getString("SEAT_COLNUMBER"))
						.theaterName(rs.getString("THEATER_NAME"))
						.theaterNumber(rs.getString("THEATER_NUMBER"))
						.reservationStatus(rs.getString("RESERVATION_STATUS").charAt(0))
                        .build();
				//System.out.println("rs내부 : "+sVO.getSeatLowNumber()+sVO.getSeatColNumber());
				sVOList.add(sVO);

			}
		} finally {
			// 6. 리소스 해제
			dbcon.dbClose(rs, pstmt, con);
		}

		return sVOList;
	}// selectTheaterNum
	
	
	/**
	 * 좌석의 상태를 변경하는 메서드
	 * @param sVO
	 * @return 성공유무
	 * @throws SQLException
	 */
	public boolean updateSeatStatus(SeatVO sVO) throws SQLException {
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
			String selectQuery = "	update seat	"
					+ "	set RESERVATION_STATUS = ?	"
					+ "	where 	"
					+ "	SEAT_LOWNUMBER = ? and	"
					+ "	SEAT_COLNUMBER = ? and	"
					+ "	THEATER_NAME = ? and	"
					+ "	THEATER_NUMBER = ? ";
			pstmt = con.prepareStatement(selectQuery);
			
			pstmt.setString(1, Character.toString(sVO.getReservationStatus()));
			pstmt.setString(2, sVO.getSeatLowNumber());
			pstmt.setString(3, sVO.getSeatColNumber());
			pstmt.setString(4, sVO.getTheaterName());
			pstmt.setString(5, sVO.getTheaterNumber());

			// 4. 쿼리 실행 및 결과 처리
			if(pstmt.executeUpdate()!=0) {
				
				result = true;
				
			};
			
			


			
		} finally {
			// 6. 리소스 해제
			dbcon.dbClose(null, pstmt, con);
		}


		return result;
	}// updateSeatStatus
	
	
	
	
}

