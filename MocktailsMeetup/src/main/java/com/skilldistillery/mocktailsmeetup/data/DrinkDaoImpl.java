package com.skilldistillery.mocktailsmeetup.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

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
		String jpql = "SELECT d FROM Drink d WHERE d.name = :keyword OR d.description = :keyword";
		drinks = em.createQuery(jpql, Drink.class).setParameter("keyword", "%" + keyword + "%" ).getResultList();
		return drinks;
	}

}
