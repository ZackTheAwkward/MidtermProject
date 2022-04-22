package com.skilldistillery.mocktailsmeetup.data;

import com.skilldistillery.mocktailsmeetup.entities.User;

public interface UserDAO {
	
	User findById(int userID);

}
