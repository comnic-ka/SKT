package jp.co.comnic.skt.entity;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the Review database table.
 * 
 */
@Entity
@Table(name ="Review")
@NamedQuery(name="Review.findAll", query="SELECT r FROM Review r")
public class Review implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String email;

	private int distances;

	private int price;

	private String review;

	private int taste;

	private int variety;

	private int volume;

	//bi-directional one-to-one association to Account
	@OneToOne
	@JoinColumn(name="email", updatable=false, insertable=false)
	private Account account;

	//bi-directional many-to-one association to Lunch
	@ManyToOne
	@JoinColumn(name="lunch_name", updatable=false, insertable=false)
	private Lunch lunch;

	public Review() {
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getDistances() {
		return this.distances;
	}

	public void setDistances(int distances) {
		this.distances = distances;
	}

	public int getPrice() {
		return this.price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getReview() {
		return this.review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public int getTaste() {
		return this.taste;
	}

	public void setTaste(int taste) {
		this.taste = taste;
	}

	public int getVariety() {
		return this.variety;
	}

	public void setVariety(int variety) {
		this.variety = variety;
	}

	public int getVolume() {
		return this.volume;
	}

	public void setVolume(int volume) {
		this.volume = volume;
	}

	public Account getAccount() {
		return this.account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public Lunch getLunch() {
		return this.lunch;
	}

	public void setLunch(Lunch lunch) {
		this.lunch = lunch;
	}

}