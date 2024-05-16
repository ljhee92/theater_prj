package admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import admin.ScreeningVO.ScreeningVOBuilder;
import util.DbConnection;

public class AdminReserveManageDAO {

    private static AdminReserveManageDAO instance = new AdminReserveManageDAO();

    public static AdminReserveManageDAO getInstance() {
        return instance;
    }

    private AdminReserveManageDAO() {}

    // 데이터베이스 연결 메소드
    public Connection getConnection(String id, String pass) throws SQLException {
        // 데이터베이스 연결 로직 작성 (이 예제에서는 생략)
        return null;
    }

    // 연결 해제 메소드
    public void dbClose(ResultSet rs, PreparedStatement pstmt, Connection con) {
        // 연결 해제 로직 작성 (이 예제에서는 생략)
    }

    ////////////////////////모든 예매리스트를 가져오는 메소드///////////////////////
	public List<AdminReserveManageVO> selectAllReserve() throws SQLException {
		List<AdminReserveManageVO> list = new ArrayList<AdminReserveManageVO>();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DbConnection dbCon = DbConnection.getInstance();

		try {
			// 데이터베이스 연결 정보
			String id = "son";
			String pass = "jimin";
			con = dbCon.getConnection(id, pass);

			// 쿼리문 생성
			String selectReserve = "SELECT rv.reservation_number, rv.user_id, m.movie_title, "
					+ "s.theater_name, s.theater_number, s.screening_date, st.screening_time, "
					+ "rs.seat_lownumber, rs.seat_colnumber " + "FROM reservation rv "
					+ "JOIN screening s ON rv.screening_code = s.screening_code "
					+ "JOIN movie m ON s.movie_code = m.movie_code "
					+ "JOIN screening_time st ON s.screening_round = st.screening_round "
					+ "JOIN reserved_seat rs ON rv.reservation_number = rs.reservation_number";

			pstmt = con.prepareStatement(selectReserve);

			// 쿼리문 수행 후 결과 얻기
			rs = pstmt.executeQuery();

			// Map to store the total seat count and seat numbers per reservation
			Map<String, AdminReserveManageVO> reserveMap = new HashMap<>();

			while (rs.next()) {
				String reservationNumber = rs.getString("reservation_number");

				AdminReserveManageVO armVO = reserveMap.get(reservationNumber);
				if (armVO == null) {
					armVO = AdminReserveManageVO.builder().reservationNumber(reservationNumber)
							.userId(rs.getString("user_id")).movieTitle(rs.getString("movie_title"))
							.theaterName(rs.getString("theater_name")).theaterNumber(rs.getString("theater_number"))
							.screeningDate(rs.getString("screening_date")).screeningTime(rs.getString("screening_time"))
							.seatNumber(rs.getString("seat_lownumber") + rs.getString("seat_colnumber"))
							.totalPeopleNumber(1) // 한 개의 좌석 정보만 있는 경우
							.build();
					reserveMap.put(reservationNumber, armVO);
				} else {
					// 좌석 정보 누적
					armVO.setSeatNumber(armVO.getSeatNumber() + ", " + rs.getString("seat_lownumber")
							+ rs.getString("seat_colnumber"));
					armVO.setTotalPeopleNumber(armVO.getTotalPeopleNumber() + 1); // 좌석 개수 증가
				}
			}

			// Convert map values to list
			list.addAll(reserveMap.values());

		} finally {
			dbCon.dbClose(rs, pstmt, con);
		}
		return list;
	}// selectAllReserve
	
