package com.skilldistillery.mocktailsmeetup.data;

import java.util.List;

import com.skilldistillery.mocktailsmeetup.entities.Category;
import com.skilldistillery.mocktailsmeetup.entities.Drink;

public interface DrinkDAO {

	Drink createNewDrink (Drink drink); 
	
	Drink findById(int drinkId);
	
	List<Drink> findByKeyword(String keyword);
	
	List<Drink> findDrinkByCategory (Category category);
	
	Drink updateDrink (int drinkId, Drink drink);
	
	List<Drink> FindAllDrinks ();
}
