package com.skilldistillery.mocktailsmeetup.data;

import java.util.List;

import com.skilldistillery.mocktailsmeetup.entities.Recipe;
import com.skilldistillery.mocktailsmeetup.entities.RecipeComment;

public interface RecipeDAO {
	Recipe findById(int recipeId);
	List<Recipe> findByKeyword(String keyword);
	Recipe updateRecipe(int id, Recipe recipe);
	List<Recipe> findAll();
	Recipe createYourOwn(Recipe recipe);
	List<RecipeComment> findAllRecipeComments(int id);
	RecipeComment createComment(RecipeComment comment);
	Recipe deleteRecipe(int id, Recipe recipe);
}
