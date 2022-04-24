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
		String jpql = "SELECT i FROM Ingredient i WHERE i.name = :keyword OR i.description = :keyword";
		ingredients = em.createQuery(jpql, Ingredient.class).setParameter("keyword",  "%" + keyword + "%" ).getResultList();
		return ingredients;
	}

}
