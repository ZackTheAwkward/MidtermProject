package com.skilldistillery.mocktailsmeetup.controllers;

import java.beans.PropertyEditorSupport;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;

import javax.persistence.NoResultException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.mocktailsmeetup.data.CategoryDAO;
import com.skilldistillery.mocktailsmeetup.data.DrinkDAO;
import com.skilldistillery.mocktailsmeetup.data.IngredientDAO;
import com.skilldistillery.mocktailsmeetup.data.MeetupDAO;
import com.skilldistillery.mocktailsmeetup.data.RecipeDAO;
import com.skilldistillery.mocktailsmeetup.data.UserDAO;
import com.skilldistillery.mocktailsmeetup.entities.Category;
import com.skilldistillery.mocktailsmeetup.entities.Meetup;
import com.skilldistillery.mocktailsmeetup.entities.Recipe;
import com.skilldistillery.mocktailsmeetup.entities.RecipeComment;
import com.skilldistillery.mocktailsmeetup.entities.RecipeIngredient;
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
	@Autowired
	private IngredientDAO ingredientDAO;

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
	public String goToUserMeetups(Model model, int id, HttpSession session) {
		User user = (User) session.getAttribute("user");
		List<Meetup> userMeetups = meetupDAO.findByOwnerId(user.getId());
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
		return "singleResult";

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

		return "results";
	}

	@RequestMapping(path = { "categories.do" }, method = RequestMethod.GET)
	public String searchByCategory(String keyword, Model model) {
		List<Category> categoryMatch = categoryDAO.findByKeyword(keyword);
		model.addAttribute("categoryMatch", categoryMatch);
		return "results";

	}

//	@RequestMapping("login.do")
//	public ModelAndView displayLogin(HttpSession session, Model model) {
//		ModelAndView mv = new ModelAndView();
//		mv.addObject("user", new User());
//		mv.setViewName("login");
//		return mv;
//	}

	@RequestMapping(path = "login.do", method = RequestMethod.POST)
	public String submitLogin(User user, HttpSession session, Model model) {
		
		try {
		User u = userDAO.getUserByUserNameAndPassword(user.getUsername(), user.getPassword());
			if (u == null) {
			return "goLogin.do";
			}
			if (u.isActive() == false) {
			return "goLogin.do";
			} else {
		
				session.setAttribute("user", u);
				List<Meetup> meetup = meetupDAO.findAll();
				model.addAttribute("meetup", meetup);
				return "welcome";
			}
		
		} catch (NoResultException e) {
			return "login";
	}}

	@RequestMapping("welcome.do")
	public String checkLogin(HttpSession session, Model model) {
		User u = (User)session.getAttribute("user");
		if (u.isActive() == false) {
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
	public String deleteRecipe(int id, Recipe recipe) {
		recipe = recipeDAO.findById(id);
		recipe = recipeDAO.deleteRecipe(id, recipe);

		return "account";
	}

	@RequestMapping("deactivateUser.do")
	public String deleteUser(int id, User user, HttpSession session) {
		user = (User) (User) session.getAttribute("user");

		userDAO.deleteUser(id, user);
		return "deactivatedUser";
	}

	@RequestMapping(path = "update.do", method = RequestMethod.GET)
	public String update(Model model, int id) {
		User user = userDAO.findById(id);
		model.addAttribute("user", user);

		return "updateAccount";
	}

	@RequestMapping(path = "updateAccount.do", method = RequestMethod.POST)
	public String updateAccount(int id, User user, Model model) {

		User updatedAccount = userDAO.updateUser(id, user);
		model.addAttribute("user", updatedAccount);
		return "account";
	}

	@RequestMapping(path = "createAccount.do", method = RequestMethod.POST)
	public String createAccount(User user, Model model, HttpSession session) {
		User createAccount = userDAO.createUser(user);
		session.setAttribute("user", createAccount);
		List<Meetup> meetup = meetupDAO.findAll();
		model.addAttribute("meetup", meetup);
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

	@RequestMapping(path = "sendToViewRecipes.do", method = RequestMethod.GET)
	public String goToUserRecipes(Model model, int id, HttpSession session) {
		User user = (User) session.getAttribute("user");
		List<Recipe> userCreated = recipeDAO.findAllUserCreated(user.getId());
//		List<Meetup> userMeetups = meetupDAO.findByOwnerId(user.getId());

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

//	@RequestMapping(path = "prePost.do", method = RequestMethod.POST)
//	public String addIngredient(Recipe recipe, Model model, HttpSession session,
//			Double quantity, String unit, Ingredient ingredient, int recipeId) {
//		User user = (User) session.getAttribute("user");
//		if (user != null) {
//
//			recipeIngredient.setRecipe(recipeDAO.findById(recipeId));
//			recipeIngredient.setQuantity(quantity);
//			recipeIngredient.setUnit(unit);
//			recipeIngredient.setIngredient(ingredient);
//			recipeDAO.addIngredient(recipeIngredient);
//			model.addAttribute("recipe", recipeDAO.findById(recipeId));
//			return "prePostRecipe";
//		} else {
//			return "login";
//		}
//	}
	@RequestMapping(path = "prePost.do", method = RequestMethod.POST)
	public String addIngredient(RecipeIngredient recipeIngredient, Model model, HttpSession session, int recipeId,
			int ingredientId) {
		User user = (User) session.getAttribute("user");
		if (user != null) {

			recipeIngredient.setRecipe(recipeDAO.findById(recipeId));
			recipeIngredient.setIngredient(ingredientDAO.findById(ingredientId));

			recipeDAO.addIngredient(recipeIngredient);

			model.addAttribute("ingredients", ingredientDAO.listAll());
			model.addAttribute("recipe", recipeDAO.findById(recipeId));
			return "prePostRecipe";
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
			model.addAttribute("recipe", newRecipe);
			model.addAttribute("ingredients", ingredientDAO.listAll());
			return "prePostRecipe";

		} else {
			return "login";
		}
	}

	@RequestMapping(path = "surpriseMe.do", method = RequestMethod.GET)
	public String surpriseMe(Model model) {

		Recipe recipe = recipeDAO.surpriseMe();

		model.addAttribute("recipe", recipe);

		return "singleResult";

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
