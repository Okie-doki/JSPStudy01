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
 * Servlet implementation class UpdateAction
 */
@WebServlet("/my_addr/update")
public class UpdateAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		Address address = new Address();
		address.setName(request.getParameter("name"));
		address.setNum(Integer.parseInt(request.getParameter("num")));
		address.setAddr(request.getParameter("addr"));
		address.setZipcode(request.getParameter("zipcode"));
		address.setTel(request.getParameter("tel"));
		
		AddressDAO dao = AddressDAOImpl.getInstance();
		dao.addressUpdate(address);
		
		response.sendRedirect("list");
	}

}
