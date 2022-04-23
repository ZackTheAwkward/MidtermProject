package com.skilldistillery.mocktailsmeetup.entities;

import java.time.LocalDate;
import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;

@Entity
public class Recipe {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String name;

	private String description;

	private boolean active;

	private String instructions;

	@Column(name = "image_url")
	private String imageUrl;

	@Column(name = "serving_size")
	private int servingSize;

	@Column(name = "created_date")
	private LocalDate createDate;
	
	@ManyToOne
	@JoinColumn(name = "drink_id")
	private Drink drink;
	
	
	@ManyToMany
	@JoinTable(name= "favorite_recipe",
			joinColumns=@JoinColumn(name="recipe_id"),
			inverseJoinColumns=@JoinColumn(name="user_id"))
	private List<User> usersFavorited;
	
	@ManyToMany
	@JoinTable(name="recipe_comment",
	joinColumns=@JoinColumn(name="recipe_id"),
	inverseJoinColumns=@JoinColumn(name="user_id"))
	private List<User> commenters;
	
	
	public Recipe() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public String getInstructions() {
		return instructions;
	}

	public void setInstructions(String instructions) {
		this.instructions = instructions;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public int getServingSize() {
		return servingSize;
	}

	public void setServingSize(int servingSize) {
		this.servingSize = servingSize;
	}

	public LocalDate getCreateDate() {
		return createDate;
	}

	public void setCreateDate(LocalDate createDate) {
		this.createDate = createDate;
	}
	

	public Drink getDrink() {
		return drink;
	}

	public void setDrink(Drink drink) {
		this.drink = drink;
	}
	
	

	public List<User> getUsersFavorited() {
		return usersFavorited;
	}

	public void setUsersFavorited(List<User> users) {
		this.usersFavorited = users;
	}

	public List<User> getCommenters() {
		return commenters;
	}

	public void setCommenters(List<User> commenters) {
		this.commenters = commenters;
	}

	@Override
	public String toString() {
		return "Recipe ID" + id + ", Name: " + name + ", Description: " + description + ", Instructions: "
				+ instructions + ", Serving Size: " + servingSize + ", Create Date: " + createDate;
	}

	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Recipe other = (Recipe) obj;
		return id == other.id;
	}

}
