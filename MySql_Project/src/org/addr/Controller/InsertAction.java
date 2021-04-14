package org.addr.Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.addr.model.Address;
import org.addr.model.AddressDAO;
import org.addr.model.AddressDAOImpl;

/**
 * Servlet implementation class InsertAction
 */
@WebServlet("/my_addr/insert")
public class InsertAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("address_insert.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		Address address = new Address();
		address.setName(request.getParameter("name"));
		address.setZipcode(request.getParameter("zipcode"));
		address.setAddr(request.getParameter("addr"));
		address.setTel(request.getParameter("tel"));
		
		AddressDAO dao = AddressDAOImpl.getInstance();
		dao.addressInsert(address);
//		response.sendRedirect("list");
	}

}
