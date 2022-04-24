package com.skilldistillery.mocktailsmeetup.data;

import com.skilldistillery.mocktailsmeetup.entities.User;

public interface UserDAO {
	
	User findById(int userId);
	
	User findUserByUserRecipe (int recipeUserId);
	
	User getUserByUserNameAndPassword(String userName, String password);
	
	User updateUser(int userId, User user);
	

}
