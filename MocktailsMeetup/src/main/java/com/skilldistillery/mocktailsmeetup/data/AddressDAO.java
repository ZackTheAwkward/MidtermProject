package com.skilldistillery.mocktailsmeetup.data;

import com.skilldistillery.mocktailsmeetup.entities.Address;
import com.skilldistillery.mocktailsmeetup.entities.Meetup;

public interface AddressDAO {
	Address findById(int addressId);

	boolean deleteAddress(int id);

	Address updateAddress(int id, Address address);

	Address addAddress(Address address);

	Address findByMeetup(Meetup meetup);
	
	
}


