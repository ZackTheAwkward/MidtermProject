package com.skilldistillery.mocktailsmeetup.data;

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
		return em.find(Drink.class, drinkId) ;
	}

}
