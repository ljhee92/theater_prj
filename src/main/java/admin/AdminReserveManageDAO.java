package admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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

    ///////////////////////////검색결과 리스트//////////////////////////////
    public List<AdminReserveManageVO> selectAllReserve(String userId) throws SQLException {
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
            StringBuilder selectUserId = new StringBuilder();
            selectUserId
                .append("select user_id, user_name, user_birthday, user_phone, rnum ")
                .append("from (select user_id, user_name, user_birthday, user_phone, ")
                .append("row_number() over (order by user_input_date desc) rnum ")
                .append("from users ");

            if (userId != null && !"".equals(userId)) {
                selectUserId.append("where instr(user_id, ?) > 0 ");
            }

            selectUserId.append(")");

            pstmt = con.prepareStatement(selectUserId.toString());

            // 바인드변수에 값 설정
            int bindIndex = 1;
            if (userId != null && !"".equals(userId)) {
                pstmt.setString(bindIndex, userId);
            }

            // 쿼리문 수행 후 결과 얻기
            rs = pstmt.executeQuery();

            UserVO uVO = null;
            while (rs.next()) {
                UserVO uVOBuilder = UserVO.builder()
                    .userId(rs.getString("user_id"))
                    .userName(rs.getString("user_name"))
                    .userBirthday(rs.getString("user_birthday"))
                    .userPhone(rs.getString("user_phone"))
                    .build();
                list.add(uVOBuilder);
            }

        } finally {
            dbCon.dbClose(rs, pstmt, con);
        }
        return list;
    }

    // 모든 사용자 리스트를 가져오는 메소드 (기존)
    public List<UserVO> selectAllUserList() throws SQLException {
        List<UserVO> list = new ArrayList<UserVO>();

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        DbConnection dbCon = DbConnection.getInstance();

        try {
            String id = "son";
            String pass = "jimin";
            con = dbCon.getConnection(id, pass);

            String sql = "SELECT user_id, user_name, user_birthday, user_phone FROM users";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                UserVO uVO = UserVO.builder()
                    .userId(rs.getString("user_id"))
                    .userName(rs.getString("user_name"))
                    .userBirthday(rs.getString("user_birthday"))
                    .userPhone(rs.getString("user_phone"))
                    .build();
                list.add(uVO);
            }

        } finally {
            dbCon.dbClose(rs, pstmt, con);
        }
        return list;
    }
}
