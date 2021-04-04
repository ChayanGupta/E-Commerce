package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ProductDao;
import entiti.Product;
import mypackage.FactoryProvider;


public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset-UTF-8");
		try(PrintWriter out=response.getWriter()){
			String email=request.getParameter("email");
			String password=request.getParameter("password");
			
			HttpSession httpSession=request.getSession();
			
			ProductDao userDao=new ProductDao(FactoryProvider.getFactory());
			Product user=userDao.getUserByEmailAndPassword(email, password);
			if(user==null)
			{
				httpSession.setAttribute("message","Email and Password Mismatch!");
				response.sendRedirect("Login.jsp");
				return;
			}
			else
			{
				httpSession.setAttribute("current-user", user);
				if(user.getUserType().equals("admin"))
					response.sendRedirect("Admin.jsp");
				else if(user.getUserType().equals("normal"))
					response.sendRedirect("Normal.jsp");
			}
		}
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request,response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request,response);
	}
}

