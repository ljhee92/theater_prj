package user.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.DAO.UserReservationDAO;
import user.VO.UserReservationVO;

@WebServlet("/SelectReservationServlet")
public class SelectReservationServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //System.out.println("서블릿 입장");
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
        UserReservationDAO urDAO = UserReservationDAO.getInstance();
        try {
            List<UserReservationVO> urVOList = urDAO.selectUserReservation(userId);
            if (urVOList.isEmpty()) {
                result.append("false}");
            } else {
                result.append("true,");
                result.append("\"result\":[");
                for (int i = 0; i < urVOList.size(); i++) {
                    result.append("{");
                    result.append("\"reservationNumber\": \"" + urVOList.get(i).getReservationNumber() + "\",");
                    result.append("\"reservationDate\": \"" + urVOList.get(i).getReservationDate() + "\",");
                    result.append("\"movieTitle\": \"" + urVOList.get(i).getMovieTitle() + "\",");
                    result.append("\"moviePosterPath\": \"" + urVOList.get(i).getMoviePosterPath() + "\",");
                    result.append("\"theaterName\": \"" + urVOList.get(i).getTheaterName() + "\",");
                    result.append("\"screeningDate\": \"" + urVOList.get(i).getScreeningDate() + "\",");
                    result.append("\"seatLownumber\": \"" + urVOList.get(i).getSeatLownumber() + "\",");
                    result.append("\"seatColnumber\": \"" + urVOList.get(i).getSeatColnumber() + "\",");
                    result.append("\"totalPrice\": \"" + urVOList.get(i).getTotalPrice() + "\"");
                    result.append("}");
                    if (i < urVOList.size() - 1) {
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
       // System.out.println(result);
        return result.toString();
    }
}