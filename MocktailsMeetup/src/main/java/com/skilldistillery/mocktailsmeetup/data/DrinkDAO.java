package com.skilldistillery.mocktailsmeetup.data;

import com.skilldistillery.mocktailsmeetup.entities.Drink;

public interface DrinkDAO {
	
	Drink findById(int drinkId);

	
}
