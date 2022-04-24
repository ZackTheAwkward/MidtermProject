package com.skilldistillery.mocktailsmeetup.data;

import com.skilldistillery.mocktailsmeetup.entities.Recipe;

public interface RecipeDAO {
	Recipe findById(int recipeId);
}
