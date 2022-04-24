package com.skilldistillery.mocktailsmeetup.data;

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

}
