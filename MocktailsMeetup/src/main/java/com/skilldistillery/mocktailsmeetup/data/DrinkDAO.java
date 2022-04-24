package com.skilldistillery.mocktailsmeetup.data;

import java.util.List;

import com.skilldistillery.mocktailsmeetup.entities.Drink;

public interface DrinkDAO {
	
	Drink findById(int drinkId);
	List<Drink> findByKeyword(String keyword);
	
}
