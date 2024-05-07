package admin.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import VO.SeatVO;
import admin.DAO.TheaterDAO;

@WebServlet("/UpdateSeatStatusServlet")
public class UpdateSeatStatusServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        
        
        String seatInfo = request.getParameter("seatInfo");
        String seatLowNumber = seatInfo.substring(0,1);
        String seatColNumber = seatInfo.substring(1);
        String theaterName = request.getParameter("theaterName");
        String theaterNumber = request.getParameter("theaterNumber");
        char reservationStatus = request.getParameter("setSeatStatus").charAt(0);
        
        
        
        
        SeatVO sVO = SeatVO.builder()
        			.seatLowNumber(seatLowNumber)
        		    .seatColNumber(seatColNumber)
        		    .theaterName(theaterName)
        		    .theaterNumber(theaterNumber)
        		    .reservationStatus(reservationStatus)
        		    .build();
        

        try {
            boolean success = updateSeat(sVO);
            String jsonResponse = "{\"success\": " + success + "}";
            response.getWriter().write(jsonResponse);
        } catch (SQLException e) {
            // 예외 처리
            e.printStackTrace();
            // 클라이언트에게 오류 응답 전송
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while updating theater.");
        }
    }

    public boolean updateSeat(SeatVO sVO) throws SQLException {


        TheaterDAO tDAO = TheaterDAO.getInstance();
        // 여기서 업데이트 작업 수행
        boolean success = tDAO.updateSeatStatus(sVO);
        return success;
    }
}