package com.skilldistillery.mocktailsmeetup.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.mocktailsmeetup.entities.Address;

@Service
@Transactional
public class AddressDaoImpl implements AddressDAO {

	@PersistenceContext
	private EntityManager em;
	
	@Override
	public Address findById(int addressId) {
		return em.find(Address.class, addressId);
	}

}
