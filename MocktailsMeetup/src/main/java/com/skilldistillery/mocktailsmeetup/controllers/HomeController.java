package com.skilldistillery.mocktailsmeetup.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.mocktailsmeetup.data.CategoryDAO;
import com.skilldistillery.mocktailsmeetup.data.DrinkDAO;
import com.skilldistillery.mocktailsmeetup.data.MeetupDAO;
import com.skilldistillery.mocktailsmeetup.data.RecipeDAO;
import com.skilldistillery.mocktailsmeetup.data.UserDAO;
import com.skilldistillery.mocktailsmeetup.entities.Category;
import com.skilldistillery.mocktailsmeetup.entities.Drink;
import com.skilldistillery.mocktailsmeetup.entities.Meetup;
import com.skilldistillery.mocktailsmeetup.entities.Recipe;
import com.skilldistillery.mocktailsmeetup.entities.RecipeComment;
import com.skilldistillery.mocktailsmeetup.entities.User;

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
	@Autowired
	private MeetupDAO meetupDAO;

	@RequestMapping(path = { "/", "home.do" })
	public String home(Model model) {
		return "home";
	}

	@RequestMapping(path = { "viewCat.do" })
	public String category(Model model) {
		return "findByCategory";
	}

	@RequestMapping(path = { "goLogin.do" })
	public String login(Model model) {
		return "login";
	}

	@RequestMapping(path = { "signUp.do" })
	public String signUp(Model model) {
		return "signUp";

	}

	@RequestMapping(path = { "account.do" })
	public String accessAcount(Model model) {
		return "account";
	}

	@RequestMapping(path = "addMeet.do")
	public String createMeet(Model model) {
		return "createMeetup";
	}

	@RequestMapping(path = "sendToViewRecipes.do", method = RequestMethod.GET)
	public String goToUserRecipes(Model model, int id) {
		User user = userDAO.findById(id);
		List<Recipe> userCreated = user.getUserCreated();
		model.addAttribute("user", user);
		model.addAttribute("userCreated", userCreated);

		return "viewUserRecipes";
	}

	@RequestMapping(path = "updateR.do", method = RequestMethod.POST)
	public String updateR(Model model, int id) {
		Recipe recipe = recipeDAO.findById(id);
		model.addAttribute("recipe", recipe);
//		System.out.println("In update.do");
		return "updateRecipe";
	}

	@RequestMapping(path = "updateRecipe.do", method = RequestMethod.POST)
	public String updateRecipe(int id, Recipe recipe, Model model) {
//		System.out.println("In updateCoffee.do");
		Recipe updatedRecipe = recipeDAO.updateRecipe(id, recipe);
		model.addAttribute("recipe", updatedRecipe);
		return "account";
	}

	@RequestMapping(path = { "meetup.do" })
	public String meetup(Model model) {
		return "showMeetup";
	}

	@RequestMapping(path = { "getRecipe.do" }, method = RequestMethod.GET)
	public String getSingleRecipeResult(int id, Model model) {
		Recipe recipe = recipeDAO.findById(id);
		model.addAttribute("recipe", recipe);
		return "singleResult";
	}

	@RequestMapping(path = { "search.do" }, method = RequestMethod.GET)
	public String searchKeyword(String keyword, Model model) {

		List<Recipe> recipeMatch = recipeDAO.findByKeyword(keyword);
		model.addAttribute("recipeMatch", recipeMatch);

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

	@RequestMapping(path= {"login.do"}, method= RequestMethod.GET )
	public ModelAndView displayLogin(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		if (session.getAttribute("user") != null) {
			mv.setViewName("redirect:home.do");
		} else {
			mv.addObject("userCommandObject", new User());
			mv.setViewName("login");
		}
		return mv;
	}

	@RequestMapping(path = "login.do", method = RequestMethod.POST)
	public String submitLogin(User user, HttpSession session) {
		if (session.getAttribute("user") != null) {
			return "redirect:home.do";
		}
		User u = userDAO.getUserByUserNameAndPassword(user.getUsername(), user.getPassword());
		if (u == null) {
			return "redirect:login.do";
		}
		session.setAttribute("user", u);

		return "welcome";
	}

	@RequestMapping("welcome.do")
	public String checkLogin(HttpSession session, Model model) {
		if (session.getAttribute("user") == null) {
			return "redirect:login.do";
		}
		List<Meetup> meetup = meetupDAO.findAll();
		model.addAttribute("meetup", meetup);
		return "welcome";

	}

	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute("user");
		return "redirect:home.do";
	}

	@RequestMapping(path = "update.do", method = RequestMethod.GET)
	public String update(Model model, int id) {
		User user = userDAO.findById(id);
		model.addAttribute("user", user);
//		System.out.println("In update.do");
		return "updateAccount";
	}

	@RequestMapping(path = "updateAccount.do", method = RequestMethod.POST)
	public String updateAccount(int id, User user, Model model) {
//		System.out.println("In updateCoffee.do");
		User updatedAccount = userDAO.updateUser(id, user);
		model.addAttribute("user", updatedAccount);
		return "account";
	}

	@RequestMapping(path = "createAccount.do", method = RequestMethod.POST)
	public String createAccount(User user, Model model) {
		User createAccount = userDAO.createUser(user);
		model.addAttribute("user", createAccount);
		return "welcome";
	}

	@RequestMapping("getMeetups.do")
	public String showMeetup(Integer Id, Model model) {
		Meetup meetup = meetupDAO.findById(Id);
		model.addAttribute("meetup", meetup);
		return "showMeetup";
	}

	@RequestMapping(path = "createdMeetup.do", method = RequestMethod.POST)
	public String createMeetup(Meetup meetup, Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user != null) {
			meetup.setOwner(user);
			System.out.println("++++++++++++++++++++++++++++++");
			System.out.println(meetup);
			Meetup createMeetup = meetupDAO.createMeetup(meetup);
			model.addAttribute("meetup", createMeetup);
			return "showMeetup";

		} else {
			return "login";
		}
	}

	@RequestMapping(path = "getRecipeComments.do")
	public String showRecipeComments(int id, Model model) {
		List<RecipeComment> recipeComments = recipeDAO.findAllRecipeComments(id);
		model.addAttribute("recipeComments", recipeComments);
		return "singleResult";
	}

}
