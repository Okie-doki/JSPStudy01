package org.addr.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.addr.model.AddressDAO;
import org.addr.model.AddressDAOImpl;
import org.addr.model.Zipcode;

import com.google.gson.Gson;

/**
 * Servlet implementation class ZipAction
 */
@WebServlet("/my_addr/zip")
public class ZipAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ZipAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("address_zip.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String dong = request.getParameter("dong");
		Zipcode zip = new Zipcode();
		
		AddressDAO dao = AddressDAOImpl.getInstance();
		ArrayList<Zipcode> zarr = dao.findZipcode(dong);
		
//		json데이터 전달
//		1. json-simple.jar 2. gson.jar
		
		Gson gson = new Gson();
		String obj = gson.toJson(zarr);
		
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(obj.toString());
	}

}
