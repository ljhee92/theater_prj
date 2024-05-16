package admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.DbConnection;

public class AdminUserManageDAO {

    private static AdminUserManageDAO instance = new AdminUserManageDAO();

    public static AdminUserManageDAO getInstance() {
        return instance;
    }

    private AdminUserManageDAO() {}

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
    public List<UserVO> selectUser(String userId) throws SQLException {
        List<UserVO> list = new ArrayList<UserVO>();

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
                .append("	SELECT user_id, user_name, user_birthday, user_phone, rnum	")
                .append("	FROM (SELECT user_id, user_name, TO_CHAR(user_birthday, 'YYYY-MM-DD') AS user_birthday, user_phone,	")
                .append("	ROW_NUMBER() OVER (ORDER BY user_input_date DESC) AS rnum	")
                .append("	FROM users WHERE user_delete_flag = 'N'	");

            if (userId != null && !"".equals(userId)) {
                selectUserId.append("	AND INSTR(user_id, ?) > 0	");
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

            StringBuilder sql = new StringBuilder();
            sql.append("	SELECT user_id, user_name, TO_CHAR(user_birthday, 'YYYY-MM-DD') AS user_birthday	")
            	.append("	,user_phone FROM users	")
            	.append("	where user_delete_flag = 'N'	")
            	.append("	order by user_input_date desc	");
            		
            pstmt = con.prepareStatement(sql.toString());
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
    
    ///////////////////////////회원 상세보기//////////////////////////////
	public UserVO selectUserDetail(String userId) throws SQLException {
		UserVO uVO = new UserVO();

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
			selectUserId.append("	select user_id, user_name, user_birthday, user_phone, user_input_date	")
					.append("	from users	")
					.append("	where user_id=?	");

			pstmt = con.prepareStatement(selectUserId.toString());
			
			//바인드 변수
			pstmt.setString(1, userId);


			// 쿼리문 수행 후 결과 얻기
			rs = pstmt.executeQuery();

			uVO = null;
			while (rs.next()) {
				UserVO uVOBuilder = UserVO.builder().
						userId(rs.getString("user_id"))
						.userName(rs.getString("user_name"))
						.userBirthday(rs.getString("user_birthday"))
						.userPhone(rs.getString("user_phone"))
						.userInputDate(rs.getString("user_input_date"))
						.build();
				uVO = uVOBuilder;
			}

		} finally {
			dbCon.dbClose(rs, pstmt, con);
		}
		return uVO;
	}//selectUserDetail
	
	
	///////////////////////////회원 정보 수정//////////////////////////////
	public int updateUserDetail(UserVO uVO) throws SQLException {
		int cnt = 0;

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
			StringBuilder updateUser = new StringBuilder();
			updateUser.append("	update users	")
						.append("	set user_name=?, user_birthday=?, user_phone=?	")
						.append("	where user_id= ?	");

			pstmt = con.prepareStatement(updateUser.toString());

			//바인드 변수
			pstmt.setString(1, uVO.getUserName());
			pstmt.setString(2, uVO.getUserBirthday());
			pstmt.setString(3, uVO.getUserPhone());
			pstmt.setString(4, uVO.getUserId());

			// 쿼리문 수행 후 결과 얻기
			cnt = pstmt.executeUpdate();

		} finally {
			dbCon.dbClose(rs, pstmt, con);
		}
		return cnt;
	}//updateUserDetail
	
	
	///////////////////////////회원 정보 삭제//////////////////////////////
	public int updateUserDeleteFlag(String userId) throws SQLException {
		int cnt = 0;

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
			StringBuilder deleteUser = new StringBuilder();
			deleteUser.append("	update users	")
						.append("	set user_delete_flag = 'Y'	")
						.append("	where user_id=?	");

			pstmt = con.prepareStatement(deleteUser.toString());

			//바인드 변수
			pstmt.setString(1, userId);

			// 쿼리문 수행 후 결과 얻기
			cnt = pstmt.executeUpdate();

		} finally {
			dbCon.dbClose(rs, pstmt, con);
		}
		return cnt;
	}//updateUserDetail
    
    
}


