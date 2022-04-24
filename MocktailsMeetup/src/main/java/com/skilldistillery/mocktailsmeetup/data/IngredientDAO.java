package com.skilldistillery.mocktailsmeetup.data;

import com.skilldistillery.mocktailsmeetup.entities.Ingredient;

public interface IngredientDAO {

		Ingredient findById(int ingredientId); 
}
