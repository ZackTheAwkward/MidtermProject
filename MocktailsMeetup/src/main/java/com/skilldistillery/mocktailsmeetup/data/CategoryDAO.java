package com.skilldistillery.mocktailsmeetup.data;

import java.util.List;

import com.skilldistillery.mocktailsmeetup.entities.Category;

public interface CategoryDAO {
	Category findById(int categoryId);
	List<Category> findByKeyword(String keyword);
	
}
