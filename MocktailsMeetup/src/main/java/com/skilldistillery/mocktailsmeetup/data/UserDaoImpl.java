package com.skilldistillery.mocktailsmeetup.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.mocktailsmeetup.entities.Recipe;
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
	public User getUserByUserNameAndPassword(String userName, String password) {

		String jpql = "SELECT u FROM User u WHERE username = :name AND password = :password";
		User user = em.createQuery(jpql, User.class).setParameter("name", userName).setParameter("password", password).getSingleResult();
			return user;
		}

	@Override
	public User updateUser(int userId, User user) {
		User managed = em.find(User.class, userId);
		managed.setFirstName(user.getFirstName());
		managed.setLastName(user.getLastName());
		managed.setUsername(user.getUsername());
		managed.setPhotoUrl(user.getPhotoUrl());
		return managed;
	}


	@Override
	public User createUser(User user) {
		em.persist(user);
		return em.find(User.class, user.getId());
	}


	@Override
	public User deleteUser(int userId, User user) {
		User managed = em.find(User.class, userId);
		managed.setActive(false);
		return managed;
	}

	@Override
	public List<Recipe> getUserList(int createdByUser) {
		String jpql = "SELECT r FROM Recipe r WHERE r.createdByUser = :id";
		List<Recipe> userCreated = em.createQuery(jpql, Recipe.class).setParameter("id", createdByUser).getResultList();
		return userCreated;
		
	}


}
