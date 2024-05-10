package admin.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;

import java.time.LocalTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import user.DAO.UserReservationDAO;
import user.VO.UserReservationVO;


@WebServlet("/CheckReservationTimeServlet")
public class CheckReservationTimeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        
        String reservationNumber = request.getParameter("reservationNumber");
        
        


        try {
        	
            boolean result = checkReservationTime(reservationNumber);
            String jsonResponse = "{\"success\": " + result + "}";
            response.getWriter().write(jsonResponse);
        } catch (SQLException e) {
            // 예외 처리
            e.printStackTrace();
            // 클라이언트에게 오류 응답 전송
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while updating theater.");
        }
    }

    public boolean checkReservationTime(String reservationNumber) throws SQLException {
        UserReservationDAO urDAO = UserReservationDAO.getInstance();
        UserReservationVO urVO = urDAO.checkReservationTime(reservationNumber);
        

        
        
        // screeningDate와 현재 날짜 비교
        LocalDate screeningDate = urVO.getScreeningDate().toLocalDate();
        LocalDate today = LocalDate.now();
        //System.out.println("screeningDate : " + screeningDate);
        //System.out.println("today : " + today);
        if (today.isBefore(screeningDate)) {
            return true; // 오늘이 screeningDate 보다 이전이면 true 반환
        } else if (today.isEqual(screeningDate)) {
            // screeningTime의 시작 시간 추출
            String screeningTime = urVO.getScreeningTime();
            String[] timeParts = screeningTime.split("~");
            String startHourStr = timeParts[0].trim().substring(0, 2);
            int startHour = Integer.parseInt(startHourStr);

            // 현재 시간과 시작 시간 비교
            LocalTime now = LocalTime.now();
            int currentHour = now.getHour();
            //System.out.println("currentHour : " + currentHour);
            //System.out.println("startHour : " + startHour);
            if (currentHour < startHour) {
                return true; // 현재 시간이 시작 시간 이전이면 true 반환
            }
        }

        // 모든 조건을 만족하지 않으면 false 반환
        return false;
    }
}