	/////////////////////////////////////////////////////////////조건에 따라 검색//////////////////////////////////////////////////////////////////
	// Case 1: reservationNumber가 있는 경우
	public List<AdminReserveManageVO> searchReserve(String theater, String screeningRoom, String date, String reserveNum) throws SQLException {
	    List<AdminReserveManageVO> list = new ArrayList<AdminReserveManageVO>();
	    DbConnection dbCon = DbConnection.getInstance();

	    Connection con = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;

	    try {
	        String id = "son";
	        String pass = "jimin";
	        con = dbCon.getConnection(id, pass);
	        
	        // 검색 조건에 따라 동적으로 쿼리를 생성하여 실행
	        String selectReserve = "SELECT rv.reservation_number, rv.user_id, m.movie_title, "
	                + "s.theater_name, s.theater_number, s.screening_date, "
	                + "st.screening_time, rs.seat_lownumber, rs.seat_colnumber "
	                + "FROM reservation rv "
	                + "JOIN screening s ON rv.screening_code = s.screening_code "
	                + "JOIN movie m ON s.movie_code = m.movie_code "
	                + "JOIN screening_time st ON s.screening_round = st.screening_round "
	                + "JOIN reserved_seat rs ON rv.reservation_number = rs.reservation_number "
	                + "WHERE 1=1 ";

	        // theater 조건 추가
	        if (theater != null && !theater.isEmpty()) {
	            selectReserve += "AND s.theater_name = ? ";
	        }

	        // screeningRoom 조건 추가
	        if (screeningRoom != null && !screeningRoom.isEmpty()) {
	            selectReserve += "AND s.theater_number = ? ";
	        }

	        // year, month, day 조건 추가
	        if (date != null && !date.isEmpty()) {
	            selectReserve += "AND s.screening_date = ? ";
	        }
	        
	        // reserveNum 조건 추가
	        if (reserveNum != null && !reserveNum.isEmpty()) {
	            selectReserve += "AND INSTR(rv.reservation_number, ?) > 0 ";
	        }

	        pstmt = con.prepareStatement(selectReserve);

	        // 검색 조건에 맞게 파라미터 설정
	        int parameterIndex = 1;
	        if (theater != null && !theater.isEmpty()) {
	            pstmt.setString(parameterIndex++, theater);
	        }
	        if (screeningRoom != null && !screeningRoom.isEmpty()) {
	            pstmt.setString(parameterIndex++, screeningRoom);
	        }
	        if (date != null && !date.isEmpty()) {
	            pstmt.setString(parameterIndex++, date);
	        }
	        if (reserveNum != null && !reserveNum.isEmpty()) {
	            pstmt.setString(parameterIndex++, reserveNum);
	        }

	        rs = pstmt.executeQuery();

	        while (rs.next()) {
	            String reservationNumber = rs.getString("reservation_number");
	            String userId = rs.getString("user_id");
	            String movieTitle = rs.getString("movie_title");
	            String theaterName = rs.getString("theater_name");
	            String theaterNumber = rs.getString("theater_number");
	            String screeningDate = rs.getString("screening_date");
	            String screeningTime = rs.getString("screening_time");
	            String seatInfo = rs.getString("seat_lownumber") + rs.getString("seat_colnumber");

	            // 이미 존재하는 예약번호인지 확인
	            boolean exists = false;
	            for (AdminReserveManageVO vo : list) {
	                if (vo.getReservationNumber().equals(reservationNumber)) {
	                    vo.setSeatNumber(vo.getSeatNumber() + ", " + seatInfo); // 기존의 좌석 정보에 추가
	                    vo.setTotalPeopleNumber(vo.getTotalPeopleNumber() + 1); // 총 인원 수 증가
	                    exists = true;
	                    break;
	                }
	            }

	            // 존재하지 않는 경우 새로운 VO를 생성하고 리스트에 추가
	            if (!exists) {
	                AdminReserveManageVO armVO = new AdminReserveManageVO();
	                armVO.setReservationNumber(reservationNumber);
	                armVO.setUserId(userId);
	                armVO.setMovieTitle(movieTitle);
	                armVO.setTheaterName(theaterName);
	                armVO.setTheaterNumber(theaterNumber);
	                armVO.setScreeningDate(screeningDate);
	                armVO.setScreeningTime(screeningTime);
	                armVO.setSeatNumber(seatInfo);
	                armVO.setTotalPeopleNumber(1); // 초기 총 인원 수는 1명
	                list.add(armVO);
	            }
	        }

	    } finally {
	        dbCon.dbClose(rs, pstmt, con);
	    }
	    return list;
	}
	
