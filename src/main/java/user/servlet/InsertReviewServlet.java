package user.servlet;

import java.io.IOException;
import java.sql.SQLException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.DAO.ReviewDAO;

import user.VO.ReviewVO;


@WebServlet("/InsertReviewServlet")
public class InsertReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charset=UTF-8");
        
        String reservationNumber = request.getParameter("reservationNumber");
        String reviewContent = request.getParameter("reviewContent");
        int reviewScore = Integer.parseInt(request.getParameter("starScore"));
        String movieCode = request.getParameter("movieCode");
        
       
        
        
        ReviewVO rVO = ReviewVO.builder()
        				.reservationNumber(reservationNumber)
        				.reviewContent(reviewContent)
        				.reviewScore(reviewScore)
        				.movieCode(movieCode)
        				.build();
        
        
        
        
        
        
        


        try {
            String resultJSON = getJSON(rVO);
            response.getWriter().write(resultJSON);
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().write("{\"success\":false}");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("{\"success\":false}");
        }

    }

    public String getJSON(ReviewVO rVO) throws SQLException {
        StringBuilder result = new StringBuilder("");
        result.append("{\"success\":");
        ReviewDAO rDAO = ReviewDAO.getInstance();
        try {
            int cnt = rDAO.insertReview(rVO);
            if (cnt!=1) {
                result.append("false}");
            } else {
                result.append("true}");

            }
        } catch (SQLException e) {
            // 예외 처리
            e.printStackTrace();
            result.append("false}");
        }

        return result.toString();
    }
}