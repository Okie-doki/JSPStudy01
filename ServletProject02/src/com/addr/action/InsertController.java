package com.addr.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.addr.model.AddrDAO;
import com.addr.model.AddrDAOImpl;
import com.addr.model.AddrDTO;

/**
 * Servlet implementation class InsertController
 */
@WebServlet("/addr/insert.addr")
public class InsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("addr_insert.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		String zipcode = request.getParameter("zipcode");
		String addr = request.getParameter("addr");
		String tel = request.getParameter("tel");
		
		AddrDTO address = new AddrDTO();
		address.setName(name);
		address.setZipcode(zipcode);
		address.setAddr(addr);
		address.setTel(tel);
		
		AddrDAO dao = AddrDAOImpl.getInstance();
		dao.addrInsert(address);
		response.sendRedirect("list.addr");
	}

}
