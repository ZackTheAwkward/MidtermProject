package com.skilldistillery.mocktailsmeetup.entities;

import java.time.LocalDate;
import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

@Entity
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String username;
	
	private String password;
	
	private boolean active;
	
	@Column(name="first_name")
	private String firstName;
	
	@Column(name="last_name")
	private String lastName;
	
	private String email;
	
	private String bio;
	
	@Column(name="photo_url")
	private String photoUrl;
	
	@Column(name="created_date")
	@CreationTimestamp
	private LocalDate createDate;
	
	@ManyToMany(mappedBy = "users")
	private List<Meetup> meetups;
	
	@ManyToMany
	@JoinTable(name= "meetup_comment",
			joinColumns=@JoinColumn(name="user_id"),
			inverseJoinColumns=@JoinColumn(name="meetup_id"))
	private List<Meetup> meetupComments;
	

	@ManyToMany(mappedBy = "usersFavorited")
	private List<Recipe> favoriteRecipes;
	
	@ManyToMany(mappedBy = "commenters")
	private List<Recipe> commentedOn;
	
	@OneToMany(mappedBy="createdByUser", fetch=FetchType.EAGER)
	private List<Recipe> userCreated;
	
	@OneToMany(mappedBy = "user")
	private List<RecipeComment> userRecipeComments;
	
	@OneToMany(mappedBy="owner")
	private List<Meetup> hostedMeetups;

	public User() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getBio() {
		return bio;
	}

	public void setBio(String bio) {
		this.bio = bio;
	}

	public String getPhotoUrl() {
		return photoUrl;
	}

	public void setPhotoUrl(String photoUrl) {
		this.photoUrl = photoUrl;
	}

	public LocalDate getCreateDate() {
		return createDate;
	}

	public void setCreateDate(LocalDate createDate) {
		this.createDate = createDate;
	}


	public List<Meetup> getMeetups() {
		return meetups;
	}

	public void setMeetups(List<Meetup> meetups) {
		this.meetups = meetups;
	}
	
	
	public List<Meetup> getMeetupComments() {
		return meetupComments;
	}

	public void setMeetupComments(List<Meetup> meetupComments) {
		this.meetupComments = meetupComments;
	}
		
	public List<Recipe> getFavoriteRecipes() {
		return favoriteRecipes;
	}

	public void setFavoriteRecipes(List<Recipe> favoriteRecipes) {
		this.favoriteRecipes = favoriteRecipes;
	}

	public List<Recipe> getCommentedOn() {
		return commentedOn;
	}

	public void setCommentedOn(List<Recipe> commentedOn) {
		this.commentedOn = commentedOn;
	}

	
	
	public List<Recipe> getUserCreated() {
		return userCreated;
	}

	public void setUserCreated(List<Recipe> userCreated) {
		this.userCreated = userCreated;
	}

	
	
	public List<RecipeComment> getUserRecipeComments() {
		return userRecipeComments;
	}

	public void setUserRecipeComments(List<RecipeComment> userRecipeComments) {
		this.userRecipeComments = userRecipeComments;
	}

	public List<Meetup> getHostedMeetups() {
		return hostedMeetups;
	}

	public void setHostedMeetups(List<Meetup> hostedMeetups) {
		this.hostedMeetups = hostedMeetups;
	}

	@Override
	public int hashCode() {
		return Objects.hash(id, username);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		User other = (User) obj;
		return id == other.id && Objects.equals(username, other.username);
	}
	
	@Override
	public String toString() {
		return "User ID:" + id + ", Username: " + username + ", First Name: " + firstName + ", Last Name: " + lastName;
	}
	
}
