package com.skilldistillery.mocktailsmeetup.entities;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;

@Entity
public class Ingredient {
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Id
	private int id;
	
	@Column
	private String name; 
	
	@Column(name="image_url")
	private String imageUrl; 

	
	@Column
	private String description;
	
	@ManyToMany
	@JoinTable(name="recipe_ingredient",
	joinColumns=@JoinColumn(name="ingredient_id"),
	inverseJoinColumns=@JoinColumn(name="recipe_id"))
	private List<Recipe> recipes;
	
	
	
	
//--------- END FIELDS -------------

	public Ingredient() {
		super();
	}
	
// ------- END No Arg - Constructor 

	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
	

	public List<Recipe> getRecipes() {
		return recipes;
	}

	public void setRecipes(List<Recipe> recipes) {
		this.recipes = recipes;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "Ingredient [id=" + id + ", name=" + name + ", description=" + description + "]";
	} 
	
	
	
}
