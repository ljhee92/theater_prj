package user.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.DAO.ReviewDAO;
import user.DAO.UserReservationDAO;
import user.VO.ReviewVO;


@WebServlet("/UpdateReviewServlet")
public class UpdateReviewServlet extends HttpServlet {
	 private static final long serialVersionUID = 1L;
	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {

	        request.setCharacterEncoding("UTF-8");
	        response.setContentType("application/json");
	        
	        int reviewNumber = Integer.parseInt(request.getParameter("reviewNumber"));
	        String reviewContent = request.getParameter("reviewContent");
	        int reviewScore = Integer.parseInt(request.getParameter("reviewScore"));
	        
	        ReviewVO rVO = ReviewVO.builder()
	        				.reviewNumber(reviewNumber)
	        				.reviewContent(reviewContent)
	        				.reviewScore(reviewScore)
	        				.build();


	        try {
	            boolean result = updateReview(rVO);
	            String jsonResponse = "{\"success\": " + result + "}";
	            response.getWriter().write(jsonResponse);
	        } catch (SQLException e) {
	            // 예외 처리
	            e.printStackTrace();
	            // 클라이언트에게 오류 응답 전송
	            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while updating theater.");
	        }
	    }

	    public boolean updateReview(ReviewVO rVO) throws SQLException {
	    	boolean result = false;
	        ReviewDAO rDAO = ReviewDAO.getInstance();
	        result = rDAO.modifyReview(rVO);

	        return result;
	    }
	}
