package com.skilldistillery.mocktailsmeetup.entities;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

@Entity
@Table(name = "recipe_comment")
public class RecipeComment {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "text_content")
	private String comment;

	@Column(name = "post_date")
	@CreationTimestamp
	private LocalDate createDate;

	@Column(name = "in_reply_to_id")
	private Integer replyToInt;

	@ManyToOne
	@JoinColumn(name = "recipe_id")
	private Recipe recipe;

	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;

	public RecipeComment() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Integer getReplyToInt() {
		return replyToInt;
	}

	public void setReplyToInt(Integer replyToInt) {
		this.replyToInt = replyToInt;
	}

	public Recipe getRecipe() {
		return recipe;
	}

	public void setRecipe(Recipe recipe) {
		this.recipe = recipe;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public String toString() {
		return "RecipeComment [id=" + id + ", comment=" + comment + "]";
	}

}