	// Case 2: screeningRoom이 '전체'인 경우
	public List<AdminReserveManageVO> searchReserve2(String theater, String date, String reserveNum) throws SQLException {
	    List<AdminReserveManageVO> list = new ArrayList<AdminReserveManageVO>();
	    DbConnection dbCon = DbConnection.getInstance();

	    Connection con = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;

	    try {
	        String id = "son";
	        String pass = "jimin";
	        con = dbCon.getConnection(id, pass);
	        
	        // 검색 조건에 따라 동적으로 쿼리를 생성하여 실행
	        String selectReserve = "SELECT rv.reservation_number, rv.user_id, m.movie_title, "
	                + "s.theater_name, s.theater_number, s.screening_date, "
	                + "st.screening_time, rs.seat_lownumber, rs.seat_colnumber "
	                + "FROM reservation rv "
	                + "JOIN screening s ON rv.screening_code = s.screening_code "
	                + "JOIN movie m ON s.movie_code = m.movie_code "
	                + "JOIN screening_time st ON s.screening_round = st.screening_round "
	                + "JOIN reserved_seat rs ON rv.reservation_number = rs.reservation_number "
	                + "WHERE 1=1 ";

	        // theater 조건 추가
	        if (theater != null && !theater.isEmpty()) {
	            selectReserve += "AND s.theater_name = ? ";
	        }


	        // year, month, day 조건 추가
	        if (date != null && !date.isEmpty()) {
	            selectReserve += "AND s.screening_date = ? ";
	        }
	        
	        // reserveNum 조건 추가
	        if (reserveNum != null && !reserveNum.isEmpty()) {
	            selectReserve += "AND INSTR(rv.reservation_number, ?) > 0 ";
	        }

	        pstmt = con.prepareStatement(selectReserve);

	        // 검색 조건에 맞게 파라미터 설정
	        int parameterIndex = 1;
	        if (theater != null && !theater.isEmpty()) {
	            pstmt.setString(parameterIndex++, theater);
	        }
	        if (date != null && !date.isEmpty()) {
	            pstmt.setString(parameterIndex++, date);
	        }
	        if (reserveNum != null && !reserveNum.isEmpty()) {
	            pstmt.setString(parameterIndex++, reserveNum);
	        }

	        rs = pstmt.executeQuery();

	        while (rs.next()) {
	            String reservationNumber = rs.getString("reservation_number");
	            String userId = rs.getString("user_id");
	            String movieTitle = rs.getString("movie_title");
	            String theaterName = rs.getString("theater_name");
	            String theaterNumber = rs.getString("theater_number");
	            String screeningDate = rs.getString("screening_date");
	            String screeningTime = rs.getString("screening_time");
	            String seatInfo = rs.getString("seat_lownumber") + rs.getString("seat_colnumber");

	            // 이미 존재하는 예약번호인지 확인
	            boolean exists = false;
	            for (AdminReserveManageVO vo : list) {
	                if (vo.getReservationNumber().equals(reservationNumber)) {
	                    vo.setSeatNumber(vo.getSeatNumber() + ", " + seatInfo); // 기존의 좌석 정보에 추가
	                    vo.setTotalPeopleNumber(vo.getTotalPeopleNumber() + 1); // 총 인원 수 증가
	                    exists = true;
	                    break;
	                }
	            }

	            // 존재하지 않는 경우 새로운 VO를 생성하고 리스트에 추가
	            if (!exists) {
	                AdminReserveManageVO armVO = new AdminReserveManageVO();
	                armVO.setReservationNumber(reservationNumber);
	                armVO.setUserId(userId);
	                armVO.setMovieTitle(movieTitle);
	                armVO.setTheaterName(theaterName);
	                armVO.setTheaterNumber(theaterNumber);
	                armVO.setScreeningDate(screeningDate);
	                armVO.setScreeningTime(screeningTime);
	                armVO.setSeatNumber(seatInfo);
	                armVO.setTotalPeopleNumber(1); // 초기 총 인원 수는 1명
	                list.add(armVO);
	            }
	        }

	    } finally {
	        dbCon.dbClose(rs, pstmt, con);
	    }
	    return list;
	}
	
