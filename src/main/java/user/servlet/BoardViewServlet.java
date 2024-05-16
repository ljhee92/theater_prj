package user.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.DAO.BoardDetailDAO;

/**
 * Servlet implementation class BoardViewServlet
 */
@WebServlet("/BoardViewServlet")
public class BoardViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String boardNumber = request.getParameter("boardNumber");
		System.out.println(boardNumber);
		int intBoardNumber = 0;
		try {
			intBoardNumber = Integer.parseInt(boardNumber);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		BoardDetailDAO bdDAO = BoardDetailDAO.getInstance();
		try {
			bdDAO.updateViews(intBoardNumber);
			successAjax();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	public String successAjax() {
		String result = "success";
		return result;
	}

}
