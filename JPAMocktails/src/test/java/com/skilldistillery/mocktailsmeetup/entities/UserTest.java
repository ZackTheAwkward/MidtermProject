package com.skilldistillery.mocktailsmeetup.entities;

import static org.junit.jupiter.api.Assertions.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class UserTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private User user; 
	
	
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
	    user = em.find(User.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
	    em.close();
	    user = null;
	}
	
	
	@Test
	@DisplayName("Initial test for user mapping")
	void test1 () {
		assertNotNull(user);
		assertEquals("admin", user.getUsername());			
	}
	
	@Test
	@DisplayName("Testing mapping for User and Meetup joining table- many to many")
	void test2() {
		assertNotNull(user);
		assertTrue(user.getMeetups().size() >0);
	}
	
	@Test
	@DisplayName("Testing recipe to user mapping for comments and favorites")
	void test3() {
		assertNotNull(user);
		assertTrue(user.getFavoriteRecipes().size()>0);
		assertTrue(user.getCommentedOn().size()>0);
		
	}
	
	@Test
	@DisplayName("Testing mapping for User and Meetup Comemnts joining table- many to many")
	void test4() {
		assertNotNull(user);
		assertTrue(user.getMeetupComments().size() > 0);
		
	}
	
	@Test
	@DisplayName("Testing mapping for recipes input by user")
	void test5() {
		assertNotNull(user);
		assertTrue(user.getUserCreated().size()>0);
	}
	
}
