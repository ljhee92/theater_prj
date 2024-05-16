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
            StringBuilder selectReserve = new StringBuilder();
            selectReserve
                .append(" SELECT rv.reservation_number, rv.user_id, m.movie_title, ")
                .append(" s.theater_name, s.theater_number, ")
                .append(" s.screening_date, st.screening_time, ")
                .append(" rs.seat_lownumber, rs.seat_colnumber ")
                .append(" FROM reservation rv ")
                .append(" JOIN screening s ON rv.screening_code = s.screening_code ")
                .append(" JOIN movie m ON s.movie_code = m.movie_code ")
                .append(" JOIN screening_time st ON s.screening_round = st.screening_round ")
                .append(" JOIN reserved_seat rs ON rv.reservation_number = rs.reservation_number ");

            pstmt = con.prepareStatement(selectReserve.toString());

            // 쿼리문 수행 후 결과 얻기
            rs = pstmt.executeQuery();

            // Map to store the total seat count and seat numbers per reservation
            Map<String, List<String>> seatMap = new HashMap<>();
            List<AdminReserveManageVO> tempList = new ArrayList<>();

            while (rs.next()) {
                String reservationNumber = rs.getString("reservation_number");

                // 좌석 정보 누적
                seatMap.putIfAbsent(reservationNumber, new ArrayList<>());
                seatMap.get(reservationNumber).add(rs.getString("seat_lownumber") + rs.getString("seat_colnumber"));

                AdminReserveManageVO armVO = AdminReserveManageVO.builder()
                    .reservationNumber(reservationNumber)
                    .userId(rs.getString("user_id"))
                    .movieTitle(rs.getString("movie_title"))
                    .theaterName(rs.getString("theater_name"))
                    .theaterNumber(rs.getString("theater_number"))
                    .screeningDate(rs.getString("screening_date"))
                    .screeningTime(rs.getString("screening_time"))
                    .build();

                tempList.add(armVO);
            }

            // Update the list with the total seat count and concatenated seat numbers for each reservation
            for (AdminReserveManageVO vo : tempList) {
                List<String> seats = seatMap.get(vo.getReservationNumber());
                if (seats != null) {
                    vo.setSeatNumber(String.join(", ", seats));
                    vo.setTotalPeopleNumber(seats.size());
                }
                list.add(vo);
            }

        } finally {
            dbCon.dbClose(rs, pstmt, con);
        }
        return list;
    }//selectAllReserve
    
    ////////////////////////조건에 맞는 예매리스트를 가져오는 메소드///////////////////////
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
	        String selectReserve = "SELECT rv.reservation_number, rv.user_id, m.movie_title,"
	        		+ "s.theater_name, s.theater_number,"
	        		+ "s.screening_date, st.screening_time,"
	        		+ "rs.seat_lownumber, rs.seat_colnumber"
	        		+ "FROM reservation"
	        		+ "JOIN screening s ON rv.screening_code = s.screening_code"
	        		+ "JOIN movie m ON s.movie_code = m.movie_code"
	        		+ "JOIN screening_time st ON s.screening_round = st.screening_round"
	        		+ "JOIN reserved_seat rs ON rv.reservation_number = rs.reservation_number"
	                + "WHERE 1=1";

	        // theater 조건 추가
	        if (theater != null && !theater.isEmpty()) {
	        	selectReserve += " AND s.theater_name = ?";
	        }

	        // screeningRoom 조건 추가
	        if (screeningRoom != null && !screeningRoom.isEmpty()) {
	        	selectReserve += " AND s.theater_number = ?";
	        }

	        // year, month, day 조건 추가
	        if (date != null && !date.isEmpty()) {
	        	selectReserve += " AND s.screening_date = ?";
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

			// Map to store the total seat count and seat numbers per reservation
			Map<String, List<String>> seatMap = new HashMap<>();
			List<AdminReserveManageVO> tempList = new ArrayList<>();

			while (rs.next()) {
				String reservationNumber = rs.getString("reservation_number");

				// 좌석 정보 누적
				seatMap.putIfAbsent(reservationNumber, new ArrayList<>());
				seatMap.get(reservationNumber).add(rs.getString("seat_lownumber") + rs.getString("seat_colnumber"));

				AdminReserveManageVO armVO = AdminReserveManageVO.builder()
						.reservationNumber(reservationNumber)
						.userId(rs.getString("user_id"))
						.movieTitle(rs.getString("movie_title"))
						.theaterName(rs.getString("theater_name"))
						.theaterNumber(rs.getString("theater_number"))
						.screeningDate(rs.getString("screening_date"))
						.screeningTime(rs.getString("screening_time"))
						.build();

				tempList.add(armVO);
			}

			// Update the list with the total seat count and concatenated seat numbers for
			// each reservation
			for (AdminReserveManageVO vo : tempList) {
				List<String> seats = seatMap.get(vo.getReservationNumber());
				if (seats != null) {
					vo.setSeatNumber(String.join(", ", seats));
					vo.setTotalPeopleNumber(seats.size());
				}
				list.add(vo);
			}

		} finally {
			dbCon.dbClose(rs, pstmt, con);
		}
		return list;
	}//searchReserve
    
    
    
}//class
