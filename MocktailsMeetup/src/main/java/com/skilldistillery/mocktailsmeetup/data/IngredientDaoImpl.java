package com.skilldistillery.mocktailsmeetup.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.mocktailsmeetup.entities.Ingredient;


@Service
@Transactional
public class IngredientDaoImpl implements IngredientDAO {
	
	@PersistenceContext
	private EntityManager em;
	
	@Override
	public Ingredient findById(int ingredientId) {
		return em.find(Ingredient.class, ingredientId) ;
	}

	@Override
	public List<Ingredient> findByKeyword(String keyword) {
		List<Ingredient> ingredients = null;
		String jpql = "SELECT i FROM Ingredient i WHERE name LIKE :keyword OR description LIKE :keyword";
		ingredients = em.createQuery(jpql, Ingredient.class).setParameter("keyword",  "%" + keyword + "%" ).getResultList();
		return ingredients;
	}

	@Override
	public Ingredient createIngredient(Ingredient ingredient) {
		em.persist(ingredient);
		return em.find(Ingredient.class, ingredient.getId());
	}

	@Override
	public Ingredient updateIngredient(int id, Ingredient ingredient) {
		Ingredient managed = em.find(Ingredient.class, id);
		managed.setImageUrl(ingredient.getImageUrl());
		managed.setDescription(ingredient.getDescription());
		return managed;
	}

}
