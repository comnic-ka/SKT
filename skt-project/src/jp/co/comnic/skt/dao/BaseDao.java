package jp.co.comnic.skt.dao;

import java.io.Serializable;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import jp.co.comnic.skt.entity.Lunch;
import jp.co.comnic.skt.entity.Review;

public class BaseDao {

	protected EntityManager em = Persistence.createEntityManagerFactory("skt-project").createEntityManager();
	protected EntityTransaction tx = em.getTransaction();
	protected CriteriaBuilder builder = em.getCriteriaBuilder();
	
	
	
	
	protected <T> List<T> findAll(CriteriaQuery<T> query, Root<T> root) {
		return em.createQuery(query.select(root)).getResultList();
	}
	


	
	public Review findKeyword(Class<Review> entityClass, String review){
		return em.find(entityClass, review);
	}
	
	public void insert(Object entity) throws DaoException{
		try {
			tx.begin();
			em.persist(entity);
			tx.commit();
		} catch (Exception e) {
			throw new DaoException(e);
		}
	}
	
	public void remove(Object entity) throws DaoException{
		try {
			tx.begin();
			em.remove(entity);
			tx.commit();
		} catch (Exception e) {
			throw new DaoException(e);
		}
	
	}
	
	public void update(Object entity) throws DaoException{
		try {
			tx.begin();
			em.merge(entity);
			tx.commit();
		} catch (Exception e) {
			throw new DaoException(e);
		}
	}
	
}