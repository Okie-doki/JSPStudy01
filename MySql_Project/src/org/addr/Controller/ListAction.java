package org.addr.Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.addr.model.Address;
import org.addr.model.AddressDAO;
import org.addr.model.AddressDAOImpl;

/**
 * Servlet implementation class ListAction
 */
@WebServlet("/my_addr/list")
public class ListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String field = request.getParameter("field")==null? "name":request.getParameter("field");
		String word = request.getParameter("word")==null? "":request.getParameter("word");
		
		AddressDAO dao = AddressDAOImpl.getInstance();
		ArrayList<Address> arr = dao.getAddress(field, word);
		int count = dao.getCount(field, word);
		
		request.setAttribute("lists", arr);
		request.setAttribute("count", count);
		request.getRequestDispatcher("address_list.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
