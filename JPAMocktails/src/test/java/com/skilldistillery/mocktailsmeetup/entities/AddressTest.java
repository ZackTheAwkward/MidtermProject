package com.skilldistillery.mocktailsmeetup.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class AddressTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Address address;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		  emf = Persistence.createEntityManagerFactory("JPAMocktails");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		   emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		 em = emf.createEntityManager();
		    address = em.find(Address.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		address = null;
		em.close();
	}
	

	@Test
	@DisplayName("Test address field mapping")
	void Test1() {
	assertNotNull(address);
	assertEquals("2021 West 32 Ave", address.getStreet());
	assertEquals("Denver", address.getCity());
	assertEquals("CO", address.getStateAbbr());
	assertEquals("80211", address.getPostalCode());
	
	}
	
	@Test
	@DisplayName("Test address to meetup mapping")
	void Test2()   {			
		assertNotNull(address.getMeetup());
		assertEquals("May is for Mocktail Party", address.getMeetup().getTitle());	
	}

}


