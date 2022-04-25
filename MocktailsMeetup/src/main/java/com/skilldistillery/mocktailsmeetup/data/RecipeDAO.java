package com.skilldistillery.mocktailsmeetup.data;

import java.util.List;

import com.skilldistillery.mocktailsmeetup.entities.Recipe;

public interface RecipeDAO {
	Recipe findById(int recipeId);
	List<Recipe> findByKeyword(String keyword);
	Recipe updateRecipe(int id, Recipe recipe);
	boolean deleteRecipe(int id);
	List<Recipe> findAll();
}
