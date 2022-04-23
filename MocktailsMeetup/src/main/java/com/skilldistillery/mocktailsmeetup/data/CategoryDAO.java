package com.skilldistillery.mocktailsmeetup.data;

import com.skilldistillery.mocktailsmeetup.entities.Category;

public interface CategoryDAO {
	Category findById(int categoryId);
}
