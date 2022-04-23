package com.skilldistillery.mocktailsmeetup.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.mocktailsmeetup.entities.User;

@Service
@Transactional
public class UserDaoImpl implements UserDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public User findById(int userId) {

		return em.find(User.class, userId);
	}

	@Override
	public User findUserByUserRecipe(int recipeUserId) {
		String jpql = "SELECT r.user_id FROM Recipe r WHERE r.user_id = :id";
		User user = em.createQuery(jpql, User.class).setParameter("id", recipeUserId).getSingleResult();
		return user;

	}

}
