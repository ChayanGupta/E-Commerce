package dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import entiti.Product;

@SuppressWarnings("deprecation")
public class ProductDao {
	private SessionFactory factory;

	public ProductDao(SessionFactory factory) {
		this.factory = factory;
	}
	
	public boolean saveProduct(Product product)
	{
		boolean f=false;
		try {
			Session session=this.factory.openSession();
			Transaction tx=session.beginTransaction();
			session.save(product);
			tx.commit();
			session.close();
			f=true;
		}catch(Exception e) {
			e.printStackTrace();
			f=false;
		}
		return f;
	}
	
	public List<Product> getAllProducts()
	{
		if(factory==null)
			factory=new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();	
		Session s=this.factory.openSession();
		@SuppressWarnings({ "rawtypes" })
		Query q=s.createQuery("from Product");
		@SuppressWarnings("unchecked")
		List<Product> list=q.list();
		return list;
	}
	
	public List<Product> getAllProductsById(int cid)
	{
		if(factory==null)
			factory=new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
		Session s=this.factory.openSession();
		@SuppressWarnings({ "rawtypes" })
		Query q=s.createQuery("from Product as p where p.category.categoryId=: id");
		q.setParameter("id", cid);
		@SuppressWarnings("unchecked")
		List<Product> list=q.list();
		return list;
	}
	
	public List<Product> getProductByProductId(int productId)
	{
		if(factory==null)
			factory=new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
		Session s=this.factory.openSession();
		@SuppressWarnings({ "rawtypes" })
		Query q=s.createQuery("from Product as p where p.pId=: d");
		q.setParameter("d", productId);
		@SuppressWarnings("unchecked")
		List<Product> list=q.list();
		return list;
	}
	
	@SuppressWarnings("rawtypes")
	public Product getUserByEmailAndPassword(String email,String password) {
		Product user=null;
		try {
			String query="from Product where userEmail=: e and userPassword=: p";
			if(factory==null)
				factory=new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
			Session session=this.factory.openSession();
			Query q=session.createQuery(query);
			q.setParameter("e", email);
			q.setParameter("p", password);
			user=(Product)((org.hibernate.query.Query) q).uniqueResult();
			session.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return user;
	}
	
	@SuppressWarnings("rawtypes")
	public Product checkUserByEmail(String email) {
		Product user=null;
		try {
			String query="from Product where userEmail=: e";
			if(factory==null)
				factory=new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
			Session session=this.factory.openSession();
			Query q=session.createQuery(query);
			q.setParameter("e", email);
			user=(Product)((org.hibernate.query.Query) q).uniqueResult();
			session.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return user;
	}

}