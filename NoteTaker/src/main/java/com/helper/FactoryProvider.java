package com.helper;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class FactoryProvider {
	
	public static SessionFactory factory;
	
	public static SessionFactory getFactory()
//	if factory is null then we call below statement factory==null and create new factory
	{
		if (factory==null) {
			factory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory(); 
			
		}
		return factory;
	}
	
//	to open factory we use factoryprovide.getfactory and
//	to close factory we factoryProvide.closeFactory
	
	public void closeFactory() {
		if (factory.isOpen()) 
		{
		 factory.isClosed();
		}
	}

}
