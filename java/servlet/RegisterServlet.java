package servlet;

import mypackage.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import dao.ProductDao;
import entiti.Product;


public class RegisterServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	protected void processRequest(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		response.setContentType("text/html;charset-UTF-8");
		try(PrintWriter out=response.getWriter()) {
			try {
				String userName=request.getParameter("userName");
				String userEmail=request.getParameter("userEmail");
				String userPassword=request.getParameter("userPassword");
				String userPhone=request.getParameter("userPhone");
				String confirmPassword=request.getParameter("confirmPassword");			

				SessionFactory factory=FactoryProvider.getFactory();
				Session hibernateSession=factory.openSession();
				HttpSession httpSession=request.getSession();
				Product user=new Product(userName,userEmail,userPassword,confirmPassword,userPhone,"normal");
				
				
				if(userPhone.length()<10)
				{
					httpSession.setAttribute("message","Please Enter Correct Phone Number");
					response.sendRedirect("Registration.jsp");
					return;
				}
				else if(userPassword.equals(confirmPassword)!=true)
				{
					httpSession.setAttribute("message","Pasword mismatch!");
					response.sendRedirect("Registration.jsp");
					return;
				}
				
				ProductDao userDao=new ProductDao(FactoryProvider.getFactory());
				Product checkuser=userDao.checkUserByEmail(userEmail);
				if(checkuser==null)
				{
					Transaction tx=hibernateSession.beginTransaction();
					int userid=(int)hibernateSession.save(user);
					user.setpId(userid);
					
					tx.commit();
					hibernateSession.close();
					
					httpSession.setAttribute("message","Registration Successfull!!");
					response.sendRedirect("Registration.jsp");
					return;
				}
				else
				{
					httpSession.setAttribute("message","Email is already exist!");
					response.sendRedirect("Registration.jsp");
					return;
				}
				
			}catch(Exception e) {
				e.printStackTrace();
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

