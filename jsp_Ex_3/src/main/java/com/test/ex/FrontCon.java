package com.test.ex;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FrontCon
 */
@WebServlet("*.do")
public class FrontCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FrontCon() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("doGet");
		try {
			actionDo(request, response);
		} catch (ServletException | IOException | SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("doPost");
		try {
			actionDo(request, response);
		} catch (ServletException | IOException | SQLException e) {
			e.printStackTrace();
		}
	}

	protected void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		System.out.println("actionDo");
		
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String command = uri.substring(conPath.length());
		
		if(command.equals("/studentAll.do")) {
			System.out.println("studentAll.do");
			response.setContentType("text/html; charset=EUC-KR");
			PrintWriter writer = response.getWriter();
			writer.println("<html><head></head><body>");
			
			Service svc = new StudentAllService();
			ArrayList<StudentDTO> sdtos = svc.execute(request,response);
			
			
			for(int i=0; i<sdtos.size(); i++) {
				StudentDTO sdto = sdtos.get(i);
				String no = sdto.getHakbun();
				String pw = sdto.getPw();
				String name = sdto.getName();
				String hp = sdto.getHp();
				
				writer.println(no+", "+pw+", "+name+", "+hp+"<br/>");
			}
			writer.println("</body></html>");
		}
		
	}
}
