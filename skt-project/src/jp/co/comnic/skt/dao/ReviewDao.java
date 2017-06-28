package jp.co.comnic.skt.dao;

import java.util.List;

import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import jp.co.comnic.skt.entity.Review;



public class ReviewDao extends BaseDao {
	public ReviewDao() throws DaoException {}
	private CriteriaQuery<Review> query = builder.createQuery(Review.class);
	private Root<Review> root = query.from(Review.class);
	
	public List<Review> findAll() {
		return super.findAll(query, root);
	}
	
	public Review findByReview(Object entity) {
		return super.findKeyword(Review.class, entity);
	}
	
}
