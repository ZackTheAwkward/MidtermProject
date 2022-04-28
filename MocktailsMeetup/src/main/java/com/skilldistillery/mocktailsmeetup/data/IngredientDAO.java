package com.skilldistillery.mocktailsmeetup.data;

import java.util.List;

import com.skilldistillery.mocktailsmeetup.entities.Ingredient;
import com.skilldistillery.mocktailsmeetup.entities.RecipeIngredient;

public interface IngredientDAO {

		Ingredient findById(int ingredientId); 
		
		List<Ingredient> findByKeyword(String keyword);
		
		Ingredient createIngredient(RecipeIngredient recipeIngredient);
		
		Ingredient updateIngredient(int id, Ingredient ingredient);
		
		List<Ingredient> listAll();
		
}
