package com.skilldistillery.mocktailsmeetup.data;

import java.util.List;

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


	@Override
	public List<Category> findByKeyword(String keyword) {
		List<Category> categories = null;
		String jpql = "SELECT c FROM Category c WHERE c.name = :keyword";
		categories = em.createQuery(jpql, Category.class).setParameter("keyword", "%" + keyword + "%" ).getResultList();
		return categories;
	}

}
