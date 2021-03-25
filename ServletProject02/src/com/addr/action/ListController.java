package com.addr.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.addr.model.AddrDAO;
import com.addr.model.AddrDAOImpl;
import com.addr.model.AddrDTO;

/**
 * Servlet implementation class ListController
 */
@WebServlet("/addr/list.addr")
public class ListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		AddrDAO dao = AddrDAOImpl.getInstance();
		ArrayList<AddrDTO> arr = dao.addrList();
		request.setAttribute("lists", arr);
		
//		°³¼ö
		int count = dao.addrCount();
		request.setAttribute("count", count);
		
		request.getRequestDispatcher("addr_list.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
