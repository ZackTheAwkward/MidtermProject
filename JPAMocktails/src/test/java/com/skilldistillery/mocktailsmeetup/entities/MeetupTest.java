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

class MeetupTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Meetup meetup;

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
		    meetup = em.find(Meetup.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		meetup = null;
		em.close();
	}
	
	@Test
	@DisplayName("Testing max attendees and address / city mapping")
	void Test1() {
	assertNotNull(meetup);
	assertNotNull(meetup.getMaxAttendees());
	assertEquals("Denver", meetup.getAddress().getCity());
	
	}
	
	
	@Test
	@DisplayName("Testing meetup to user mapping")
	void test2() {
		assertNotNull(meetup);
		assertTrue(meetup.getUsers().size()>0);
	}
	@Test
	@DisplayName("Testing meetup to user comment mapping")
	void test3() {
		assertNotNull(meetup);
		assertTrue(meetup.getUsersWhoCommented().size() > 0);
	}
	
}
