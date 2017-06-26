package jp.co.comnic.skt.dao;

import javax.persistence.NoResultException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;


import jp.co.comnic.skt.entity.Account;

public class AccountDao extends BaseDao {

	public AccountDao() throws DaoException {}
	private CriteriaQuery<Account> query = builder.createQuery(Account.class);
	private Root<Account> root = query.from(Account.class);
	
	
	
	
	public Account loginAuthenticate(String email, String password){
	Account account = null;
		
		try {	
			query.select(root)
				 .where(builder.equal(root.get("email"), email), 
						builder.equal(root.get("password"), password));	
	
			account = em.createQuery(query).getSingleResult();
			
		} catch (NoResultException e) {

		}
		
		return account;
	}	
}
	

