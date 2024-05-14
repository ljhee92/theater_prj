package user.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.DAO.LoginDAO;
import user.DAO.UserReservationDAO;
import user.VO.UserReservationVO;
import user.VO.UserVO;


@WebServlet("/DeleteReservationServlet")
public class DeleteReservationServlet extends HttpServlet {
	 private static final long serialVersionUID = 1L;
	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {

	        request.setCharacterEncoding("UTF-8");
	        response.setContentType("application/json");
	        
	        String reservationNumber = request.getParameter("reservationNumber");
	        
	        


	        try {
	            boolean result = deleteReservation(reservationNumber);
	            String jsonResponse = "{\"success\": " + result + "}";
	            response.getWriter().write(jsonResponse);
	        } catch (SQLException e) {
	            // 예외 처리
	            e.printStackTrace();
	            // 클라이언트에게 오류 응답 전송
	            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while updating theater.");
	        }
	    }

	    public boolean deleteReservation(String reservationNumber) throws SQLException {
	    	boolean result = false;
	        UserReservationDAO urDAO = UserReservationDAO.getInstance();
	        result = urDAO.deleteReservation(reservationNumber);

	        return result;
	    }
	}
