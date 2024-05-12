package user.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import user.VO.PaymentVO;
import util.DbConnection;

public class PaymentDAO {
	
	private static PaymentDAO pDAO;
	
	private PaymentDAO() {
	}
	
	public static PaymentDAO getInstance() {
		if(pDAO == null) {
			pDAO = new PaymentDAO();
		} // end if
		return pDAO;
	} // getInstance
	
	/**
	 * 가장 마지막 결제번호 가져오기
	 * @return
	 */
	public String selectMaxPaymentNumber() throws SQLException {
		String maxPaymentNumber = "";
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DbConnection dbCon = DbConnection.getInstance();
		
		try {
			String id = "son";
			String pass = "jimin";
			
			con = dbCon.getConnection(id, pass);
			
			String selectMaxPaymentNumber = "select max(payment_number) as max_payment_number from payment";
			
			pstmt = con.prepareStatement(selectMaxPaymentNumber);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				maxPaymentNumber = rs.getString("max_payment_number");
			} // end if
			
			// DB의 가장 마지막 예매번호 + 1 구하기
			String character = maxPaymentNumber.substring(0, 1);
			int number = Integer.parseInt(maxPaymentNumber.substring(1))+1;
			String num = String.format("%010d", number);
					
			maxPaymentNumber = character+num;
		} finally {
			dbCon.dbClose(rs, pstmt, con);
		} // end finally
		return maxPaymentNumber;
	} // selectMaxReservationNumber
	
	/**
	 * 결제하기
	 * @param rvtVO
	 * @throws SQLException
	 */
	public void insertPayment(PaymentVO pVO) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DbConnection dbCon = DbConnection.getInstance();
		
		try {
			String id = "son";
			String pass = "jimin";
			
			con = dbCon.getConnection(id, pass);
			
			String insertPayment = "insert into payment(payment_number, reservation_number, total_price, payment_method_number) values(?, ?, ?, ?)";
			
			int paymentMethodNumber = 1;
			if(pVO.getPaymentMethod().equals("card")) {
				paymentMethodNumber = 2;
			} // end if
			
			pstmt = con.prepareStatement(insertPayment);
			pstmt.setString(1, pVO.getPaymentNumber());
			pstmt.setString(2, pVO.getReservationNumber());
			pstmt.setString(3, pVO.getTotalPrice());
			pstmt.setInt(4, paymentMethodNumber);
			
			pstmt.executeUpdate();
		} finally {
			dbCon.dbClose(rs, pstmt, con);
		} // end finally
	} // insertReservation

} // class