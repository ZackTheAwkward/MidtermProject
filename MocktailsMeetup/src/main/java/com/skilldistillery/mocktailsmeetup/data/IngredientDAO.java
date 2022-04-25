package com.skilldistillery.mocktailsmeetup.data;

import java.util.List;

import com.skilldistillery.mocktailsmeetup.entities.Ingredient;

public interface IngredientDAO {

		Ingredient findById(int ingredientId); 
		
		List<Ingredient> findByKeyword(String keyword);
		
		Ingredient createIngredient(Ingredient ingredient);
		
		Ingredient updateIngredient(int id, Ingredient ingredient);
		
		//Stretch goal. Figure out delete/set as inactive method?
}
