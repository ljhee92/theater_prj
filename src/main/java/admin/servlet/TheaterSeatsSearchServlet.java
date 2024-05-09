package admin.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import VO.SeatVO;
import VO.TheaterVO;
import admin.DAO.TheaterDAO;

@WebServlet("/TheaterSeatsSearchServlet")
public class TheaterSeatsSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String theaterName = request.getParameter("theaterName");
		String theaterNum = request.getParameter("theaterNum");

		TheaterVO tVO = TheaterVO.builder().theaterName(theaterName).theaterNumber(theaterNum).build();

		// System.out.println("서블릿내부 theaterName : " + theaterName);
		// System.out.println("서블릿내부 theaterNum : " + theaterNum);
		response.getWriter().write(getJSON(tVO));

	}

	public String getJSON(TheaterVO tVO) {
		// System.out.println("getJSON시작");
		StringBuilder result = new StringBuilder("");
		result.append("{\"result\":[");
		TheaterDAO tDAO = TheaterDAO.getInstance();
		try {
			List<SeatVO> sVOList = tDAO.selectTheaterSeat(tVO);
			for (int i = 0; i < sVOList.size(); i++) {
				result.append("{");
				result.append("\"SeatLowNumber\": \"" + sVOList.get(i).getSeatLowNumber() + "\",");
				result.append("\"SeatColNumber\": \"" + sVOList.get(i).getSeatColNumber() + "\",");
				result.append("\"heaterName\": \"" + sVOList.get(i).getTheaterName() + "\",");
				result.append("\"TheaterNumber\": \"" + sVOList.get(i).getTheaterNumber() + "\",");
				result.append("\"ReservationStatus\": \"" + sVOList.get(i).getReservationStatus() + "\"");
				result.append("}");
				if (i < sVOList.size() - 1) {
					result.append(",");
				}
			}
			result.append("]}");
		} catch (SQLException e) {
			// 예외 처리
			e.printStackTrace();
		}

		System.out.println("result 리턴전 :  " + result);
		return result.toString();
	}
}