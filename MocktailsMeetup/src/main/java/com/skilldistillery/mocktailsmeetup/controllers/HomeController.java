package com.skilldistillery.mocktailsmeetup.controllers;

import java.beans.PropertyEditorSupport;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
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

	@RequestMapping(path = { "newRecipe.do" })
	public String addARecipe(Model model) {
		return "newRecipe";
	}

	@RequestMapping(path = "viewAllMeetup.do")
	public String viewAllMeets(Model model) {
		List<Meetup> meetup = meetupDAO.findAll();
		model.addAttribute("meetup", meetup);
		return "viewAllMeetups";
	}

	@RequestMapping(path = "sendToViewMeetups.do", method = RequestMethod.GET)
	public String goToUserMeetups(Model model, int id) {
		User user = userDAO.findById(id);
		List<Meetup> userMeetups = user.getHostedMeetups();
		model.addAttribute("user", user);
		model.addAttribute("userMeetups", userMeetups);

		return "viewUserMeetups";
	}

	@RequestMapping(path = "updateR.do", method = RequestMethod.POST)
	public String updateR(Model model, int id) {
		Recipe recipe = recipeDAO.findById(id);
		model.addAttribute("recipe", recipe);
//		System.out.println("In update.do");
		return "updateRecipe";
	}

	@RequestMapping(path = "updateMeetup.do", method = RequestMethod.POST)
	public String updateMeetup(Model model, int id) {
		Meetup meetup = meetupDAO.findById(id);
		model.addAttribute("meetup", meetup);
		return "meetupUpdate";
	}

	@RequestMapping(path = "updateRecipe.do", method = RequestMethod.POST)
	public String updateRecipe(int id, Recipe recipe, Model model) {
//		System.out.println("In updateCoffee.do");
		Recipe updatedRecipe = recipeDAO.updateRecipe(id, recipe);
		model.addAttribute("recipe", updatedRecipe);
		return "account";

	}

	@RequestMapping(path = "updatedMeetup.do")
	public String updatedMeetup(int id, Meetup meetup, Model model) {
//		System.out.println("In updateCoffee.do");
		Meetup updatedMeetup = meetupDAO.updateMeetup(id, meetup);
		model.addAttribute("meetup", updatedMeetup);
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

	@RequestMapping("login.do")
	public ModelAndView displayLogin(HttpSession session, Model model) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("user", new User());
		mv.setViewName("login");
		return mv;
	}

	@RequestMapping(path = "login.do", method = RequestMethod.POST)
	public String submitLogin(User user, HttpSession session, Model model) {
		User u = userDAO.getUserByUserNameAndPassword(user.getUsername(), user.getPassword());
		if (u == null || user.isActive()==false) {
			return "redirect:login.do";
		}
		session.setAttribute("user", u);
		List<Meetup> meetup = meetupDAO.findAll();
		model.addAttribute("meetup", meetup);
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
	
	@RequestMapping("deleteRecipe.do")
	public String deleteRecipe(int id) {
		Boolean isDeleted = recipeDAO.deleteRecipe(id);
		return "viewUserRecipes";
	}
	
	@RequestMapping("deactivateUser.do")
	public String deleteUser(int id, User user) {
		 user = userDAO.findById(id);
		userDAO.deleteUser(id, user);
		return "deactivatedUser";
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
	public String showMeetup(int Id, Model model) {
		Meetup meetup = meetupDAO.findById(Id);
		model.addAttribute("meetup", meetup);
		return "showMeetup";
	}

	@RequestMapping(path = "createdMeetup.do", method = RequestMethod.POST)
	public String createMeetup(Meetup meetup, Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user != null) {
			meetup.setOwner(user);
			Meetup createMeetup = meetupDAO.createMeetup(meetup);
			model.addAttribute("meetup", createMeetup);
			return "showMeetup";

		} else {
			return "login";
		}
	}

	@RequestMapping(path = "createdRecipe.do", method = RequestMethod.POST)
	public String createRecipe(Recipe recipe, Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user != null) {
			recipe.setCreatedByUser(user);
			Recipe newRecipe = recipeDAO.createYourOwn(recipe);
			model.addAttribute("newRecipe", newRecipe);
			List<Recipe> userCreated = user.getUserCreated();
			model.addAttribute("user", user);
			model.addAttribute("userCreated", userCreated);
			return "viewUserRecipes";

		} else {
			return "login";
		}
	}

	@RequestMapping(path = "sendToViewRecipes.do", method = RequestMethod.GET)
	public String goToUserRecipes(Model model, int id, HttpSession session) {
		User user =(User) session.getAttribute("user");
		List<Recipe> userCreated = user.getUserCreated();
		model.addAttribute("user", user);
		model.addAttribute("userCreated", userCreated);

		return "viewUserRecipes";
	}

	@RequestMapping(path = "getRecipeComments.do")
	public String showRecipeComments(int id, Model model) {
		List<RecipeComment> recipeComments = recipeDAO.findAllRecipeComments(id);
		model.addAttribute("recipeComments", recipeComments);
		return "singleResult";
	}

	@RequestMapping(path = "createComment.do", method = RequestMethod.POST)
	public String addComment(RecipeComment recipeComment, Model model, HttpSession session, int recipeId,
			String comment) {
		User user = (User) session.getAttribute("user");
		if (user != null) {
			recipeComment.setUser(user);
			recipeComment.setRecipe(recipeDAO.findById(recipeId));
			recipeComment.setComment(comment);

			recipeDAO.createComment(recipeComment);
			model.addAttribute("recipe", recipeDAO.findById(recipeId));
			return "singleResult";
		} else {
			return "login";
		}
	}

