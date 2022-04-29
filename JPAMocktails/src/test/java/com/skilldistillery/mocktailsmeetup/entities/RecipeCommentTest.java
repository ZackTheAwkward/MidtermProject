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

class RecipeCommentTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private RecipeComment comment;

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
		comment = em.find(RecipeComment.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		comment = null;
		em.close();
	}

	@Test
	@DisplayName("Testing comment to recipe mapping")
	void Test1() {
		assertNotNull(comment);
		assertEquals("This is one of my favorite mocktails!", comment.getComment());

	}

	@Test
	@DisplayName("Testing comment to user mapping")
	void Test2() {
		assertNotNull(comment);
		assertEquals("admin@admin.com", comment.getUser().getEmail());
		assertEquals("admin", comment.getUser().getLastName());
		assertEquals("admin", comment.getUser().getFirstName());
	}
}