package com.skilldistillery.mocktailsmeetup.entities;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

import org.hibernate.annotations.CreationTimestamp;
import org.springframework.format.annotation.DateTimeFormat;




@Entity
public class Meetup {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String title;

	private String description;

	@Column(name = "date_created")
	@CreationTimestamp
	private LocalDateTime dateCreated;

	@DateTimeFormat(iso = DateTimeFormat.ISO.TIME)
	@Column(name = "start_time")
	private LocalTime startTime;

	@DateTimeFormat(iso = DateTimeFormat.ISO.TIME)
	@Column(name = "end_time")
	private LocalTime endTime;

	@Column(name = "max_attendees")
	private int maxAttendees;

	private boolean active;

	@Column(name = "image_url")
	private String imageURL;

	@DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
	@Column(name = "meetup_date")
	private LocalDate meetupDate;

	@OneToOne
	@JoinColumn(name = "address_id")
	private Address address;

	@ManyToMany
	@JoinTable(name = "user_meeting", joinColumns = @JoinColumn(name = "meetup_id"), inverseJoinColumns = @JoinColumn(name = "user_id"))
	private List<User> users;

	@ManyToMany(mappedBy = "meetupComments")
	private List<User> usersWhoCommented;

	@ManyToOne
	@JoinColumn(name = "user_id")
	private User owner;

	public Meetup() {
		super();
	}

	@Override
	public String toString() {
		return "Meetup [id=" + id + ", title=" + title + ", description=" + description + "]";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public LocalDateTime getDateCreated() {
		return dateCreated;
	}

	public void setDateCreated(LocalDateTime dateCreated) {
		this.dateCreated = dateCreated;
	}

	public LocalTime getStartTime() {
		return startTime;
	}

	public void setStartTime(LocalTime startTime) {
		this.startTime = startTime;
	}

	public LocalTime getEndTime() {
		return endTime;
	}

	public void setEndTime(LocalTime endTime) {
		this.endTime = endTime;
	}

	public int getMaxAttendees() {
		return maxAttendees;
	}

	public void setMaxAttendees(int maxAttendees) {
		this.maxAttendees = maxAttendees;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public String getImageURL() {
		return imageURL;
	}

	public void setImageURL(String imageURL) {
		this.imageURL = imageURL;
	}

	public LocalDate getMeetupDate() {
		return meetupDate;
	}

	public void setMeetupDate(LocalDate meetupDate) {
		this.meetupDate = meetupDate;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> user) {
		this.users = user;
	}

	public List<User> getUsersWhoCommented() {
		return usersWhoCommented;
	}

	public void setUsersWhoCommented(List<User> usersWhoCommented) {
		this.usersWhoCommented = usersWhoCommented;
	}

	public User getOwner() {
		return owner;
	}

	public void setOwner(User owner) {
		this.owner = owner;
	}

	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Meetup other = (Meetup) obj;
		return id == other.id;
	}

}
