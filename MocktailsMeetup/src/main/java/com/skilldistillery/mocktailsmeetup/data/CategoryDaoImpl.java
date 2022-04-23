package com.skilldistillery.mocktailsmeetup.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.mocktailsmeetup.entities.Category;

@Service
@Transactional
public class CategoryDaoImpl implements CategoryDAO {

	@PersistenceContext
	private EntityManager em;
	
	
	@Override
	public Category findById(int categoryId) {
		return em.find(Category.class, categoryId);
	}

}
