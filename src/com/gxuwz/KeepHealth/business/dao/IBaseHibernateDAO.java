package com.gxuwz.KeepHealth.business.dao;

import org.hibernate.Session;

/**
 * Data access interface for domain model
 * @author MyEclipse Persistence Tools
 */
public interface IBaseHibernateDAO {
	public Session getSession();
}