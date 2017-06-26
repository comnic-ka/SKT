package jp.co.comnic.skt.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the Lunch database table.
 * 
 */
@Entity
@Table(name ="Lunch")
@NamedQuery(name="Lunch.findAll", query="SELECT l FROM Lunch l")
public class Lunch implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="lunch_name")
	private String lunchName;

	private String location;

	//bi-directional many-to-one association to Review
	@OneToMany(mappedBy="lunch")
	private List<Review> reviews;

	public Lunch() {
	}

	public String getLunchName() {
		return this.lunchName;
	}

	public void setLunchName(String lunchName) {
		this.lunchName = lunchName;
	}

	public String getLocation() {
		return this.location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public List<Review> getReviews() {
		return this.reviews;
	}

	public void setReviews(List<Review> reviews) {
		this.reviews = reviews;
	}

	public Review addReview(Review review) {
		getReviews().add(review);
		review.setLunch(this);

		return review;
	}

	public Review removeReview(Review review) {
		getReviews().remove(review);
		review.setLunch(null);

		return review;
	}

}