package servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import dao.CategoryDao;
import dao.ProductDao;
import entiti.Category;
import entiti.Product;
import mypackage.FactoryProvider;

@MultipartConfig
public class ProductAddServlet extends HttpServlet {
	private static final long serialVersionUID = 2L;

	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try(PrintWriter out=response.getWriter()){
			
			String op=request.getParameter("operation");
			if(op.trim().equals("addcategory"))
			{
				String title=request.getParameter("catTitle");
				String description=request.getParameter("catDescription");
				
				Category category=new Category();
				category.setCategoryTitle(title);
				category.setCategoryDescription(description);
				
				CategoryDao categoryDao=new CategoryDao(FactoryProvider.getFactory());
				categoryDao.saveCategory(category);
				
				HttpSession httpSession=request.getSession();
				httpSession.setAttribute("message2", "Category added Successfully");
				response.sendRedirect("Admin.jsp");
				return;
			}
			else if(op.trim().equals("addproduct"))
			{
				
				String pName=request.getParameter("pName");
				String pDesc=request.getParameter("pDesc");
				
				int pPrice=Integer.parseInt(request.getParameter("pPrice"));
				int pDiscount=Integer.parseInt(request.getParameter("pDiscount"));
				String Asin=request.getParameter("Asin");
				int catId=Integer.parseInt(request.getParameter("catId"));
				
				Part part=request.getPart("pPic");
				
				Product p=new Product();
				p.setpName(pName);
				p.setpDesc(pDesc);
				
				p.setpPrice(pPrice);
				p.setpAsin(Asin);
				p.setpDiscount(pDiscount);
				p.setpPhoto(part.getSubmittedFileName());
				
				CategoryDao cdao=new CategoryDao(FactoryProvider.getFactory());
				Category category=cdao.getCategoryById(catId);
				p.setCategory(category);
				
				
				ProductDao pdao=new ProductDao(FactoryProvider.getFactory());
				
				pdao.saveProduct(p);
				
				@SuppressWarnings("deprecation")
				String path=request.getRealPath("img") +File.separator + "products" + File.separator + part.getSubmittedFileName();
				
				try {
					FileOutputStream fos=new FileOutputStream(path);
					InputStream is=part.getInputStream();
					byte[]data=new byte[is.available()];
					is.read(data);
					fos.write(data);
					fos.close();
				}catch(Exception e) {
					e.printStackTrace();
				}
				
				
				HttpSession httpSession=request.getSession();
				httpSession.setAttribute("message3", "Product added Successfully!!");
				response.sendRedirect("Admin.jsp");
				return;
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
