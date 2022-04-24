package com.skilldistillery.mocktailsmeetup.data;

import java.util.List;

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

	@Override
	public List<Recipe> findByKeyword(String keyword) {
		List<Recipe> recipes = null;
		String jpql = "SELECT r FROM Recipe r WHERE name LIKE :keyword OR description LIKE :keyword";
		recipes = em.createQuery(jpql, Recipe.class).setParameter("keyword", "%" + keyword + "%").getResultList();
		return recipes;
	}

}
