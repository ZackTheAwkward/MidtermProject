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

class RecipeIngredientTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private RecipeIngredient ingredient; 
	
	
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
	    ingredient = em.find(RecipeIngredient.class, new RecipeIngredientId(1, 8));
	}

	@AfterEach
	void tearDown() throws Exception {
	    em.close();
	    ingredient = null;
	}
	
	
	@Test
	@DisplayName("Initial test for ingredient mapping")
	void test1 () {
		assertNotNull(ingredient);
	}
	
	/*mysql> select * from recipe_ingredient;
+-----------+---------------+----------+--------------+---------------+
| recipe_id | ingredient_id | quantity | unit         | instruction   |
+-----------+---------------+----------+--------------+---------------+
|         1 |             8 |        1 | cherry */
	@Test
	@DisplayName("Testing recipeingredient  mapping")
	void test2() {
		assertNotNull(ingredient);
		assertEquals("cherry", ingredient.getUnit()); 
	}

}
