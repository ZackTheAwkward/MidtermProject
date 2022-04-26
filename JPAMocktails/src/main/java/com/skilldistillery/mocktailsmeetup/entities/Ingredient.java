package com.skilldistillery.mocktailsmeetup.entities;

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
import javax.persistence.OneToMany;

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
	
	@OneToMany(mappedBy= "ingredient")
	private List<RecipeIngredient> recipes;
	
	
	
	
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
	
	

	public List<RecipeIngredient> getRecipes() {
		return recipes;
	}

	public void setRecipes(List<RecipeIngredient> recipes) {
		this.recipes = recipes;
	}

	public void setId(int id) {
		this.id = id;
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
		Ingredient other = (Ingredient) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "Ingredient [id=" + id + ", name=" + name + ", description=" + description + "]";
	} 
	
	
	
}
