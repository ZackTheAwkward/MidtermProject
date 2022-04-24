package com.skilldistillery.mocktailsmeetup.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.mocktailsmeetup.entities.Recipe;

@Service
@Transactional
public class RecipeDaoImpl implements RecipeDAO {

		@PersistenceContext
		private EntityManager em;
		
	@Override
	public Recipe findById(int recipeId) {
		return em.find(Recipe.class, recipeId);
	}

}