	// Case 3: screeningRoom이 '전체'이고 reservationNumber가 없는 경우
	public List<AdminReserveManageVO> searchReserve3(String theater, String date) throws SQLException {
	    List<AdminReserveManageVO> list = new ArrayList<AdminReserveManageVO>();
	    DbConnection dbCon = DbConnection.getInstance();

	    Connection con = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;

	    try {
	        String id = "son";
	        String pass = "jimin";
	        con = dbCon.getConnection(id, pass);
	        
	        // 검색 조건에 따라 동적으로 쿼리를 생성하여 실행
	        String selectReserve = "SELECT rv.reservation_number, rv.user_id, m.movie_title, "
	                + "s.theater_name, s.theater_number, s.screening_date, "
	                + "st.screening_time, rs.seat_lownumber, rs.seat_colnumber "
	                + "FROM reservation rv "
	                + "JOIN screening s ON rv.screening_code = s.screening_code "
	                + "JOIN movie m ON s.movie_code = m.movie_code "
	                + "JOIN screening_time st ON s.screening_round = st.screening_round "
	                + "JOIN reserved_seat rs ON rv.reservation_number = rs.reservation_number "
	                + "WHERE 1=1 ";

	        // theater 조건 추가
	        if (theater != null && !theater.isEmpty()) {
	            selectReserve += "AND s.theater_name = ? ";
	        }

	        // year, month, day 조건 추가
	        if (date != null && !date.isEmpty()) {
	            selectReserve += "AND s.screening_date = ? ";
	        }
	        
	        pstmt = con.prepareStatement(selectReserve);

	        // 검색 조건에 맞게 파라미터 설정
	        int parameterIndex = 1;
	        if (theater != null && !theater.isEmpty()) {
	            pstmt.setString(parameterIndex++, theater);
	        }
	        if (date != null && !date.isEmpty()) {
	            pstmt.setString(parameterIndex++, date);
	        }

	        rs = pstmt.executeQuery();

	        while (rs.next()) {
	            String reservationNumber = rs.getString("reservation_number");
	            String userId = rs.getString("user_id");
	            String movieTitle = rs.getString("movie_title");
	            String theaterName = rs.getString("theater_name");
	            String theaterNumber = rs.getString("theater_number");
	            String screeningDate = rs.getString("screening_date");
	            String screeningTime = rs.getString("screening_time");
	            String seatInfo = rs.getString("seat_lownumber") + rs.getString("seat_colnumber");

	            // 이미 존재하는 예약번호인지 확인
	            boolean exists = false;
	            for (AdminReserveManageVO vo : list) {
	                if (vo.getReservationNumber().equals(reservationNumber)) {
	                    vo.setSeatNumber(vo.getSeatNumber() + ", " + seatInfo); // 기존의 좌석 정보에 추가
	                    vo.setTotalPeopleNumber(vo.getTotalPeopleNumber() + 1); // 총 인원 수 증가
	                    exists = true;
	                    break;
	                }
	            }

	            // 존재하지 않는 경우 새로운 VO를 생성하고 리스트에 추가
	            if (!exists) {
	                AdminReserveManageVO armVO = new AdminReserveManageVO();
	                armVO.setReservationNumber(reservationNumber);
	                armVO.setUserId(userId);
	                armVO.setMovieTitle(movieTitle);
	                armVO.setTheaterName(theaterName);
	                armVO.setTheaterNumber(theaterNumber);
	                armVO.setScreeningDate(screeningDate);
	                armVO.setScreeningTime(screeningTime);
	                armVO.setSeatNumber(seatInfo);
	                armVO.setTotalPeopleNumber(1); // 초기 총 인원 수는 1명
	                list.add(armVO);
	            }
	        }

	    } finally {
	        dbCon.dbClose(rs, pstmt, con);
	    }
	    return list;
	}
	
