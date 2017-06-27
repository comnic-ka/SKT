package jp.co.comnic.skt.dao;

import java.util.List;

import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import jp.co.comnic.skt.entity.Lunch;



public class LunchDao extends BaseDao {

	public LunchDao() throws DaoException {}
	private CriteriaQuery<Lunch> query = builder.createQuery(Lunch.class);
	private Root<Lunch> root = query.from(Lunch.class);
	
	public List<Lunch> findAll() {
		
		return super.findAll(query, root);
	}
	

}
