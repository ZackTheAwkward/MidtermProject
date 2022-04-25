package com.skilldistillery.mocktailsmeetup.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.mocktailsmeetup.entities.Category;
import com.skilldistillery.mocktailsmeetup.entities.Drink;

@Service
@Transactional
public class DrinkDaoImpl implements DrinkDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public Drink findById(int drinkId) {
		return em.find(Drink.class, drinkId);
	}

	@Override
	public List<Drink> findByKeyword(String keyword) {
		List<Drink> drinks = null;
		String jpql = "SELECT d FROM Drink d WHERE name LIKE :keyword OR description LIKE :keyword";
		drinks = em.createQuery(jpql, Drink.class).setParameter("keyword", "%" + keyword + "%" ).getResultList();
		return drinks;
	}

	@Override
	public Drink createNewDrink (Drink drink) {
		em.persist(drink);
		return em.find(Drink.class, drink.getId());
	}
	
	
	public List<Drink> findDrinkByCategory (Category category) {
		String jpql = "SELECT d FROM Drink d WHERE d.category = :category ";
		return em.createQuery(jpql, Drink.class).setParameter("category", category).getResultList();
	}
	
	
	public Drink updateDrink (int drinkId, Drink drink) {
		Drink updated = em.find(Drink.class, drinkId);
		updated.setName(drink.getName());
		updated.setDescription(drink.getDescription());
		updated.setImageUrl(drink.getImageUrl());
		em.flush();
		return updated;	
	}
	
	
	public List<Drink> FindAllDrinks () {
		String jpql = "SELECT d FROM Drink d";
		return em.createQuery(jpql, Drink.class).getResultList();
	}


	
	
	
}
