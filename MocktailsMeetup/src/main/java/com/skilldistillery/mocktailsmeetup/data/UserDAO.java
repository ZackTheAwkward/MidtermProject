package com.skilldistillery.mocktailsmeetup.data;

import java.util.List;

import com.skilldistillery.mocktailsmeetup.entities.Recipe;
import com.skilldistillery.mocktailsmeetup.entities.User;

public interface UserDAO {
	
	User findById(int userId);
	
	User getUserByUserNameAndPassword(String userName, String password);
	
	User createUser (User user);
	
	User updateUser(int userId, User user);
	
	User deleteUser(int userId, User user);

	List<Recipe> getUserList(int userId);

}
