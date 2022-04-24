package com.skilldistillery.mocktailsmeetup.data;

import com.skilldistillery.mocktailsmeetup.entities.Address;

public interface AddressDAO {
	Address findById(int addressId);
}
