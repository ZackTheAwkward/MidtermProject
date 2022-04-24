package com.skilldistillery.mocktailsmeetup.data;

import java.util.Map;
import java.util.Set;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.mocktailsmeetup.entities.User;

@Service
@Transactional
public class UserDaoImpl implements UserDAO {
	
	private Map<Integer, User> users;

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

	@Override
	public User getUserByUserNameAndPassword(String userName, String password) {
		User u = null;
		Set<Integer> keys = users.keySet();
		for (Integer key : keys) {
			User user = users.get(key);
			if(user.getUsername().equals(userName) && user.getPassword().equals(password)) {
				u = user;
				break;
			}
		}
		
		return u;
	}

	@Override
	public User updateUser(int userId, User user) {
		return null;
	}

}
