package com.skilldistillery.mocktailsmeetup.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.mocktailsmeetup.data.CategoryDAO;
import com.skilldistillery.mocktailsmeetup.data.RecipeDAO;
import com.skilldistillery.mocktailsmeetup.data.UserDAO;
import com.skilldistillery.mocktailsmeetup.entities.Category;
import com.skilldistillery.mocktailsmeetup.entities.Ingredient;
import com.skilldistillery.mocktailsmeetup.entities.Recipe;

@Controller
public class HomeController {
	
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private RecipeDAO recipeDAO;
	@Autowired
	private CategoryDAO categoryDAO;
	
	@RequestMapping(path = {"/", "home.do"})
	public String home(Model model) {
		
		return "home";
	}
	
	@RequestMapping(path = { "search.do" }, method = RequestMethod.GET)
	public ModelAndView searchKeywordOrId(String id) {
		ModelAndView mv = new ModelAndView();
		String keyword = id;

		try {
			int newId = Integer.parseInt(id);
			Recipe recipe = recipeDAO.findById(newId);
			mv.addObject("recipe", recipe);
			mv.setViewName("results");

		} catch (Exception e) {

//			List<Recipe> recipeMatch = dao.findByNameContaining(keyword);
//			mv.addObject("recipeMatch", recipeMatch);
//			mv.setViewName("results");
//			List<Category> categoryMatch = dao.findByNameContaining(keyword);
//			mv.addObject("categoryMatch", categoryMatch);
//			mv.setViewName("results");
//			List<Ingredient> ingredientMatch = dao.findByNameContaining(keyword);
//			mv.addObject("ingredientMatch", ingredientMatch);
//			mv.setViewName("results");

		}
		return mv;
	}
	
}
