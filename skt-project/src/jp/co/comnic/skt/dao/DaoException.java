package jp.co.comnic.skt.dao;

public class DaoException extends Exception {

	private static final long serialVersionUID = 1L;

	public DaoException(Exception e) {
		super("an exception occur in the DAO layer.", e);
		
	}
}