	// Case 4: screeningRoom이 '전체'가 아니고 reservationNumber가 없는 경우
	public List<AdminReserveManageVO> searchReserve4(String theater, String screeningRoom, String date) throws SQLException {
	    List<AdminReserveManageVO> list = new ArrayList<AdminReserveManageVO>();
	    DbConnection dbCon = DbConnection.getInstance();

	    Connection con = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;

	    try {
	        String id = "son";
	        String pass = "jimin";
	        con = dbCon.getConnection(id, pass);
	        
	        // 검색 조건에 따라 동적으로 쿼리를 생성하여 실행
	        String selectReserve = "SELECT rv.reservation_number, rv.user_id, m.movie_title, "
	                + "s.theater_name, s.theater_number, s.screening_date, "
	                + "st.screening_time, rs.seat_lownumber, rs.seat_colnumber "
	                + "FROM reservation rv "
	                + "JOIN screening s ON rv.screening_code = s.screening_code "
	                + "JOIN movie m ON s.movie_code = m.movie_code "
	                + "JOIN screening_time st ON s.screening_round = st.screening_round "
	                + "JOIN reserved_seat rs ON rv.reservation_number = rs.reservation_number "
	                + "WHERE 1=1 ";

	        // theater 조건 추가
	        if (theater != null && !theater.isEmpty()) {
	            selectReserve += "AND s.theater_name = ? ";
	        }

	        // screeningRoom 조건 추가
	        if (screeningRoom != null && !screeningRoom.isEmpty()) {
	            selectReserve += "AND s.theater_number = ? ";
	        }

	        // year, month, day 조건 추가
	        if (date != null && !date.isEmpty()) {
	            selectReserve += "AND s.screening_date = ? ";
	        }
	        
	        pstmt = con.prepareStatement(selectReserve);

	        // 검색 조건에 맞게 파라미터 설정
	        int parameterIndex = 1;
	        if (theater != null && !theater.isEmpty()) {
	            pstmt.setString(parameterIndex++, theater);
	        }
	        if (screeningRoom != null && !screeningRoom.isEmpty()) {
	            pstmt.setString(parameterIndex++, screeningRoom);
	        }
	        if (date != null && !date.isEmpty()) {
	            pstmt.setString(parameterIndex++, date);
	        }
	        
	        rs = pstmt.executeQuery();

	        while (rs.next()) {
	            String reservationNumber = rs.getString("reservation_number");
	            String userId = rs.getString("user_id");
	            String movieTitle = rs.getString("movie_title");
	            String theaterName = rs.getString("theater_name");
	            String theaterNumber = rs.getString("theater_number");
	            String screeningDate = rs.getString("screening_date");
	            String screeningTime = rs.getString("screening_time");
	            String seatInfo = rs.getString("seat_lownumber") + rs.getString("seat_colnumber");

	            // 이미 존재하는 예약번호인지 확인
	            boolean exists = false;
	            for (AdminReserveManageVO vo : list) {
	                if (vo.getReservationNumber().equals(reservationNumber)) {
	                    vo.setSeatNumber(vo.getSeatNumber() + ", " + seatInfo); // 기존의 좌석 정보에 추가
	                    vo.setTotalPeopleNumber(vo.getTotalPeopleNumber() + 1); // 총 인원 수 증가
	                    exists = true;
	                    break;
	                }
	            }

	            // 존재하지 않는 경우 새로운 VO를 생성하고 리스트에 추가
	            if (!exists) {
	                AdminReserveManageVO armVO = new AdminReserveManageVO();
	                armVO.setReservationNumber(reservationNumber);
	                armVO.setUserId(userId);
	                armVO.setMovieTitle(movieTitle);
	                armVO.setTheaterName(theaterName);
	                armVO.setTheaterNumber(theaterNumber);
	                armVO.setScreeningDate(screeningDate);
	                armVO.setScreeningTime(screeningTime);
	                armVO.setSeatNumber(seatInfo);
	                armVO.setTotalPeopleNumber(1); // 초기 총 인원 수는 1명
	                list.add(armVO);
	            }
	        }

	    } finally {
	        dbCon.dbClose(rs, pstmt, con);
	    }
	    return list;
	}
	
	

    
    
    ////////////////////////예매 삭제///////////////////////
    public int deleteReserve(String reservationNumber) throws SQLException {
        int result = 0;
        Connection con = null;
        PreparedStatement pstmt = null;
        DbConnection dbCon = DbConnection.getInstance();

        try {
            String id = "son";
            String pass = "jimin";
            con = dbCon.getConnection(id, pass);

            // 쿼리문: reservation 테이블에서 예약 정보 삭제
            String deleteReservationSQL = "DELETE FROM reservation WHERE reservation_number = ?";
            pstmt = con.prepareStatement(deleteReservationSQL);
            pstmt.setString(1, reservationNumber);

            // 쿼리 실행 및 결과 확인
            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            throw e; // 예외 다시 던지기
        } finally {
            // 리소스 해제
            dbCon.dbClose(null, pstmt, con);
        }
        return result;
    }//deleteReserve
    
    
    
}//class
