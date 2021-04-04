package mypackage;

import org.hibernate.SessionFactory;
import org.hibernate.boot.Metadata;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;


public class FactoryProvider {
	public static StandardServiceRegistry standardServiceRegistry;
	public static SessionFactory factory;
	static {
		if(factory == null)
		{
			try {
				standardServiceRegistry =new StandardServiceRegistryBuilder().configure().build();
				MetadataSources metadataSources=new MetadataSources(standardServiceRegistry);
				Metadata metadata=metadataSources.getMetadataBuilder().build();
				factory=metadata.getSessionFactoryBuilder().build();
			}catch(Exception e) {
				e.printStackTrace();
				if(standardServiceRegistry != null) {
					StandardServiceRegistryBuilder.destroy(standardServiceRegistry);
				}
			}
		}
	}
	public static SessionFactory getFactory()
	{
		return factory;
	}
}