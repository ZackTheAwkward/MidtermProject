package com.skilldistillery.mocktailsmeetup.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.mocktailsmeetup.entities.Recipe;
import com.skilldistillery.mocktailsmeetup.entities.RecipeComment;

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
	
	@Override
	public Recipe updateRecipe(int id, Recipe recipe) {
		Recipe updated = em.find(Recipe.class, id);
		updated.setName(recipe.getName());
		updated.setDescription(recipe.getDescription());
		updated.setInstructions(recipe.getInstructions());
		updated.setImageUrl(recipe.getImageUrl());
		em.flush();
		return updated;
	}
	
	@Override
	public boolean deleteRecipe(int id) {
		
		boolean isDeleted = false;
		Recipe recipe = em.find(Recipe.class, id);
		if (recipe != null) {
			em.remove(recipe);
		}
		em.flush();
		isDeleted = !em.contains(recipe);
		
		return isDeleted;
	}
	

	
	@Override
	public List<Recipe> findAll() {
		String jpql = "SELECT r FROM Recipe r";
		return em.createQuery(jpql, Recipe.class).getResultList();

	}
	
	public Recipe createYourOwn(Recipe recipe) {
		em.persist(recipe);
		return recipe;
	}
	
	
	@Override
	public List<RecipeComment> findAllRecipeComments(int id) {
		String jpql = "SELECT rc FROM RecipeComment rc WHERE id = :id";
		return em.createQuery(jpql, RecipeComment.class).getResultList();
		

	}
	
	@Override
	public RecipeComment createComment(RecipeComment comment) {
//		em.persist(comment.getUser());
//		em.persist(comment.getRecipe());
	
		em.persist(comment);
		
		return comment;
		
	}

}
	






