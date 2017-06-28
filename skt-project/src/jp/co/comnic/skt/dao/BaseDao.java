package jp.co.comnic.skt.dao;

import java.io.Serializable;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;


import jp.co.comnic.skt.entity.Account;
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

	
	
	
	
	public Review findKeyword(Class<Review> entityClass, Object entity){
		return em.find(entityClass, entity);
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
	
	public <T> void remove(Class<T> entityClass, Serializable lunchName) throws DaoException {
		// エンティティ・オブジェクトを取得して削除
		remove(em.find(entityClass, lunchName));
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

	public Account findAll(Class<Account> class1, Integer id) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