//	
//	@RequestMapping(path = "createComment.do", method = RequestMethod.POST)
//	public String addComment(RecipeComment recipeComment, Model model,  HttpSession session) {
//		User user = (User) session.getAttribute("user");
//		if (user != null) {
//			recipeComment.setUser(user);
//			RecipeComment createComment = recipeDAO.createComment(recipeComment);
//			model.addAttribute("recipeComment", createComment);
//			return "singleResult";
//		} else {
//			return "login";
//		}
//	}

//	@RequestMapping(path = "createComment.do")
//	public String addComment(Model model,  int userId, int recipeId, String comment) {
//		RecipeComment recipeComment = new RecipeComment();
//		recipeComment.setUser(userDAO.findById(userId));
//		recipeComment.setRecipe(recipeDAO.findById(recipeId));
//		recipeComment.setComment(comment);
//		
//			model.addAttribute("recipeComment", recipeComment);
//			
//			return "singleResult";
//	
//		
//	}
	@InitBinder
	public void initBinder(WebDataBinder webDataBinder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat.setLenient(true);
		webDataBinder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
		webDataBinder.registerCustomEditor(LocalDate.class, new PropertyEditorSupport() {
			@Override
			public void setAsText(String text) throws IllegalArgumentException {
				setValue(LocalDate.parse(text, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
			}

			@Override
			public String getAsText() throws IllegalArgumentException {
				return DateTimeFormatter.ofPattern("yyyy-MM-dd").format((LocalDate) getValue());
			}
		});
		webDataBinder.registerCustomEditor(LocalTime.class, new PropertyEditorSupport() {
			@Override
			public void setAsText(String text) throws IllegalArgumentException {
				setValue(LocalTime.parse(text, DateTimeFormatter.ofPattern("HH:mm")));
			}

			@Override
			public String getAsText() throws IllegalArgumentException {
				return DateTimeFormatter.ofPattern("HH:mm").format((LocalTime) getValue());
			}
		});
		// 2020-11-04T09:44
		webDataBinder.registerCustomEditor(LocalDateTime.class, new PropertyEditorSupport() {
			@Override
			public void setAsText(String text) throws IllegalArgumentException {
				setValue(LocalDateTime.parse(text, DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm")));
			}

			@Override
			public String getAsText() throws IllegalArgumentException {
				return DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm").format((LocalDateTime) getValue());
			}
		});
	}
}
