package com.skilldistillery.mocktailsmeetup.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.mocktailsmeetup.entities.Address;
import com.skilldistillery.mocktailsmeetup.entities.Meetup;

@Service
@Transactional
public class AddressDaoImpl implements AddressDAO {

	@PersistenceContext
	private EntityManager em;
	
	@Override
	public Address findById(int addressId) {
		return em.find(Address.class, addressId);
	}
	
	@Override
	public Address findByMeetup(Meetup meetup) {
		return em.find(Address.class, meetup);
	}


	@Override
	public Address addAddress(Address address) {
		em.persist(address);
		return em.find(Address.class, address.getId());
	}

	@Override
	public Address updateAddress(int id, Address address) {
		Address managed = em.find(Address.class, id);
		managed.setStreet(address.getStreet());
		managed.setCity(address.getCity());
		managed.setStateAbbr(address.getStateAbbr());
		managed.setPostalCode(address.getPostalCode());
		
		
		return managed;
	}

	@Override
	public boolean deleteAddress(int id) {
		boolean removed = false;
		Address address = em.find(Address.class, id);
		
		if(address != null) {
			em.remove(address);
			removed = !em.contains(address);
		}
		
		return removed;
	}
}
