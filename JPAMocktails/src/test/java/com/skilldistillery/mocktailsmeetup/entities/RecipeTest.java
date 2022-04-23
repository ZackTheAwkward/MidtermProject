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

class RecipeTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Recipe recipe;

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
		 recipe = em.find(Recipe.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		recipe = null;
		em.close();
	}
	

	@Test
	void Test1() {
	assertNotNull(recipe);
	assertEquals("Shirley Temple sample recipe", recipe.getName());
	assertEquals(12, recipe.getServingSize());
		
	}
	
	@Test
	@DisplayName("Testing recipe to drink mapping")
	void Test2() {
		assertNotNull(recipe);
		assertEquals(1, recipe.getDrink().getId());
	}
	
	@Test
	@DisplayName("Testing recipe and user comments and favorites mappings")
	void Test3() {
		assertNotNull(recipe);
		assertTrue(recipe.getUsersFavorited().size()>0);
		assertTrue(recipe.getCommenters().size() >0);
		
	}
	
	@Test
	@DisplayName("Testing recipe to ingredient mapping")
	void test4() {
		assertNotNull(recipe);
		assertTrue(recipe.getIngredients().size()>0);
	}
	
	}
