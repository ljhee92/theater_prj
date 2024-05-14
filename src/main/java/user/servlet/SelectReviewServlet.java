package user.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import user.DAO.UserReviewDAO;
import user.VO.ReviewVO;


@WebServlet("/SelectReviewServlet")
public class SelectReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charset=UTF-8");
        String userId = request.getParameter("id");
       

        try {
            String resultJSON = getJSON(userId);
            response.getWriter().write(resultJSON);
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().write("{\"success\":false}");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("{\"success\":false}");
        }

    }

    public String getJSON(String userId) throws SQLException {
        StringBuilder result = new StringBuilder("");
        result.append("{\"success\":");
        UserReviewDAO urDAO = UserReviewDAO.getInstance();
        try {
            List<ReviewVO> rVOList = urDAO.selectReview(userId);
            if (rVOList.isEmpty()) {
                result.append("false}");
            } else {
                result.append("true,");
                result.append("\"result\":[");
                for (int i = 0; i < rVOList.size(); i++) {
                    result.append("{");
                    result.append("\"reservationNumber\": \"" + rVOList.get(i).getReservationNumber() + "\",");
                    result.append("\"movieTitle\": \"" + rVOList.get(i).getMovieTitle() + "\",");
                    result.append("\"moviePosterPath\": \"" + rVOList.get(i).getMoviePosterPath() + "\",");
                    result.append("\"theaterName\": \"" + rVOList.get(i).getTheaterName() + "\",");
                    result.append("\"theaterNumber\": \"" + rVOList.get(i).getTheaterNumber() + "\",");
                    result.append("\"screeningDate\": \"" + rVOList.get(i).getScreeningDate() + "\",");
                    result.append("\"screeningTime\": \"" + rVOList.get(i).getScreeningTime() + "\",");
                    result.append("\"reviewNumber\": \"" + rVOList.get(i).getReviewNumber() + "\",");
                    result.append("\"reviewScore\": \"" + rVOList.get(i).getReviewScore()+ "\",");
                    result.append("\"reviewContent\": \"" + rVOList.get(i).getReviewContent() + "\"");
                    result.append("}");
                    if (i < rVOList.size() - 1) {
                        result.append(",");
                    }
                }
                result.append("]}");
            }
        } catch (SQLException e) {
            // 예외 처리
            e.printStackTrace();
            result.append("false}");
        }
        System.out.println(result.toString());
        return result.toString();
    }
}