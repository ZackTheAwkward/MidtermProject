package com.skilldistillery.mocktailsmeetup.data;

import java.util.List;
import java.util.Random;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.mocktailsmeetup.entities.Recipe;
import com.skilldistillery.mocktailsmeetup.entities.RecipeComment;
import com.skilldistillery.mocktailsmeetup.entities.RecipeIngredient;
import com.skilldistillery.mocktailsmeetup.entities.RecipeIngredientId;

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
	public Recipe deleteRecipe(int id, Recipe recipe) {
		Recipe managed = em.find(Recipe.class, id);
		managed.setActive(false);
		return managed;
	}
	

	
	@Override
	public List<Recipe> findAll() {
		String jpql = "SELECT r FROM Recipe r";
		return em.createQuery(jpql, Recipe.class).getResultList();

	}
	
	public Recipe createYourOwn(Recipe recipe) {
		recipe.setActive(true);
		em.persist(recipe);
		return recipe;
	}
	
	public RecipeIngredient createYourIngredient(RecipeIngredient recipeIngredient) {
		em.persist(recipeIngredient);
		return recipeIngredient;
	}
	
	
	@Override
	public List<RecipeComment> findAllRecipeComments(int id) {
		String jpql = "SELECT rc FROM RecipeComment rc WHERE id = :id";
		return em.createQuery(jpql, RecipeComment.class).getResultList();
		

	}
	
	@Override
	public RecipeComment createComment(RecipeComment comment) {
		em.persist(comment);
		
		return comment;
		
	}
	
	@Override
	public Recipe surpriseMe() {
		String jpql = "SELECT r FROM Recipe r";
	List<Recipe> full = em.createQuery(jpql, Recipe.class).getResultList();
	Random rand = new Random();
	Recipe recipe = full.get(rand.nextInt(full.size()));
    
	return recipe;
	
	}

	@Override
	public List<Recipe> findAllUserCreated(int id) {
		String jpql = "SELECT r FROM Recipe r WHERE r.createdByUser.id = :id";
		List<Recipe> full = em.createQuery(jpql, Recipe.class).setParameter("id", id).getResultList();
		return full;
	}

	@Override
	public RecipeIngredient addIngredient(RecipeIngredient recipeIngredient) {
		RecipeIngredientId id = new RecipeIngredientId(recipeIngredient.getRecipe().getId(), recipeIngredient.getIngredient().getId());
		recipeIngredient.setId(id);
		em.persist(recipeIngredient);
		return recipeIngredient;
	}
}
	






