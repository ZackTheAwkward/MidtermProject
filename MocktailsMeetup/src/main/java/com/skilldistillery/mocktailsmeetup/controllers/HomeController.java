package com.skilldistillery.mocktailsmeetup.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.mocktailsmeetup.data.CategoryDAO;
import com.skilldistillery.mocktailsmeetup.data.DrinkDAO;
import com.skilldistillery.mocktailsmeetup.data.RecipeDAO;
import com.skilldistillery.mocktailsmeetup.data.UserDAO;
import com.skilldistillery.mocktailsmeetup.entities.Category;
import com.skilldistillery.mocktailsmeetup.entities.Drink;

@Controller
public class HomeController {

	@Autowired
	private UserDAO userDAO;
	@Autowired
	private RecipeDAO recipeDAO;
	@Autowired
	private CategoryDAO categoryDAO;
	@Autowired
	private DrinkDAO drinkDAO;

	@RequestMapping(path = { "/", "home.do" })
	public String home(Model model) {
		return "home";
	}

	@RequestMapping(path = { "viewCat.do" })
	public String category(Model model) {
		return "findByCategory";
	}

	@RequestMapping(path = { "search.do" }, method = RequestMethod.GET)
	public String searchKeyword(String keyword, Model model) {

//			List<Recipe> recipeMatch = dao.findByNameContaining(keyword);
//			mv.addObject("recipeMatch", recipeMatch);
		List<Category> categoryMatch = categoryDAO.findByKeyword(keyword);
		model.addAttribute("categoryMatch", categoryMatch);
		List<Drink> drinkMatch = drinkDAO.findByKeyword(keyword);
		model.addAttribute("drinkMatch", drinkMatch);
//			List<Ingredient> ingredientMatch = dao.findByNameContaining(keyword);
//			mv.addObject("ingredientMatch", ingredientMatch);

		return "results";
	}

	@RequestMapping(path = { "categories.do" }, method = RequestMethod.GET)
	public String searchByCategory(String keyword, Model model) {
		List<Category> categoryMatch = categoryDAO.findByKeyword(keyword);
		model.addAttribute("categoryMatch", categoryMatch);
		return "results";

	}

}
