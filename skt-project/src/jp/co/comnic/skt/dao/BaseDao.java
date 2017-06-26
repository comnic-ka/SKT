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
	
	public <T> T findById(Class<T> entityClass, Serializable id) {
		return em.find(entityClass, id);
	}
	
	
	public List<Lunch> findAll(CriteriaQuery query, Root root){
		return null;
	}
	
	public Review findKeyword(Class<Review> entityClass, String keyword){
		return null;
	}
	
	public void insert(Object entity){
		
	}
	
	public void remove(Object entity){
		
	}
	
	public void update(Object entity){
		
	}
	
}
